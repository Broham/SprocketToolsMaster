﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductList.aspx.cs" Inherits="SprocketToolsWebsite.ProductList" MasterPageFile="~/Site.Master" %>


<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <script src="Scripts/jquery.maskedinput-1.3.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('.tab').css("background-image", "url('/images/other_Tab.png')").css("color", "#2f2f2f");
            $("#products").css("background-image", "url('/images/Active_Tab.png')").css("color", "White");
            $("#phone").mask("(999) 999-9999? x99999");
            $("#cPost").mask("a9a 9a9");
            $("#ssn").mask("999-99-9999");
            $("#spv14DL").colorbox({width: "500px",
                                 height:"500px",
                                 iframe: true });
        });
    </script>
</asp:Content>
<asp:Content ID="cnt_featured" runat="server" ContentPlaceHolderID="FeaturedContent">
    <div id="featured">
        <div id="featured_content">
            <span>Our latest products</span>
        </div>
    </div>
</asp:Content>
<asp:Content ID="main" runat="server" ContentPlaceHolderID="MainAll">
<div id="spv" class="product">
    <h3>Sprocket Validator</h3>
   Sprocket Validator provides a number of methods for validating and formatting user input that go above and beyond the out of the box functionality of SharePoint 2010 validation.  
   This allows administrators to ensure that meaningful and consistent data is being entered at all times.  
   <br />

   You can watch a quick video of Sprocket Validator in action <a style="color:#03d759" href="/Demos.aspx">here</a>.  
   If you like what you see feel free to try a 14 day free trial or purchase below:
   <br /><br />
   <a href="/popups/spv14.aspx" id="spv14DL">SharePoint 2010 14 day trial</a><br />

<input type="hidden" name="cmd" value="_s-xclick">
<input type="hidden" name="hosted_button_id" value="ZVHT35ENLJPZG">
<table>
<tr><td>
<%--<input type="hidden" name="on0" value="Sprocket Validator Options:">Sprocket Validator Options:</td></tr><tr><td><select name="os0">
	    <option value="Sprocket Validator">Sprocket Validator $0.01 USD</option>
	    <option value="Sprocket Validator and 1 year maintenance">Sprocket Validator and 1 year maintenance $0.01 USD</option>
    </select> </td></tr>
    </table>
    <input type="hidden" name="currency_code" value="USD">
    <asp:ImageButton ID="btnPayNow" runat="server" ImageUrl="https://www.paypalobjects.com/en_US/i/btn/btn_buynowCC_LG.gif" PostBackUrl="https://www.paypal.com/cgi-bin/webscr" AlternateText="PayPal - The safer, easier way to pay online!"/>
    <img alt="" border="0" src="https://www.paypalobjects.com/en_US/i/scr/pixel.gif" width="1" height="1">
       <br />
    <br />--%>
</div>


<div id="Div1" class="product">
    <h3>Sprocket Merge</h3>
   Sprocket Validator provides a number of methods for validating and formatting user input that go above and beyond the out of the box functionality of SharePoint 2010 validation.  
   This allows administrators to ensure that meaningful and consistent data is being entered at all times.  
   <br />
   <!--<br />
    
    These custom validation methods include:
    <ul>
        <li>
            Masked Input:<br />
            Users will be forced to enter fixed width data and formatting will automatically be applied.  If you are not familiar with how masked inputs work, give it a whirle below:<br />
            <table style="margin:20px;">
                <tr>
                    <td>Social Security Number:</td>
                    <td><input id="ssn" type="text" /></td>
                </tr>
                <tr>
                    <td>Phone Number with Extension:</td>
                    <td><input id="phone" type="text" /></td>
                </tr>
            </table>
        </li>
        <li>Regular Expression Validation - </li>
        <li>Value Comparison - </li>
    </ul>
    -->

   <br />

   You can watch a quick video of Sprocket Validator in action <a style="color:#03d759" href="/Demos.aspx">here</a>.  
   If you like what you see feel free to try a 14 day free trial or purchase below:
   <br /><br />
   <a href="/popups/spv14.aspx" id="A1">SharePoint 2010 14 day trial</a><br />
   <a href="" id="A2">SharePoint 2010 purchase</a>
    <br />
    <br />
</div>

<div id="Div2" class="product">
    <h3>Sprocket Lookup</h3>
   Sprocket Validator provides a number of methods for validating and formatting user input that go above and beyond the out of the box functionality of SharePoint 2010 validation.  
   This allows administrators to ensure that meaningful and consistent data is being entered at all times.  
   <br />
   <!--<br />
    
    These custom validation methods include:
    <ul>
        <li>
            Masked Input:<br />
            Users will be forced to enter fixed width data and formatting will automatically be applied.  If you are not familiar with how masked inputs work, give it a whirle below:<br />
            <table style="margin:20px;">
                <tr>
                    <td>Social Security Number:</td>
                    <td><input id="ssn" type="text" /></td>
                </tr>
                <tr>
                    <td>Phone Number with Extension:</td>
                    <td><input id="phone" type="text" /></td>
                </tr>
            </table>
        </li>
        <li>Regular Expression Validation - </li>
        <li>Value Comparison - </li>
    </ul>
    -->

   <br />

   You can watch a quick video of Sprocket Validator in action <a style="color:#03d759" href="/Demos.aspx">here</a>.  
   If you like what you see feel free to try a 14 day free trial or purchase below:
   <br /><br />
   <a href="/popups/spv14.aspx" id="A3">SharePoint 2010 14 day trial</a><br />
   <a href="" id="A4">SharePoint 2010 purchase</a>
    <br />
    <br />
</div>

</asp:Content>
