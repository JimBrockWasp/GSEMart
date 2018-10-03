<%@ page language="C#" masterpagefile="~/site.master" autoeventwireup="true" validaterequest="false" enableeventvalidation="false" inherits="Submit_Tender, App_Web_1ganjq4w" title="Submit a Tender - GSE-Mart.aero" theme="Default" maintainScrollPositionOnPostBack="true" %>

<%@ Register TagPrefix="uc" TagName="Notifier" Src="~/UserControls/Notifier.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <script type="text/javascript">
    var aspNetId = '#ctl00_MainContent_';

    $(document).ready(function() {
        $(aspNetId + 'txtCompanyName').focus(function() { $(aspNetId + 'txtCompanyName').css('border', cssStyleHighlighted); });
        $(aspNetId + 'txtCompanyName').blur(function() { $(aspNetId + 'txtCompanyName').css('border', cssStyleNormal); });

        $(aspNetId + 'txtContactName').focus(function() { $(aspNetId + 'txtContactName').css('border', cssStyleHighlighted); });
        $(aspNetId + 'txtContactName').blur(function() { $(aspNetId + 'txtContactName').css('border', cssStyleNormal); });

        $(aspNetId + 'txtTenderSubject').focus(function() { $(aspNetId + 'txtTenderSubject').css('border', cssStyleHighlighted); });
        $(aspNetId + 'txtTenderSubject').blur(function() { $(aspNetId + 'txtTenderSubject').css('border', cssStyleNormal); });

        $(aspNetId + 'txtTelephone').focus(function() { $(aspNetId + 'txtTelephone').css('border', cssStyleHighlighted); });
        $(aspNetId + 'txtTelephone').blur(function() { $(aspNetId + 'txtTelephone').css('border', cssStyleNormal); });

        $(aspNetId + 'txtMobile').focus(function() { $(aspNetId + 'txtMobile').css('border', cssStyleHighlighted); });
        $(aspNetId + 'txtMobile').blur(function() { $(aspNetId + 'txtMobile').css('border', cssStyleNormal); });

        $(aspNetId + 'txtEmailAddress').focus(function() { $(aspNetId + 'txtEmailAddress').css('border', cssStyleHighlighted); });
        $(aspNetId + 'txtEmailAddress').blur(function() { $(aspNetId + 'txtEmailAddress').css('border', cssStyleNormal); });

        $(aspNetId + 'txtURL').focus(function() { $(aspNetId + 'txtURL').css('border', cssStyleHighlighted); });
        $(aspNetId + 'txtURL').blur(function() { $(aspNetId + 'txtURL').css('border', cssStyleNormal); });

        $(aspNetId + 'txtDescription').focus(function() { $(aspNetId + 'txtDescription').css('border', cssStyleHighlighted); });
        $(aspNetId + 'txtDescription').blur(function() { $(aspNetId + 'txtDescription').css('border', cssStyleNormal); });

        $(aspNetId + 'txtRequirement').focus(function() { $(aspNetId + 'txtRequirement').css('border', cssStyleHighlighted); });
        $(aspNetId + 'txtRequirement').blur(function() { $(aspNetId + 'txtRequirement').css('border', cssStyleNormal); });

        $(aspNetId + 'txtSpecialInstruction').focus(function() { $(aspNetId + 'txtSpecialInstruction').css('border', cssStyleHighlighted); });
        $(aspNetId + 'txtSpecialInstruction').blur(function() { $(aspNetId + 'txtSpecialInstruction').css('border', cssStyleNormal); });

        /*
        $(aspNetId + 'chkTC').click(function() {
            if ($(aspNetId + 'chkTC').attr('checked')) {
                $(aspNetId + 'btnSubmit').css('border', '#A61627');
                $(aspNetId + 'btnSubmit').css('background-color', '#A61627');
            }
            else {
                $(aspNetId + 'btnSubmit').css('border', 'solid 1px #666666');
                $(aspNetId + 'btnSubmit').css('background-color', '#999999');
            }
        });
        */

        $('#ctl00_MainContent_txtDescription').keyup(function() {
            limitChars('ctl00_MainContent_txtDescription', 2000, 'txtDescription_charlimitinfo');
        })
        $('#ctl00_MainContent_txtRequirement').keyup(function() {
            limitChars('ctl00_MainContent_txtRequirement', 6000, 'txtRequirement_charlimitinfo');
        })
        $('#ctl00_MainContent_txtSpecialInstruction').keyup(function() {
            limitChars('ctl00_MainContent_txtSpecialInstruction', 1000, 'txtSpecialInstruction_charlimitinfo');
        })

        /*
        $(aspNetId + 'chkTC').attr('checked', '');
        $(aspNetId + 'btnSubmit').css('border', 'solid 1px #666666');
        $(aspNetId + 'btnSubmit').css('background-color', '#999999');
        */
    });
    </script>
    
    <script type="text/javascript">
        function limitChars(textid, limit, infodiv) {
            var text = $('#' + textid).val();
            var textlength = text.length;
            if (textlength > limit) {
                $('#' + infodiv).html('You cannot write more than ' + limit + ' characters!');
                $('#' + textid).val(text.substr(0, limit));
                return false;
            }
            else {
                $('#' + infodiv).html('You have ' + (limit - textlength) + ' characters left');
                return true;
            }
        }
        
        function CheckTermsAndConditions(sender, args) {
            if (document.getElementById("<%=chkTC.ClientID %>").checked == true) {
                args.IsValid = true;
            } else {
                args.IsValid = false;
            }
        }


        /*
        function CheckBoxTCChanged(me) {
            var btn = document.getElementById('ctl00_MainContent_btnSubmit');

            if (me.checked) {
                btn.disabled = false;
            }
            else {
                btn.disabled = true;

            }
        }
        */
   </script>
    
    <div class="BoxShadow" style="width:1018px; height:180px;">
        <div style="width:100%; font-size:20px; text-align:center;color:#A61627;margin-top:10px">
            Tenders
        </div>
        <br />
        <div style="width:100%; font-size:14px; text-align:center;">
            If you are looking to purchase several pieces of equipment and are looking for sellers to quote you a price,
            why not publish a tender here. Once published, the tender will be sent to out to all the registered sellers who have subscribed 
            to the tender service. 
            <br />
            <br />
            Publishing a tender at www.GSE-Mart.aero is a quick, easy and free of charge way to get your tender to many companies at once.            
            <br />
            <br />
            If you are a seller and would like to subscribe to our service, please 
            <a href="contactus.aspx"> contact us.</a>
        </div>
    </div>
    
    
    <div class="BoxShadow" style="width:1018px; margin-top:10px;">
        <uc:Notifier ID="ctlNotifier" runat="server" EnableViewState="false" />


            <h3>Tender Information</h3>

            <div class="tenderHeading">
                Company Name
                
            </div>
            <div class="tenderText">
                <asp:TextBox ID="txtCompanyName" runat="server" Width="500" />
                <asp:RegularExpressionValidator ID="rvTxtCompanyName" ControlToValidate="txtCompanyName" runat="server" ValidationExpression="^[\s\S]{0,100}$" ErrorMessage="Maximum length allowed is 100 characters" Display="Dynamic" ValidationGroup="SubmitTender" />
                <asp:RequiredFieldValidator ID="rfvTxtCompanyName" runat="server" ErrorMessage="<-- Required"
                ControlToValidate="txtCompanyName" Display="Dynamic"  ValidationGroup="SubmitTender" />
            </div>
            <div style="clear:both;"></div>
            
            <div class="tenderHeading">
                    Contact Name
            </div>
            <div class="tenderText">
                    <asp:TextBox ID="txtContactName" runat="server" Width="500" />
                    <asp:RegularExpressionValidator ID="rvTxtContactName" ControlToValidate="txtContactName" runat="server" ValidationExpression="^[\s\S]{0,100}$" ErrorMessage="Maximum length allowed is 100 characters" Display="Dynamic" ValidationGroup="SubmitTender" />
                    <asp:RequiredFieldValidator ID="rfvTxtContactName" runat="server" ErrorMessage="<-- Required"
                    ControlToValidate="txtContactName" Display="Dynamic" ValidationGroup="SubmitTender" />
            </div>
            <div style="clear:both;"></div>
            
            <div class="tenderHeading">
                    Tender Subject
            </div>
            <div class="tenderText">
                    <asp:TextBox ID="txtTenderSubject" runat="server" Width="500" />
                    <asp:RegularExpressionValidator ID="rvTxtTenderSubject" ControlToValidate="txtTenderSubject" runat="server" ValidationExpression="^[\s\S]{0,200}$" ErrorMessage="Maximum length allowed is 200 characters" Display="Dynamic" ValidationGroup="SubmitTender" />
                    <asp:RequiredFieldValidator ID="rfvTxtTenderSubject" runat="server" ErrorMessage="<-- Required"
                    ControlToValidate="txtTenderSubject" Display="Dynamic" ValidationGroup="SubmitTender" />
            </div>
            <div style="clear:both;"></div>
            
            <div class="tenderHeading">
                    Telephone
            </div>
            <div class="tenderText">
                    <asp:TextBox ID="txtTelephone" runat="server" Width="250" />
                    <asp:RegularExpressionValidator ID="rvTxtTelephone" ControlToValidate="txtTelephone" runat="server" ValidationExpression="^[\s\S]{0,100}$" ErrorMessage="Maximum length allowed is 100 characters" Display="Dynamic" ValidationGroup="SubmitTender" />
                    <asp:RequiredFieldValidator ID="rfvTxtTelephone" runat="server" ErrorMessage="<-- Required"
                    ControlToValidate="txtTelephone" Display="Dynamic" ValidationGroup="SubmitTender" />
            </div>
            <div style="clear:both;"></div>
            
            <div class="tenderHeading">
                    Mobile
            </div>
            <div class="tenderText">
                    <asp:TextBox ID="txtMobile" runat="server" Width="250" />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="txtTenderSubject" runat="server" ValidationExpression="^[\s\S]{0,100}$" ErrorMessage="Maximum length allowed is 100 characters" Display="Dynamic" ValidationGroup="SubmitTender" />
            </div>
            <div style="clear:both;"></div>
            
            <div class="tenderHeading">
                    Country
            </div>
            <div class="tenderText">
                    <asp:DropDownList ID="ddlCountry" runat="server"  CssClass="searchOption" style="width: 250px;">
                    
                    <asp:ListItem Value="Andorra" Text="Andorra" />
<asp:ListItem Value="Afghanistan" Text="Afghanistan" />
<asp:ListItem Value="Albania" Text="Albania" />
<asp:ListItem Value="Algeria" Text="Algeria" />
<asp:ListItem Value="American Samoa" Text="American Samoa" />
<asp:ListItem Value="Andorra" Text="Andorra" />
<asp:ListItem Value="Angola" Text="Angola" />
<asp:ListItem Value="Anguilla" Text="Anguilla" />
<asp:ListItem Value="Antigua and Barbuda" Text="Antigua and Barbuda" />
<asp:ListItem Value="Argentina" Text="Argentina" />
<asp:ListItem Value="Armenia" Text="Armenia" />
<asp:ListItem Value="Aruba" Text="Aruba" />
<asp:ListItem Value="Australia" Text="Australia" />
<asp:ListItem Value="Austria" Text="Austria" />
<asp:ListItem Value="Azerbaijan" Text="Azerbaijan" />
<asp:ListItem Value="Bahamas" Text="Bahamas" />
<asp:ListItem Value="Bahrain" Text="Bahrain" />
<asp:ListItem Value="Bangladesh" Text="Bangladesh" />
<asp:ListItem Value="Barbados" Text="Barbados" />
<asp:ListItem Value="Belarus" Text="Belarus" />
<asp:ListItem Value="Belgium" Text="Belgium" />
<asp:ListItem Value="Belize" Text="Belize" />
<asp:ListItem Value="Benin" Text="Benin" />
<asp:ListItem Value="Bhutan" Text="Bhutan" />
<asp:ListItem Value="Bolivia" Text="Bolivia" />
<asp:ListItem Value="Bosnia and Herzegowina" Text="Bosnia and Herzegowina" />
<asp:ListItem Value="Botswana" Text="Botswana" />
<asp:ListItem Value="Brazil" Text="Brazil" />
<asp:ListItem Value="Brunei Darussalam" Text="Brunei Darussalam" />
<asp:ListItem Value="Bulgaria" Text="Bulgaria" />
<asp:ListItem Value="Burkina Faso" Text="Burkina Faso" />
<asp:ListItem Value="Burundi" Text="Burundi" />
<asp:ListItem Value="Cambodia" Text="Cambodia" />
<asp:ListItem Value="Cameroon" Text="Cameroon" />
<asp:ListItem Value="Canada" Text="Canada" />
<asp:ListItem Value="Cape Verde" Text="Cape Verde" />
<asp:ListItem Value="Cayman Islands" Text="Cayman Islands" />
<asp:ListItem Value="Central African Republic" Text="Central African Republic" />
<asp:ListItem Value="Chad" Text="Chad" />
<asp:ListItem Value="Chile" Text="Chile" />
<asp:ListItem Value="China" Text="China" />
<asp:ListItem Value="Colombia" Text="Colombia" />
<asp:ListItem Value="Comoros" Text="Comoros" />
<asp:ListItem Value="Congo" Text="Congo" />
<asp:ListItem Value="Costa Rica" Text="Costa Rica" />
<asp:ListItem Value="Cote D'Ivoire" Text="Cote D'Ivoire" />
<asp:ListItem Value="Croatia" Text="Croatia" />
<asp:ListItem Value="Cuba" Text="Cuba" />
<asp:ListItem Value="Cyprus" Text="Cyprus" />
<asp:ListItem Value="Czech Republic" Text="Czech Republic" />
<asp:ListItem Value="Denmark" Text="Denmark" />
<asp:ListItem Value="Djibouti" Text="Djibouti" />
<asp:ListItem Value="Dominica" Text="Dominica" />
<asp:ListItem Value="Dominican Republic" Text="Dominican Republic" />
<asp:ListItem Value="East Timor" Text="East Timor" />
<asp:ListItem Value="Ecuador" Text="Ecuador" />
<asp:ListItem Value="Egypt" Text="Egypt" />
<asp:ListItem Value="El Salvador" Text="El Salvador" />
<asp:ListItem Value="Equatorial Guinea" Text="Equatorial Guinea" />
<asp:ListItem Value="Eritrea" Text="Eritrea" />
<asp:ListItem Value="Estonia" Text="Estonia" />
<asp:ListItem Value="Ethiopia" Text="Ethiopia" />
<asp:ListItem Value="Faroe Islands" Text="Faroe Islands" />
<asp:ListItem Value="Fiji" Text="Fiji" />
<asp:ListItem Value="Finland" Text="Finland" />
<asp:ListItem Value="France" Text="France" />
<asp:ListItem Value="French Guiana" Text="French Guiana" />
<asp:ListItem Value="French Polynesia" Text="French Polynesia" />
<asp:ListItem Value="Gabon" Text="Gabon" />
<asp:ListItem Value="Gambia" Text="Gambia" />
<asp:ListItem Value="Georgia" Text="Georgia" />
<asp:ListItem Value="Germany" Text="Germany" />
<asp:ListItem Value="Ghana" Text="Ghana" />
<asp:ListItem Value="Gibraltar" Text="Gibraltar" />
<asp:ListItem Value="Greece" Text="Greece" />
<asp:ListItem Value="Greenland" Text="Greenland" />
<asp:ListItem Value="Grenada" Text="Grenada" />
<asp:ListItem Value="Guadeloupe" Text="Guadeloupe" />
<asp:ListItem Value="Guam" Text="Guam" />
<asp:ListItem Value="Guatemala" Text="Guatemala" />
<asp:ListItem Value="Guinea Conacry" Text="Guinea Conacry" />
<asp:ListItem Value="Guinea-Bissau" Text="Guinea-Bissau" />
<asp:ListItem Value="Guyana" Text="Guyana" />
<asp:ListItem Value="Haiti" Text="Haiti" />
<asp:ListItem Value="Honduras" Text="Honduras" />
<asp:ListItem Value="Hong Kong" Text="Hong Kong" />
<asp:ListItem Value="Hungary" Text="Hungary" />
<asp:ListItem Value="Iceland" Text="Iceland" />
<asp:ListItem Value="India" Text="India" />
<asp:ListItem Value="Indonesia" Text="Indonesia" />
<asp:ListItem Value="Iran" Text="Iran" />
<asp:ListItem Value="Iraq" Text="Iraq" />
<asp:ListItem Value="Ireland" Text="Ireland" />
<asp:ListItem Value="Israel" Text="Israel" />
<asp:ListItem Value="Italy" Text="Italy" />
<asp:ListItem Value="Jamaica" Text="Jamaica" />
<asp:ListItem Value="Japan" Text="Japan" />
<asp:ListItem Value="Jordan" Text="Jordan" />
<asp:ListItem Value="Kazakhstan" Text="Kazakhstan" />
<asp:ListItem Value="Kenya" Text="Kenya" />
<asp:ListItem Value="Kiribati" Text="Kiribati" />
<asp:ListItem Value="Korea Dem Peoples Republic" Text="Korea Dem Peoples Republic" />
<asp:ListItem Value="Korea Republic Of" Text="Korea Republic Of" />
<asp:ListItem Value="Kosovo" Text="Kosovo" />
<asp:ListItem Value="Kuwait" Text="Kuwait" />
<asp:ListItem Value="Kyrgyzstan" Text="Kyrgyzstan" />
<asp:ListItem Value="Lao Peoples Dem Republic" Text="Lao Peoples Dem Republic" />
<asp:ListItem Value="Latvia" Text="Latvia" />
<asp:ListItem Value="Lebanon" Text="Lebanon" />
<asp:ListItem Value="Lesotho" Text="Lesotho" />
<asp:ListItem Value="Liberia" Text="Liberia" />
<asp:ListItem Value="Libya" Text="Libya" />
<asp:ListItem Value="Liechtenstein" Text="Liechtenstein" />
<asp:ListItem Value="Lithuania" Text="Lithuania" />
<asp:ListItem Value="Luxembourg" Text="Luxembourg" />
<asp:ListItem Value="Macau" Text="Macau" />
<asp:ListItem Value="Macedonia" Text="Macedonia" />
<asp:ListItem Value="Madagascar" Text="Madagascar" />
<asp:ListItem Value="Malawi" Text="Malawi" />
<asp:ListItem Value="Malaysia" Text="Malaysia" />
<asp:ListItem Value="Maldives" Text="Maldives" />
<asp:ListItem Value="Mali" Text="Mali" />
<asp:ListItem Value="Malta" Text="Malta" />
<asp:ListItem Value="Marshall Islands" Text="Marshall Islands" />
<asp:ListItem Value="Martinique" Text="Martinique" />
<asp:ListItem Value="Mauritania" Text="Mauritania" />
<asp:ListItem Value="Mauritius" Text="Mauritius" />
<asp:ListItem Value="Mayotte" Text="Mayotte" />
<asp:ListItem Value="Mexico" Text="Mexico" />
<asp:ListItem Value="Micronesia Federated States Of" Text="Micronesia Federated States Of" />
<asp:ListItem Value="Moldova" Text="Moldova" />
<asp:ListItem Value="Monaco" Text="Monaco" />
<asp:ListItem Value="Mongolia" Text="Mongolia" />
<asp:ListItem Value="Montenegro" Text="Montenegro" />
<asp:ListItem Value="Morocco" Text="Morocco" />
<asp:ListItem Value="Mozambique" Text="Mozambique" />
<asp:ListItem Value="Myanmar" Text="Myanmar" />
<asp:ListItem Value="Namibia" Text="Namibia" />
<asp:ListItem Value="Nauru" Text="Nauru" />
<asp:ListItem Value="Nepal" Text="Nepal" />
<asp:ListItem Value="Netherlands" Text="Netherlands" />
<asp:ListItem Value="Netherlands Antilles" Text="Netherlands Antilles" />
<asp:ListItem Value="New Caledonia" Text="New Caledonia" />
<asp:ListItem Value="New Zealand" Text="New Zealand" />
<asp:ListItem Value="Nicaragua" Text="Nicaragua" />
<asp:ListItem Value="Niger" Text="Niger" />
<asp:ListItem Value="Nigeria" Text="Nigeria" />
<asp:ListItem Value="Norway" Text="Norway" />
<asp:ListItem Value="Oman" Text="Oman" />
<asp:ListItem Value="Pakistan" Text="Pakistan" />
<asp:ListItem Value="Panama" Text="Panama" />
<asp:ListItem Value="Papua New Guinea" Text="Papua New Guinea" />
<asp:ListItem Value="Paraguay" Text="Paraguay" />
<asp:ListItem Value="Peru" Text="Peru" />
<asp:ListItem Value="Philippines" Text="Philippines" />
<asp:ListItem Value="Poland" Text="Poland" />
<asp:ListItem Value="Portugal" Text="Portugal" />
<asp:ListItem Value="Puerto Rico" Text="Puerto Rico" />
<asp:ListItem Value="Qatar" Text="Qatar" />
<asp:ListItem Value="Reunion" Text="Reunion" />
<asp:ListItem Value="Romania" Text="Romania" />
<asp:ListItem Value="Russian Federation" Text="Russian Federation" />
<asp:ListItem Value="Rwanda" Text="Rwanda" />
<asp:ListItem Value="Saint Kitts And Nevis" Text="Saint Kitts And Nevis" />
<asp:ListItem Value="Saint Lucia" Text="Saint Lucia" />
<asp:ListItem Value="Saint Vincent and The Grenadines" Text="Saint Vincent and The Grenadines" />
<asp:ListItem Value="Samoa" Text="Samoa" />
<asp:ListItem Value="San Marino" Text="San Marino" />
<asp:ListItem Value="Sao Tome and Principe" Text="Sao Tome and Principe" />
<asp:ListItem Value="Saudi Arabia" Text="Saudi Arabia" />
<asp:ListItem Value="Senegal" Text="Senegal" />
<asp:ListItem Value="Serbia" Text="Serbia" />
<asp:ListItem Value="Seychelles" Text="Seychelles" />
<asp:ListItem Value="Sierra Leone" Text="Sierra Leone" />
<asp:ListItem Value="Singapore" Text="Singapore" />
<asp:ListItem Value="Slovakia" Text="Slovakia" />
<asp:ListItem Value="Slovenia" Text="Slovenia" />
<asp:ListItem Value="Solomon Islands" Text="Solomon Islands" />
<asp:ListItem Value="Somalia" Text="Somalia" />
<asp:ListItem Value="South Africa" Text="South Africa" />
<asp:ListItem Value="South Sudan" Text="South Sudan" />
<asp:ListItem Value="Spain" Text="Spain" />
<asp:ListItem Value="Sri Lanka" Text="Sri Lanka" />
<asp:ListItem Value="Sudan" Text="Sudan" />
<asp:ListItem Value="Suriname" Text="Suriname" />
<asp:ListItem Value="Swaziland" Text="Swaziland" />
<asp:ListItem Value="Sweden" Text="Sweden" />
<asp:ListItem Value="Switzerland" Text="Switzerland" />
<asp:ListItem Value="Syria" Text="Syria" />
<asp:ListItem Value="Taiwan" Text="Taiwan" />
<asp:ListItem Value="Tajikistan" Text="Tajikistan" />
<asp:ListItem Value="Tanzania" Text="Tanzania" />
<asp:ListItem Value="Thailand" Text="Thailand" />
<asp:ListItem Value="Togo" Text="Togo" />
<asp:ListItem Value="Tonga" Text="Tonga" />
<asp:ListItem Value="Trinidad and Tobago" Text="Trinidad and Tobago" />
<asp:ListItem Value="Tunisia" Text="Tunisia" />
<asp:ListItem Value="Turkey" Text="Turkey" />
<asp:ListItem Value="Turkmenistan" Text="Turkmenistan" />
<asp:ListItem Value="Tuvalu" Text="Tuvalu" />
<asp:ListItem Value="Uganda" Text="Uganda" />
<asp:ListItem Value="Ukraine" Text="Ukraine" />
<asp:ListItem Value="United Arab Emirates" Text="United Arab Emirates" />
<asp:ListItem Value="United Kingdom" Text="United Kingdom" />
<asp:ListItem Value="United States" Text="United States" Selected="True" />
<asp:ListItem Value="Uruguay" Text="Uruguay" />
<asp:ListItem Value="Uzbekistan" Text="Uzbekistan" />
<asp:ListItem Value="Vanuatu" Text="Vanuatu" />
<asp:ListItem Value="Venezuela" Text="Venezuela" />
<asp:ListItem Value="Viet Nam" Text="Viet Nam" />
<asp:ListItem Value="Virgin Islands (British)" Text="Virgin Islands (British)" />
<asp:ListItem Value="Virgin Islands (U.S.)" Text="Virgin Islands (U.S.)" />
<asp:ListItem Value="Yemen" Text="Yemen" />
<asp:ListItem Value="Zaire" Text="Zaire" />
<asp:ListItem Value="Zambia" Text="Zambia" />
<asp:ListItem Value="Zimbabwe" Text="Zimbabwe" />
                    
                    </asp:DropDownList>
            </div>
            <div style="clear:both;"></div> 
            
            <div class="tenderHeading">
                    Website
            </div>
            <div class="tenderText">
                    <asp:TextBox ID="txtURL" runat="server" Width="250" />
                    <asp:RegularExpressionValidator 
                            runat="server" 
                            ID="RegularExpressionValidator2" 
                            ControlToValidate="txtURL"
                            ErrorMessage="* Invalid" 
                            ValidationExpression="^((http|https)://)?([\w-]+\.)+[\w]+(/[\w- ./?]*)?$"
                            Display="Dynamic" 
                            ValidationGroup="Create" 
                        />  
                    <asp:RegularExpressionValidator ID="rvtxtURL" ControlToValidate="txtURL" runat="server" ValidationExpression="^[\s\S]{0,50}$" ErrorMessage="Maximum length allowed is 50 characters" Display="Dynamic" ValidationGroup="SubmitTender" />
                    <asp:RequiredFieldValidator ID="rfvtxtURL" runat="server" ErrorMessage="<-- Required"
                    ControlToValidate="txtURL" Display="Dynamic" ValidationGroup="SubmitTender" />
            </div>
            <div style="clear:both;"></div>
            
                      
            <div class="tenderHeading">
                    Email Address
            </div>
            <div class="tenderText">
                    <asp:TextBox ID="txtEmailAddress" runat="server" Width="250" />
                    <asp:RegularExpressionValidator 
                            runat="server" 
                            ID="rvtxtEmailAddressForm" 
                            ControlToValidate="txtEmailAddress"
                            ErrorMessage="* Invalid" 
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                            Display="Dynamic" 
                            ValidationGroup="Create" 
                        />  
                    <asp:RegularExpressionValidator ID="rvTxtEmailAddressLength" ControlToValidate="txtEmailAddress" runat="server" ValidationExpression="^[\s\S]{0,50}$" ErrorMessage="Maximum length allowed is 50 characters" Display="Dynamic" ValidationGroup="SubmitTender" />
                    <asp:RequiredFieldValidator ID="rfvTxtEmailAddress" runat="server" ErrorMessage="<-- Required"
                    ControlToValidate="txtEmailAddress" Display="Dynamic" ValidationGroup="SubmitTender" />
            </div>
            <div style="clear:both;"></div>
            
            <div class="tenderHeading">
                    Expiry Date
            </div>
            <div class="tenderText">
                    
                    <asp:DropDownList ID="ddlExpiryDate" runat="server"  CssClass="searchOption" style="width: 250px;">
                    </asp:DropDownList> 
                    
            </div>
            <div style="clear:both;"></div>
            
            
            <div class="tenderHeading">
                Requirements    
            </div>
            <div class="tenderText" style="height:85px;">
                <div class="tenderInstructions" style="width: 500px; height:50px; text-align: justify;">
                        If you have a tender document, you can upload it here. 
                        Alternatively you can email the document to us and we will attach it to your tender. 
                        If you prefer, you can ask the sellers to request the document from you by entering your instructions in the requirements below. 
                </div>
                <div>
                    <asp:FileUpload ID="fileUploadControl" Width="500px" runat="server" />
                </div>
                <div style="clear:both;"></div>
            
            </div>
            <div style="clear:both;"></div>
            
            
            <div class="tenderHeading">
                
            </div>
                        
            <div class="tenderText" style="height:370px">
                    <div class="tenderInstructions"  style="width:500px; text-align: justify;">
                        If your requirements are short, you can enter them here or you can ask the sellers to request a tender document from you.
                        We recommend you write your requirements in a seperate application and cut 
                        and paste your requirements here.
                    </div>
                    <asp:TextBox ID="txtRequirement" runat="server" Width="500" Height="300" TextMode="MultiLine" />
                    <asp:RequiredFieldValidator ID="rfvtxtRequirement" runat="server" ErrorMessage="<-- Required"
                    ControlToValidate="txtRequirement" Display="Dynamic" ValidationGroup="SubmitTender" />
                    <br />
                    <span id="txtRequirement_charlimitinfo" class="charLimitInfo">Write your text within 6000 characters</span> 
            </div>
            <div style="clear:both;"></div>
            
            <div class="tenderHeading">
                    
            </div>
            <div class="tenderText">
                    <asp:CheckBox ID="chkTC" runat="server" Checked="false"/>
                    Please check this box to confirm that you understand and accept GSE-Mart 
                    <asp:HyperLink ID="HyperLink1" Target="_blank" runat="server" NavigateUrl="~/TermAndCondition.aspx">Terms and Conditions</asp:HyperLink>.   
                    <asp:CustomValidator ID="rfvTermsAndConditions"
                                        runat="server" 
                                        ErrorMessage="<-- Required" 
                                        ClientValidationFunction = "CheckTermsAndConditions"
                                        ValidationGroup="SubmitTender"
                                        />
            </div>
            <div style="clear:both;"></div>

            <div class="tenderHeading">
                    
            </div>
            <div class="tenderText">
                    <asp:Button class="header-button" 
                                ID="btnSubmit" 
                                Text="Submit" 
                                ValidationGroup="SubmitTender" 
                                OnClick="btnSubmit_OnClick" 
                                runat="server" />
            </div>
            <div style="clear:both;"></div>



            
    </div>

    <script type="text/javascript">
        limitChars('ctl00_MainContent_txtDescription', 2000, 'txtDescription_charlimitinfo');
        limitChars('ctl00_MainContent_txtRequirement', 6000, 'txtRequirement_charlimitinfo');
        limitChars('ctl00_MainContent_txtSpecialInstruction', 1000, 'txtSpecialInstruction_charlimitinfo');
    </script>
    
</asp:Content>

