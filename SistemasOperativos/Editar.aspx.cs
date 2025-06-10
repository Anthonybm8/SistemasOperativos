using System;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace SistemasOperativos
{
    public partial class editar : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            lblMensaje.Text = "";

            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    int id;
                    if (int.TryParse(Request.QueryString["id"], out id))
                    {
                        hfId.Value = id.ToString();
                        CargarDatos(id);
                    }
                    else
                    {
                        lblMensaje.ForeColor = System.Drawing.Color.Red;
                        lblMensaje.Text = "ID inválido.";
                        btnGuardar.Enabled = false;
                    }
                }
                else
                {
                    lblMensaje.ForeColor = System.Drawing.Color.Red;
                    lblMensaje.Text = "No se proporcionó ID.";
                    btnGuardar.Enabled = false;
                }
            }
        }

        private void CargarDatos(int id)
        {
            using (MySqlConnection con = new MySqlConnection(connectionString))
            {
                string query = "SELECT * FROM SistemaOperativo WHERE id = @id";
                MySqlCommand cmd = new MySqlCommand(query, con);
                cmd.Parameters.AddWithValue("@id", id);

                con.Open();
                using (var reader = cmd.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        txtNombre.Text = reader["nombre"].ToString();
                        txtVersion.Text = reader["version"].ToString();
                        txtArquitectura.Text = reader["arquitectura"].ToString();
                        txtFabricante.Text = reader["fabricante"].ToString();
                        txtManual.Text = reader["manual"].ToString();
                    }
                    else
                    {
                        lblMensaje.ForeColor = System.Drawing.Color.Red;
                        lblMensaje.Text = "No se encontró el sistema operativo.";
                        btnGuardar.Enabled = false;
                    }
                }
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    int id = int.Parse(hfId.Value);

                    using (MySqlConnection con = new MySqlConnection(connectionString))
                    {
                        string query = @"UPDATE SistemaOperativo 
                                         SET nombre=@nombre, version=@version, arquitectura=@arquitectura, fabricante=@fabricante, manual=@manual 
                                         WHERE id=@id";

                        MySqlCommand cmd = new MySqlCommand(query, con);
                        cmd.Parameters.AddWithValue("@nombre", txtNombre.Text.Trim());
                        cmd.Parameters.AddWithValue("@version", txtVersion.Text.Trim());
                        cmd.Parameters.AddWithValue("@arquitectura", txtArquitectura.Text.Trim());
                        cmd.Parameters.AddWithValue("@fabricante", txtFabricante.Text.Trim());
                        cmd.Parameters.AddWithValue("@manual", txtManual.Text.Trim());
                        cmd.Parameters.AddWithValue("@id", id);

                        con.Open();
                        int result = cmd.ExecuteNonQuery();

                        if (result > 0)
                        {
                            Response.Redirect("sistemasOs.aspx");
                        }
                        else
                        {
                            lblMensaje.ForeColor = System.Drawing.Color.Red;
                            lblMensaje.Text = "No se pudo actualizar el sistema operativo. Intente nuevamente.";
                        }
                    }
                }
                catch (Exception ex)
                {
                    lblMensaje.ForeColor = System.Drawing.Color.Red;
                    lblMensaje.Text = "Error al guardar: " + ex.Message;
                }
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("sistemasOs.aspx");
        }
    }
}
