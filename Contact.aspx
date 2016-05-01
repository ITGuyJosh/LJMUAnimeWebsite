<%@ Page Title="" Language="C#" MasterPageFile="~/FrontMaster.master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="http://maps.googleapis.com/maps/api/js"></script>
    <script>
        function initialize() {
            var myLatlng = new google.maps.LatLng(53.403530, -2.971234);
            var mapOptions = {
                zoom: 16,
                center: myLatlng
            }
            
            var map = new google.maps.Map(document.getElementById("GoogleMaps"), mapOptions);            
        }
            
        google.maps.event.addDomListener(window, 'load', initialize);
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <section class="MainBody">
        <h2>Contact</h2>        
    <div class="ContactForm">
        <p>We meet every Thursday at 7PM term time at the John Foster Building. Check our <a href="https://www.facebook.com/groups/ljmuanime/?fref=ts">Facebook </a>page for regular updates about what anime will be showcased and contact LJMU Anime with the form below if you have any further questions or comments.</p>
        <table>
            <tr>
                <td>
                    <strong>Name:</strong>
                </td>
                <td class="ContactFormTxtName">
                    <asp:TextBox ID="txtName" runat="server" CssClass="ContactFormTxtName"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ErrorMessage="Please enter your name."
                        ControlToValidate="txtName"
                        Text="*"
                        ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <strong>Email:</strong>
                </td>
                <td class="ContactFormTxtEmail">
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="ContactFormTxtEmail"></asp:TextBox>
                </td>
                <td>
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
                </td>
            </tr>
            <tr>
                <td>
                    <strong>Subject:</strong>
                </td>
                <td class="ContactFormTxtSubject">
                    <asp:TextBox ID="txtSubject" runat="server" CssClass="ContactFormTxtSubject"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ErrorMessage="Please enter your subject."
                        ControlToValidate="txtSubject"
                        Text="*"
                        ForeColor="Red"
                        ></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="ContactFormTxtCommentsTitle">
                    <strong>Comments:</strong>
                </td>
                <td class="ContactFormTxtComments">
                    <asp:TextBox ID="txtComments" runat="server" Rows="5" TextMode="MultiLine" CssClass="ContactFormTxtComments"></asp:TextBox>
                </td>
                <td style="vertical-align: top;">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ErrorMessage="Please enter your comments."
                        ControlToValidate="txtComments"
                        Text="*"
                        ForeColor="Red"
                        ></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:ValidationSummary HeaderText="Please fix the following errors:" ForeColor="Red" ID="ValidationSummary1" runat="server" />
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:Label ID="Label1" runat="server" Font-Bold="true"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" CssClass="ContactFormSubmit" />
                </td>
            </tr>
        </table>
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

