<%@ page language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="sellerHome, App_Web_undihsvo" title="Login - GSE-Mart.aero" theme="Default" maintainScrollPositionOnPostBack="true" %>

<%@ Register TagPrefix="uc" TagName="Notifier" Src="~/UserControls/Notifier.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
   
   
   <script type="text/javascript">
   var aspNetId = '#ctl00_MainContent_';

   $(document).ready(function() {
       //Login Boxes
       $(aspNetId + 'txtLoginEmail').focus(function() { $(aspNetId + 'txtLoginEmail').css('border', cssStyleHighlighted); });
       $(aspNetId + 'txtLoginEmail').blur(function() { $(aspNetId + 'txtLoginEmail').css('border', cssStyleNormal); });

       $(aspNetId + 'txtLoginPassword').focus(function() { $(aspNetId + 'txtLoginPassword').css('border', cssStyleHighlighted); });
       $(aspNetId + 'txtLoginPassword').blur(function() { $(aspNetId + 'txtLoginPassword').css('border', cssStyleNormal); });
   });


   

    function CheckTermsAndConditions(sender, args) {
        if (document.getElementById("<%=chkTerms.ClientID %>").checked == true) {
            args.IsValid = true;
        } else {
            args.IsValid = false;
        }
    }
            

    </script>

    <!-- Main Container -->   
    <div style="width:1024px; height:800px;">

    <uc:Notifier ID="ctlNotifier" runat="server" EnableViewState="false" />
    
    <div class="BoxShadow" style="width:1018px;">
        <div style="float:left; left:0px; top:0px; width:170px; ">
            <img src="images/free2.jpg" style="height:60px;" />
        </div>
        <div class="sellerHeader" style="float:left; left:300px; top:0px; width:780px; margin-top:15px;">
            Create your seller account and advertise one piece of equiment FREE!
        </div>
        <div style="float:left; left:1000px; top:0px; width:60px;">
            <img src="images/free2.jpg" style="height:60px;" />
        </div>
        <div style="clear:both;"></div>
        
    </div>
   
    <div class="BoxShadow" style="float:left; width:493px; height:180px; margin-top:10px; padding: 20px 5px 5px 5px;">

        <div style="float:left;width:100px; padding-left:20px;">
            <img alt="Free" src="<%= ResolveUrl ("~/images/sell.jpg") %>" border="0" style="width: 90px; " />
        </div>
        
        <div style="float:left; width:350px; ">
            <div style="text-align:center; width:100%; height:35px; font-size:16px;">
                <b>CREATE</b> a Seller Account<br />
            </div>
                        
            <table width="100%" border="0" cellpadding="3" cellspacing="0">
                <tr style="height:30px;">
                    <td style="width:70px">
                        Email
                    </td>
                    <td>
                        <asp:TextBox ID="txtLoginEmail" runat="server" Width="170px"></asp:TextBox>
                        <asp:RequiredFieldValidator 
                            ID="rfvtxtLoginEmail" 
                            runat="server" 
                            ErrorMessage="* Required"
                            ControlToValidate="txtLoginEmail" 
                            Display="Dynamic" 
                            ValidationGroup="Create" 
                        />
                            
                        <asp:RegularExpressionValidator 
                            runat="server" 
                            ID="revtxtEmailAddress" 
                            ControlToValidate="txtLoginEmail"
                            ErrorMessage="* Invalid" 
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                            Display="Dynamic" 
                            ValidationGroup="Create" 
                        />  
                        
                        <asp:CustomValidator 
                            ID="cuvtxtEmailAddress" 
                            Display="Dynamic" 
                            ErrorMessage="* In use"
                            runat="server" 
                            ValidationGroup="Create" 
                        />
                        
                    </td>
                </tr>
                
                <tr style="height:30px;">
                    <td >
                        Password
                    </td>
                    <td>
                        <asp:TextBox ID="txtLoginPassword" runat="server" Width="170px" TextMode="password"></asp:TextBox>
                    
                        <asp:RequiredFieldValidator 
                                ID="rfvtxtLoginPassword" 
                                runat="server" 
                                ErrorMessage="* Required"
                                ControlToValidate="txtLoginPassword" 
                                Display="Dynamic" 
                                ValidationGroup="Create" 
                            />
                        
                        <asp:RegularExpressionValidator 
                            Display = "Dynamic" 
                            ControlToValidate = "txtLoginPassword" 
                            ID="rfvtxtLoginPasswordLength" 
                            ValidationExpression = "^[\s\S]{6,}$" 
                            runat="server" 
                            ErrorMessage="* Min 6 chars" 
                            ValidationGroup="Create"
                        />
                    
                    
                    </td>
                </tr>
                <tr style="height:30px;">
                    <td colspan="2" align="left">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td style="width:10px;">
                                    <asp:checkBox runat="server" ID="chkTerms" />
                                </td>
                                <td>
                                    Click to accept our <a href="TermAndCondition.aspx">Terms & Conditions</a>
                                    <asp:CustomValidator ID="rfvTermsAndConditions"
                                    runat="server" 
                                    ErrorMessage=" * Required" 
                                    ClientValidationFunction = "CheckTermsAndConditions"
                                    ValidationGroup="Create"
                                    />
                                    
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr style="height:30px;">
                    <td>
                        &nbsp;
                    </td>
                    <td align="left">
                        <asp:Button 
                                class="header-button" 
                                style="width:189px; 
                                height:35px;" 
                                ID="btnCreateAccount" 
                                runat="server" 
                                Text="Create Account" 
                                OnClick="btnCreateAccount_Click" 
                                ValidationGroup="Create" />
  
                    </td>
                </tr>
            </table>
            
            
        </div>
        <div style="clear:both;"></div>
        
        
    </div>

    <div class="BoxShadow" style="float:left;width:493px; height:180px; margin:10px 0 0 10px; padding: 20px 5px 5px 5px;"">
    
        <div style="float:left; text-align:left; width:350px; height:35px; font-size:16px; padding-left:30px;">
            Already Registered? <br />
            <br />
            <asp:button runat="server" ID="lnkSellerArea" CssClass="header-button" 
                style="width:170px; height:35px" Text="Login Here" 
                onclick="lnkSellerArea_Click"></asp:button>
            
        </div>
        <div style="float:left;">
            <img src="images/padlock.jpg">
        </div>
        <div style="clear:both;"></div>
        <div style="padding: 10px 0 0 30px;">
            Enter the sellers area and update your adverts and company profile
        </div>

                                                                        
    </div>
    <div style="clear:both;"></div>



    <!-- Create Account Instructions -->
    <div class="BoxShadow" style="width:1018px; margin-top:10px;">
    
        <div class="sellerHeader" style="width:100%; text-align:center; margin-top:10px;">
            Creating a Seller Account is FREE!
        </div>
        
        <span style="font-size:12px;"> As a seller you can:</span><br /><br />
        
        <div style="float:left; width:500px;">
        
            <div class="accountFeatureHeading"></div>
            <div class="accountFeatureText">Advertise one piece of equipment for <b>FREE!</b></div>
            <div style="clear:both;"></div>

            <div class="accountFeatureHeading"></div>
            <div class="accountFeatureText">Global exposure to thousands of potential buyers</div>
            <div style="clear:both;"></div>

            <div class="accountFeatureHeading"></div>
            <div class="accountFeatureText">Upload your company logo to appear on your adverts</div>
            <div style="clear:both;"></div>

            <div class="accountFeatureHeading"></div>
            <div class="accountFeatureText">Create a company profile for buyers to see</div>
            <div style="clear:both;"></div>

        </div>
        
        <div style="float:left; width:500px;">
        
            <div class="accountFeatureHeading"></div>
            <div class="accountFeatureText">Advertise new and used equipment</div>
            <div style="clear:both;"></div>                

            <div class="accountFeatureHeading"></div>
            <div class="accountFeatureText">Create detailed adverts with technical data and images</div>
            <div style="clear:both;"></div>                
            
            <div class="accountFeatureHeading"></div>
            <div class="accountFeatureText">Embed GSE-Mart lists and adverts in your own site</div>
            <div style="clear:both;"></div>                
    
            <div class="accountFeatureHeading"></div>
            <div class="accountFeatureText">Advertise equipment for rental or leasing as well as for sale</div>
            <div style="clear:both;"></div>                
    
        </div>
        <div style="clear:both;"></div>                
        <div style="width:100%; text-align:center; ">
            <img src="images/map.png" style="width:470px;" alt="Global exposure to thousands of potential buyers"/>
        </div>
    </div>
        


<!-- End of Main Container -->    
</div>
    
</asp:Content>
