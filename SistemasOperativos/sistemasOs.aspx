<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sistemasOs.aspx.cs" Inherits="SistemasOperativos.sistemasOs" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sistemas Operativos</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-4">
            <h1 class="mb-4">Lista de Sistemas Operativos</h1>

            <asp:Button ID="btnAgregarNuevo" runat="server" Text="Agregar Nuevo Sistema" CssClass="btn btn-primary mb-3" OnClick="btnAgregarNuevo_Click" />

            <asp:GridView ID="gvSistemas" runat="server" CssClass="table table-bordered table-striped"
                AutoGenerateColumns="False" DataKeyNames="id"
                OnRowDeleting="gvSistemas_RowDeleting"
                ShowHeader="True"
                GridLines="Both"
                EmptyDataText="No hay sistemas operativos registrados.">
                <Columns>
                    <asp:BoundField DataField="nombre" HeaderText="Nombre" />
                    <asp:BoundField DataField="version" HeaderText="Versión" />
                    <asp:BoundField DataField="arquitectura" HeaderText="Arquitectura" />
                    <asp:BoundField DataField="fabricante" HeaderText="Fabricante" />
                    <asp:TemplateField HeaderText="Manual">
                        <ItemTemplate>
                            <asp:HyperLink ID="hlManual" runat="server" NavigateUrl='<%# Eval("manual") %>' Text="Ver Manual" Target="_blank" CssClass="btn btn-sm btn-info" />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Editar">
                        <ItemTemplate>
                            <asp:Button ID="btnEditar" runat="server" Text="Editar" CssClass="btn btn-sm btn-warning"
                                CommandArgument='<%# Eval("id") %>' OnClick="btnEditar_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:CommandField ShowDeleteButton="True" ButtonType="Button" DeleteText="Eliminar" />
                </Columns>
            </asp:GridView>
        </div>
    </form>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
