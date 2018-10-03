<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Notifier.ascx.cs" Inherits="ctl_Notifier" %>
<table border="0" cellpadding="5" cellspacing="0" width="100%" id="tblMsg" runat="server" visible="false">
    <tr>
        <td valign="top" width="1%">
            <asp:Image ID="imgMsg" runat="server" />
        </td>
        <td valign="middle" align="left">
            <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
        </td>
    </tr>
</table>


