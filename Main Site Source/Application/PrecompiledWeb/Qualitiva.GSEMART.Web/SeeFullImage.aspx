<%@ page language="C#" autoeventwireup="true" inherits="SeeFullImage, App_Web_wtl_aivr" theme="Default" maintainScrollPositionOnPostBack="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>GSE-Mart</title>
</head>
<body>
    <form id="aspnet_Form" runat="server">
    <table align="center">
   
    <%--&nbsp;&nbsp;&nbsp;<asp:Button ID="btnBack" runat="server" Text="Go Back" CssClass="btnStyle1" OnClientClick="javascript:history.back();parent.window.location.reload();return false;" /><br /><br />
      --%>  
      <tr>
      <td align="right">
       <asp:Button ID="btnBack" runat="server" Text="Close" CssClass="btnStyle1" OnClientClick="javascript:window.close();return false;" /><br /><br />
      </td>
      </tr>
     <tr>
     <td>
     <asp:Image ID="imgFullSize" runat="server" />
     </td>
     </tr>
      
    </table>
    </form>
</body>
</html>
