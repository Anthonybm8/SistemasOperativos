<%@ Page Title="Nuevo Sistema Operativo" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="nuevo.aspx.cs" Inherits="SistemasOperativos.nuevo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <main id="main" class="main">
        <div class="container mt-4">
            <h2>Agregar Nuevo Sistema Operativo</h2>

            <div class="form-group">
                <asp:Label ID="lblNombre" runat="server" Text="Nombre:" AssociatedControlID="txtNombre" CssClass="form-label" />
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

            <asp:Button ID="btnGuardar" runat="server" Text="Guardar" CssClass="btn btn-success" OnClick="btnGuardar_Click" />
            <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CssClass="btn btn-secondary ml-2" OnClick="btnCancelar_Click" CausesValidation="false" />

            <asp:Label ID="lblMensaje" runat="server" CssClass="mt-3 text-danger"></asp:Label>
        </div>
    </main>
</asp:Content>
