<%@ page language="C#" masterpagefile="~/site.master" autoeventwireup="true" inherits="SellingGSE, App_Web_1ganjq4w" title="Selling Guide - GSE-Mart.aero" theme="Default" maintainScrollPositionOnPostBack="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
<table width="100%" class="mainTable" cellspacing="1" cellpadding="2">
        <tr>
            <td bgcolor="#FFFFFF">
                <table width="100%">
                    <tr>
                        <td>
                            <table width="100%">
                                <tr>
                                    <td width="100%" valign="top">
                                        <table class="quick-search" border="0" cellpadding="0" cellspacing="0" height="200">
                                            <tr height="25">
                                                <td align="left" class="header" width="25">
                                                    <img src="images/left-corner.png" border="0" />
                                                </td>
                                                <td class="header" width="700">
                                                    Selling Guide
                                                </td>
                                                <td align="right" class="header">
                                                    <img src="images/right-corner.png" border="0" />
                                                </td>
                                            </tr>
                                            <tr height="175">
                                                <td class="content" colspan="3">
                                                    <table width="100%">
                                                        <tr>
                                                            <td valign="top">
                                                                <div class="divMargin">
                                                                    <span class="smallMarginTxt">The GSE-Mart.aero web site (the &quot;Website&quot;)
                                                                        is provided to you by ONGROUND FZC. (the &quot;Company&quot;), and is subject to
                                                                        the terms and conditions of the Terms of Use Agreement (&quot;Agreement&quot;) and
                                                                        any rules or procedures established by the Company from time to time which are posted
                                                                        on the Website whether by links on the Website or otherwise. This Website is a GSE
                                                                        and GSE related items listing GSE for sale (“GSE") </span>
                                                                    <br />
                                                                    <br />
                                                                    <div>
                                                                        <h3>How It Works for Sellers</h3>
                                                                        <ol>
                                                                            <li><b>Become a seller - </b>You have to create a Seller account first
                                                                                <br />
                                                                                <br />
                                                                            </li>
                                                                            <li><b>Create your account – </b>Register yourself as a user
                                                                                <ol type="a">
                                                                                    <li>Go to the Sell screen by clicking on the toolbar option called
                                                                                        <img src="<%= ResolveUrl("images/sell-page/Sell.png") %>" align="absmiddle" />
                                                                                    </li>
                                                                                    <li>You will see the following screen
                                                                                        <br />
                                                                                        <br />
                                                                                        <img src="<%= ResolveUrl("images/sell-page/CreateAccount.png") %>" width="600px" />
                                                                                        <br />
                                                                                        <br />
                                                                                    </li>
                                                                                    <li>Enter all the information requested in each field on the create seller account form
                                                                                        above </li>
                                                                                    <li>Your email address and password will be used as you username and password to access your account once it has been activated.
                                                                                        So make sure these details are accurate as the activation code will be sent to this email address.</li>
                                                                                    <li>The sales code field is used to identify gse-mart sales people if they have been responsible for securing a seller‘s interest in wanting to advertise on gse-mart.
                                                                                        Leave this blank if this is not relevant</li>
                                                                                    <li>When you press the create account button you will navigate to the welcome screen
                                                                                        below:
                                                                                        <br />
                                                                                        <br />
                                                                                        <img src="<%= ResolveUrl("images/sell-page/AccountValidation.png") %>" width="600px" />
                                                                                    </li>
                                                                                    <li>You will receive an acceptance email and activation code from us confirming that your account is activated for use.
                                                                                        This will be almost immediate and will be sent to the email address you have used for your account set up.</li>
                                                                                    <li>When you receive your activation code please type it into the activation code box to trigger your account live status.
                                                                                        Your account will be live once the code is accepted.</li>
                                                                                    <li>If you don’t receive your email please press the resend button
                                                                                        <br />
                                                                                        <br />
                                                                                    </li>
                                                                                </ol>
                                                                            </li>
                                                                            <li><b>Publishing adverts – </b>Once your account is activated you will be able to create
                                                                                adverts which will be published on GSE-Mart.aero. To create an advert:
                                                                                <ol type="a">
                                                                                    <li>Log into your account first. </li>
                                                                                    <li>Once you are in your account you will automatically be placed in your adverts screen.
                                                                                        If not then press the button on the toolbar called
                                                                                        <img src="<%= ResolveUrl("images/sell-page/AddAdvertButton.png") %>" align="absmiddle" />
                                                                                    </li>
                                                                                    <li>Press the add advert button – you will navigate to a new screen </li>
                                                                                    <li>There are 6 steps needed to create a classified advert. </li>
                                                                                    <li>Complete each step and and press next to move to the next screen.
                                                                                        <br />
                                                                                        <br />
                                                                                        <img src="<%= ResolveUrl("images/sell-page/AllSteps.png") %>" width="600px" /><br />
                                                                                        <br />
                                                                                    </li>
                                                                                    <li><b>Step 1 & 2</b> below is where all details of the advert are created
                                                                                        <ol type="I">
                                                                                            <li><b>Category</b> – Enter a description for the advert item – Ground Support Equipment, Spares or tools.</li>
                                                                                        
                                                                                        <br />
                                                                                        <br />
                                                                                        <img src="<%= ResolveUrl("images/sell-page/Step1.1.png") %>" width="600px" />
                                                                                        <br />
                                                                                        <br />
                                                                                            <li>Another field will appear on the same screen as below..</li>
                                                                                        <br />
                                                                                        <br />
                                                                                        <img src="<%= ResolveUrl("images/sell-page/Step1.2.png") %>" width="600px" />
                                                                                        <br />
                                                                                        <br />
                                                                                            <li><b>Manufacturer</b> – Add the name of the manufacturer of the equipment spare or tool. </li>
                                                                                            <li><b>Spares / Tools</b> – If you select spares or tools there are 2 additional fields that appear</li>
                                                                                            <ol>
                                                                                                <li><b>Product ID</b>	 – if you have a product ID please add it here</li>
                                                                                                <li><b>Seller</b>	 – If you now who the seller is please add it here</li>
                                                                                            </ol>
                                                                                            <li>Now press next and you will move to a step 2 which is the main details screen…see below</li>
                                                                                        
                                                                                        <br />
                                                                                        <br />
                                                                                        <img src="<%= ResolveUrl("images/sell-page/Step2.1.png") %>" width="600px" />
                                                                                        <br />
                                                                                        <br />                                                    
                                                                                            <li><b>Item Name</b> – Add the Item name i.e. Harlan HTAG50, Tug MA-50, Diesel Tug MA-50, Clark DT-25 pushback tug etc.</li>
                                                                                            <li><b>Year</b> – Enter the year of the item being advertised – i.e. 1995  (free text)</li>
                                                                                            <li><b>Quantity</b> – The quantity field allows you to add one or more as a numeric i.e. 1 or 5 or 10 – this is used where you have similar equipment for sale and want to advertise them all under one advert.</li>
                                                                                            <li><b>Show price</b> – this will either display the price on the advert or not – we recommend you display the asking price to stand the best chance of attracting a potential buyer and for your item to appear on price searches.  If you don’t choose to add a price the description on the advert will be set to "Price on Request".</li>
                                                                                            <li><b>Select currency</b> – You can specify the currency you want to advertise your item in i.e. GPB, USD EU etc. by choosing the country from the drop down. This will set affix the currency code to the price when the advert is published.</li>
                                                                                            <li><b>Price</b> – type the price free format text as numbers i.e. 10,000.00</li>
                                                                                            <li><b>Short description</b> – You can add a short description of your item for the advert. This is a free format text field.</li>
                                                                                            <li><b>Long description</b> – You can add a lot more detail i.e. history, maintenance information, technical specifications and other types of information. All of this can be retrieved in word searches by prospective buyers.</li>
                                                                                            <li><b>Country</b> – This will default to the country that you are already in but can be changed if you are advertising on behalf of another client in another location.</li>
                                                                                            <li><b>Location</b> – This is the airport location or place that the item is located in. This field is free text format.</li>
                                                                                        </ol>
                                                                                        <br />
                                                                                        <br />
                                                                                        <!--finish step 2-->
                                                                                    </li>
                                                                                    <br />
                                                                                    <br />
                                                                                    <img src="<%= ResolveUrl("images/sell-page/Step3.1.png") %>" width="600px" />
                                                                                    <br />
                                                                                    <br />
                                                                                    <li><b>Step 3</b> is where contact details are displayed.
                                                                                        This will default from your account details
                                                                                        – any field can be changed here if required for the advert.
                                                                                        <ol type="I">
                                                                                            <li><b>Name –</b> defaults from account details </li>
                                                                                            <li><b>Contact Number –</b> defaults from account details </li>
                                                                                            <li><b>Fax -</b> defaults from account details </li>
                                                                                            <li><b>Mobile Number -</b> defaults from account details </li>
                                                                                            <li><b>Web Address -</b> defaults from account details </li>
                                                                                            <li><b>Email Address -</b> defaults from account details </li>
                                                                                            <li><b>Address -</b> defaults from account details</li>
                                                                                        </ol>
                                                                                    </li>
                                                                                    <br />
                                                                                    <!--finish step 3-->
                                                                                    <li><b>Step 4</b> below is where advert pictures can be uploaded.</li>
                                                                                        <ol type="I">
                                                                                            <li><b>Choose a file</b> – Click on this button to select a picture.</li>
                                                                                            <li><b>Default Image</b> – Tick this box for any image you want to set as the default image.</li>
                                                                                            <li><b>Add image</b> – Click on this file to upload an image.</li>
                                                                                            <li><b>Change default Image</b> – You can change the default image to by clicking on the green (house) icon under any picture.</li>
                                                                                            <li><b>Multiple Pictures</b> – Choose another file and add the new picture as before</li>
                                                                                        </ol>
                                                                                    <br />
                                                                                    <br />
                                                                                    <img src="<%= ResolveUrl("images/sell-page/Step4.1.png") %>" width="600px" />
                                                                                    <br />
                                                                                    <br />
                                                                                    <img src="<%= ResolveUrl("images/sell-page/Step5.1.png") %>" width="600px" />
                                                                                    <br />
                                                                                    <br />
                                                                                    <li><b>Step 5</b> above is where you can preview your advert.</li>
                                                                                        <ol type="I">
                                                                                            <li><b>Important</b> – This step is important because once you publish your advert only certain details can be changed i.e. price, long description and contact details.</li>
                                                                                            <li>You can also contact us directly at <a href="mailto:admin@GSE-Mart.aero">admin@GSE-Mart.aero</a> for changes to published adverts.</li>
                                                                                            <li>You can revert back to any of the five screens by using the back button or by clicking on any of the boxes describing the steps. This will allow you to finalise advert details, content, contact numbers etc. before publishing the advert.</li>
                                                                                        </ol>
                                                                                    <br />
                                                                                    <li><b>Step 6</b> below is a confirmation and payment screen.<br />
                                                                                        <br />
                                                                                        <img src="<%= ResolveUrl("images/sell-page/Step6.1.png") %>" width="600px" /><br />
                                                                                        <br />
                                                                                        <ol type="I">
                                                                                            <li><b>Subscibed period –</b> Choose the period you wish to advertise which will calculate the cost of the advert. Make sure you have read and understood the terms and conditions.</li>
                                                                                            <li>Advert periods are:</li>
                                                                                                <ul type="disc">
                                                                                                    <li>1 month </li>
                                                                                                    <li>2 months </li>
                                                                                                    <li>3 months </li>
                                                                                                    <li>Until sold </li>
                                                                                                </ul>
                                                                                            <li><b>Amount to be paid –</b> The system will ask you for the following:
                                                                                                <ul type="disc">
                                                                                                    <li>Credit card details </li>
                                                                                                    <li>Other security information </li>
                                                                                                    <li>A valid Vat number if this is applicable – please be accurate </li>
                                                                                                    <li>Do you want an invoice yes/no </li>
                                                                                                    <li>Company details for invoicing </li>
                                                                                                    <li>When ready click on the &quot;place advert&quot; button
                                                                                                        <br />
                                                                                                        <br />
                                                                                                    </li>
                                                                                                </ul>
                                                                                            </li>
                                                                                        </ol>
                                                                                    </li>
                                                                                    <li><b>Step 7</b> below is a confirmation that your advert has been placed.<br />
                                                                                        <br />
                                                                                        <img src="<%= ResolveUrl("images/sell-page/StepFinished.png") %>" width="600px" /><br />
                                                                                        <br />
                                                                                            <ol type="disc">
                                                                                                <li>You advert will now be listed on your adverts screen in your account and on the main GSE-Mart.aero site.</li>
                                                                                                <li>You will be returned to your adverts screen where you can see all your published adverts – the most recent advert will be listed as the last item on your current list.</li>
                                                                                            </ol>
                                                                                    </li>
                                                                                </ol>
                                                                                <!--finish-->
                                                                            </li>
                                                                            <li><b>Invoices –</b> You can view all your invoices for adverts
                                                                                <ol type="a">
                                                                                    <li>Press the button on the toolbar called
                                                                                        <img src="<%= ResolveUrl("images/InvoiceButton.bmp") %>" align="absmiddle" />
                                                                                    </li>
                                                                                    <li>The screen will display a list of invoiced transactions </li>
                                                                                    <li>Print invoices as required
                                                                                        <br />
                                                                                        <br />
                                                                                    </li>
                                                                                </ol>
                                                                            </li>
                                                                            <li><b>Account Information –</b> You can access your account details
                                                                                <ol type="a">
                                                                                    <li>Press the button on the toolbar called
                                                                                        <img src="<%= ResolveUrl("images/sell-page/MyAccountButton.png") %>" align="absmiddle" />
                                                                                    </li>
                                                                                    <li>The screen below holds all of your account registration information </li>
                                                                                    <li>You can update fields and change your account details
                                                                                        <br />
                                                                                        <br />
                                                                                        <img src="<%= ResolveUrl("images/sell-page/MyAccount.png") %>" width="600px" /><br />
                                                                                        <br />
                                                                                    </li>
                                                                                </ol>
                                                                            </li>
                                                                            <li><b>Logout – </b>You can logout of your account at any time
                                                                                <ol type="a">
                                                                                    <li>Press the button on the toolbar called
                                                                                        <img src="<%= ResolveUrl("images/sell-page/Logout.png") %>" align="absmiddle" />
                                                                                    </li>
                                                                                    <li>You will navigate to a logout out screen </li>
                                                                                    <li>To log back in either go to the sell screen or click on the line &quot;You have
                                                                                        been logged off. Click here to log back in&quot;.
                                                                                        <br />
                                                                                        <br />
                                                                                    </li>
                                                                                </ol>
                                                                            </li>
                                                                            <li><b>Buying offers -</b> Your advert will remain online for the specified period of
                                                                                the advert. Your contact details – email address and telephone numbers will be visible
                                                                                to prospective buyers during the adverts live period. You will receive offers by
                                                                                email or telephone subject to your contact details.
                                                                                <br />
                                                                                <br />
                                                                            </li>
                                                                            <li><b>Negotiation & final price -</b> Negotiations with any prospective buyer and the
                                                                                final agreed price for any advertised items on GSE-Mart.aero is your own responsibility.
                                                                                <br />
                                                                                <br />
                                                                            </li>
                                                                            <li><b>Settlement - </b>Once you have agreed the final price with a prospective buyer
                                                                                it is your responsibility to ensure a secure payment method and a secure payment
                                                                                from the buyer is made. This process is managed strictly between sellers and buyers
                                                                                and any payment/s will be agreed and made directly between you and the buyer.<br />
                                                                                <br />
                                                                            </li>
                                                                            <li><b>Collection of your equipment, spares or tools –</b> Once you have agreed the
                                                                                payment with the buyer, it is for you to make arrangements as to how you dispatch
                                                                                your equipment, spares or tools.
                                                                                <ol type="a">
                                                                                    <li>Shipping costs and logistics for items purchased will be agreed and made directly
                                                                                        between you and the seller. </li>
                                                                                    <li>Post and packaging will be your responsibility and the method ill be agreed with
                                                                                        the buyer </li>
                                                                                    <li>Delivery timelines will be agreed directly between you and the buyer. </li>
                                                                                </ol>
                                                                                <br />
                                                                            </li>
                                                                            <li><b>Disclaimer</b>
                                                                                <ol type="a">
                                                                                    <li>GSE-Mart.aero does not own, buy or sell GSE listed on our website. </li>
                                                                                    <li>GSE-Mart.aero does not offer GSE warehousing or shipping services. </li>
                                                                                    <li>GSE-Mart.aero does not get involved in transactions between buyers and sellers. </li>
                                                                                    <li>GSE-Mart.aero does not ask you for personal or financial information via email. </li>
                                                                                    <li>GSE-Mart.aero does not inspect vehicles listed on our website for fitness of purpose.
                                                                                    </li>
                                                                                    <li>Please see our buying & selling tips guide for more information. </li>
                                                                                </ol>
                                                                            </li>
                                                                        </ol>
                                                                    </div>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
