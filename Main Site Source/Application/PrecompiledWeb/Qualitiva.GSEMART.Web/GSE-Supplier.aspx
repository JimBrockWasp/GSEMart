<%@ page language="C#" masterpagefile="~/site.master" autoeventwireup="true" inherits="contactus, App_Web_3p_pvgco" title="Contact Us - GSE-Mart.aero" theme="Default" maintainScrollPositionOnPostBack="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">

<div class="BoxShadow" style="width:1018px; padding-top:20px; height:120px;">

    <div style="float:left; width:350px;">
        <asp:HyperLink ID="hlAccount" runat="server">
            <asp:Image ID="imgAccount" runat="server" BorderWidth="0" style="Max-Width:254px; max-height:77px; display: block; margin-left: auto; margin-right: auto;"/><br />
        </asp:HyperLink>
        <div style="width:100%; text-align:center; font-size:10px; font-style:italic;">Click logo to display adverts</div>
    </div>
    
    <div class="supplierContactDetails" style="float:left; margin-top:10px;">
        <div class="sH">Contact:  </div><div class="sD"><asp:Label ID="lblContact" runat="server"/></div>
        <div class="sH">Telephone:</div><div class="sD"><asp:Label ID="lblTelephone" runat="server"/></div>
        <div style="clear:both"></div>
        <div class="sH">Email:    </div><div class="sD"><asp:HyperLink ID="hlEmail" runat="server">Email Seller</asp:HyperLink></div>
        <div class="sH">Website:  </div><div class="sD"><asp:HyperLink ID="hlWebsite" runat="server">Seller's Website</asp:HyperLink></div>
        <div style="clear:both"></div>

    </div>
    <div style="clear: both"></div>

</div>

<div ID="divProfile" runat="server" class="BoxShadow" style="width:998px; margin-top: 10px; padding:10px 10px 10px 10px;">
    <asp:Label ID="lblProfile" CssClass="description-text" runat="server"></asp:Label> 
</div>


</asp:Content>
