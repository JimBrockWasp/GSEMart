<%@ page language="C#" masterpagefile="~/site.master" autoeventwireup="true" inherits="adDetails, App_Web_3p_pvgco" title="Advert Details" theme="Default" maintainScrollPositionOnPostBack="true" %>

<%@ Register TagPrefix="uc" TagName="Advert" Src="~/UserControls/Advert.ascx" %>
<%@ Register TagPrefix="uc" TagName="Notifier" Src="~/UserControls/Notifier.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <script type="text/javascript">
    $(document).ready(function(){
        $('#gallery a').lightBox();
    });
    </script>

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

</asp:Content>
