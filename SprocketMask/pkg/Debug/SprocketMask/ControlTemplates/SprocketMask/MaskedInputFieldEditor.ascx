<%@ Assembly Name="SprocketMask, Version=1.0.0.0, Culture=neutral, PublicKeyToken=2f043c6337a3e9b7" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MaskedInputFieldEditor.ascx.cs" Inherits="SprocketMask.ControlTemplates.SprocketMask.MaskedInputFieldEditor" %>
<table>
    <tr>
        <td>Select from common patterns: </td>
        <td>
            <asp:DropDownList ID="ddl_CommonPatterns" runat="server">
                <asp:ListItem Text="---Select---" />
                <asp:ListItem Text="US Phone Number" Value="(999) 999-9999? x99999" />
                <asp:ListItem Text="Social Security Number" Value="999-99-9999" />
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td>
            <asp:CheckBox ID="cb_CustomMask" runat="server" AutoPostBack="true" TextAlign="Left" Text="or create a custom pattern: " 
                oncheckedchanged="cb_CustomMask_CheckedChanged" />
        </td>
        <td align="right">
            <asp:TextBox ID="tb_CustomMask" runat="server" Enabled="false" />        
        </td>
    </tr>
</table>


