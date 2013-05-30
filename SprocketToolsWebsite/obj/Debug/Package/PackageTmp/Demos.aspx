<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Demos.aspx.cs" Inherits="SprocketToolsWebsite.Demos" MasterPageFile="~/Site.Master" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <script type="text/javascript">
        $(document).ready(function () {
            $('.tab').css("background-image", "url('/images/other_Tab.png')").css("color", "#2f2f2f");
            //$('.tab').css("color", "#2f2f2f")
            $("#demos").css("background-image", "url('/images/Active_Tab.png')").css("color", "White");
            //$("#demos").css("color", "White");
        });
    </script>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainLeft">
            <h3>SprocketComplete Demo</h3>
            Take a look at our SharePoint autocomplete textbox web part that is driven by SharePoint list.  Just add the web part, specify the list and column you want to use and you are up and rolling in a matter of minutes.
            <br /><br />
            <iframe width="425" height="349" src="http://www.youtube.com/embed/7BEpJWNz4D8" frameborder="0" allowfullscreen></iframe>
            <br />
</asp:Content>
