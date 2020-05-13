<%@ page language="C#" enableeventvalidation="false" masterpagefile="~/Site.master" autoeventwireup="true" inherits="_default, App_Web_undihsvo" title="GSE Mart - Global Ground Support Equipment Database" theme="Default" maintainScrollPositionOnPostBack="true" %>

<%@ Register TagPrefix="uc" TagName="Notifier" Src="~/UserControls/Notifier.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">

<uc:notifier ID="ctlNotifier" runat="server" EnableViewState="false" />               

<div style="width:100%; height:805px">

<!-- First Row of Divs -->   
<div style="width:100%; height:300px;">

    <!-- Quick Search -->
    <div class="BoxShadow" style="position: relative; top:0px; left:0px; height: 220px; width:508px; padding:0px; margin: 0px; font-size:14px; text-align:center; border-radius: 5px;">
    
        <div style="font-size:20px; color:#A61627; height:28px;">
            Quick Search
        </div>
        
        <!-- GSE Types -->
        <div style="height:35px">
            <!-- GSE Type Select list -->
            <asp:DropDownList ID="ddlGSEType" runat="server" Width="97%" Height="27px" style="border-radius:5px;" Font-Size="16px">
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
    
    
        <div style="height:35px">
            <asp:DropDownList ID="ddlManufacturer" runat="server" Width="97%" Height="27px" style="border-radius:5px;" Font-Size="16px">
                <asp:ListItem Text="All Manufacturers" Value="" />
            </asp:DropDownList> 
        </div>

    
        <div style="height:35px">
        <asp:DropDownList ID="ddlCountryId" runat="server" Width="97%" Height="27px" style="border-radius:5px;" Font-Size="16px">
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

        <div style="height:35px;">
            <asp:CheckBoxList ID="chkNew"  RepeatDirection="horizontal" runat="server" Width="100%" Font-Size="16px">
                <asp:ListItem Selected="True">New Units</asp:ListItem>
                <asp:ListItem Selected="True">Used Units</asp:ListItem>
            </asp:CheckBoxList>
        </div>
    
        <asp:button id="cmdSearch" runat="server" style="width:325px; height:35px;" class="header-button" 
                                    Text="Search" BorderStyle="None" onclick="cmdSearch_Click">
    </asp:button>

    </div>

    <!-- Statistics Box -->
    <div class="BoxShadow" style="position: relative; top:5px; left:0px; height: 70px; width:508px; padding:0px; margin: 0px; font-size:14px; text-align:center; border-radius: 5px; font-size:19px;">
        <asp:Label class="statisticsText" ID="lblUsedQuantityItem" runat="server" /> Used GSE
        <asp:Label class="statisticsText" ID="lblNewQuantityItem" runat="server" />  Models of Brand New GSE <br />
        in <asp:Label class="statisticsText" ID="lblAdvertCountries" runat="server" /> Countries
    </div>

        
    <!-- Youtube Video -->
    <div class="BoxShadow" id="GSEInFocus" 
        style="position: relative; top:-292px; left:514px; margin-top:0px; width: 508px; height: 295px; ">
        <iframe src="https://www.youtube.com/embed/qlAH0RncfIk" frameborder="0" 
            allowfullscreen style="height: 100%; width: 100%"></iframe>
    </div>
    

    
    <!-- Flash Banner -->    
    <!--
    <div class="BoxShadow" style="position: relative; top: -214px; left:350px; height: 120px; width:670px; padding:0px; margin: 0px; border-radius: 5px;">
        <object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0" width="670px" height="120px" id="preview" align="middle">
        <param name="allowScriptAccess" value="sameDomain" />
        <param name="movie" value="homepage.swf?clickTAG=" /><param name="quality" value="high" /><param name="bgcolor" value="#ffffff" />
        <embed src="homepage.swf?clickTAG=" quality="high" bgcolor="#ffffff" width="670px" height="120px" name="preview" align="middle" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />
        </object>
    </div>
    -->
    
</div>


    <!-- Latest Adverts -->
    <div class="BoxShadow" style="margin-top:10px;height: 190px; width: 1024px; border-radius:5px">
        <div class="top-listing-row" style="width:100%; height:100%; border-radius:5px">
            <div align="center" valign="middle" style="font-size: medium; font-weight: bold; position:relative; top:5px; ">
                Preview the latest Adverts:
            </div>
            <div class="top-listing" style="position:relative; top:10px; height:125px;">
                <asp:Repeater ID="dataTopListingImage" runat="server" OnItemDataBound="dataTopListing_ItemDataBound">
                    <HeaderTemplate>        
                    </HeaderTemplate>
                    <ItemTemplate>
                        <div class="item-image" style="float:left;margin-left:8px;">
                            <a href="adDetails.aspx?id=<%# Eval("AdvertId") %>" title="<%# Eval("ShortDescription") %>" class="noborderline">
                                <asp:Image ID="imgThumb" runat="server" Width="157px" Height="122px"/>
                            </a>
                        </div>
                    </ItemTemplate>
                    <FooterTemplate>
                        <div style="clear:both;"></div>
                    </FooterTemplate>
                </asp:Repeater>
            </div>
            <div class="top-listing" style="position:relative; top:10px;">
                <asp:Repeater ID="dataTopListingTitle" runat="server">
                    <HeaderTemplate>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <div class="item-title" style="float:left; margin-left:8px;">
                            <a href="adDetails.aspx?id=<%# Eval("AdvertId") %>" title="<%# Eval("ShortDescription") %>" style="color:White;" >
                            <%# Eval("Title")%></a>
                        </div>
                    </ItemTemplate>
                    <FooterTemplate>
                        <div style="clear:both;"></div>
                    </FooterTemplate>
                </asp:Repeater>
            </div>
            
        </div>
    </div>   
    
    <div id="logos" style="width: 100%;">

        <!-- Arrivals Board -->
        <div class="BoxShadow" id="Div1" style="position:relative; top:0px; margin-top:10px; width: 340px;">
            <a href="GSE-Search.aspx"><img src="images/infocus/arrivals.jpg" style="height:295px; width:340px; border-style: none;"></a>
        </div>
      
        <div class="BoxShadow" style="position:relative; top:-297px; left: 350px; width:330px; height:200px;">
            <a href="http://www.afsaviation.co.uk/afs-ground-support-services/online-auction/">
            <img src="images/inFocus/afs.gif" 
                style="border-style: none; width:330px; height:200px"/></a>
        </div>
        <div class="BoxShadow" style="position:relative; top:-498px; left: 685px; margin-left:8px; width:330px; height:200px">
            <a href="http://www.groundhandling.com" target="_blank"><img src="images/inFocus/Finalbanner.gif" style="border-style: none;"/></a>
        </div>
        <div class="BoxShadow" style="position:relative; top:-492px; left: 350px; width:674px;">
            <a href="http://www.asaworld.aero/" target="_blank"><img src="images/companylogos/asa.jpg" width="674px" height = "85" style="border-style: none;"/></a>
        </div>
        
    </div>

    <div style="clear: both;"></div>

    <div style="height:30px;"></div>
</div>
    
</asp:Content>
