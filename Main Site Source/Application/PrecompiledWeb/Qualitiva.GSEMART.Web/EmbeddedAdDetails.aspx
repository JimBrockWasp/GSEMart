<%@ page language="C#" autoeventwireup="true" inherits="EmbeddedAdDetails, App_Web_wtvs-xho" theme="Default" maintainScrollPositionOnPostBack="true" %>
<%@ Register TagPrefix="uc" TagName="Advert" Src="~/UserControls/Advert.ascx" %>
<%@ Register TagPrefix="uc" TagName="Notifier" Src="~/UserControls/Notifier.ascx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!--- Style Sheet --->
<link href="<%= ResolveUrl("~/style/Default.css") %>" rel="stylesheet" type="text/css" />
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>


</head>
<body>
    <!--- JavaScript --->
    <script type="text/javascript" src='<%= ResolveUrl ("~/js/popup.js") %>'></script>
    <script type="text/javascript" src='<%= ResolveUrl ("~/js/datepicker.js") %>'></script>
    <script type="text/javascript" src='<%= ResolveUrl ("~/js/util.js") %>'></script>
    <script type="text/javascript" src="<%= ResolveUrl ("~/js/jquery-1.7.min.js") %>"></script>

    <script type="text/javascript">
    $(document).ready(function(){
        $('#gallery a').lightBox();
    });
    </script>


    <form id="form1" runat="server">
    <div>
    

<!-- Content Container -->
<div style="width:100%;">

    <uc:notifier ID="ctlNotifier" runat="server" EnableViewState="false" />     
      
    <uc:Advert ID="ctAdvert" runat="server" />
    
    <br />
    <div class="advertAdvertId" style="padding-left:10px; float: left; width:800px;">
        <asp:Label ID="lblAdvertId" runat="server" />
    </div>
    
    <div class="advertCounter" style="float:left; width:200px;">
        Total Views: <asp:Label ID="lblCounter" runat="server" />
    </div>
    <div style="clear:both;"></div>
    
</div>
    </div>
    </form>
</body>
</html>
