<%@ Assembly Name="SprocketValidator, Version=1.0.0.0, Culture=neutral, PublicKeyToken=6d8442061715448c" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ValidatorSettings.ascx.cs" Inherits="SprocketValidator.CONTROLTEMPLATES.SprocketValidator.ValidatorSettings" %>
<%@ Register TagPrefix="wssuc" TagName="InputFormControl" src="~/_controltemplates/InputFormControl.ascx" %>
<%@ Register TagPrefix="wssuc" TagName="InputFormSection" src="~/_controltemplates/InputFormSection.ascx" %>


<wssuc:InputFormSection runat="server" Title="SprocketValidator Settings" id="inputSectionLookupRelationships" >
	<Template_Description>
        Enter your SprocketValidator settings here.
	</Template_Description>
	<Template_InputFormControls>
	<wssuc:InputFormControl runat="server" ID="inputFormRelationships">
		<Template_LabelText>
		    Validation Settings:
		</Template_LabelText>
		<Template_Control>
        <script>
            function openDialog() {
	            var options = {
	                url: "/_layouts/SprocketValidator/MaskInstructions.aspx",
	                width: 800,
	                height: 600,
	                title: "Mask Instructions",
	            };
	            SP.UI.ModalDialog.showModalDialog(options);
	        }
        </script>
        <asp:RadioButtonList ID="rbl_ValidationMethods" runat="server" onselectedindexchanged="rbl_ValidationMethods_SelectedIndexChanged" AutoPostBack="true">
            <asp:ListItem Text="Common Patterns" Selected="True"/>
            <asp:ListItem Text="Masked Input" />
            <asp:ListItem Text="Regular Expression" />
            <asp:ListItem Text="Value Comparison" />
        </asp:RadioButtonList>
        <br />
        <asp:Panel ID="pnl_CommonPatterns" runat="server" Visible="true">
            Common Patterns: 
            <asp:DropDownList ID="ddl_CommonPatterns" runat="server" OnSelectedIndexChanged="OnChange_ddl_CommonPatterns" AutoPostBack="true">
                <asp:ListItem Text="---Select Pattern----" />
                <asp:ListItem Text="US Phone Number" Value="(999) 999-9999? x99999" />
                <asp:ListItem Text="Social Security Number" Value="999-99-9999" />
                <asp:ListItem Text="Email Address" Value="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                <asp:ListItem Text="Web Address" />
                <asp:ListItem Text="Zip Code" value="99999?-9999" />
            </asp:DropDownList>
            <br />
            <asp:Label ID="lbl_CommonPatternDesc" runat="server" />
        </asp:Panel>

        <asp:Panel ID="pnl_MaskedInput" runat="server" Visible="false">
            Masked Input Pattern: <asp:TextBox ID="tb_MaskedInputPattern" runat="server" /><br /><br />
            <i>Masked inputs allow you to apply formatting to any input a user enters.  <br /><br />For example when a users enters 5555555555 for a phone number you can automatically format what they enter as (555) 555-5555.  To find more information on how to format input click <a href="#" onclick="openDialog(); return false;">here</a>.</i>
        </asp:Panel>

        <asp:Panel ID="pnl_Regex" runat="server" Visible="false">
            Regular Expression to match: <asp:TextBox ID="tb_RegularExpression" runat="server" TextMode="MultiLine" Rows="3" Width="90%" /> <br /><br />
            <i>Regular expressions allow advanced users to specify complex validation patterns for user input.  To learn more about creating regular expressions <a href="http://www.regular-expressions.info/tutorial.html" target="_blank">click here</a>.</i>
        </asp:Panel>
        <asp:Panel ID="pnl_ValueComparison" runat="server" Visible="false">
            <div style="float:left">This value is a: </div>
            <div style="float:right">
                <asp:DropDownList runat="server" ID="ddl_ValueType">
                    <asp:ListItem Text="Number" />
                    <asp:ListItem Text="Date"  />
                    <asp:ListItem Text="Word or Words"  />
                </asp:DropDownList>
            </div>
            <div style="clear:both">&nbsp;</div>

            <div style="float:left">This value must:  </div>
            <div style="float:right">
                <asp:DropDownList ID="ddl_ComparisonTypes" runat="server">
                    <asp:ListItem Text="Be Greater Than..." Value="Be Greater Than..."  />
                    <asp:ListItem Text="Be Less Than..." Value="Be Less Than..."   />
                    <asp:ListItem Text="Start With..." Value="Start With..."   />
                    <asp:ListItem Text="End With..."  Value="End With..."  />
                    <asp:ListItem Text="Contain..." Value="Contain..."   />
                </asp:DropDownList>
            </div>
            <div style="clear:both">&nbsp;</div>

            <div style="float:left">this value:</div>
            <div style="float:right"><asp:TextBox ID="tb_ComparisonValue" runat="server" /></div>
            <div style="clear:both">&nbsp;</div>
        </asp:Panel>
        <br /><br />
        <div style="float:left">Instructions for end user: </div>
        <div style="float:left"><asp:TextBox ID="tb_Instructions" runat="server" TextMode="MultiLine" /></div>
		</Template_Control>
	</wssuc:InputFormControl>
	</Template_InputFormControls>
</wssuc:InputFormSection>

