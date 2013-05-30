<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="SprocketToolsWebsite.Test" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="Scripts/interface.js" type="text/javascript"></script>
    <style>
        div.nav
        {
            float:left;
            border:1px solid;
            height:25px;
            width:45px;
            padding:5px;
            margin-right:35px;
            text-align:center;
            position:relative;
        }
        div.main
        {
            position:relative;
            top:60px;
            width:500px;
            margin:auto;
        }
        div.first
        {
        }
        div.second
        {
            top:-8px;
        }
        div.third
        {
            top:-12px;
        }
        div.fourth
        {
            top:-8px;
        }
        div.fifth
        {
        }
    </style>
    <script type="text/javascript">
        $(document).ready({

//        $("#fisheye").Fisheye(
//            {
//                	maxWidth: 50,
//					items: 'a',
//					itemsText: 'span',
//					container: '.first',
//					itemWidth: 40,
//					proximity: 90,
//					halign : 'center'

//            }
//        );

    });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="main">
            <div class="nav first">
                First
                <a>test</a>
                <a>test2</a>
                <a>test3</a>
            </div>
            <div class="nav second">
                Second
            </div>
            <div class="nav third">
                Third
            </div>
            <div class="nav fourth">
                Fourth
            </div>
            <div class="nav fifth">
                Fifth
            </div>
        </div>
    </form>
</body>
</html>
