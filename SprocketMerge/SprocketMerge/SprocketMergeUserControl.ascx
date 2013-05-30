<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SprocketMergeUserControl.ascx.cs" Inherits="SprocketMerge.SprocketMerge.SprocketMergeUserControl" %>

Select your document from existing templates:<br />
<asp:ListBox ID="lb_Templates" runat="server" AutoPostBack="true" Width="200"
    onselectedindexchanged="lb_Templates_SelectedIndexChanged" /><br />
Don't see your template? Click <a href="javascript:SP.UI.ModalDialog.OpenPopUpPage('/_layouts/SprocketMerge/UploadFile.aspx');">here</a> to upload a template from your local machine.
<br />

<%--Browse for your template Word document: 
<asp:FileUpload runat="server" ID="fu_Template" EnableViewState="true" />--%>
<br />
<%--<asp:UpdatePanel ID="up_Info" runat="server">
    <ContentTemplate>--%>
        Select your source list: <asp:DropDownList ID="ddl_Lists" runat="server" AutoPostBack="true" onselectedindexchanged="ddl_Lists_SelectedIndexChanged" Enabled="false" />
        <br /><br />
        <asp:GridView ID="gv_Mappings" runat="server" AutoGenerateColumns="false" OnRowDataBound="gv_Mappings_rowdatabound" >
            <Columns>
                <asp:BoundField DataField="TemplateField" HeaderText="Template Field" />
                <asp:TemplateField HeaderText="Mapped to...">
                    <ItemTemplate>
                        <asp:DropDownList ID="ddl_Columns" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
<%--    </ContentTemplate>
</asp:UpdatePanel>--%>
<br />
Select your destination library: <asp:DropDownList ID="ddl_Destination" runat="server" Enabled="false" />
<br />
<asp:Button ID="btn_Merge" runat="server" Text="Merge!" 
    onclick="btn_Merge_Click" /><br />
    <asp:Label  ID="lbl_Result" runat="server" />