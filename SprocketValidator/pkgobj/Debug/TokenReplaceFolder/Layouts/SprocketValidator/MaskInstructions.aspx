<%@ Assembly Name="SprocketValidator, Version=1.0.0.0, Culture=neutral, PublicKeyToken=6d8442061715448c" %>
<%@ Import Namespace="Microsoft.SharePoint.ApplicationPages" %>
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MaskInstructions.aspx.cs" Inherits="SprocketValidator.Layouts.SprocketValidator.MaskInstructions" DynamicMasterPageFile="~masterurl/default.master" %>

<asp:Content ID="PageHead" ContentPlaceHolderID="PlaceHolderAdditionalPageHead" runat="server">
<style type="text/css">

    body, div
    {
        background-color: #F1F1F2;
    }
</style>
</asp:Content>

<asp:Content ID="Main" ContentPlaceHolderID="PlaceHolderMain" runat="server">
    <div style="padding: 40px;color:#4C4C4C;background-color: #F1F1F2;">
        The following mask definitions are available:
        <ul>
            <li> a - Represents any letter (A-Z,a-z)</li>
            <li> 9 - Represents any number (0-9)</li>
            <li> * - Represents any number or letter (A-Z,a-z,0-9)</li>
        </ul>

        All other characters besides the 3 above will be placeholders that are automatically included when the user begins typing.<br /><br />

        By using the <i>a, 9 or *</i> characters you can define how users must enter input.  <br /><br />

        For example, if you want to only allow users to enter a Social Security Number you could define a custom mask as: <i>999-99-9999</i><br /><br />

        This will allow users to only enter numbers and will automatically insert dashes in the correct position.<br /><br />

        Below are several more examples:
        <ul>
            <li>5 letters with dashes inbetween them: <i>a-a-a-a-a</i></li>
            <li>5 letters, a dash and then 3 numbers: <i>aaaaa-999</i></li>
            <li>a standard US phone number: <i>(999) 999-9999</i></li>
        </ul>
    </div>
</asp:Content>

<asp:Content ID="PageTitle" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">
Create your own custom masked input
</asp:Content>

<asp:Content ID="PageTitleInTitleArea" ContentPlaceHolderID="PlaceHolderPageTitleInTitleArea" runat="server" >
Custom Input Mask Instructions
</asp:Content>
