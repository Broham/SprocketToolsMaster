<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="SprocketToolsWebsite._Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
      <script type="text/javascript" >
          $(document).ready(function () {
              $('.tab').css("background-image", "url('/images/other_Tab.png')").css("color", "#2f2f2f");
              $("#home").css("background-image", "url('/images/Active_Tab.png')").css("color", "White");
          });

      </script>
</asp:Content>
<asp:Content ID="cnt_featured" runat="server" ContentPlaceHolderID="FeaturedContent">
    <div id="featured">
        <div id="featured_content">
	        We are excited to announce the release of our first product - Sprocket Validator!  <strong>Sprocket Validator provides several methods for validaing user input in SharePoint 2010 including</strong>:
            <ul>
                <li><strong>Masked Inputs</strong> - Allow users to input fixed width data that is automatically formatted into dates, phone numbers, social security numbers or any custom pattern that you would like.</li>
                <li><strong>Regualr Expressions</strong> - Users can choose from common predefined regular expressions or create their own.</li>
                <li><strong>Value Comparisons</strong> - Determine if a value is greater than, less than, contains or starts with a certain value.</li>
            </ul>
            <a style="color:#03d759" href="/ProductList.aspx#spv">Click here</a> to being your 14 day trial!
            <br />
        </div>
    </div>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainLeft">
            <h3>Welcome to Sprocket tools!</h3>
            Sprocket Tools delivers quality SharePoint web parts and administrative tools at an affordable price.  By providing effective SharePoint components we allow administrators and users to focus on more important tasks rather than worrying about implementing gaps in commonly requested functionality.
            <br /><br />
            Sprocket Tools also provides custom SharePoint development.  We can offer significant discounts on custom development if the client allows us to resell what we develop.  If you need something developed just contact one of our sales engineers to discuss what solution will work best for you and your organization.
            <br />
</asp:Content>
<asp:Content ID="rightContent" runat="server" ContentPlaceHolderID="MainRight">
            <h3>Newest features</h3>
            Check out our newest sharepoint tools!
            <br />  <br />
            <img src="images/spLogo.png" />
</asp:Content>
