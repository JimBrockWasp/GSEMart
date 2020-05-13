<%@ page language="C#" masterpagefile="~/site.master" autoeventwireup="true" inherits="advertiseFree, App_Web_undihsvo" title="Advertisement Rates - GSE-Mart.aero" theme="Default" maintainScrollPositionOnPostBack="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    
    <div class="BoxShadow" style="width:1018px; height:400px; text-align:center;padding-top:24px;">
    
        <div style="width:100%; font-size:20px; height:100px;">
            Welcome to <span style="color:#A61627;">GSE-Mart.aero</span>
        </div>
    
        
        <div style="width:100%; font-size:16px; height:100px;">
            Congratulations. You have successfully created a seller account.
            <br />
            <br />
            Click below to enter the seller area.
        </div>
    
        <div>
            <asp:button 
                runat="server" 
                ID="lnkSellerArea" 
                CssClass="header-button" 
                style="width:170px; height:40px" 
                Text="Enter Here" 
                onclick="lnkSellerArea_Click">
            </asp:button>
        </div>
    
    
    
    </div>
       
</asp:Content>