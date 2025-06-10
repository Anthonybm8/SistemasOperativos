<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Equipos.aspx.cs" Inherits="SistemasOperativos.Equipos" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Lista de Equipos</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server" class="container mt-4">
        <h2>Equipos</h2>

        <asp:Button ID="btnNuevo" runat="server" Text="Nuevo Equipo" CssClass="btn btn-primary mb-3" OnClick="btnNuevo_Click" />

        <asp:GridView ID="gvEquipos" runat="server" AutoGenerateColumns="False" DataKeyNames="id"
            CssClass="table table-bordered"
            OnRowEditing="gvEquipos_RowEditing" OnRowDeleting="gvEquipos_RowDeleting">
            <Columns>
                <asp:BoundField DataField="nombre_equipo" HeaderText="Nombre" />
                <asp:BoundField DataField="marca" HeaderText="Marca" />
                <asp:BoundField DataField="modelo" HeaderText="Modelo" />
                <asp:TemplateField HeaderText="Foto">
                    <ItemTemplate>
                        <asp:Image ID="imgFoto" runat="server" ImageUrl='<%# Eval("foto") %>' Width="100px" Height="100px" AlternateText="Foto Equipo" />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:BoundField DataField="nombre_so" HeaderText="Sistema Operativo" />
                <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>

        <asp:Label ID="lblMensaje" runat="server" CssClass="text-danger mt-3"></asp:Label>
    </form>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
