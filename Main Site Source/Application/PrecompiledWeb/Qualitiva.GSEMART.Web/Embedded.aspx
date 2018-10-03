<%@ page language="C#" autoeventwireup="true" inherits="Embedded, App_Web_wtl_aivr" theme="Default" maintainScrollPositionOnPostBack="true" %>
<%@ Register TagPrefix="uc" TagName="Notifier" Src="~/UserControls/Notifier.ascx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!--- Style Sheet --->
<link href="<%= ResolveUrl("~/style/Default.css") %>" rel="stylesheet" type="text/css" />

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>GSE-Mart</title>


</head>
<body>
    <form id="form1" runat="server">
    <div>
 <uc:notifier ID="ctlNotifier" runat="server" EnableViewState="false" />               
   
    <!-- Results Pane -->
<div class="BoxShadow" 
     style="float: left; 
            width:708px; 
            padding:0px; 
            margin: 0 0 0 10px; 
            font-size:14px; 
            min-height:530px;
            border-radius:5px;">                
    
                                                    
    <asp:Panel ID="pnPagingTop" runat="server">
    <table class="paging-display-message">
        <tr>
            <td align="left">
                <asp:Label ID="lblPagingDescTop" runat="server" />
            </td>
            <td align="right">
                <asp:Label ID="lblPagingTop" runat="server" />
            </td>
        </tr>
    </table>
    </asp:Panel>
    
<!-- Grid Section -->
<div style="width:100%;">
    
    <table class="grid">
        <asp:PlaceHolder ID="plSearchResults" runat="server" Visible="false">
            <tr>
                <td colspan="2">
                    <asp:GridView ID="grdAdverts" runat="server" AutoGenerateColumns="false" Width="100%"
                        CellPadding="0" BorderWidth="0px" AllowPaging="false" ShowHeader="false"
                        BorderStyle="none" Visible="true" GridLines="None"
                        OnRowDataBound="DisplayAdverts">
                        
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <table class="item" cellspacing="0" width="100%">
                                        <tr>
                                            <td valign="top" style="padding-left:0px;">

<!-- A Single Advert -->                                                                                                                                                                                     
<div class="advertBox" >

    <!-- Main advert title -->
    <div class="advertTitle">
        <asp:HyperLink ID="hlAdTitle1" CssClass="title" runat="server"><%# Eval("Title")%></asp:HyperLink>
    </div>
      
    <!-- Contact Info -->
    <div class="contact" style="position:absolute; width:180px; top:0px; left:490px;">
        
        <!-- Currency -->
        <div style="height:25px"><asp:Label ID="lblCurrency" CssClass="price" runat="server" Height="20" /></div>
        
        <!-- Company Logo -->
        <div style="height:40px;"><asp:Image CssClass="CompanyLogo" ID="CompanyLogo" runat="server" BorderWidth="0"/></div>
        
        <div style="height:20px; margin-top:10px"><asp:Label ID="lblTelephone" CssClass="workphone" runat="server"></asp:Label></div>
        
        <div style="height:20px">
            <asp:PlaceHolder ID="plEmail" runat="server" Visible="false">
                    <asp:Label ID="lblEmail" CssClass="email" Text="Email" runat="server" Height="30px"></asp:Label>
            </asp:PlaceHolder>
        </div>

        <div style="height:40px">
            <asp:PlaceHolder ID="plASAMember" runat="server" Visible="false">
                    <img src="images/companylogos/logoASASmall.jpg" style="height:30px" />
            </asp:PlaceHolder>
        </div>
                
    </div>
        
    <!-- image -->
    <div style="position:absolute; top:25px; left:0px; width:170px;">
    
            <!-- Advert Image -->
            <asp:HyperLink ID="hlAdTitle2" runat="server">
                <asp:Image CssClass="image" ID="imgAdvert" runat="server" BorderWidth="0" />
            </asp:HyperLink>
            <br />
            <span id="Span1" class="content-summary" runat="server">
                <div style="overflow-x:discard"><asp:Label ID="lblCountry" runat="server" /></div>
                <div style="overflow-x:discard"><asp:Label ID="lblLocation" runat="server" /></div>
                <div style="overflow-x:discard"><asp:Label ID="lblAdvertId" runat="server" /></div>
                <asp:Label ID="lblQuantity" runat="server" /><br />
            </span>
            
    </div>
    
    <!-- Main Content -->
    <div style= "position:absolute; top:25px; left:160px; width:270px;">
    
        <!-- New/Used Image -->
        <div style="position:absolute; top:0px; left:0px; width:65px; height: 35px; ">
            <asp:Image CssClass="NewUsedImage" ID="NewUsedImage" runat="server" BorderWidth="0"/>
        </div>
        
        <div style="text-align:justify; position:absolute; top:35px; left: 0px; width:315px; height: 100px; overflow-y:hidden;">
            <%# FixCrLf(Eval("ShortDescription").ToString()) %> 
        </div> 
        
    </div>

    <!-- Specifications table -->
    <div style="position:absolute; top:130px; left:160px;">
        <div style="position:absolute; top:0px;   left:0px;  " class="content-specheading"><asp:Label ID="lblSpecHeading1" runat="server" /></div>
        <div style="position:absolute; top:0px; left:115px;  " class="content-specvalue"><asp:Label ID="lblSpecValue1" runat="server" /></div>
    
        <div style="position:absolute; top:0px; left:225px;  " class="content-specheading"><asp:Label ID="lblSpecHeading2" runat="server" /></div>
        <div style="position:absolute; top:0px; left:340px;  " class="content-specvalue"><asp:Label ID="lblSpecValue2" runat="server" /></div>
            
        <div style="position:absolute; top:20px; left:0px;   " class="content-specheading"><asp:Label ID="lblSpecHeading3" runat="server" /></div>
        <div style="position:absolute; top:20px; left:115px; " class="content-specvalue"><asp:Label ID="lblSpecValue3" runat="server" /></div>
    
        <div style="position:absolute; top:20px; left:225px; " class="content-specheading"><asp:Label ID="lblSpecHeading4" runat="server" /></div>
        <div style="position:absolute; top:20px; left:340px; " class="content-specvalue"><asp:Label ID="lblSpecValue4" runat="server" /></div>
    </div>
        

 


</div>



                                            </td>
                                        </tr>
                                    </table>
                                    <div class="dotted"></div>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
        </asp:PlaceHolder>
    </table>

<!-- End of Grid -->
</div>                                                    
                                                    
<asp:Panel ID="pnPagingBottom" runat="server">
    <table class="paging-display-message">
        <tr>
            <td align="right">
                <asp:Label ID="lblPagingBottom" runat="server" />
            </td>
        </tr>
    </table>
</asp:Panel>


<!-- End of Results Pane -->
</div>


<!-- Clear the floating divs -->
<div style="clear:both;"></div>

    
    
    
    
    
    
    
    </div>
    </form>
</body>
</html>
