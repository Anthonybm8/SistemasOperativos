<%@ Page Title="Equipos" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Equipos.aspx.cs" Inherits="SistemasOperativos.Equipos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Contenido principal con clase "main" para integrarse con la plantilla -->
    <main id="main" class="main">
        <div class="container mt-4">
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
        </div>
    </main>
</asp:Content>
