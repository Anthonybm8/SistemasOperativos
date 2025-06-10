using System;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace SistemasOperativos
{
    public partial class NuevoE : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            lblMensaje.Text = "";

            if (!IsPostBack)
            {
                CargarSistemasOperativos();
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

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;

            try
            {
                using (MySqlConnection con = new MySqlConnection(connectionString))
                {
                    string query = @"INSERT INTO Equipo (nombre_equipo, marca, modelo, foto, sistema_operativo_id) 
                                     VALUES (@nombre, @marca, @modelo, @foto, @soid)";

                    MySqlCommand cmd = new MySqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@nombre", txtNombreEquipo.Text.Trim());
                    cmd.Parameters.AddWithValue("@marca", txtMarca.Text.Trim());
                    cmd.Parameters.AddWithValue("@modelo", txtModelo.Text.Trim());
                    cmd.Parameters.AddWithValue("@foto", txtFoto.Text.Trim());
                    cmd.Parameters.AddWithValue("@soid", Convert.ToInt32(ddlSistemaOperativo.SelectedValue));

                    con.Open();
                    cmd.ExecuteNonQuery();
                }

                Response.Redirect("Equipos.aspx");
            }
            catch (Exception ex)
            {
                lblMensaje.Text = "Error al guardar el equipo: " + ex.Message;
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Equipos.aspx");
        }
    }
}
