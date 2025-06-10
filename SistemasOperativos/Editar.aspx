<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="editar.aspx.cs" Inherits="SistemasOperativos.editar" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Editar Sistema Operativo</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server" class="container mt-4">
        <h2>Editar Sistema Operativo</h2>

        <asp:HiddenField ID="hfId" runat="server" />

        <div class="form-group">
            <asp:Label ID="lblNombre" runat="server" Text="Nombres:" AssociatedControlID="txtNombre" CssClass="form-label" />
            <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" />
            <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txtNombre"
                ErrorMessage="El nombre es obligatorio." ForeColor="red" Display="Dynamic" />
        </div>

        <div class="form-group">
            <asp:Label ID="lblVersion" runat="server" Text="Versión:" AssociatedControlID="txtVersion" CssClass="form-label" />
            <asp:TextBox ID="txtVersion" runat="server" CssClass="form-control" />
        </div>

        <div class="form-group">
            <asp:Label ID="lblArquitectura" runat="server" Text="Arquitectura:" AssociatedControlID="txtArquitectura" CssClass="form-label" />
            <asp:TextBox ID="txtArquitectura" runat="server" CssClass="form-control" />
        </div>

        <div class="form-group">
            <asp:Label ID="lblFabricante" runat="server" Text="Fabricante:" AssociatedControlID="txtFabricante" CssClass="form-label" />
            <asp:TextBox ID="txtFabricante" runat="server" CssClass="form-control" />
        </div>

        <div class="form-group">
            <asp:Label ID="lblManual" runat="server" Text="URL del Manual:" AssociatedControlID="txtManual" CssClass="form-label" />
            <asp:TextBox ID="txtManual" runat="server" CssClass="form-control" />
            <asp:RegularExpressionValidator ID="revManual" runat="server" ControlToValidate="txtManual"
                ValidationExpression="^https?://.+" ErrorMessage="Ingrese una URL válida (http o https)." ForeColor="red" Display="Dynamic" />
        </div>

        <asp:Button ID="btnGuardar" runat="server" Text="Guardar Cambios" CssClass="btn btn-success" OnClick="btnGuardar_Click" />
        <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CssClass="btn btn-secondary ml-2" OnClick="btnCancelar_Click" />

        <asp:Label ID="lblMensaje" runat="server" CssClass="mt-3"></asp:Label>
    </form>
    
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
