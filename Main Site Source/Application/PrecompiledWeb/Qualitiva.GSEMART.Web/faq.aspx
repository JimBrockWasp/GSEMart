<%@ page language="C#" masterpagefile="~/site.master" autoeventwireup="true" inherits="faq, App_Web_lehcpdw-" title="FAQ - GSE-Mart.aero" theme="Default" maintainScrollPositionOnPostBack="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
<div class="BoxShadow" style="width:1018px; height:2050px">
        <div style="width:100%; text-align:center; font-size:16px;">
            Frequently Asked Questions
            <br /><br />
        </div>
    
    <a name="top"></a>
    <div class="divMargin">
        <span class="smallMarginTxt">The GSE-Mart.aero web site (the &quot;Website&quot;)
            is provided to you by ONGROUND FZC. (the &quot;Company&quot;), and is subject to
            the terms and conditions of the Terms of Use Agreement (&quot;Agreement&quot;) and
            any rules or procedures established by the Company from time to time which are posted
            on the Website whether by links on the Website or otherwise. This Website is a GSE
            and GSE related items listing for ground support equipment for sale (“GSE") </span>
        <br />
        <br />
        <h3>Seller Questions</h3><br />
        <div class="smallMarginLeftTxt">
            <a href="#sq1">How do I become a seller?</a><br />
            <a href="#sq4">How can I add/edit my account?</a><br />
            <a href="#sq2">How do I place an advert?</a><br />
            <a href="#sq2">How do I add images to my advert?</a><br />
            <a href="#sq2">How do I place an advert?</a><br />
            <a href="#sq2">How do I update the GSE type technical detail for my advert?</a><br />
            <a href="#sq6">What happens when I sell my GSE?</a><br />
        </div>
        <br />
        <h3>Buyer Questions</h3><br />
        <div class="smallMarginLeftTxt">
            <a href="#bq1">Do I need to register to be a buyer?</a><br />
            <a href="#bq3">How do I register my interest in an item?</a><br />
            <a href="#bq4">What about final costs for shipping, taxes etc.?</a><br />
            <a href="#bq5">What about the quality of secondhand GSE?</a><br />
            <a href="#bq6">How do I know that the GSE I am interested is still available?</a><br />
            <a href="#bq7">How do I obtain the GSE title?</a><br />
            <a href="#bq8">What About Title Enquiries?</a><br />
        </div>
        <br />
        <br />
        <br />
        <div class="smallMarginLeftTxt">
            <a name="sq1"><b>How do I become a Seller?</b></a>
            <div class="mrgLeftAndBtmTxt">
                To become a seller go to the <a href="sell.aspx">Selling Page</a>, enter you email address 
                and a password and click the "Create Account" button. 
                Please review our standard terms and conditions and privacy policy during this process.
                A new account will be created allowing you to place one free advert on our site.
                <br />
                <br />
                Once your account has been created, you can login into the <asp:HyperLink ID="lnkSellersArea" Runat="server" Text="Seller's Area"/> 
                using the email address and password you used to create the account.
            </div>
            
            <a name="sq2"><b>How do I edit my account?</b></a>
            <div class="mrgLeftAndBtmTxt">
                Once you have logged into the Seller Area, you will be able to edit your company profile 
                and contact information.
            </div>

            <a name="sq3"><b>How do I place an advert?</b></a>
            <div class="mrgLeftAndBtmTxt">
                From the Seller Area:
                <ul>
                    <li>Click the "Adverts" tab</li>
                    <li>Click "New Advert" button</li>
                    <li>Enter the basic information and click "Save". Your new advert will be given an Id and appear in
                            the advert list.</li>
                    <li>From the Advert List. Click the "Placed" column to place the advert.</li>
                </ul>
                <br />
                You can enhance the appearance and searchability of your advert by:
                <ul>
                    <li><a href="#sq4">Adding images to your advert</a></li>
                    <li><a href="#sq5">Updating the GSE type technical data</a></li>
                </ul>
            </div>
            <div align="right"><a href="#top"><span class="faqLink">Back to top</span></a></div>

            <a name="sq4"><b>How do I add images to my advert?</b></a>
            <div class="mrgLeftAndBtmTxt">
                From the Seller Area:
                <ul>
                    <li>Click the "Adverts" tab</li>
                    <li>Click the "Advert Id" from the Advert List</li>
                    <li>Click the "Add/Edit Images" button</li>
                    <li>Click the "+" button to select images from your local drive.</li>
                    <li>Click the "Click here to upload your images" button.</li>
                    <li>Click the "Default" column in the image list to choose a default image for the advert.</li>
                </ul>
            </div>

            <a name="sq5"><b>How do I update the GSE type technical detail for my advert?</b></a>
            <div class="mrgLeftAndBtmTxt">
                From the Seller Area:
                <ul>
                    <li>Click the "Adverts" tab</li>
                    <li>Click the "Advert Id" from the Advert List</li>
                    <li>Click the "Add/Edit Technical Data" button</li>
                    <li>Update the technical data</li>
                    <li>Click the "Save" button</li>
                </ul>
            </div>
            
            <div align="right"><a href="#top"><span class="faqLink">Back to top</span></a></div>
            
            <a name="sq6"><b>What happens when I sell my GSE?</b></a>
            <div class="mrgLeftAndBtmTxt">
                Once you have agreed a sale with a buyer you should flag your advert as
                “sold”. The advert will remain visible on our listings for a short time with a "Sold" label before
                being removed from our listings.
                <br />
                <br />
                To flag an advert as "Sold":
                <ul>
                    <li>Click the "Adverts" tab</li>
                    <li>Click the "Sold" column for the advert</li>
                </ul>
            </div>
            <div align="right"><a href="#top"><span class="faqLink">Back to top</span></a></div>

        </div>
        <!-- End of Seller Questions -->
        <!-- Buyer Questions -->
        <div class="smallMarginLeftTxt">
            <a name="bq1"><b>Do I need to register to be a buyer?</b></a>
            <div class="mrgLeftAndBtmTxt">
                No. You do not need to register to become a buyer. However please refer to our standard
                terms and conditions and privacy policy for information about use of the Website.
            </div>
            <a name="bq3"><b>How do I register my interest in an item?</b></a>
            <div class="mrgLeftAndBtmTxt">
                This is easy as all contact details on our Website will be already supplied by sellers.
                In the main this will be contact numbers and an email address. You will be able
                to search for and find GSE you are interested in and then make direct contact
                with the seller with regard to an offer you may wish to make.
            </div>
            <a name="bq4"><b>What about final costs for shipping, taxes etc.?</b></a>
            <div class="mrgLeftAndBtmTxt">
                If you wish to query final pricing for an item, transportation costs, and additional
                taxation considerations for any items you are interested in we recommend you contact
                the seller directly and discuss the options available to you. The Company does not
                control the buying and selling process as negotiations are conducted between prospective
                buyers and sellers.
            </div>
            
            <div align="right"><a href="#top"><span class="faqLink">Back to top</span></a></div>
            
            <a name="bq5"><b>What about the quality if secondhand GSE?</b></a>
            <div class="mrgLeftAndBtmTxt">
                Items are sold by the seller "AS IS - WITH ALL FAULTS". Please ensure that you are
                fully aware of the condition of the GSE you are buying. The Company does not
                control the buying and selling process and makes no warranties on the fitness of
                purpose for any GSE sold through the Website. Please refer to our <a href="TermAndCondition.aspx">
                    Terms of Use</a> agreement.
            </div>
            <a name="bq6"><b>How do I know that the GSE I am interested is still available?</b></a>
            <div class="mrgLeftAndBtmTxt">
                All sold items will be flagged as sold so it will be easy to see that an item you
                are interested in has been sold to another buyer. The Company does not control the
                buying and selling process as negotiations are conducted between prospective buyers
                and sellers.
            </div>
            <a name="bq7"><b>How do I pay for my GSE?</b></a>
            <div class="mrgLeftAndBtmTxt">
                Payment is made direct to the seller. The Company does not control the buying and
                selling process so sales agreements and final agreed pricing for GSE which
                may include, delivery charges, taxes etc. are mutually agreed and made directly
                from the buyer to the seller.
            </div>
            <a name="bq8"><b>How do I obtain the GSE title?</b></a>
            <div class="mrgLeftAndBtmTxt">
                Title inquiries are directed to the Seller via his/her contact details which will
                be found on the advert itself. Please be aware that a title may not be available,
                or may not even exist, for every piece of GSE sold.
            </div>
            <a name="bq9"><b>What About Title Inquiries</b></a>
            <div class="mrgLeftAndBtmTxt">
                When requesting a title, include the buyer's full name or company name as you desire
                it to be listed on the title. Also include the GSE asset number, which is
                listed in the GSE description.
            </div>
            
            <div align="right"><a href="#top"><span class="faqLink">Back to top</span></a></div>
        </div>
        <!-- End of Buyers Questions -->
    </div>

</div>

</asp:Content>
