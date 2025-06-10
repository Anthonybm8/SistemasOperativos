<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditarE.aspx.cs" Inherits="SistemasOperativos.EditarE" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Editar Equipo</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server" class="container mt-4">
        <h2>Editar Equipo</h2>

        <asp:HiddenField ID="hfId" runat="server" />

        <div class="form-group">
            <asp:Label ID="lblNombreEquipo" runat="server" Text="Nombre del Equipo:" AssociatedControlID="txtNombreEquipo" CssClass="form-label"></asp:Label>
            <asp:TextBox ID="txtNombreEquipo" runat="server" CssClass="form-control" />
            <asp:RequiredFieldValidator ID="rfvNombreEquipo" runat="server" ControlToValidate="txtNombreEquipo"
                ErrorMessage="El nombre del equipo es obligatorio." ForeColor="red" Display="Dynamic" />
        </div>

        <div class="form-group">
            <asp:Label ID="lblMarca" runat="server" Text="Marca:" AssociatedControlID="txtMarca" CssClass="form-label"></asp:Label>
            <asp:TextBox ID="txtMarca" runat="server" CssClass="form-control" />
            <asp:RequiredFieldValidator ID="rfvMarca" runat="server" ControlToValidate="txtMarca"
                ErrorMessage="La marca es obligatoria." ForeColor="red" Display="Dynamic" />
        </div>

        <div class="form-group">
            <asp:Label ID="lblModelo" runat="server" Text="Modelo:" AssociatedControlID="txtModelo" CssClass="form-label"></asp:Label>
            <asp:TextBox ID="txtModelo" runat="server" CssClass="form-control" />
            <asp:RequiredFieldValidator ID="rfvModelo" runat="server" ControlToValidate="txtModelo"
                ErrorMessage="El modelo es obligatorio." ForeColor="red" Display="Dynamic" />
        </div>

        <div class="form-group">
            <asp:Label ID="lblFoto" runat="server" Text="Foto (URL):" AssociatedControlID="txtFoto" CssClass="form-label"></asp:Label>
            <asp:TextBox ID="txtFoto" runat="server" CssClass="form-control" />
            <asp:RegularExpressionValidator ID="revFoto" runat="server" ControlToValidate="txtFoto"
                ValidationExpression="^https?://.+" ErrorMessage="Ingrese una URL válida (http o https)." ForeColor="red" Display="Dynamic" />
        </div>

        <div class="form-group">
            <asp:Label ID="lblSistemaOperativo" runat="server" Text="Sistema Operativo:" AssociatedControlID="ddlSistemaOperativo" CssClass="form-label"></asp:Label>
            <asp:DropDownList ID="ddlSistemaOperativo" runat="server" CssClass="form-control" />
            <asp:RequiredFieldValidator ID="rfvSistemaOperativo" runat="server" ControlToValidate="ddlSistemaOperativo"
                InitialValue="" ErrorMessage="Seleccione un sistema operativo." ForeColor="red" Display="Dynamic" />
        </div>

        <asp:Button ID="btnGuardar" runat="server" Text="Guardar Cambios" CssClass="btn btn-success" OnClick="btnGuardar_Click" />
        <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CssClass="btn btn-secondary ml-2" OnClick="btnCancelar_Click" />

        <asp:Label ID="lblMensaje" runat="server" CssClass="mt-3 text-danger"></asp:Label>
    </form>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
