<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UserInfo.ascx.cs" Inherits="SprocketToolsWebsite.popups.UserInfo" %>
<div>
    <table width="100%">
        <tr>
            <td>First Name:</td><td><asp:TextBox ID="tb_FName" runat="server" />* <asp:RequiredFieldValidator ControlToValidate="tb_FName" Text="You must enter a value for First Name" runat="server" /></td>
        </tr>
        <tr>
            <td>Last Name:</td><td><asp:TextBox ID="tb_LName" runat="server" />* <asp:RequiredFieldValidator ControlToValidate="tb_LName" Text="You must enter a value for Last Name" runat="server" /></td>
        </tr>
        <tr>
            <td>Company Name:</td><td><asp:TextBox ID="tb_Company" runat="server" />* <asp:RequiredFieldValidator ControlToValidate="tb_Company" Text="You must enter a value for Company" runat="server" /></td>
        </tr>
        <tr>
            <td>Email Address:</td><td><asp:TextBox ID="tb_Email" runat="server" />* <asp:RequiredFieldValidator ControlToValidate="tb_Email" Text="You must enter a value for Email" runat="server" /></td>
        </tr>
        <tr>
            <td>Phone Number:</td><td><asp:TextBox ID="tb_Phone" runat="server" /></td>
        </tr>
        <tr>
            <td style="vertical-align: text-top">Server Names:</td><td>Please include a comma seperated list of servers that you plan to install on.<br /><asp:TextBox ID="tb_Server" runat="server" TextMode="MultiLine" />*<asp:RequiredFieldValidator ControlToValidate="tb_Email" Text="You must enter at least one server name" runat="server" /></td>
        </tr>
        <tr>
            <td style="vertical-align: text-top">Other info:</td><td><asp:TextBox ID="tb_Other" runat="server" TextMode="MultiLine" /></td>
        </tr>
    </table>
    
</div>