<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="SprocketToolsWebsite.ContactUs" MasterPageFile="~/Site.Master" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <script type="text/javascript">
        $(document).ready(function () {
            $('.tab').css("background-image", "url('/images/other_Tab.png')").css("color", "#2f2f2f");
        });
    </script>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainAll">



    <div style="width:450px;margin-left:auto;margin-right:auto;">
        <h2>
            Contact us:
        </h2>
        <div class="left">Your Name:</div>
        <div class="right"><asp:TextBox ID="tb_Name" runat="server" Width="275"  /></div> 
        <div class="clearing" /><br />

        <div class="left">Your Email:</div>
        <div class="right"><asp:TextBox ID="tb_Email" runat="server" Width="275"  /></div> 
        <div class="clearing" /><br />

                <div class="left">Your Phone:</div>
        <div class="right"><asp:TextBox ID="tb_Phone" runat="server" Width="275"  /></div> 
        <div class="clearing" /><br />

        <div class="left">Message:</div>
        <div class="right"><asp:TextBox ID="tb_Message" runat="server" TextMode="MultiLine" Height="200" Width="275" /></div> 
        <div class="clearing" /><br />

        <asp:Button ID="btn_SendEmail" runat="server" Text="Send" 
                onclick="btn_SendEmail_Click" />

        <br /><br />
        <asp:Label ID="lbl_Message" runat="server" />
    </div>
</asp:Content>
