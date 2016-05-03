<%@ Page Title="" Language="C#" MasterPageFile="~/FrontMaster.master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <%-- Load up Google API --%>
    <script src="http://maps.googleapis.com/maps/api/js"></script>
    <%-- Custom Map Function --%>
    <script>
        //Initalise the map via it's lattitue & longitude, setting the zoom about
        function initialize() {
            var myLatlng = new google.maps.LatLng(53.403530, -2.971234);
            var mapOptions = {
                zoom: 16,
                center: myLatlng                
            }
            
            //Aplpying the mapOptions to the pages dom
            var map = new google.maps.Map(document.getElementById("GoogleMaps"), mapOptions);            

            //Adding map marker
            new google.maps.Marker({
                position: myLatlng,
                map: map,                
            });       
        }

        //Inialising map event
        google.maps.event.addDomListener(window, 'load', initialize);

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <section class="MainBody">
        <h2>Contact</h2>
        <div class="ContactForm">
            <p>We meet every Thursday at 7PM term time at the John Foster Building. Check our <a href="https://www.facebook.com/groups/ljmuanime/?fref=ts">Facebook </a>page for regular updates about what anime will be showcased and contact LJMU Anime with the form below if you have any further questions or comments.</p>

                        <asp:TextBox ID="txtName" runat="server" CssClass="ContactFormTxtName" placeholder="NAME"></asp:TextBox>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                            ErrorMessage="Please enter your name."
                            ControlToValidate="txtName"
                            Text="*"
                            ForeColor="Red"></asp:RequiredFieldValidator>

     
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="ContactFormTxtEmail" placeholder="EMAIL"></asp:TextBox>
                
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                            ErrorMessage="Please enter your email."
                            ControlToValidate="txtEmail"
                            Text="*"
                            Display="Dynamic"
                            ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please enter a valid email."
                            ControlToValidate="txtEmail"
                            Display="Dynamic"
                            ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>

                        <asp:TextBox ID="txtSubject" runat="server" CssClass="ContactFormTxtSubject" placeholder="SUBJECT"></asp:TextBox>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                            ErrorMessage="Please enter your subject."
                            ControlToValidate="txtSubject"
                            Text="*"
                            ForeColor="Red"></asp:RequiredFieldValidator>
 
                        <asp:TextBox ID="txtComments" placeholder="COMMENTS" runat="server" Rows="5" TextMode="MultiLine" CssClass="ContactFormTxtComments"></asp:TextBox>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                            ErrorMessage="Please enter your comments."
                            ControlToValidate="txtComments"
                            Text="*"
                            ForeColor="Red"></asp:RequiredFieldValidator>
     
                        <asp:ValidationSummary HeaderText="Please fix the following errors:" ForeColor="#cc0000" ID="ValidationSummary1" runat="server" />

                        <asp:Label ID="lblText" runat="server" Font-Bold="true"></asp:Label>
    
                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="BtnSubmit_Click" CssClass="ContactFormSubmit" />
        </div>

        <div class="ContactInfo">
            <ul>
                <li><strong>Address</strong></li>
                <li>John Foster Building</li>
                <li>80-98 Mount Pleasant</li>
                <li>Merseyside</li>
                <li>Liverpool</li>
                <li>L3 5UZ</li>
            </ul>
            <div id="GoogleMaps">
            </div>
        </div>

    </section>
</asp:Content>

