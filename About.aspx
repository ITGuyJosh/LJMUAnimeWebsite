<%@ Page Title="" Language="C#" MasterPageFile="~/FrontMaster.master" AutoEventWireup="true" CodeFile="About.aspx.cs" Inherits="About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="MainBody">
        <div id="AboutWrapper">
            <div id="AboutWelcome">
                <img alt="Club Banner" src="Resources/Images/AllRiseBanner.png" id="Banner" />
                <div id="Counter">
                    <input type="text" id="InputCount" />
                </div>
                <h2>Welcome to LJMU Anime Society!</h2>
                <h3>Would you like to know about what we get up to? Well..</h3>
            </div>

            <p>
                The main aim of anime society is to show a diverse range of new and classic Japanese animation to group members. We meet to socialise and share our passion for anime. Throughout the year, we take part in a range of fun activities including cinema trips, conventions, meals and nights out, including karaoke! Each week, we meet as a group and screen the first episode of three different anime series. This gives members a taste of a broad range of Japanese animation at its finest! We always encourage people to suggest their favourite anime to us to show.
            </p>
            <h3>Why you should join us</h3>
            <p>
                Joining anime society is a great way to socialise with like-minded people. We are a fun and approachable bunch who welcome all! We encourage group working with frequent quizzes in a fun and competitive manner, so your sure to get chatting. We begin the year with a free screening.
            </p>
            <h4>Anime Reviews</h4>
            <p>
                Every anime is great! Or are they? Opinions and perspectives help us decide what anime to watch or drop and because of this Anime Reviews have been introduced so all LJMU Anime Society members can create reviews on their favourite anime. Feel free to head over and read about what we think of the legendary Death Note or Bleach, and consider signing up once you have become a full anime society member.
            </p>
            <h4>Pub Affilliation</h4>
            <p>
                After each anime session we regularly go to our affilated pub, the <a href="http://thehopeandanchorliverpool.co.uk" target="_blank">Hope & Anchor</a>. This student-come-sports bar is a laid back environment with pool tables, air hockey, foosball, and Xbox/Gamecube gaming systems! As part of the affiliation we also get society cards for use in the pub which gives us good offers on drinks and food.
            </p>
        </div>
    </div>

    <script>
        // js script to countdown to japan day!
        // declare variables
        var before = "Japan Day!"
        var current = "Kyou wa, Nihon no hidesu! Happy Japan Day!"
        var montharray = new Array("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")

        // set countdown to year, month, day function
        function countdown(yr, m, d) {
            theyear = yr; themonth = m; theday = d
            // get date/time
            var today = new Date()
            var todayy = today.getYear()
            if (todayy < 1000) {
                todayy += 1900;
            }
            var todaym = today.getMonth();
            var todayd = today.getDate();
            var todayh = today.getHours();
            var todaymin = today.getMinutes();
            var todaysec = today.getSeconds();
            //generate string
            var todaystring = montharray[todaym] + " " + todayd + ", " + todayy + " " + todayh + ":" + todaymin + ":" + todaysec
            futurestring = montharray[m - 1] + " " + d + ", " + yr;
            //parse string
            dd = Date.parse(futurestring) - Date.parse(todaystring)
            //calculate date
            dday = Math.floor(dd / (60 * 60 * 1000 * 24) * 1);
            dhour = Math.floor((dd % (60 * 60 * 1000 * 24)) / (60 * 60 * 1000) * 1);
            dmin = Math.floor(((dd % (60 * 60 * 1000 * 24)) % (60 * 60 * 1000)) / (60 * 1000) * 1);
            dsec = Math.floor((((dd % (60 * 60 * 1000 * 24)) % (60 * 60 * 1000)) % (60 * 1000)) / 1000 * 1);
            // check if day is current if so output japan day
            if (dday == 0 && dhour == 0 && dmin == 0 && dsec == 1) {
                document.getElementById("InputCount").value = current;
                return;
            }
                // set countdown
            else {
                document.getElementById("InputCount").value = "Only " + dday + "dys, " + dhour + "hrs, " + dmin + "mins, & " + dsec + "secs until " + before;
                setTimeout("countdown(theyear,themonth,theday)", 1000);
            }
        }
        //entering countdown date in function
        countdown(2016, 08, 20);
    </script>
</asp:Content>

