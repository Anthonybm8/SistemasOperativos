using System;
using System.Configuration;
using System.Data;
using MySql.Data.MySqlClient;

namespace SistemasOperativos
{
    public partial class Equipos : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarEquipos();
            }
        }

        private void CargarEquipos()
        {
            try
            {
                using (MySqlConnection con = new MySqlConnection(connectionString))
                {
                    string query = @"
                        SELECT e.id, e.nombre_equipo, e.marca, e.modelo, e.foto, so.nombre AS nombre_so
                        FROM Equipo e
                        INNER JOIN SistemaOperativo so ON e.sistema_operativo_id = so.id";

                    MySqlDataAdapter da = new MySqlDataAdapter(query, con);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    gvEquipos.DataSource = dt;
                    gvEquipos.DataBind();
                }
            }
            catch (Exception ex)
            {
                lblMensaje.Text = "Error al cargar los equipos: " + ex.Message;
            }
        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            Response.Redirect("NuevoE.aspx");
        }

        protected void gvEquipos_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
        {
            int id = Convert.ToInt32(gvEquipos.DataKeys[e.NewEditIndex].Value);
            Response.Redirect($"EditarE.aspx?id={id}");
        }

        protected void gvEquipos_RowDeleting(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(gvEquipos.DataKeys[e.RowIndex].Value);

            try
            {
                using (MySqlConnection con = new MySqlConnection(connectionString))
                {
                    string query = "DELETE FROM Equipo WHERE id=@id";
                    MySqlCommand cmd = new MySqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@id", id);
                    con.Open();
                    cmd.ExecuteNonQuery();
                }

                CargarEquipos();
            }
            catch (Exception ex)
            {
                lblMensaje.Text = "Error al eliminar el equipo: " + ex.Message;
            }
        }
    }
}
