<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> 
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SprocketCompleteUserControl.ascx.cs" Inherits="SprocketComplete.SprocketComplete.SprocketCompleteUserControl" %>

<SharePoint:ScriptLink ID="ScriptLink2" runat="server" Name="SprocketComplete/js/jquery.min.js" Localizable="false" />
<SharePoint:ScriptLink ID="ScriptLink3" runat="server" Name="SprocketComplete/js/jquery.autocomplete.min.js" Localizable="false" />
<SharePoint:ScriptLink ID="ScriptLink4" runat="server" Name="SprocketComplete/js/lib/jquery.bgiframe.min.js" Localizable="false" />

<SharePoint:CssLink ID="CssLink1" runat="server" />
<SharePoint:CssRegistration ID="CssRegistration1" runat="server" Name="jquery.autocomplete.css" /> 

<script type="text/javascript">
    function getCompleteData() {
        if (<%= (!String.IsNullOrEmpty(WebPart._SourceList)).ToString().ToLower() %>) {
            var xmlData = "<soap:Envelope xmlns:soap='http://schemas.xmlsoap.org/soap/envelope/' xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' \
                  xmlns:xsd='http://www.w3.org/2001/XMLSchema'><soap:Body><GetListItems xmlns='http://schemas.microsoft.com/sharepoint/soap/'> \
                  <listName>{<%= WebPart._SourceList %>}</listName><query><Query xmlns=''><OrderBy><FieldRef Name='Title' /></OrderBy></Query></query><viewFields><ViewFields xmlns=''  /></viewFields> \
                  <queryOptions><QueryOptions xmlns='' /></queryOptions></GetListItems></soap:Body></soap:Envelope>";
            $.ajax({
                url: "<%= SPContext.Current.Web.Url %>/_vti_bin/lists.asmx",
                type: "POST",
                dataType: "xml",
                data: xmlData,
                complete: SuccessFunc,
                error: ErrorFunc,
                contentType: "text/xml; charset=\"utf-8\""
            });
          }
    }

    function SuccessFunc(result) {
        //xml node with namespace need to be handled differently for jQuery
        var data = "";
        $(result.responseXML).find("z\\:row").each(function () {
            data = data + $(this).attr("ows_<%= WebPart._SourceColumn %>") + "|";
        });
        $("#<%= tb_AC.ClientID %>").autocomplete(data.split("|"));
    }

    function ErrorFunc(result) {
        alert("ERROR: " + result.responseText);
    }


    function addLoadEvent(func) {
        var oldonload = window.onload;
        if (typeof window.onload != 'function') {
            window.onload = func;
        }
        else {
            window.onload = function () {
                oldonload();
                func();
            }
        }
    }

    addLoadEvent(getCompleteData);


</script>



<input id="tb_AC" runat="server" /> 
<br />