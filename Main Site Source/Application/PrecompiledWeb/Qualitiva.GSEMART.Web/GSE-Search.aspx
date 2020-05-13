<%@ page language="C#" enableeventvalidation="false" masterpagefile="~/site.master" autoeventwireup="true" inherits="newSearchAdverts, App_Web_undihsvo" title="Search GSE Adverts - New and Used Ground Support Equipment, GSE-Mart.aero" theme="Default" maintainScrollPositionOnPostBack="true" %>

<%@ Register Assembly="skmValidators" Namespace="skmValidators" TagPrefix="cc1" %>
    
<%@ Register TagPrefix="uc" TagName="Notifier" Src="~/UserControls/Notifier.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">



<script type="text/javascript">

    function PageLoadVisibility() {

        SetASAOptionsVisibility();
        SetVisibility();
        SetEngineVisibility('SO8', '_1', '_2');
        SetEngineVisibility('SO19', '_1', '_2');
        SetEngineVisibility('SO25', '_2', '_3');
        SetEngineVisibility('SO31', '_1', '_2');
    
    }

    function hideInstructions(){
        var instructionsDiv = document.getElementById("instructions");
        instructionsDiv.style.visibility="hidden";
        return true;
    }

    function SetASAOptionsVisibility() {


        var checkBoxlist = document.getElementById("<%= chkNew.ClientID%>");
        var listItems = checkBoxlist.getElementsByTagName("input");


        switch (listItems[1].checked) {
            case true:
                document.getElementById("ASAOptionsBlank").style.zIndex = 1;
                //document.getElementById("ASATipsBlank").style.zIndex = 1;
                document.getElementById("ASAOptions").style.zIndex = 2;
                //document.getElementById("ASATips").style.zIndex = 2;
                break;

            default:
                document.getElementById("ASAOptionsBlank").style.zIndex = 2;
                //document.getElementById("ASATipsBlank").style.zIndex = 2;
                document.getElementById("ASAOptions").style.zIndex = 1;
                //document.getElementById("ASATips").style.zIndex = 1;
                break;

        };
        
            
    }

    function SetEngineVisibility(controlName, modeControlNumber, EngineControlNumber) {

        var modeControlName = "ctl00_MainContent_" + controlName + modeControlNumber;
        var engineControlName = "ctl00_MainContent_" + controlName + EngineControlNumber;
        var blankControlName = controlName + EngineControlNumber + "Blank";

        var selMode = document.getElementById(modeControlName);

        switch (selMode.value) {
            case "SELF":
                document.getElementById(blankControlName).style.zIndex = 0;
                break;

            default:
                document.getElementById(blankControlName).style.zIndex = 2;
                document.getElementById(engineControlName).value = "ANY";
                break;

        };

    }
   
   
   
    function SetVisibility() {

        var cnt;
        var DivElement = "";
        
        document.getElementById("blank").style.zIndex = 0;
        //document.getElementById("SearchButton").style.zIndex = 10;

        for (cnt = 1; cnt <=50; cnt++){

            DivElement = "Div" + cnt.toString();
            document.getElementById(DivElement).style.zIndex = 0;    
        
        }
        
        var selGSEType = document.getElementById("<%= ddlGSEType.ClientID%>");



        switch (selGSEType.value) {
            case "0": 
                document.getElementById("blank").style.zIndex = 2;
                //document.getElementById("SearchButton").style.zIndex = 0;
                break;
            default:
                DivElement = "Div" + selGSEType.value;
                document.getElementById(DivElement).style.zIndex = 2;
                break;
        };
        
        
    }

</script>


<uc:notifier ID="ctlNotifier" runat="server" EnableViewState="false" />               

<!-- Search Options -->
<div class="BoxShadow" 
     style="float: left; 
            height: 530px; 
            width:300px; 
            padding:0px; 
            margin: 0px; 
            font-size:14px; 
            text-align:center;
            border-radius:5px;">                

<div style="font-size:20px; color:#A61627; height:35px;">
Search GSE-Mart.aero
</div>


<!-- GSE Type Select list -->               
<div class="NSColumnDDL">
<asp:DropDownList ID="ddlGSEType" runat="server" CssClass="searchOption">
<asp:ListItem Value="0" Text="All GSE Types" />
<asp:ListItem Value="44" Text="Accessories/Components" />
<asp:ListItem Value="1" Text="Air Starter Units" />
<asp:ListItem Value="2" Text="Airconditioning Units" />
<asp:ListItem Value="3" Text="Aircraft Heaters" />
<asp:ListItem Value="42" Text="Aircraft Jacks" />
<asp:ListItem Value="4" Text="Aircraft Recovery Equipment" />
<asp:ListItem Value="5" Text="Aircraft Washers & Carpet Cleaners" />
<asp:ListItem Value="6" Text="Baggage/Miscellaneous Carts" />
<asp:ListItem Value="50" Text="Baggage/Cargo Lifters" />
<asp:ListItem Value="7" Text="Baggage/Cargo Tractors" />
<asp:ListItem Value="8" Text="Belt Loaders/Conveyors" />
<asp:ListItem Value="9" Text="Catering Trucks" />
<asp:ListItem Value="10" Text="Cleaning Trucks" />
<asp:ListItem Value="11" Text="Container/Pallet Transporters" />
<asp:ListItem Value="13" Text="De-icers" />
<asp:ListItem Value="14" Text="Dollies" />
<asp:ListItem Value="15" Text="Electric Multi-Purpose Vehicles" />
<asp:ListItem Value="16" Text="Fire Fighting  & Rescue Equipment" />
<asp:ListItem Value="17" Text="Fork Lift Trucks" />
<asp:ListItem Value="18" Text="Frequency Converters" />
<asp:ListItem Value="19" Text="Friction Testers" />
<asp:ListItem Value="20" Text="Ground Power Units" />
<asp:ListItem Value="45" Text="Glycol Recovery Units" />
<asp:ListItem Value="48" Text="GSE Maintenance Equipment" />
<asp:ListItem Value="21" Text="Lavatory Service Units" />
<asp:ListItem Value="22" Text="Lower Deck Loaders" />
<asp:ListItem Value="23" Text="Main Deck Loaders" />
<asp:ListItem Value="12" Text="Maintenance/Crew Stairs" />
<asp:ListItem Value="24" Text="Maintenance Platforms" />
<asp:ListItem Value="25" Text="Man Lifts/Cherry Pickers" />
<asp:ListItem Value="26" Text="Medical Lifts" />
<asp:ListItem Value="28" Text="Miscellaneous motorised GSE" />
<asp:ListItem Value="46" Text="Miscellaneous MRO Tools/Equipment" />
<asp:ListItem Value="29" Text="Miscellaneous non-motorised GSE" />
<asp:ListItem Value="49" Text="Mobile MRO Workshops" />
<asp:ListItem Value="47" Text="MRO Service Trolleys" />
<asp:ListItem Value="30" Text="Pax/Crew Buses" />
<asp:ListItem Value="31" Text="Pax/VIP Stairs" />
<asp:ListItem Value="32" Text="Pushback Tractors" />
<asp:ListItem Value="33" Text="Rapid Delivery Vehicles" />
<asp:ListItem Value="34" Text="Refuelling Trucks" />
<asp:ListItem Value="35" Text="Runway Sweepers" />
<asp:ListItem Value="43" Text="Safety/Security Vehicles" />
<asp:ListItem Value="36" Text="Snow Removal Equipment" />
<asp:ListItem Value="37" Text="Towbars/Towheads" />
<asp:ListItem Value="38" Text="Transporter Loaders" />
<asp:ListItem Value="39" Text="ULDs" />
<asp:ListItem Value="41" Text="ULD Racks" />
<asp:ListItem Value="40" Text="Water Service Units" />
</asp:DropDownList>
</div>


    <!-- Manufacturer -->
    <div class = "NSColumnDDL">
        <asp:DropDownList ID="ddlManufacturer" runat="server"  CssClass="searchOption">
            <asp:ListItem Text="All Manufacturers" Value="" />
        </asp:DropDownList> 
    </div>

    <!-- Country List -->
    <div class="NSColumnDDL">
        <asp:DropDownList ID="ddlCountryId" runat="server" CssClass="searchOption">
            <asp:ListItem Text="All Countries/Regions" Value="" />
            <asp:ListItem OptionGroup="Regions" Value="AFR" Text="Africa" />
            <asp:ListItem Value="ASP" Text="Asia-Pacific" />
            <asp:ListItem Value="AUN" Text="Australia and New Zealand" />
            <asp:ListItem Value="CAM" Text="Central America and Carribean" />
            <asp:ListItem Value="CAS" Text="Central Asia" />
            <asp:ListItem Value="CIS" Text="CIS" />
            <asp:ListItem Value="EUR" Text="Europe" />
            <asp:ListItem Value="MEA" Text="Middle East" />
            <asp:ListItem Value="NAM" Text="North America" />
            <asp:ListItem Value="SAM" Text="South America" />
            <asp:ListItem Value="SAS" Text="South Asia" />
            <asp:ListItem Value="SPI" Text="South Pacific Islands" />

            <asp:ListItem OptionGroup="Countries" Value="AD" Text="Andorra" />
    <asp:ListItem Value="AF" Text="Afghanistan" />
    <asp:ListItem Value="AL" Text="Albania" />
    <asp:ListItem Value="DZ" Text="Algeria" />
    <asp:ListItem Value="AS" Text="American Samoa" />
    <asp:ListItem Value="AD" Text="Andorra" />
    <asp:ListItem Value="AO" Text="Angola" />
    <asp:ListItem Value="AI" Text="Anguilla" />
    <asp:ListItem Value="AG" Text="Antigua and Barbuda" />
    <asp:ListItem Value="AR" Text="Argentina" />
    <asp:ListItem Value="AM" Text="Armenia" />
    <asp:ListItem Value="AW" Text="Aruba" />
    <asp:ListItem Value="AU" Text="Australia" />
    <asp:ListItem Value="AT" Text="Austria" />
    <asp:ListItem Value="AZ" Text="Azerbaijan" />
    <asp:ListItem Value="BS" Text="Bahamas" />
    <asp:ListItem Value="BH" Text="Bahrain" />
    <asp:ListItem Value="BD" Text="Bangladesh" />
    <asp:ListItem Value="BB" Text="Barbados" />
    <asp:ListItem Value="BY" Text="Belarus" />
    <asp:ListItem Value="BE" Text="Belgium" />
    <asp:ListItem Value="BZ" Text="Belize" />
    <asp:ListItem Value="BJ" Text="Benin" />
    <asp:ListItem Value="BT" Text="Bhutan" />
    <asp:ListItem Value="BO" Text="Bolivia" />
    <asp:ListItem Value="BA" Text="Bosnia and Herzegowina" />
    <asp:ListItem Value="BW" Text="Botswana" />
    <asp:ListItem Value="BR" Text="Brazil" />
    <asp:ListItem Value="BN" Text="Brunei Darussalam" />
    <asp:ListItem Value="BG" Text="Bulgaria" />
    <asp:ListItem Value="BF" Text="Burkina Faso" />
    <asp:ListItem Value="BI" Text="Burundi" />
    <asp:ListItem Value="KH" Text="Cambodia" />
    <asp:ListItem Value="CM" Text="Cameroon" />
    <asp:ListItem Value="CA" Text="Canada" />
    <asp:ListItem Value="CV" Text="Cape Verde" />
    <asp:ListItem Value="KY" Text="Cayman Islands" />
    <asp:ListItem Value="CF" Text="Central African Republic" />
    <asp:ListItem Value="TD" Text="Chad" />
    <asp:ListItem Value="CL" Text="Chile" />
    <asp:ListItem Value="CN" Text="China" />
    <asp:ListItem Value="CO" Text="Colombia" />
    <asp:ListItem Value="KM" Text="Comoros" />
    <asp:ListItem Value="CG" Text="Congo" />
    <asp:ListItem Value="CR" Text="Costa Rica" />
    <asp:ListItem Value="CI" Text="Cote D'Ivoire" />
    <asp:ListItem Value="HR" Text="Croatia" />
    <asp:ListItem Value="CU" Text="Cuba" />
    <asp:ListItem Value="CY" Text="Cyprus" />
    <asp:ListItem Value="CZ" Text="Czech Republic" />
    <asp:ListItem Value="DK" Text="Denmark" />
    <asp:ListItem Value="DJ" Text="Djibouti" />
    <asp:ListItem Value="DM" Text="Dominica" />
    <asp:ListItem Value="DO" Text="Dominican Republic" />
    <asp:ListItem Value="TP" Text="East Timor" />
    <asp:ListItem Value="EC" Text="Ecuador" />
    <asp:ListItem Value="EG" Text="Egypt" />
    <asp:ListItem Value="SV" Text="El Salvador" />
    <asp:ListItem Value="GQ" Text="Equatorial Guinea" />
    <asp:ListItem Value="ER" Text="Eritrea" />
    <asp:ListItem Value="EE" Text="Estonia" />
    <asp:ListItem Value="ET" Text="Ethiopia" />
    <asp:ListItem Value="FO" Text="Faroe Islands" />
    <asp:ListItem Value="FJ" Text="Fiji" />
    <asp:ListItem Value="FI" Text="Finland" />
    <asp:ListItem Value="FR" Text="France" />
    <asp:ListItem Value="GF" Text="French Guiana" />
    <asp:ListItem Value="PF" Text="French Polynesia" />
    <asp:ListItem Value="GA" Text="Gabon" />
    <asp:ListItem Value="GM" Text="Gambia" />
    <asp:ListItem Value="GE" Text="Georgia" />
    <asp:ListItem Value="DE" Text="Germany" />
    <asp:ListItem Value="GH" Text="Ghana" />
    <asp:ListItem Value="GI" Text="Gibraltar" />
    <asp:ListItem Value="GR" Text="Greece" />
    <asp:ListItem Value="GL" Text="Greenland" />
    <asp:ListItem Value="GD" Text="Grenada" />
    <asp:ListItem Value="GP" Text="Guadeloupe" />
    <asp:ListItem Value="GU" Text="Guam" />
    <asp:ListItem Value="GT" Text="Guatemala" />
    <asp:ListItem Value="GN" Text="Guinea Conacry" />
    <asp:ListItem Value="GW" Text="Guinea-Bissau" />
    <asp:ListItem Value="GY" Text="Guyana" />
    <asp:ListItem Value="HT" Text="Haiti" />
    <asp:ListItem Value="HN" Text="Honduras" />
    <asp:ListItem Value="HK" Text="Hong Kong" />
    <asp:ListItem Value="HU" Text="Hungary" />
    <asp:ListItem Value="IS" Text="Iceland" />
    <asp:ListItem Value="IN" Text="India" />
    <asp:ListItem Value="ID" Text="Indonesia" />
    <asp:ListItem Value="IR" Text="Iran" />
    <asp:ListItem Value="IQ" Text="Iraq" />
    <asp:ListItem Value="IE" Text="Ireland" />
    <asp:ListItem Value="IL" Text="Israel" />
    <asp:ListItem Value="IT" Text="Italy" />
    <asp:ListItem Value="JM" Text="Jamaica" />
    <asp:ListItem Value="JP" Text="Japan" />
    <asp:ListItem Value="JO" Text="Jordan" />
    <asp:ListItem Value="KZ" Text="Kazakhstan" />
    <asp:ListItem Value="KE" Text="Kenya" />
    <asp:ListItem Value="KI" Text="Kiribati" />
    <asp:ListItem Value="KP" Text="Korea Dem Peoples Republic" />
    <asp:ListItem Value="KR" Text="Korea Republic Of" />
    <asp:ListItem Value="KS" Text="Kosovo" />
    <asp:ListItem Value="KW" Text="Kuwait" />
    <asp:ListItem Value="KG" Text="Kyrgyzstan" />
    <asp:ListItem Value="LA" Text="Lao Peoples Dem Republic" />
    <asp:ListItem Value="LV" Text="Latvia" />
    <asp:ListItem Value="LB" Text="Lebanon" />
    <asp:ListItem Value="LS" Text="Lesotho" />
    <asp:ListItem Value="LR" Text="Liberia" />
    <asp:ListItem Value="LY" Text="Libya" />
    <asp:ListItem Value="LI" Text="Liechtenstein" />
    <asp:ListItem Value="LT" Text="Lithuania" />
    <asp:ListItem Value="LU" Text="Luxembourg" />
    <asp:ListItem Value="MO" Text="Macau" />
    <asp:ListItem Value="MK" Text="Macedonia" />
    <asp:ListItem Value="MG" Text="Madagascar" />
    <asp:ListItem Value="MW" Text="Malawi" />
    <asp:ListItem Value="MY" Text="Malaysia" />
    <asp:ListItem Value="MV" Text="Maldives" />
    <asp:ListItem Value="ML" Text="Mali" />
    <asp:ListItem Value="MT" Text="Malta" />
    <asp:ListItem Value="MH" Text="Marshall Islands" />
    <asp:ListItem Value="MQ" Text="Martinique" />
    <asp:ListItem Value="MR" Text="Mauritania" />
    <asp:ListItem Value="MU" Text="Mauritius" />
    <asp:ListItem Value="YT" Text="Mayotte" />
    <asp:ListItem Value="MX" Text="Mexico" />
    <asp:ListItem Value="FM" Text="Micronesia Federated States Of" />
    <asp:ListItem Value="MD" Text="Moldova" />
    <asp:ListItem Value="MC" Text="Monaco" />
    <asp:ListItem Value="MN" Text="Mongolia" />
    <asp:ListItem Value="MI" Text="Montenegro" />
    <asp:ListItem Value="MA" Text="Morocco" />
    <asp:ListItem Value="MZ" Text="Mozambique" />
    <asp:ListItem Value="MM" Text="Myanmar" />
    <asp:ListItem Value="NA" Text="Namibia" />
    <asp:ListItem Value="NR" Text="Nauru" />
    <asp:ListItem Value="NP" Text="Nepal" />
    <asp:ListItem Value="NL" Text="Netherlands" />
    <asp:ListItem Value="AN" Text="Netherlands Antilles" />
    <asp:ListItem Value="NC" Text="New Caledonia" />
    <asp:ListItem Value="NZ" Text="New Zealand" />
    <asp:ListItem Value="NI" Text="Nicaragua" />
    <asp:ListItem Value="NE" Text="Niger" />
    <asp:ListItem Value="NG" Text="Nigeria" />
    <asp:ListItem Value="NO" Text="Norway" />
    <asp:ListItem Value="OM" Text="Oman" />
    <asp:ListItem Value="PK" Text="Pakistan" />
    <asp:ListItem Value="PA" Text="Panama" />
    <asp:ListItem Value="PG" Text="Papua New Guinea" />
    <asp:ListItem Value="PY" Text="Paraguay" />
    <asp:ListItem Value="PE" Text="Peru" />
    <asp:ListItem Value="PH" Text="Philippines" />
    <asp:ListItem Value="PL" Text="Poland" />
    <asp:ListItem Value="PT" Text="Portugal" />
    <asp:ListItem Value="PR" Text="Puerto Rico" />
    <asp:ListItem Value="QA" Text="Qatar" />
    <asp:ListItem Value="RE" Text="Reunion" />
    <asp:ListItem Value="RO" Text="Romania" />
    <asp:ListItem Value="RU" Text="Russian Federation" />
    <asp:ListItem Value="RW" Text="Rwanda" />
    <asp:ListItem Value="KN" Text="Saint Kitts And Nevis" />
    <asp:ListItem Value="LC" Text="Saint Lucia" />
    <asp:ListItem Value="VC" Text="Saint Vincent and The Grenadines" />
    <asp:ListItem Value="WS" Text="Samoa" />
    <asp:ListItem Value="SM" Text="San Marino" />
    <asp:ListItem Value="ST" Text="Sao Tome and Principe" />
    <asp:ListItem Value="SA" Text="Saudi Arabia" />
    <asp:ListItem Value="SN" Text="Senegal" />
    <asp:ListItem Value="SX" Text="Serbia" />
    <asp:ListItem Value="SC" Text="Seychelles" />
    <asp:ListItem Value="SL" Text="Sierra Leone" />
    <asp:ListItem Value="SG" Text="Singapore" />
    <asp:ListItem Value="SK" Text="Slovakia" />
    <asp:ListItem Value="SI" Text="Slovenia" />
    <asp:ListItem Value="SB" Text="Solomon Islands" />
    <asp:ListItem Value="SO" Text="Somalia" />
    <asp:ListItem Value="ZA" Text="South Africa" />
    <asp:ListItem Value="SS" Text="South Sudan" />
    <asp:ListItem Value="ES" Text="Spain" />
    <asp:ListItem Value="LK" Text="Sri Lanka" />
    <asp:ListItem Value="SD" Text="Sudan" />
    <asp:ListItem Value="SR" Text="Suriname" />
    <asp:ListItem Value="SZ" Text="Swaziland" />
    <asp:ListItem Value="SE" Text="Sweden" />
    <asp:ListItem Value="CH" Text="Switzerland" />
    <asp:ListItem Value="SY" Text="Syria" />
    <asp:ListItem Value="TW" Text="Taiwan" />
    <asp:ListItem Value="TJ" Text="Tajikistan" />
    <asp:ListItem Value="TZ" Text="Tanzania" />
    <asp:ListItem Value="TH" Text="Thailand" />
    <asp:ListItem Value="TG" Text="Togo" />
    <asp:ListItem Value="TO" Text="Tonga" />
    <asp:ListItem Value="TT" Text="Trinidad and Tobago" />
    <asp:ListItem Value="TN" Text="Tunisia" />
    <asp:ListItem Value="TR" Text="Turkey" />
    <asp:ListItem Value="TM" Text="Turkmenistan" />
    <asp:ListItem Value="TV" Text="Tuvalu" />
    <asp:ListItem Value="UG" Text="Uganda" />
    <asp:ListItem Value="UA" Text="Ukraine" />
    <asp:ListItem Value="AE" Text="United Arab Emirates" />
    <asp:ListItem Value="GB" Text="United Kingdom" />
    <asp:ListItem Value="US" Text="United States" />
    <asp:ListItem Value="UY" Text="Uruguay" />
    <asp:ListItem Value="UZ" Text="Uzbekistan" />
    <asp:ListItem Value="VU" Text="Vanuatu" />
    <asp:ListItem Value="VE" Text="Venezuela" />
    <asp:ListItem Value="VN" Text="Viet Nam" />
    <asp:ListItem Value="VG" Text="Virgin Islands (British)" />
    <asp:ListItem Value="VI" Text="Virgin Islands (U.S.)" />
    <asp:ListItem Value="YE" Text="Yemen" />
    <asp:ListItem Value="ZR" Text="Zaire" />
    <asp:ListItem Value="ZM" Text="Zambia" />
    <asp:ListItem Value="ZW" Text="Zimbabwe" />
    </asp:DropDownList>
    </div>


    <!-- Suppliers -->
    <div class = "NSColumnDDL">
        <asp:DropDownList ID="ddlSuppliers" runat="server"  CssClass="searchOption">
            <asp:ListItem Text="All Sellers" Value="" />
        </asp:DropDownList> 
    </div>
    
    <div class ="NSColumnDDL">
    <!-- Search button div for all types -->
    <asp:Button ID="btnSearch" 
                runat="server" 
                Text="Search" 
                OnClick="btnSearch_Click" 
                style="width:275px; height:35px;" 
                class="header-button" 
                OnClientClick="=hideInstructions();"
                />
    </div>

    <div class="NSHeading2">
    Further Options
    </div>


    <!-- For Sale, Rent or Lease -->
    <div class="NSColumnChk">
        <asp:CheckBoxList id="chkSaleOptions" runat="server" RepeatDirection="Horizontal" CssClass="searchOptionCheckList">
            <asp:ListItem Selected ="True">Sale</asp:ListItem>
            <asp:ListItem Selected ="True">Rent</asp:ListItem>
            <asp:ListItem Selected ="True">Lease</asp:ListItem>
        </asp:CheckBoxList>
        
    </div>
    <div class="NSColumnValidate">
        <cc1:CheckBoxListValidator ID="chkSaleOptionsValidator" runat="server" ErrorMessage="<" ControlToValidate="chkSaleOptions"></cc1:CheckBoxListValidator>
    </div>
    <div style="clear: both"></div>


    <!-- New or Used -->
    <div class="NSColumnChk">
        <asp:CheckBoxList ID="chkNew"  RepeatDirection="horizontal" runat="server"  CssClass="searchOptionCheckList">
            <asp:ListItem Selected="True">New</asp:ListItem>
            <asp:ListItem Selected="True">Used</asp:ListItem>
        </asp:CheckBoxList>
        <div id="ASAOptions" style="position: relative; z-index: 2; height:35px;">
        <asp:RadioButtonlist ID="rdoASAMembersOnly" runat="server" RepeatDirection ="horizontal" CssClass="searchOptionCheckList">
            <asp:ListItem Selected="True">All</asp:ListItem>
            <asp:ListItem >ASA</asp:ListItem>
        </asp:RadioButtonlist>
        </div>
        <div id="ASAOptionsBlank" style="background:white; position: relative; top: -35px; z-index: 1; width:100%; height:35px;"></div>
    </div>
    <div class="NSColumnValidate">
        <cc1:CheckBoxListValidator ID="chkNewValidator" runat="server" ErrorMessage="<--" ControlToValidate="chkNew" style="width:20px"></cc1:CheckBoxListValidator>
    </div>
    <div style="clear: both"></div>
    


    <div class="NSHeading2">
    <br />
    GSE Type Technical Data
    </div>


<div style="position: relative; width:100%; height:150px; top:25px;">
    
    <!-- Blank div to hide the other panels -->
    <div id="blank" class="NSBlank">
    </div>

    
    
    <!-- GSE Type Divs -->  
    <div id="Div1" class="NSCriteria">

        <!--<h2>Air Starter Units</h2><br />-->
        
        <div class="NSColumn1">Mode:</div>
        <div class="NSColumn2">
            <asp:DropDownList ID="SO1_1" runat="server"  CssClass="searchOptionDropDown">
                <asp:ListItem Value="ANY"  Text="All Modes" />
                <asp:ListItem Value="SELF" Text="Self Propelled" />
                <asp:ListItem Value="TOWD" Text="Towed" />
            </asp:DropDownList>
            
        </div>
        <div class="NSColumnValidate"></div>
        <div style="clear: both;"></div>

        <div class="NSColumn1">Airflow:</div>
        <div class="NSColumn2"><asp:textbox id="Q1_1" name="Q1_1" runat="server"/> PPM</div>
        <div class="NSColumnValidate"><asp:RegularExpressionValidator ID="Q1_1Validator" ControlToValidate="Q1_1" runat="server" ErrorMessage="<--" ValidationExpression="^\d+$"></asp:RegularExpressionValidator></div>
        <div style="clear: both;"></div>
          
        <div class="NSColumn1">Pressure:</div>
        <div class="NSColumn2"><asp:textbox id="Q1_2" runat="server"/> PSI</div>
        <div class="NSColumnValidate"><asp:RegularExpressionValidator ID="Q1_2Validator" ControlToValidate="Q1_2" runat="server" ErrorMessage="<--" ValidationExpression="^\d+$"></asp:RegularExpressionValidator></div>
        <div style="clear: both;"></div>
    </div>

    <div id="Div2" class="NSCriteria">
        <!--<h2>Air Conditioning Units</h2><br />-->
        <div class="NSColumn1">Mode:</div>
        <div class="NSColumn2">
            <asp:DropDownList ID="SO2_1" runat="server">
                <asp:ListItem Value="ANY"  Text="All Modes" />
                <asp:ListItem Value="SELF" Text="Self Propelled" />
                <asp:ListItem Value="TOWD" Text="Towed" />
            </asp:DropDownList>
            
        </div>
        <div class="NSColumnValidate"></div>
        <div style="clear: both;"></div>
        
        <div class="NSColumn1">Cooling Cap:</div>
        <div class="NSColumn2"><asp:textbox id="Q2_1" runat="server"/> tons</div>
        <div class="NSColumnValidate"><asp:RegularExpressionValidator ControlToValidate="Q2_1" ID="Q2_1Validator" runat="server" ErrorMessage="<--" ValidationExpression="^\d+$"> </asp:RegularExpressionValidator></div>
        <div style="clear: both;"></div>
        
        <div class="NSColumn1">Airflow:</div>
        <div class="NSColumn2"><asp:textbox id="Q2_2" runat="server"/> PPM</div>
        <div class="NSColumnValidate"><asp:RegularExpressionValidator ControlToValidate="Q2_2" ID="Q2_2Validator" runat="server" ErrorMessage="<--" ValidationExpression="^\d+$"> </asp:RegularExpressionValidator></div>
        <div style="clear: both;"></div>
            
    </div>
    
    <div id="Div3" class="NSCriteria">
    <!--<h2>Aircraft Heaters</h2><br />-->
        <div class="NSColumn1">Mode:</div>
        <div class="NSColumn2">
            <asp:DropDownList ID="SO3_1" runat="server" >
                <asp:ListItem Value="ANY"  Text="All Modes" />
                <asp:ListItem Value="SELF" Text="Self Propelled" />
                <asp:ListItem Value="TOWD" Text="Towed" />
            </asp:DropDownList>
        </div>
        <div class="NSColumnValidate"></div>
        <div style="clear: both;"></div>
        
        <div class="NSColumn1">Heater Engine:</div>
        <div class="NSColumn2">
            <asp:DropDownList ID="SO3_2" runat="server" >
                <asp:ListItem Value="ANY"  Text="All Engine Types" />
                <asp:ListItem Value="ELEC" Text="Electric" />
                <asp:ListItem Value="JET" Text="Jet Fuel" />
                <asp:ListItem Value="DIESL" Text="Diesel" />
            </asp:DropDownList>
        </div>
        <div class="NSColumnValidate"></div>
        <div style="clear: both;"></div>
                
        <div class="NSColumn1">Heating Cap:</div>
        <div class="NSColumn2"><asp:textbox id="Q3_1" runat="server" /> BTU</div>
        <div class="NSColumnValidate"><asp:RegularExpressionValidator ControlToValidate="Q3_1" ID="Q3_1Validator" runat="server" ErrorMessage="<--" ValidationExpression="^\d+$"> </asp:RegularExpressionValidator></div>
        <div style="clear: both;"></div>
        
        <div class="NSColumn1">Airflow:</div>
        <div class="NSColumn2"><asp:textbox id="Q3_2" runat="server" /> PPM</div>
        <div class="NSColumnValidate"><asp:RegularExpressionValidator ControlToValidate="Q3_2" ID="Q3_2Validator" runat="server" ErrorMessage="<--" ValidationExpression="^\d+$"> </asp:RegularExpressionValidator></div>
        <div style="clear: both;"></div>
            
    </div>
    
    <div id="Div4" class="NSCriteria">
    <!--<h2>Aircraft Recovery Equipment</h2><br />-->
    </div>
    
    <div id="Div5" class="NSCriteria">
    <!--<h2>Aircraft Washers</h2><br />-->
    </div>
    
    <div id="Div6" class="NSCriteria">
    <!--<h2>Baggage/Miscellaneous Carts</h2><br />-->
        <div class="NSColumn1">Cart Type:</div>
        <div class="NSColumn2">
            <asp:DropDownList id="SO6_1" runat="server" >
                <asp:ListItem value="ANY" Text="Any Cart Type"></asp:ListItem>
                <asp:ListItem value="BAGG" Text="Baggage"></asp:ListItem>
                <asp:ListItem value="WATER" Text="Water/Lavatory"></asp:ListItem>
                <asp:ListItem value="MISC" Text="Miscellaneous"></asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="NSColumnValidate"></div>
        <div style="clear: both;"></div>
    </div>
    
    
    
    <div id="Div7" class="NSCriteria">
    <!--<h2>Baggage/Cargo Tractors</h2><br />-->
        <div class="NSColumn1">Engine Type:</div>
        <div class="NSColumn2">
            <asp:DropDownList ID="SO7_1" runat="server" style="z-index:10">
                <asp:ListItem Value="ANY"  Text="All Engine Types" />
                <asp:ListItem Value="DIESL" Text="Diesel" />
                <asp:ListItem Value="ELEC" Text="Electric" />
                <asp:ListItem Value="HYBRD" Text="Hybrid" />
                <asp:ListItem Value="LPG" Text="LPG/CNG" />
                <asp:ListItem Value="PETRL" Text="Petrol (Gasoline)" />
            </asp:DropDownList>
            
        </div>
        <div class="NSColumnValidate"></div>
        <div style="clear: both;"></div>

        <div class="NSColumn1">Drawbar Pull:</div>
        <div class="NSColumn2">
            <asp:textbox id="Q7_1" name="Q7_1" runat="server" />
            <asp:RadioButton ID="QU7_1_1" GroupName="QU7_1" runat="server" Text ="kN" checked="true" />    
            <asp:RadioButton ID="QU7_1_2" GroupName="QU7_1" runat="server" Text ="lbs" />    
        </div>
        <div class="NSColumnValidate"><asp:RegularExpressionValidator ControlToValidate="Q7_1" ID="Q7_1Validator" runat="server" ErrorMessage="<--" ValidationExpression="^\d+$"> </asp:RegularExpressionValidator></div>
        <div style="clear: both;"></div>
    
    </div>
    
    <div id="Div8" class="NSCriteria">
    <!--<h2>Belt Loaders/Conveyors</h2>-->
        
        <div class="NSColumn1">Top Service Height:</div>
        <div class="NSColumn2">
            <asp:textbox id="Q8_1" name="Q8_1" runat="server" />
            <asp:RadioButton ID="QU8_1_1" GroupName="QU8_1" runat="server" Text ="mm" checked="true" />    
            <asp:RadioButton ID="QU8_1_2" GroupName="QU8_1" runat="server" Text ="ft" />    
        </div>
        <div class="NSColumnValidate"><asp:RegularExpressionValidator ControlToValidate="Q8_1" ID="Q8_1Validator" runat="server" ErrorMessage="<--" ValidationExpression="^\d+$"> </asp:RegularExpressionValidator></div>
        <div style="clear: both;"></div>
    
        <div class="NSColumn1">Boom Length:</div>
        <div class="NSColumn2">
            <asp:textbox id="Q8_2" name="Q8_2" runat="server" />
            <asp:RadioButton ID="QU8_2_1" GroupName="QU8_2" runat="server" Text ="mm" checked="true" />    
            <asp:RadioButton ID="QU8_2_2" GroupName="QU8_2" runat="server" Text ="ft" />    
        </div>
        <div class="NSColumnValidate"><asp:RegularExpressionValidator ControlToValidate="Q8_2" ID="Q8_2Validator" runat="server" ErrorMessage="<--" ValidationExpression="^\d+$"> </asp:RegularExpressionValidator></div>
        <div style="clear: both;"></div>
                
        
        <div class="NSColumn1">Mode:</div>
        <div class="NSColumn2">
            <asp:DropDownList ID="SO8_1" runat="server" >
                <asp:ListItem Value="ANY"  Text="All Modes" />
                <asp:ListItem Value="SELF" Text="Self Propelled" />
                <asp:ListItem Value="TOWD" Text="Towed" />
            </asp:DropDownList>
        </div>
        <div class="NSColumnValidate"></div>
        <div style="clear: both;"></div>
        
        <div style="position:relative; z-index: 10;">
            <div id= "SO8_2Col1" class="NSColumn1" style="position:relative;z-index:1;">Engine Type:</div>
            <div class="NSColumn2" style="position:relative;z-index:1;">
                <asp:DropDownList ID="SO8_2" runat="server" >
                    <asp:ListItem Value="ANY"  Text="All Engine Types" />
                    <asp:ListItem Value="PETRL" Text="Petrol (Gasoline)" />
                    <asp:ListItem Value="DIESL" Text="Diesel" />
                    <asp:ListItem Value="ELEC" Text="Electric" />
                    <asp:ListItem Value="HYBRD" Text="Hybrid" />
                    <asp:ListItem Value="LPG" Text="LPG/CNG" />
                    <asp:ListItem Value="MISC" Text="Miscellaneous" />
                </asp:DropDownList>
                
            </div>
            <div class="NSColumnValidate" style="position:relative;z-index:1;"></div>
            <div style="clear: both;"></div>
            <div id="SO8_2Blank" class = "NSEngineBlank" style="position:relative; z-index:2;top: -40px; left:0px;"></div>
        </div>
    
    </div>
    
    <div id="Div9" class="NSCriteria">
    <!--<h2>Catering Trucks</h2><br />-->
        <div class="NSColumn1">Scissors:</div>
        <div class="NSColumn2">
            <asp:DropDownList ID="SO9_1" runat="server" style="z-index:10">
                <asp:ListItem Value="ANY"  Text="Any Scissors" />
                <asp:ListItem Value="SINGL" Text="Single Scissors" />
                <asp:ListItem Value="DOUBL" Text="Double Scissors" />
                <asp:ListItem Value="SIDE" Text="Side Loader" />
            </asp:DropDownList>
            
        </div>
        <div class="NSColumnValidate"></div>
        <div style="clear: both;"></div>

        <div class="NSColumn1">Top Service Height:</div>
        <div class="NSColumn2">
            <asp:textbox id="Q9_1" name="Q9_1" runat="server" />
            <asp:RadioButton ID="QU9_1_1" GroupName="QU9_1" runat="server" Text ="mm" checked="true" />    
            <asp:RadioButton ID="QU9_1_2" GroupName="QU9_1" runat="server" Text ="ft" />    
        </div>
        <div class="NSColumnValidate"><asp:RegularExpressionValidator ControlToValidate="Q9_1" ID="Q9_1Validator" runat="server" ErrorMessage="<--" ValidationExpression="^\d+$"> </asp:RegularExpressionValidator></div>
        <div style="clear: both;"></div>
    
    </div>
   
    <div id="Div10" class="NSCriteria">
    <!--<h2>Cleaning Trucks</h2><br />-->
        <div class="NSColumn1">Scissors:</div>
        <div class="NSColumn2">
            <asp:DropDownList ID="SO10_1" runat="server" style="z-index:10">
                <asp:ListItem Value="ANY"  Text="Any Scissors" />
                <asp:ListItem Value="SINGL" Text="Single Scissors" />
                <asp:ListItem Value="DOUBL" Text="Double Scissors" />
                <asp:ListItem Value="SIDE" Text="Side Loader" />
            </asp:DropDownList>
            
        </div>
        <div class="NSColumnValidate"></div>
        <div style="clear: both;"></div>

        <div class="NSColumn1">Top Service Height:</div>
        <div class="NSColumn2">
            <asp:textbox id="Q10_1" name="Q10_1" runat="server" />
            <asp:RadioButton ID="QU10_1_1" GroupName="QU10_1" runat="server" Text ="mm" checked="true" />    
            <asp:RadioButton ID="QU10_1_2" GroupName="QU10_1" runat="server" Text ="ft" />    
        </div>
        <div class="NSColumnValidate"><asp:RegularExpressionValidator ControlToValidate="Q10_1" ID="Q10_1Validator" runat="server" ErrorMessage="<--" ValidationExpression="^\d+$"> </asp:RegularExpressionValidator></div>
        <div style="clear: both;"></div>
    
    </div>

    <div id="Div11" class="NSCriteria">
    <!--<h2>Container Pallet Transporters</h2><br />-->
        <div class="NSColumn1">Engine Type:</div>
        <div class="NSColumn2">
            <asp:DropDownList ID="SO11_1" runat="server" style="z-index:10">
                <asp:ListItem Value="ANY"  Text="Any Engine Type" />
                <asp:ListItem Value="DIESL" Text="Diesel" />
                <asp:ListItem Value="ELEC" Text="Electric" />
            </asp:DropDownList>
            
        </div>
        <div class="NSColumnValidate"></div>
        <div style="clear: both;"></div>

        <div class="NSColumn1">Payload:</div>
        <div class="NSColumn2">
            <asp:textbox id="Q11_1" name="Q11_1" runat="server" />
            <asp:RadioButton ID="QU11_1_1" GroupName="QU11_1" runat="server" Text ="tons" checked="true" />    
            <asp:RadioButton ID="QU11_1_2" GroupName="QU11_1" runat="server" Text ="lbs" />    
        </div>
        <div class="NSColumnValidate"><asp:RegularExpressionValidator ControlToValidate="Q11_1" ID="Q11_1Validator" runat="server" ErrorMessage="<--" ValidationExpression="^\d+$"> </asp:RegularExpressionValidator></div>
        <div style="clear: both;"></div>
    
    </div>
    
    <div id="Div12" class="NSCriteria">
    <!--<h2>Crew/Maintenance Stairs</h2><br />-->
        
        <div class="NSColumn1">Top Service Height:</div>
        <div class="NSColumn2">
            <asp:textbox id="Q12_1" name="Q12_1" runat="server" />
            <asp:RadioButton ID="QU12_1_1" GroupName="QU12_1" runat="server" Text ="mm" checked="true" />    
            <asp:RadioButton ID="QU12_1_2" GroupName="QU12_1" runat="server" Text ="ft" />    
        </div>
        <div class="NSColumnValidate"><asp:RegularExpressionValidator ControlToValidate="Q12_1" ID="Q12_1Validator" runat="server" ErrorMessage="<--" ValidationExpression="^\d+$"> </asp:RegularExpressionValidator></div>
        <div style="clear: both;"></div>
    
    </div>
    
    <div id="Div13" class="NSCriteria">
        
        <div class="NSColumn1">Aircraft Type:</div>
        <div class="NSColumn2">
            <asp:DropDownList ID="SO13_1" runat="server" style="z-index:10">
                <asp:ListItem Value="ANY" Text="Any Aircraft Type" />
                <asp:ListItem Value="NARRW" Text="Narrow Body Aircraft" />
                <asp:ListItem Value="WIDE" Text="Wide Body Aircraft" />
                <asp:ListItem Value="A380" Text="A380 Capable" />
            </asp:DropDownList>
            
        </div>
        <div class="NSColumnValidate"></div>
        <div style="clear: both;"></div>
    </div>

    <div id="Div14" class="NSCriteria">
    <!--<h2>Dollies</h2><br />-->
        <div class="NSColumn1">Dolly Type:</div>
        <div class="NSColumn2">
            <asp:DropDownList ID="SO14_1" runat="server" style="z-index:10">
                <asp:ListItem Value="ANY" Text="Any Dolly Type" />
                <asp:ListItem Value="CONT" Text="Container Dollies" />
                <asp:ListItem Value="10FT" Text="10 foot Pallet Dollies" />
                <asp:ListItem Value="20FT" Text="20 foot Pallet Dollies" />
                <asp:ListItem Value="COOL" Text="Cooling Dollies" />
                <asp:ListItem Value="OTHR" Text="Other Dollies" />
            </asp:DropDownList>
            
        </div>
        <div class="NSColumnValidate"></div>
        <div style="clear: both;"></div>
    </div>
    
    <div id="Div15" class="NSCriteria">
    <!--<h2>Electric Multi-Purpose Vehicles</h2><br />-->
    </div>
    
    <div id="Div16" class="NSCriteria">
    <!--<h2>Fire Fighting and Rescue Equipment</h2><br />-->
    </div>

    <div id="Div17" class="NSCriteria">
    <!--<h2>Fork Lift Trucks</h2><br />-->
        <div class="NSColumn1">Truck Type:</div>
        <div class="NSColumn2">
            <asp:DropDownList ID="SO17_1" runat="server" style="z-index:10">
                <asp:ListItem Value="ANY" Text="Any Truck Type" />
                <asp:ListItem Value="FORK" Text="Fork Lift Trucks" />
                <asp:ListItem Value="REACH" Text="Reach Trucks" />
                <asp:ListItem Value="TOW" Text="Tow Tractors" />
                <asp:ListItem Value="STACK" Text="Stackers" />
                <asp:ListItem Value="HAND" Text="Hand Pallet Units" />
            </asp:DropDownList>
        </div>
        <div class="NSColumnValidate"></div>
        <div style="clear: both;"></div>
        
        <div class="NSColumn1">Engine Type:</div>
        <div class="NSColumn2">
            <asp:DropDownList ID="SO17_2" runat="server" style="z-index:10">
                <asp:ListItem Value="ANY"  Text="All Engine Types" />
                <asp:ListItem Value="DIESL" Text="Diesel" />
                <asp:ListItem Value="ELEC" Text="Electric" />
                <asp:ListItem Value="HYBRD" Text="Hybrid" />
                <asp:ListItem Value="LPG" Text="LPG/CNG" />
                <asp:ListItem Value="MISC" Text="Miscellaneous" />
            </asp:DropDownList>
            
        </div>
        <div class="NSColumnValidate"></div>
        <div style="clear: both;"></div>

        <div class="NSColumn1">Load Capacity:</div>
        <div class="NSColumn2">
            <asp:textbox id="Q17_1" name="Q17_1" runat="server" />
            <asp:RadioButton ID="QU17_1_1" GroupName="QU17_1" runat="server" Text ="kgs" checked="true" />    
            <asp:RadioButton ID="QU17_1_2" GroupName="QU17_1" runat="server" Text ="lbs" />    
        </div>
        <div class="NSColumnValidate"><asp:RegularExpressionValidator ControlToValidate="Q17_1" ID="Q17_1Validator" runat="server" ErrorMessage="<--" ValidationExpression="^\d+$"> </asp:RegularExpressionValidator></div>
        <div style="clear: both;"></div>
    
    </div>    
    
    <div id="Div18" class="NSCriteria">
    <!--<h2>Frequency Converters</h2><br />-->
        
        <div class="NSColumn1">Mode:</div>
        <div class="NSColumn2">
            <asp:DropDownList ID="SO18_1" runat="server" >
                <asp:ListItem Value="ANY"  Text="All Modes" />
                <asp:ListItem Value="SELF" Text="Self Propelled" />
                <asp:ListItem Value="TOWD" Text="Towed" />
                <asp:ListItem Value="STAT" Text="Stationary" />
            </asp:DropDownList>
        </div>
        <div class="NSColumnValidate"></div>
        <div style="clear: both;"></div>
        
        <div class="NSColumn1">Frequency:</div>
        <div class="NSColumn2">
            <asp:textbox id="Q18_1" name="Q18_1" runat="server" /> Hz
        </div>
        <div class="NSColumnValidate"><asp:RegularExpressionValidator ControlToValidate="Q18_1" ID="Q18_1Validator" runat="server" ErrorMessage="<--" ValidationExpression="^\d+$"> </asp:RegularExpressionValidator></div>
        <div style="clear: both;"></div>
    
    </div>   
    
    <div id="Div19" class="NSCriteria">
    <!--<h2>Friction Testers</h2><br />-->
        <div class="NSColumn1">Mode:</div>
        <div class="NSColumn2">
            <asp:DropDownList ID="SO19_1" runat="server" >
                <asp:ListItem Value="ANY"  Text="All Modes" />
                <asp:ListItem Value="SELF" Text="Self Propelled" />
                <asp:ListItem Value="TOWD" Text="Towed" />
            </asp:DropDownList>
        </div>
        <div class="NSColumnValidate"></div>
        <div style="clear: both;"></div>
        
        <div style="position:relative; z-index: 10;">
            <div class="NSColumn1" style="position:relative;z-index:1;">Engine Type:</div>
            <div class="NSColumn2" style="position:relative;z-index:1;">
                <asp:DropDownList ID="SO19_2" runat="server" >
                    <asp:ListItem Value="ANY"  Text="All Engine Types" />
                    <asp:ListItem Value="DIESL" Text="Diesel" />
                    <asp:ListItem Value="PETRL" Text="Petrol" />
                    <asp:ListItem Value="OTHR" Text="Other" />
                </asp:DropDownList>
                
            </div>
            <div class="NSColumnValidate" style="position:relative;z-index:1;"></div>
            <div style="clear: both;"></div>
            <div id="SO19_2Blank" class = "NSEngineBlank" style="position:relative; z-index:2;top: -35px; left:0px;"></div>
        
        </div>
        
        
    </div>
    
    <div id="Div20" class="NSCriteria">
    <!--<h2>Ground Power Units</h2><br />-->
        <div class="NSColumn1">28V Option:</div>
        <div class="NSColumn2">
            <asp:DropDownList ID="SO20_1" runat="server" style="z-index:10">
                <asp:ListItem Value="ANY" Text="Any" />
                <asp:ListItem Value="W28V" Text="With 28V" />
                <asp:ListItem Value="WO28V" Text="Without 28V" />
            </asp:DropDownList>
            
        </div>
        <div class="NSColumnValidate"></div>
        <div style="clear: both;"></div>
        
        <div class="NSColumn1">Mode:</div>
        <div class="NSColumn2">
            <asp:DropDownList ID="SO20_2" runat="server" >
                <asp:ListItem Value="ANY"  Text="All Modes" />
                <asp:ListItem Value="SELF" Text="Self Propelled" />
                <asp:ListItem Value="PMNT" Text="Push Back Mounted" />
                <asp:ListItem Value="STAT" Text="Stationary" />
                <asp:ListItem Value="TOWD" Text="Towed" />
            </asp:DropDownList>
        </div>
        <div class="NSColumnValidate"></div>
        <div style="clear: both;"></div>
        
        <div class="NSColumn1">Power:</div>
        <div class="NSColumn2"><asp:textbox id="Q20_1" runat="server" /> kVA</div>
        <div class="NSColumnValidate"><asp:RegularExpressionValidator ControlToValidate="Q20_1" ID="Q20_1Validator" runat="server" ErrorMessage="<--" ValidationExpression="^\d+$"> </asp:RegularExpressionValidator></div>
        <div style="clear: both;"></div>
        
    </div>

    <div id="Div21" class="NSCriteria">
    <!--<h2>Lavatory Service Units</h2><br />-->
        <div class="NSColumn1">Mode:</div>
        <div class="NSColumn2">
            <asp:DropDownList ID="SO21_1" runat="server" >
                <asp:ListItem Value="ANY"  Text="All Modes" />
                <asp:ListItem Value="SELF" Text="Self Propelled" />
                <asp:ListItem Value="TOWD" Text="Towed" />
            </asp:DropDownList>
        </div>
        <div class="NSColumnValidate"></div>
        <div style="clear: both;"></div>
        
        <div class="NSColumn1">Tank Capacity:</div>
        <div class="NSColumn2">
            <asp:textbox id="Q21_1" name="Q21_1" runat="server" />
            <asp:RadioButton ID="QU21_1_1" GroupName="QU21_1" runat="server" Text ="ltrs" checked="true" />    
            <asp:RadioButton ID="QU21_1_2" GroupName="QU21_1" runat="server" Text ="gals" />    
        </div>
        <div class="NSColumnValidate"><asp:RegularExpressionValidator ControlToValidate="Q21_1" ID="Q21_1Validator" runat="server" ErrorMessage="<--" ValidationExpression="^\d+$"> </asp:RegularExpressionValidator></div>
        <div style="clear: both;"></div>
    </div>

    <div id="Div22" class="NSCriteria">
    <!--<h2>Lower Deck Loaders</h2><br />-->
        <div class="NSColumn1">Engine Type:</div>
        <div class="NSColumn2">
           <asp:DropDownList id="SO22_1" runat="server" >
                 <asp:ListItem value="ANY" Text="Any Engine"></asp:ListItem>
                 <asp:ListItem value="DIESL" Text="Diesel"></asp:ListItem>
                 <asp:ListItem value="ELEC" Text="Electric"></asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="NSColumnValidate"></div>
        <div style="clear: both;"></div>
        
        <div class="NSColumn1">Payload:</div>
        <div class="NSColumn2">
            <asp:textbox id="Q22_1" name="Q22_1" runat="server" />
            <asp:RadioButton ID="QU22_1_1" GroupName="QU22_1" runat="server" Text ="kgs" checked="true" />    
            <asp:RadioButton ID="QU22_1_2" GroupName="QU22_1" runat="server" Text ="lbs" />    
        </div>
        <div class="NSColumnValidate"><asp:RegularExpressionValidator ControlToValidate="Q22_1" ID="RegularExpressionValidator1" runat="server" ErrorMessage="<--" ValidationExpression="^\d+$"> </asp:RegularExpressionValidator></div>
        <div style="clear: both;"></div>
    </div>

    <div id="Div23" class="NSCriteria">
    <!--<h2>Main Deck Loaders</h2><br />-->
        <div class="NSColumn1">Engine Type:</div>
        <div class="NSColumn2">
            <asp:DropDownList id="SO23_1" runat="server" >
                <asp:ListItem value="ANY" Text="Any Engine"></asp:ListItem>
                <asp:ListItem value="DIESL" Text="Diesel"></asp:ListItem>
                <asp:ListItem value="ELEC" Text="Electric"></asp:ListItem>
                <asp:ListItem value="PETRL" Text="Petrol"></asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="NSColumnValidate"></div>
        <div style="clear: both;"></div>
        
        <div class="NSColumn1">Payload:</div>
        <div class="NSColumn2">
            <asp:textbox id="Q23_1" name="Q23_1" runat="server" />
            <asp:RadioButton ID="QU23_1_1" GroupName="QU23_1" runat="server" Text ="kgs" checked="true" />    
            <asp:RadioButton ID="QU23_1_2" GroupName="QU23_1" runat="server" Text ="lbs" />    
        </div>
        <div class="NSColumnValidate"><asp:RegularExpressionValidator ControlToValidate="Q23_1" ID="Q23_1Validator" runat="server" ErrorMessage="<--" ValidationExpression="^\d+$"> </asp:RegularExpressionValidator></div>
        <div style="clear: both;"></div>
    </div>
    
    <div id="Div24" class="NSCriteria">
    <!--<h2>Maintenance Platforms</h2><br />-->
        <div class="NSColumn1">Mode:</div>
        <div class="NSColumn2">
            <asp:DropDownList ID="SO24_1" runat="server" >
                <asp:ListItem Value="ANY"  Text="All Modes" />
                <asp:ListItem Value="SELF" Text="Self Propelled" />
                <asp:ListItem Value="TOWD" Text="Towed" />
            </asp:DropDownList>
        </div>
        <div class="NSColumnValidate"></div>
        <div style="clear: both;"></div>
        
        <div class="NSColumn1">Top Service Height:</div>
        <div class="NSColumn2">
            <asp:textbox id="Q24_1" name="Q24_1" runat="server" />
            <asp:RadioButton ID="QU24_1_1" GroupName="QU24_1" runat="server" Text ="mm" checked="true" />    
            <asp:RadioButton ID="QU24_1_2" GroupName="QU24_1" runat="server" Text ="ft" />    
        </div>
        <div class="NSColumnValidate"><asp:RegularExpressionValidator ControlToValidate="Q24_1" ID="Q24_1Validator" runat="server" ErrorMessage="<--" ValidationExpression="^\d+$"> </asp:RegularExpressionValidator></div>
        <div style="clear: both;"></div>
    </div>
    
    <div id="Div25" class="NSCriteria">
    <!--<h2>Man Lifts/Cherry Pickers</h2><br />-->
        
        <div class="NSColumn1">Type:</div>
        <div class="NSColumn2">
            <asp:DropDownList id="SO25_1" runat="server" >
                <asp:ListItem value="ANY" Text="Any Type"></asp:ListItem>
                <asp:ListItem value="CHRRY" Text="Cherry Pickers"></asp:ListItem>
                <asp:ListItem value="TOWD" Text="Man Lifts"></asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="NSColumnValidate"></div>
        <div style="clear: both;"></div>
        
        <div class="NSColumn1">Top Service Height:</div>
        <div class="NSColumn2">
            <asp:textbox id="Q25_1" name="Q25_1" runat="server" />
            <asp:RadioButton ID="QU25_1_1" GroupName="QU25_1" runat="server" Text ="mm" checked="true" />    
            <asp:RadioButton ID="QU25_1_2" GroupName="QU25_1" runat="server" Text ="ft" />    
        </div>
        <div class="NSColumnValidate"><asp:RegularExpressionValidator ControlToValidate="Q25_1" ID="Q25_1Validator" runat="server" ErrorMessage="<--" ValidationExpression="^\d+$"> </asp:RegularExpressionValidator></div>
        <div style="clear: both;"></div>
        
        
        <div class="NSColumn1">Mode:</div>
        <div class="NSColumn2">
            <asp:DropDownList ID="SO25_2" runat="server" >
                <asp:ListItem Value="ANY"  Text="All Modes" />
                <asp:ListItem Value="SELF" Text="Self Propelled" />
                <asp:ListItem Value="TOWD" Text="Towed" />
            </asp:DropDownList>
        </div>
        <div class="NSColumnValidate"></div>
        <div style="clear: both;"></div>
        
        <div style="position:relative; z-index: 10;">
        <div class="NSColumn1" style="position:relative;z-index:1;">Engine Type:</div>
        <div class="NSColumn2" style="position:relative;z-index:1;">
            <asp:DropDownList id="SO25_3" runat="server" >
                <asp:ListItem value="ANY" Text="Any Engine"></asp:ListItem>
                <asp:ListItem value="DIESL" Text="Diesel"></asp:ListItem>
                <asp:ListItem value="ELEC" Text="Electric"></asp:ListItem>
             </asp:DropDownList>
        </div>
        <div class="NSColumnValidate" style="position:relative;z-index:1;"></div>
        <div style="clear: both;"></div>
        <div id="SO25_3Blank" class = "NSEngineBlank" style="position:relative; z-index:2;top: -40px; height:40px; left:0px;"></div>
        </div>
        

    </div>

    <div id="Div26" class="NSCriteria">
    <!--<h2>Medical Lifts</h2><br />-->
        <div class="NSColumn1">Scissors:</div>
        <div class="NSColumn2">
            <asp:DropDownList ID="SO26_1" runat="server" style="z-index:10">
                <asp:ListItem Value="ANY"  Text="Any Scissors" />
                <asp:ListItem Value="SINGL" Text="Single Scissors" />
                <asp:ListItem Value="DOUBL" Text="Double Scissors" />
                <asp:ListItem Value="SIDE" Text="Side Loader" />
                <asp:ListItem Value="OTHR" Text="Other" />

            </asp:DropDownList>
            
        </div>
        <div class="NSColumnValidate"></div>
        <div style="clear: both;"></div>

        <div class="NSColumn1">Mode:</div>
        <div class="NSColumn2">
            <asp:DropDownList ID="SO26_2" runat="server" >
                <asp:ListItem Value="ANY"  Text="All Modes" />
                <asp:ListItem Value="SELF" Text="Self Propelled" />
                <asp:ListItem Value="TOWD" Text="Towed" />
            </asp:DropDownList>
        </div>
        <div class="NSColumnValidate"></div>
        <div style="clear: both;"></div>
        
        <div class="NSColumn1">Top Service Height:</div>
        <div class="NSColumn2">
            <asp:textbox id="Q26_1" name="Q26_1" runat="server" />
            <asp:RadioButton ID="QU26_1_1" GroupName="QU26_1" runat="server" Text ="mm" checked="true" />    
            <asp:RadioButton ID="QU26_1_2" GroupName="QU26_1" runat="server" Text ="ft" />    
        </div>
        <div class="NSColumnValidate"><asp:RegularExpressionValidator ControlToValidate="Q9_1" ID="RegularExpressionValidator2" runat="server" ErrorMessage="<--" ValidationExpression="^\d+$"> </asp:RegularExpressionValidator></div>
        <div style="clear: both;"></div>
    
    </div>
    
     <div id="Div27" class="NSCriteria">
        <!--<h2>Military Equipment</h2><br />-->
     </div>
     
     <div id="Div28" class="NSCriteria">
        <!--<h2>Miscellanesous Motorised GSE</h2><br />-->
        <div class="NSColumn1">Engine Type:</div>
        <div class="NSColumn2">
            <asp:DropDownList ID="SO28_1" runat="server" >
                <asp:ListItem Value="ANY"  Text="All Engine Types" />
                <asp:ListItem Value="DIESL" Text="Diesel" />
                <asp:ListItem Value="ELEC" Text="Electric" />
                <asp:ListItem Value="HYBRD" Text="Hybrid" />
                <asp:ListItem Value="LPG" Text="LPG/CNG" />
                <asp:ListItem Value="MISC" Text="Miscellaneous" />
            </asp:DropDownList>
            
        </div>
        <div class="NSColumnValidate"></div>
        <div style="clear: both;"></div>

     </div>
     
     <div id="Div29" class="NSCriteria">
        <!--<h2>Miscellaneous Non-Motorised GSE</h2><br />-->
     </div>
     
     <div id="Div30" class="NSCriteria">
        <!--<h2>Pax/Crew Buses</h2><br />-->
        <div class="NSColumn1">Engine Type:</div>
        <div class="NSColumn2">
            <asp:DropDownList ID="SO30_1" runat="server" >
                <asp:ListItem Value="ANY"  Text="All Engine Types" />
                <asp:ListItem Value="DIESL" Text="Diesel" />
                <asp:ListItem Value="ELEC" Text="Electric" />
                <asp:ListItem Value="LPG" Text="LPG/CNG" />
                <asp:ListItem Value="MISC" Text="Miscellaneous" />
            </asp:DropDownList>
            
        </div>
        <div class="NSColumnValidate"></div>
        <div style="clear: both;"></div>

        <div class="NSColumn1">Capacity:</div>
        <div class="NSColumn2"><asp:textbox id="Q30_1" runat="server" /> passengers</div>
        <div class="NSColumnValidate"><asp:RegularExpressionValidator ControlToValidate="Q30_1" ID="Q30_1Validator" runat="server" ErrorMessage="<--" ValidationExpression="^\d+$"> </asp:RegularExpressionValidator></div>
        <div style="clear: both;"></div>

     </div>
     
     <div id="Div31" class="NSCriteria">
     <!--<h2>Pax/VIP Stairs</h2><br />-->
     
        <div class="NSColumn1">Top Service Height:</div>
        <div class="NSColumn2">
            <asp:textbox id="Q31_1" name="Q31_1" runat="server" />
            <asp:RadioButton ID="QU31_1_1" GroupName="QU31_1" runat="server" Text ="mm" checked="true" />    
            <asp:RadioButton ID="QU31_1_2" GroupName="QU31_1" runat="server" Text ="ft" />    
        </div>
        <div class="NSColumnValidate"><asp:RegularExpressionValidator ControlToValidate="Q31_1" ID="Q31_1Validator" runat="server" ErrorMessage="<--" ValidationExpression="^\d+$"> </asp:RegularExpressionValidator></div>
        <div style="clear: both;"></div>
        
        <div class="NSColumn1">Mode:</div>
        <div class="NSColumn2">
            <asp:DropDownList ID="SO31_1" runat="server" >
                <asp:ListItem Value="ANY"  Text="All Modes" />
                <asp:ListItem Value="SELF" Text="Self Propelled" />
                <asp:ListItem Value="TOWD" Text="Towed" />
            </asp:DropDownList>
        </div>
        <div class="NSColumnValidate"></div>
        <div style="clear: both;"></div>
        
        <div style="position:relative; z-index: 10;">
        <div class="NSColumn1" style="position:relative;z-index:1;">Engine Type:</div>
        <div class="NSColumn2" style="position:relative;z-index:1;">
            <asp:DropDownList ID="SO31_2" runat="server" >
                <asp:ListItem Value="ANY"  Text="All Engine Types" />
                <asp:ListItem Value="DIESL" Text="Diesel" />
                <asp:ListItem Value="ELEC" Text="Electric" />
            </asp:DropDownList>
            
        </div>
        <div class="NSColumnValidate" style="position:relative;z-index:1;"></div>
        <div style="clear: both;"></div>
        <div id="SO31_2Blank" class = "NSEngineBlank" style="position:relative; z-index:2;top: -35px; left:0px;"></div>
        </div>


        
    </div>

     <div id="Div32" class="NSCriteria">
     <!--<h2>Pushback Tractors</h2><br />-->
        <div class="NSColumn1">Type:</div>
        <div class="NSColumn2">
            <asp:DropDownList id="SO32_1" runat="server" >
                <asp:ListItem value="ANY" Text="Any Type"></asp:ListItem>
                <asp:ListItem value="CONV" Text="Conventional"></asp:ListItem>
                <asp:ListItem value="TBLES" Text="Towbarless"></asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="NSColumnValidate"></div>
        <div style="clear: both;"></div>
        
        <div class="NSColumn1">Engine Type:</div>
        <div class="NSColumn2">
            <asp:DropDownList ID="SO32_2" runat="server" >
                <asp:ListItem Value="ANY"  Text="All Engine Types" />
                <asp:ListItem Value="DIESL" Text="Diesel" />
                <asp:ListItem Value="ELEC" Text="Electric" />
                <asp:ListItem Value="HYBRD" Text="Hybrid" />
            </asp:DropDownList>
            
        </div>
        <div class="NSColumnValidate"></div>
        <div style="clear: both;"></div>
        
        <div class="NSColumn1">MTOW:</div>
        <div class="NSColumn2">
            <asp:textbox id="Q32_1" name="Q32_1" runat="server" />
            <asp:RadioButton ID="QU32_1_1" GroupName="QU32_1" runat="server" Text ="tons" checked="true" />    
            <asp:RadioButton ID="QU32_1_2" GroupName="QU32_1" runat="server" Text ="lbs" />    
        </div>
        <div class="NSColumnValidate"><asp:RegularExpressionValidator ControlToValidate="Q32_1" ID="RegularExpressionValidator3" runat="server" ErrorMessage="<--" ValidationExpression="^\d+$"> </asp:RegularExpressionValidator></div>
        <div style="clear: both;"></div>
        
    </div>
    
    <div id="Div33" class="NSCriteria">
    <!--<h2>Rapid Delivery Vehicles</h2><br />-->
        <div class="NSColumn1">Engine Type:</div>
        <div class="NSColumn2">
            <asp:DropDownList ID="SO33_1" runat="server" style="z-index:10">
                <asp:ListItem Value="ANY"  Text="All Engine Types" />
                <asp:ListItem Value="DIESL" Text="Diesel" />
                <asp:ListItem Value="ELEC" Text="Electric" />
                <asp:ListItem Value="HYBRD" Text="Hybrid" />
                <asp:ListItem Value="LPG" Text="LPG/CNG" />
                <asp:ListItem Value="MISC" Text="Miscellaneous" />
            </asp:DropDownList>
            
        </div>
        <div class="NSColumnValidate"></div>
        <div style="clear: both;"></div>

    
    </div>
    
     <div id="Div34" class="NSCriteria">
     <!--<h2>Refuelling Trucks</h2><br />-->
        <div class="NSColumn1">Type:</div>
        <div class="NSColumn2">
            <asp:DropDownList id="SO34_1"  runat="server" >
                <asp:ListItem  value = "ANY" Text="Any Mode"></asp:ListItem>
                <asp:ListItem  value = "AIRC" Text="Aircraft"></asp:ListItem>
                <asp:ListItem  value = "GSE" Text="GSE"></asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="NSColumnValidate"></div>
        <div style="clear: both;"></div>
        
        <div class="NSColumn1">Mode:</div>
        <div class="NSColumn2">
            <asp:DropDownList ID="SO34_2" runat="server" >
                <asp:ListItem Value="ANY"  Text="All Modes" />
                <asp:ListItem Value="SELF" Text="Self Propelled" />
                <asp:ListItem Value="TOWD" Text="Towed" />
            </asp:DropDownList>
            
        </div>
        <div class="NSColumnValidate"></div>
        <div style="clear: both;"></div>
        
        <div class="NSColumn1">Tank Capacity:</div>
        <div class="NSColumn2">
            <asp:textbox id="Q34_1" name="Q34_1" runat="server" />
            <asp:RadioButton ID="QU34_1_1" GroupName="QU34_1" runat="server" Text ="ltrs" checked="true" />    
            <asp:RadioButton ID="QU34_1_2" GroupName="QU34_1" runat="server" Text ="gals" />    
        </div>
        <div class="NSColumnValidate"><asp:RegularExpressionValidator ControlToValidate="Q34_1" ID="Q34_1Validator" runat="server" ErrorMessage="<--" ValidationExpression="^\d+$"> </asp:RegularExpressionValidator></div>
        <div style="clear: both;"></div>
    </div>
    
    <div id="Div35" class="NSCriteria">
    <!--<h2>Runway Sweepers</h2><br />-->
    </div>

    <div id="Div36" class="NSCriteria">
    <!--<h2>Snow Removal Equipment</h2><br />-->
    </div>

    <div id="Div37" class="NSCriteria">
     <!--<h2>Towbars</h2><br />-->
     
        <div class="NSColumn1">Towbar or Towhead</div>
        <div class="NSColumn2">
            <asp:DropDownList ID="SO37_2" runat="server" >
                <asp:ListItem Value="ANY"  Text="Both" />
                <asp:ListItem Value="TOWB" Text="Towbars" />
                <asp:ListItem Value="TOWH" Text="Towheads" />
            </asp:DropDownList>
            
        </div>
        <div class="NSColumnValidate"></div>
        <div style="clear: both;"></div>
     
        <div class="NSColumn1">Aircraft Type:</div>
        <div class="NSColumn2">
            <asp:DropDownList id="SO37_1"  runat="server">
                <asp:ListItem  value = "ANY" Text="Any Type"></asp:ListItem>
                <asp:ListItem  value = "CORP" Text="Corporate/FBO"></asp:ListItem>
                <asp:ListItem  value = "GENRL" Text="General"></asp:ListItem>
                <asp:ListItem  value = "REGNL" Text="Regional"></asp:ListItem>
                <asp:ListItem  value = "NARRW" Text="Narrow Body Aircraft"></asp:ListItem>
                <asp:ListItem  value = "WIDE" Text="Wide Body Aircraft"></asp:ListItem>
                <asp:ListItem  value = "HELC" Text="Helicopters"></asp:ListItem>
                <asp:ListItem  value = "MILT" Text="Military"></asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="NSColumnValidate"></div>
        <div style="clear: both;"></div>
       
     </div> 
     
     <div id="Div38" class="NSCriteria">
     <!--<h2>Transport Loaders</h2><br />-->
        <div class="NSColumn1">Engine Type:</div>
        <div class="NSColumn2">
            <asp:DropDownList ID="SO38_1" runat="server" style="z-index:10">
                <asp:ListItem Value="ANY"  Text="All Engine Types" />
                <asp:ListItem Value="DIESL" Text="Diesel" />
                <asp:ListItem Value="ELEC" Text="Electric" />
                <asp:ListItem Value="TOW" Text="Towable" />
            </asp:DropDownList>
            
        </div>
        <div class="NSColumnValidate"></div>
        <div style="clear: both;"></div>
    
    </div>

     <div id="Div39" class="NSCriteria">
     <!--<h2>ULDs</h2><br />-->
        <div class="NSColumn1">Type:</div>
        <div class="NSColumn2">
            <asp:DropDownList ID="SO39_1" runat="server" style="z-index:10">
                <asp:ListItem Value="ANY"  Text="All ULD Types" />
                <asp:ListItem Value="PALLT" Text="Pallets" />
                <asp:ListItem Value="CONT" Text="Containers" />
            </asp:DropDownList>
            
        </div>
        <div class="NSColumnValidate"></div>
        <div style="clear: both;"></div>
    
    </div>

    <div id="Div40" class="NSCriteria">
    <!--<h2>Water Service Units</h2><br />-->
        <div class="NSColumn1">Mode:</div>
        <div class="NSColumn2">
            <asp:DropDownList id="SO40_1" runat="server" >
                <asp:ListItem value="ANY" Text="Any Mode"></asp:ListItem>
                <asp:ListItem value="SELF" Text="Self Propelled"></asp:ListItem>
                <asp:ListItem value="TOWD" Text="Towed"></asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="NSColumnValidate"></div>
        <div style="clear: both;"></div>
        
        <div class="NSColumn1">Tank Capacity:</div>
        <div class="NSColumn2">
            <asp:textbox id="Q40_1" name="Q40_1" runat="server" />
            <asp:RadioButton ID="QU40_1_1" GroupName="QU40_1" runat="server" Text ="ltrs" checked="true" />    
            <asp:RadioButton ID="QU40_1_2" GroupName="QU40_1" runat="server" Text ="gals" />    
        </div>
        <div class="NSColumnValidate"><asp:RegularExpressionValidator ControlToValidate="Q40_1" ID="Q40_1Validator" runat="server" ErrorMessage="<--" ValidationExpression="^\d+$"> </asp:RegularExpressionValidator></div>
        <div style="clear: both;"></div>
    </div>
     
    <div id="Div41" class="NSCriteria">
    <!--<h2>ULD Racks</h2><br />-->
        <div class="NSColumn1">Payload:</div>
        <div class="NSColumn2">
            <asp:textbox id="Q41_1" name="Q41_1" runat="server" />
            <asp:RadioButton ID="QU41_1_1" GroupName="QU41_1" runat="server" Text ="kgs" checked="true" />    
            <asp:RadioButton ID="QU41_1_2" GroupName="QU41_1" runat="server" Text ="lbs" />    
        </div>
        <div class="NSColumnValidate"><asp:RegularExpressionValidator ControlToValidate="Q41_1" ID="Q41_1Validator" runat="server" ErrorMessage="<--" ValidationExpression="^\d+$"> </asp:RegularExpressionValidator></div>
        <div style="clear: both;"></div>
    </div>    

    <div id="Div42" class="NSCriteria">
    <!--<h2>Aircraft Jacks</h2><br />-->
        <div class="NSColumn1">Type:</div>
        <div class="NSColumn2">
            <asp:DropDownList id="SO42_1" runat="server" >
                <asp:ListItem value="ANY" Text="Any Type"></asp:ListItem>
                <asp:ListItem value="AXLE" Text="Axle Jacks"></asp:ListItem>
                <asp:ListItem value="TRIP" Text="Maintenance Tripod Jacks"></asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="NSColumnValidate"></div>
        <div style="clear: both;"></div>

    </div>
    <div id="Div43" class="NSCriteria">
        <!--<h2>Safety and Security Vehicles</h2><br />-->
     </div>
    
    <div id="Div44" class="NSCriteria">
    <!--<h2>Accessories/Components</h2><br />-->
        <div class="NSColumn1">GSE Type:</div>
        <div class="NSColumn2">
            <asp:DropDownList id="SO44_1" runat="server">
                <asp:ListItem value="ANY" Text="For Any Type"></asp:ListItem>
                <asp:ListItem Value="1" Text="For Air Starter Units" />
                <asp:ListItem Value="2" Text="For Airconditioning Units" />
                <asp:ListItem Value="3" Text="For Aircraft Heaters" />
                <asp:ListItem Value="42" Text="For Aircraft Jacks" />
                <asp:ListItem Value="4" Text="For Aircraft Recovery Equipment" />
                <asp:ListItem Value="5" Text="For Aircraft Washers" />
                <asp:ListItem Value="6" Text="For Baggage/Miscellaneous Carts" />
                <asp:ListItem Value="7" Text="For Baggage/Cargo Tractors" />
                <asp:ListItem Value="8" Text="For Belt Loaders/Conveyors" />
                <asp:ListItem Value="9" Text="For Catering Trucks" />
                <asp:ListItem Value="10" Text="For Cleaning Trucks" />
                <asp:ListItem Value="11" Text="For Container/Pallet Transporters" />
                <asp:ListItem Value="12" Text="For Crew/Maintenance Stairs" />
                <asp:ListItem Value="13" Text="For De-icers" />
                <asp:ListItem Value="14" Text="For Dollies" />
                <asp:ListItem Value="15" Text="For Electric Multi-Purpose Vehicles" />
                <asp:ListItem Value="16" Text="For Fire Fighting  & Rescue Equipment" />
                <asp:ListItem Value="17" Text="For Fork Lift Trucks" />
                <asp:ListItem Value="18" Text="For Frequency Converters" />
                <asp:ListItem Value="19" Text="For Friction Testers" />
                <asp:ListItem Value="20" Text="For Ground Power Units" />
                <asp:ListItem Value="21" Text="For Lavatory Service Units" />
                <asp:ListItem Value="22" Text="For Lower Deck Loaders" />
                <asp:ListItem Value="23" Text="For Main Deck Loaders" />
                <asp:ListItem Value="24" Text="For Maintenance Platforms" />
                <asp:ListItem Value="25" Text="For Man Lifts/Cherry Pickers" />
                <asp:ListItem Value="26" Text="For Medical Lifts" />
                <asp:ListItem Value="28" Text="For Miscellaneous motorised GSE" />
                <asp:ListItem Value="29" Text="For Miscellaneous non-motorised GSE" />
                <asp:ListItem Value="30" Text="For Pax/Crew Buses" />
                <asp:ListItem Value="31" Text="For Pax/VIP Stairs" />
                <asp:ListItem Value="32" Text="For Pushback Tractors" />
                <asp:ListItem Value="33" Text="For Rapid Delivery Vehicles" />
                <asp:ListItem Value="34" Text="For Refuelling Trucks" />
                <asp:ListItem Value="35" Text="For Runway Sweepers" />
                <asp:ListItem Value="43" Text="For Safety/Security Vehicles" />
                <asp:ListItem Value="36" Text="For Snow Removal Equipment" />
                <asp:ListItem Value="37" Text="For Towbars" />
                <asp:ListItem Value="38" Text="For Transporter Loaders" />
                <asp:ListItem Value="39" Text="For ULDs" />
                <asp:ListItem Value="41" Text="For ULD Racks" />
                <asp:ListItem Value="40" Text="For Water Service Units" />
            </asp:DropDownList>
        </div>
        <div class="NSColumnValidate"></div>
        
     </div>
        

     <div id="Div45" class="NSCriteria">
        <!--<h2>Glycol Recovery Units</h2><br />-->
     </div>
     <div style="clear: both;"></div>
        
    <div id="Div46" class="NSCriteria">
    <!--<h2>Miscellaneous MRO Tools/Equipment</h2><br />-->
        <div class="NSColumn1">Type:</div>
        <div class="NSColumn2">
            <asp:DropDownList id="SO46_1" runat="server" >
                <asp:ListItem value="ANY" Text="Any Type"></asp:ListItem>
                <asp:ListItem value="ENG" Text="Engine Handling Equipment"></asp:ListItem>
                <asp:ListItem value="FLUI" Text="Fluid Handling Equipment"></asp:ListItem>
                <asp:ListItem value="MISC" Text="Miscellaneous Tools/Equipment"></asp:ListItem>
                <asp:ListItem value="TAIL" Text="Tail Stanchions"></asp:ListItem>
                <asp:ListItem value="WHEE" Text="Wheel Handling Equipment"></asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="NSColumnValidate"></div>
        <div style="clear: both;"></div>
    </div>

    <div id="Div47" class="NSCriteria">
    <!--<h2>MRO Service Trolleys</h2><br />-->
        <div class="NSColumn1">Type:</div>
        <div class="NSColumn2">
            <asp:DropDownList id="SO47_1" runat="server" >
                <asp:ListItem value="ANY" Text="Any Type"></asp:ListItem>
                <asp:ListItem value="NITG" Text="Nitrogen Trolleys"></asp:ListItem>
                <asp:ListItem value="OXYG" Text="Oxygen Trolleys"></asp:ListItem>
                <asp:ListItem value="WHEE" Text="Wheel Trollies"></asp:ListItem>
                <asp:ListItem value="MISC" Text="Miscellaneous MRO Trolleys"></asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="NSColumnValidate"></div>
        <div style="clear: both;"></div>
    </div>

    <div id="Div48" class="NSCriteria">
    <!--<h2>GSE Maintenance Equipment</h2><br />-->
        <div class="NSColumn1">Type:</div>
        <div class="NSColumn2">
            <asp:DropDownList id="SO48_1" runat="server" >
                <asp:ListItem value="ANY" Text="Any Type"></asp:ListItem>
                <asp:ListItem value="CRAN" Text="Crane Trolleys"></asp:ListItem>
                <asp:ListItem value="JACK" Text="GSE Jacks"></asp:ListItem>
                <asp:ListItem value="LEFT" Text="Hydraulic Lifts"></asp:ListItem>
                <asp:ListItem value="MISC" Text="Miscellaneous GSE Maintenance Equipment"></asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="NSColumnValidate"></div>
        <div style="clear: both;"></div>
    </div>
    
       
    <div id="Div49" class="NSCriteria">
    <!--<h2>Mobile MRO Workshops</h2><br />-->
    </div>
    
     <div id="Div50" class="NSCriteria">
    <!--<h2>Baggage/Cargo Lifters</h2><br />-->
    </div>
       
 </div>

<!-- End of Search Options --> 
</div> 

<!-- Results Pane -->
<div class="BoxShadow" 
     style="float: left; 
            width:708px; 
            padding:0px; 
            margin: 0 0 0 10px; 
            font-size:14px; 
            min-height:530px;
            border-radius:5px;">                
    
    <!-- Instructions -->
    <div runat="server" id="instructions" style="width:710px; height:400px">
        <div class="searchInstructionsText" style="position:relative; top:35px; left:5px;">
        &lt;-- Choose your main search criteria here
        </div>
        <div class="searchInstructionsText" style="position:relative; top:150px; left:5px;">
        &lt;-- When you have entered your criteria and filters, click SEARCH here
        </div>
        
        <div class="searchInstructionsText" style="position:relative; top:175px; left:5px;">
        &lt;-- You can filter your results by equipment for sale, rent or lease here
        </div>
        
        <div class="searchInstructionsText" style="position:relative; top:180px; left:5px;">
        &lt;-- You can filter your results by new and used here
        </div>
        
        <div class="searchInstructionsText" style="position:relative; top:175px; left:5px;">
        &lt;-- If you select used equipment, you can filter on ASA members only here
        </div>

        <div class="searchInstructionsText" style="position:relative; top:200px; left:5px;">
        &lt;-- Narrow your search by entering GSE type specific criteria here
        </div>
        
    </div>  
      
                                                    
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
            <span class="content-summary" runat="server">
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

<script type="text/javascript">

    // Check visibility on the page load
    window.onload = PageLoadVisibility;
 
</script>

    
</asp:Content>
