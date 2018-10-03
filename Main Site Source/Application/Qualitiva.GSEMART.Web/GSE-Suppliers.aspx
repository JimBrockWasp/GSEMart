<%@ Page Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="GSE-Suppliers.aspx.cs"
    Inherits="contactus" Title="Meet the Suppliers - GSE-Mart.aero" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">

<div class="BoxShadow" style="width:1018px; height:100px;">
    <div style="width:100%; font-size:20px; text-align:center;color:#A61627;margin-top:10px">
        Meet the Sellers
    </div>
    <br />
    <div style="width:100%; font-size:14px; text-align:center;">
        Below is a list of sellers who are currently advertising on GSE-Mart.aero. Click a logo to see their
        company profile and adverts.

    </div>
</div>

<div class="BoxShadow" style="width:1018px; height:auto; margin-top:10px">

<!-- Suppliers Grid -->
<asp:Repeater 
    ID="grdSuppliers" 
    runat="server"
    Visible="true"  
    OnItemDataBound="DisplaySupplier">
    
    
            <ItemTemplate>
                <div class="item" style="float:left; width:320px; margin:10px 0 0 10px;">
                
                    <!-- GOT HERE This is a copy of the static contect -->
                    <div class="supplierImage">

                        <asp:HyperLink ID="hlAccount" runat="server">
                            <asp:Image ID="imgAccount" runat="server" BorderWidth="0" style="Max-Width:254px; max-height:77px; display: block; margin-left: auto; margin-right: auto;"/><br />
                        </asp:HyperLink>

                    </div>

                    <%# (Container.ItemIndex + 1) % 3 == 0 ? "<div style='Clear:both;'></div>" : string.Empty%>


                </div>
                
                
            </ItemTemplate>
    
</asp:Repeater>

<div style='Clear:both;'></div>

<!-- End of Suppliers Grid -->


</div>
     

</asp:Content>
