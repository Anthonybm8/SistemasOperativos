using System;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace SistemasOperativos
{
    public partial class nuevo : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            lblMensaje.Text = "";
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    using (MySqlConnection con = new MySqlConnection(connectionString))
                    {
                        con.Open();

                        string query = @"INSERT INTO SistemaOperativo (nombre, version, arquitectura, fabricante, manual) 
                                         VALUES (@nombre, @version, @arquitectura, @fabricante, @manual)";

                        MySqlCommand cmd = new MySqlCommand(query, con);
                        cmd.Parameters.AddWithValue("@nombre", txtNombre.Text.Trim());
                        cmd.Parameters.AddWithValue("@version", txtVersion.Text.Trim());
                        cmd.Parameters.AddWithValue("@arquitectura", txtArquitectura.Text.Trim());
                        cmd.Parameters.AddWithValue("@fabricante", txtFabricante.Text.Trim());
                        cmd.Parameters.AddWithValue("@manual", txtManual.Text.Trim());

                        int result = cmd.ExecuteNonQuery();

                        if (result > 0)
                        {
                            Response.Redirect("sistemasOs.aspx");
                        }
                        else
                        {
                            lblMensaje.ForeColor = System.Drawing.Color.Red;
                            lblMensaje.Text = "Error al agregar el sistema operativo.";
                        }
                    }
                }
                catch (Exception ex)
                {
                    lblMensaje.ForeColor = System.Drawing.Color.Red;
                    lblMensaje.Text = "Error: " + ex.Message;
                }
            }
        }
        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            // Redirige sin importar validaciones
            Response.Redirect("sistemasOs.aspx");
        }
    }
}
