<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Advert.ascx.cs" Inherits="ctl_Advert" %>

<link href='<%= ResolveUrl ("~/style/jquery.lightbox-0.5.css") %>' rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%= ResolveUrl ("~/js/jquery.lightbox-0.5.min.js") %>"></script>

<asp:LinkButton ID="lnkBackButton" runat="server" OnClick="btnBack_Click" Text=" &laquo; Back to Search Results"></asp:LinkButton>
<br />
<br />
<style type="text/css">
.contact td
{
	padding-bottom:5px;
}
</style>

<!-- Header Box -->
<div class="BoxShadow" style="float:left; width:1018px">

    <div class="detail-title" style="width:800px; float: left; height: 30px; margin: 0 0 0 10px;">
        <asp:Label ID="lblItemName" runat="server"></asp:Label>
    </div>

    <div style="width:195px; float:left; height: 30px; margin: 0 0 0 10px;">
        <asp:Label ID="lblPrice" runat="server" CssClass="detail-price"></asp:Label>
    </div>

    <div style="clear:both;"></div>

    <div style="width:800px; float: left;  margin: 0 0 0 10px;">
        <asp:Label ID="lblShortDesc" CssClass="description-text" runat="server"></asp:Label>
    </div>
    
    <div style="width:200px; float:left; text-align:right">
        <asp:Image runat="server" ID="imgNewUsed" width="80px" ></asp:Image>
        <asp:Image CssClass="AdvertCompanyLogo" runat="server" ID="imgCompanyLogo" ></asp:Image>
    </div>
    <div style="clear:both;"></div>
    
</div>
<div style="clear:both;"></div>
<br />


<!--
<table border="0" cellpadding="0" cellspacing="0" style="border:solid 1px #A61627;" width="100%">
-->
<table border="0" cellpadding="0" cellspacing="0" class="BoxShadow" style="width:1018px">
    <tr>
        <td colspan="3">
            <table id="tblMainAdvertTable" runat="server" width="100%">
                <tr class="trGrid">
                    <td align="left" valign="top">
                        <table width="100%" >
                            <tr>
                                <td width="100px" align="left" valign="top">
                                    <asp:Image ID="imgDefault" runat="server" />
                                    
                                    <div id="gallery">
                                        <asp:Repeater ID="dataLstImages" runat="server" OnItemDataBound="dataLstImages_ItemDataBound">
                                            <HeaderTemplate>
                                                <ul>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <li>
                                                    <a id="imgThumbURL" runat="server" href="">
                                                        <asp:Image ID="imgThumb" runat="server" />
                                                    </a>
                                                </li>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                </ul>
                                            </FooterTemplate>
                                        </asp:Repeater>
                                    </div>
                                    <font style="font-size:11px;">
                                    <i><asp:Label ID="lblClickImageNote" Text="Click on image to expand" Visible="false" runat="server" /></i>
                                    </font>
                                </td>
                                <td valign="top">
                                    
                                    
                                    <asp:Table ID="tblAdvertDetails" runat="server" CssClass="detail-table" Width="100%">
                                        <asp:TableRow runat="server" CssClass="detail-header">
                                            <asp:TableCell runat="server" ColumnSpan="5">Advert Details</asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow runat="server">
                                            <asp:TableCell CssClass="header-label" runat="server" style="width:100px;"></asp:TableCell>
                                            <asp:TableCell runat="server" style="width:200px;"></asp:TableCell>
                                            <asp:TableCell runat="server" style="width:10px;"></asp:TableCell>
                                            <asp:TableCell CssClass="header-label" runat="server" style="width:100px;"></asp:TableCell>
                                            <asp:TableCell runat="server" style="width:200px;"></asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow runat="server">
                                            <asp:TableCell CssClass="header-label" runat="server"></asp:TableCell>
                                            <asp:TableCell runat="server"></asp:TableCell>
                                            <asp:TableCell runat="server"></asp:TableCell>
                                            <asp:TableCell CssClass="header-label" runat="server"></asp:TableCell>
                                            <asp:TableCell runat="server"></asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow runat="server">
                                            <asp:TableCell CssClass="header-label" runat="server"></asp:TableCell>
                                            <asp:TableCell runat="server"></asp:TableCell>
                                            <asp:TableCell runat="server"></asp:TableCell>
                                            <asp:TableCell CssClass="header-label" runat="server"></asp:TableCell>
                                            <asp:TableCell runat="server"></asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow runat="server">
                                            <asp:TableCell CssClass="header-label" runat="server"></asp:TableCell>
                                            <asp:TableCell runat="server"></asp:TableCell>
                                            <asp:TableCell runat="server"></asp:TableCell>
                                            <asp:TableCell CssClass="header-label" runat="server"></asp:TableCell>
                                            <asp:TableCell runat="server"></asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow runat="server">
                                            <asp:TableCell CssClass="header-label" runat="server"></asp:TableCell>
                                            <asp:TableCell runat="server"></asp:TableCell>
                                            <asp:TableCell runat="server"></asp:TableCell>
                                            <asp:TableCell CssClass="header-label" runat="server"></asp:TableCell>
                                            <asp:TableCell runat="server"></asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow runat="server">
                                            <asp:TableCell CssClass="header-label" runat="server"></asp:TableCell>
                                            <asp:TableCell runat="server"></asp:TableCell>
                                            <asp:TableCell runat="server"></asp:TableCell>
                                            <asp:TableCell CssClass="header-label" runat="server"></asp:TableCell>
                                            <asp:TableCell runat="server"></asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow runat="server">
                                            <asp:TableCell CssClass="header-label" runat="server"></asp:TableCell>
                                            <asp:TableCell runat="server"></asp:TableCell>
                                            <asp:TableCell runat="server"></asp:TableCell>
                                            <asp:TableCell CssClass="header-label" runat="server"></asp:TableCell>
                                            <asp:TableCell runat="server"></asp:TableCell>
                                        </asp:TableRow>
                                    </asp:Table>
                                    <asp:Table ID="tblContactDetails" runat="server" CssClass="detail-table" Width="100%">
                                        <asp:TableRow runat="server" CssClass="detail-header">
                                            <asp:TableCell runat="server" ColumnSpan="5">Contact Details</asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow>
                                            <asp:TableCell CssClass="header-label" runat="server" style="width:100px;"></asp:TableCell>
                                            <asp:TableCell runat="server" style="width:200px;"></asp:TableCell>
                                            <asp:TableCell runat="server" style="width:10px;"></asp:TableCell>
                                            <asp:TableCell CssClass="header-label" runat="server" style="width:100px;"></asp:TableCell>
                                            <asp:TableCell runat="server" style="width:200px;"></asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow runat="server">
                                            <asp:TableCell CssClass="header-label" runat="server"></asp:TableCell>
                                            <asp:TableCell runat="server"></asp:TableCell>
                                            <asp:TableCell runat="server"></asp:TableCell>
                                            <asp:TableCell CssClass="header-label" runat="server"></asp:TableCell>
                                            <asp:TableCell runat="server"></asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow runat="server">
                                            <asp:TableCell CssClass="header-label" runat="server"></asp:TableCell>
                                            <asp:TableCell runat="server"></asp:TableCell>
                                            <asp:TableCell runat="server"></asp:TableCell>
                                            <asp:TableCell CssClass="header-label" runat="server"></asp:TableCell>
                                            <asp:TableCell runat="server"></asp:TableCell>
                                        </asp:TableRow>
                                    </asp:Table>

                                    
                                    <asp:Table ID="tblDocuments" runat="server" CssClass="detail-table" Width="100%">
                                        <asp:TableRow runat="server" CssClass="detail-header">
                                            <asp:TableCell  runat="server" ColumnSpan="2">Documents for Download</asp:TableCell>
                                        </asp:TableRow>
                                        <asp:TableRow>
                                            <asp:TableCell CssClass="header-label" runat="server" style="width:50%;"></asp:TableCell>
                                            <asp:TableCell ID="TableCell3" runat="server" style="width:200px;"></asp:TableCell>
                                        </asp:TableRow>
                                    </asp:Table>



                                </td>
                            </tr>
                            <tr>                                    
                                <td colspan="2">
                                    <br />
                                    <span class="description-title">Description</span>
                                    <br />
                                    <asp:Label ID="lblLongDesc" CssClass="description-text" runat="server"></asp:Label>
                                    <br /><br />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>


<asp:HiddenField ID="hdnReferer" runat="server" />

