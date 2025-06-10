using System;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace SistemasOperativos
{
    public partial class EditarE : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            lblMensaje.Text = "";

            if (!IsPostBack)
            {
                CargarSistemasOperativos();

                if (Request.QueryString["id"] == null)
                {
                    Response.Redirect("Equipos.aspx");
                    return;
                }

                int id;
                if (!int.TryParse(Request.QueryString["id"], out id))
                {
                    Response.Redirect("Equipos.aspx");
                    return;
                }

                hfId.Value = id.ToString();
                CargarEquipo(id);
            }
        }

        private void CargarSistemasOperativos()
        {
            try
            {
                using (MySqlConnection con = new MySqlConnection(connectionString))
                {
                    string query = "SELECT id, nombre FROM SistemaOperativo ORDER BY nombre";
                    MySqlCommand cmd = new MySqlCommand(query, con);
                    con.Open();

                    ddlSistemaOperativo.Items.Clear();
                    ddlSistemaOperativo.Items.Add(new System.Web.UI.WebControls.ListItem("-- Seleccione --", ""));

                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ddlSistemaOperativo.Items.Add(new System.Web.UI.WebControls.ListItem(reader["nombre"].ToString(), reader["id"].ToString()));
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblMensaje.Text = "Error al cargar sistemas operativos: " + ex.Message;
            }
        }

        private void CargarEquipo(int id)
        {
            try
            {
                using (MySqlConnection con = new MySqlConnection(connectionString))
                {
                    string query = "SELECT nombre_equipo, marca, modelo, foto, sistema_operativo_id FROM Equipo WHERE id=@id";
                    MySqlCommand cmd = new MySqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@id", id);
                    con.Open();

                    using (var reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            txtNombreEquipo.Text = reader["nombre_equipo"].ToString();
                            txtMarca.Text = reader["marca"].ToString();
                            txtModelo.Text = reader["modelo"].ToString();
                            txtFoto.Text = reader["foto"].ToString();
                            ddlSistemaOperativo.SelectedValue = reader["sistema_operativo_id"].ToString();
                        }
                        else
                        {
                            lblMensaje.Text = "Equipo no encontrado.";
                            btnGuardar.Enabled = false;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblMensaje.Text = "Error al cargar equipo: " + ex.Message;
                btnGuardar.Enabled = false;
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;

            try
            {
                int id = Convert.ToInt32(hfId.Value);

                using (MySqlConnection con = new MySqlConnection(connectionString))
                {
                    string query = @"
                        UPDATE Equipo SET 
                            nombre_equipo = @nombre, 
                            marca = @marca, 
                            modelo = @modelo, 
                            foto = @foto, 
                            sistema_operativo_id = @soid
                        WHERE id = @id";

                    MySqlCommand cmd = new MySqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@nombre", txtNombreEquipo.Text.Trim());
                    cmd.Parameters.AddWithValue("@marca", txtMarca.Text.Trim());
                    cmd.Parameters.AddWithValue("@modelo", txtModelo.Text.Trim());
                    cmd.Parameters.AddWithValue("@foto", txtFoto.Text.Trim());
                    cmd.Parameters.AddWithValue("@soid", Convert.ToInt32(ddlSistemaOperativo.SelectedValue));
                    cmd.Parameters.AddWithValue("@id", id);

                    con.Open();
                    cmd.ExecuteNonQuery();
                }

                Response.Redirect("Equipos.aspx");
            }
            catch (Exception ex)
            {
                lblMensaje.Text = "Error al guardar los cambios: " + ex.Message;
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Equipos.aspx");
        }
    }
}
