using System;
using System.Data;
using MySql.Data.MySqlClient;
using System.Configuration;

namespace SistemasOperativos
{
    public partial class sistemasOs : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarSistemasOperativos();
            }
        }

        private void CargarSistemasOperativos()
        {
            using (MySqlConnection con = new MySqlConnection(connectionString))
            {
                string query = "SELECT * FROM SistemaOperativo";
                MySqlDataAdapter da = new MySqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvSistemas.DataSource = dt;
                gvSistemas.DataBind();
            }
        }

        protected void gvSistemas_RowDeleting(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(gvSistemas.DataKeys[e.RowIndex].Value);

            using (MySqlConnection con = new MySqlConnection(connectionString))
            {
                con.Open();
                MySqlCommand cmd = new MySqlCommand("DELETE FROM SistemaOperativo WHERE id = @id", con);
                cmd.Parameters.AddWithValue("@id", id);
                cmd.ExecuteNonQuery();
            }

            CargarSistemasOperativos();
        }

        protected void btnEditar_Click(object sender, EventArgs e)
        {
            var button = (System.Web.UI.WebControls.Button)sender;
            string id = button.CommandArgument;

            Response.Redirect($"editar.aspx?id={id}");
        }
        protected void btnAgregarNuevo_Click(object sender, EventArgs e)
        {
            Response.Redirect("nuevo.aspx");
        }
    }
}
