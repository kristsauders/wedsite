<%@ page contentType="text/html; charset=iso-8859-1" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Properties"%>
<%@ page import="javax.mail.Message"%>
<%@ page import="javax.mail.MessagingException"%>
<%@ page import="javax.mail.PasswordAuthentication"%>
<%@ page import="javax.mail.Session"%>
<%@ page import="javax.mail.Transport"%>
<%@ page import="javax.mail.internet.InternetAddress"%>
<%@ page import="javax.mail.internet.MimeMessage"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html>
<head>
<title>Reid-Auders Wedding</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<style type="text/css" media="screen">
  body { margin: -10px 0 0 -10px; }
  html body { margin: 0; padding: 0; }
  
</style>
<style type="text/css">
<!--/*--><![CDATA[/*><!--*/
   img.preload { display: none; }
/*]]>*/-->
</style>
        
<script type="text/javascript">

       function remap() {
    	   if(document.all === undefined) {
    		   var elImage = document.getElementById("mainImage");
    	   } else {
    		   var elImage = document.all.mainImage;
    	   }
          var elMap = getMap(elImage);
          var perc = elImage.width / 1800;
          if (null != elMap) {
        	  //Have to reset coords to original in this case
        	  elMap.areas[0].coords = "250,1350,348,1385";
        	  elMap.areas[1].coords = "386,1350,580,1385";
        	  elMap.areas[2].coords = "617,1350,758,1385";
        	  elMap.areas[3].coords = "797,1350,963,1385";
        	  elMap.areas[4].coords = "1005,1350,1207,1385";
        	  elMap.areas[5].coords = "1244,1350,1381,1385";
        	  elMap.areas[6].coords = "1422,1350,1531,1385";
        	  elMap.areas[7].coords = "1572,1350,1662,1385";
             for (var intLoop = 0; intLoop < elMap.areas.length;
                   intLoop++) {
                var elArea = elMap.areas[intLoop];
                var coords = elArea.coords.split(",");
                var scaledCoords = "";
                for (coord in coords) {
                   scaledCoords += (Math.round(coords[coord] * perc)) + ",";
                }
                elArea.coords = scaledCoords;
             }
          }
       };
       
window.onresize = function remapResize() {
	//Resize video
	if (document.getElementById('text')){
	document.getElementById('text').style.width = (document.getElementById('mainImage').width * .80) + 'px';
	document.getElementById('text').style.height = ((document.getElementById('mainImage').width * .80) * (1/1.5)) + 'px';
	}
	//Firefox does not support document.all in this document mode, so I have it use getElementById instead
	if(document.all === undefined) {
		   var elImage = document.getElementById("mainImage");
	   } else {
		   var elImage = document.all.mainImage;
	   } 
      var elMap = getMap(elImage);
      var perc = elImage.width / 1800;
      if (null != elMap) {
    	  //Have to reset coords to original in this case
    	  elMap.areas[0].coords = "250,1350,348,1385";
    	  elMap.areas[1].coords = "386,1350,580,1385";
    	  elMap.areas[2].coords = "617,1350,758,1385";
    	  elMap.areas[3].coords = "797,1350,963,1385";
    	  elMap.areas[4].coords = "1005,1350,1207,1385";
    	  elMap.areas[5].coords = "1244,1350,1381,1385";
    	  elMap.areas[6].coords = "1422,1350,1531,1385";
    	  elMap.areas[7].coords = "1572,1350,1662,1385";
         for (var intLoop = 0; intLoop < elMap.areas.length;
               intLoop++) {
            var elArea = elMap.areas[intLoop];
            var coords = elArea.coords.split(",");
            var scaledCoords = "";
            for (coord in coords) {
               scaledCoords += (Math.round(coords[coord] * perc)) + ",";
            } 
            elArea.coords = scaledCoords;
         }
      }
   };
   
   function getMap(elImage) {
	   if(document.all === undefined) {
		   var elImage = document.getElementById("mainImage");
	   } else {
		   var elImage = document.all.mainImage;
	   }
       if (elImage.useMap != null) {
          return document.getElementById("mainMap");
       }
       else
          return null;
    }
   </script>
</head>

<body onload="remap();">

<img name="mainImage" id="mainImage" style="width:100%;" src="main.jpg" alt="Cannot display image" usemap="#mainMap" border=0/>
<map name="mainMap" id="mainMap">
<area shape="rect" coords="250,1350,348,1385" href="index.jsp" alt="" title=""  onMouseOver="if(document.images) document.getElementById('mainImage').src= 'mainHomeButton.jpg';" onMouseOut="if(document.images) document.getElementById('mainImage').src= 'main.jpg';"  />
<area shape="rect" coords="386,1350,580,1385" href="story.jsp" alt="" title=""  onMouseOver="if(document.images) document.getElementById('mainImage').src= 'mainStory.jpg';" onMouseOut="if(document.images) document.getElementById('mainImage').src= 'main.jpg';"  />
<area shape="rect" coords="617,1350,758,1385" href="details.jsp" alt="" title=""  onMouseOver="if(document.images) document.getElementById('mainImage').src= 'mainDetails.jpg';" onMouseOut="if(document.images) document.getElementById('mainImage').src= 'main.jpg';"  />
<area shape="rect" coords="797,1350,963,1385" href="registry.jsp" alt="" title=""  onMouseOver="if(document.images) document.getElementById('mainImage').src= 'mainRegistry.jpg';" onMouseOut="if(document.images) document.getElementById('mainImage').src= 'main.jpg';"  />
<area shape="rect" coords="1005,1350,1207,1385" href="guestbook.jsp" alt="" title=""  onMouseOver="if(document.images) document.getElementById('mainImage').src= 'mainGuestbook.jpg';" onMouseOut="if(document.images) document.getElementById('mainImage').src= 'main.jpg';"  />
<area shape="rect" coords="1244,1350,1381,1385" href="photos.jsp" alt="" title=""  onMouseOver="if(document.images) document.getElementById('mainImage').src= 'mainPhotos.jpg';" onMouseOut="if(document.images) document.getElementById('mainImage').src= 'main.jpg';"  />
<area shape="rect" coords="1422,1350,1531,1385" href="index.jsp?video=yes" alt="" title=""  onMouseOver="if(document.images) document.getElementById('mainImage').src= 'mainVideo.jpg';" onMouseOut="if(document.images) document.getElementById('mainImage').src= 'main.jpg';"  />
<area shape="rect" coords="1572,1350,1662,1385" href="updateRsvp.jsp" alt="" title=""   onMouseOver="if(document.images) document.getElementById('mainImage').src= 'mainRsvp.jpg';" onMouseOut="if(document.images) document.getElementById('mainImage').src= 'main.jpg';" />
</map> 

<div name="text" id="text" style="position:absolute;width:80%;left:10%;top:2%;font-family:Arial;font-size:14px;" >
<img name="story" id="story"  style="left:33%;width:34%;position:absolute;" src="story.png" alt="Cannot display image" border=0/><br/><br/>
<br/>
<hr style="left:15%;width:70%;color:#800517;background-color:#800517;height:2px;"></hr>
<div name="story" id="story" align="left" style="position:relative;left:15%;width:70%;height:100%;overflow:scroll;overflow-x:hidden;">
<p><b>From Christiana: </b></p>
<p>I remember the moment when I felt completely smitten with Krists. It was November 2007, in a hotel room in Las Vegas. Before you make any assumptions, let me explain. Krists and I met through Model United Nations at UC San Diego and we were at a conference for the club. If you're unfamiliar with MUN, it's the academic decathlon of international diplomacy. Nerdy. Krists represented Yemen in an oil summit, and I debated human rights law on behalf of Ukraine. We wrote speeches, discussed foreign policy, and were immediately pegged as political science geeks. We had a very similar sense of humor and I found him to be absolutely adorable. </p>

<img src="albums/album1/K&C1.jpg" style="width:30%;float:left;padding:5px;" />
<p><b>From Krists: </b></p>
<p>The Las Vegas trip was a blast, it had it all: ambitiously early mornings, long days of diplomacy, late nights with new college friends, and a new kind of fun for us. There was a moment where Christiana and I were lying on the floor on our backs, side by side, taking goofy photos with her camera phone, and I'll never forget that. Our best late nights now are just like that one.</p>

<p>But the relationship didn't start there; it took a few more months. Christiana was a high-up officer in the club, and I had just joined. Vegas had been my first conference. When I came back from Las Vegas, determined to be an active member of this group, I joined her team. Yes, yes, this means she was my boss for a while. But that's just it; I soon got an elected position in the club and she wanted to have a meeting to go over my new responsibilities. So we met over coffee in the afternoon, both completely unaware that it was Valentine's Day, and talked. And kept talking. And kept talking for hours, long after being done with business. That was how our relationship really started, despite meeting in a Las Vegas hotel room.</p>

<p>The first time we dated, the timing wasn't perfect. We remained friends, and got coffee here and there. But we found each other in the fall of 2009. It was this time that, somehow, we both just knew. This was it, and it was worth fighting for. </p>

<p><b>From Christiana: </b></p>
<p>Fast-forward to October 2009.</p>

<img src="albums/album1/K&C5.jpg" style="width:35%;float:right;padding:5px;" />
<p>Call it serendipity or plain, stubborn fate, but we kept running in to one another. After a few of these chance encounters, we decided to get together and catch up. An unlikely 13-hour adventure ensued, one that began over yet another cup of coffee. Walking away from that coffee date, I knew that something had changed. I knew that my feelings for Krists had grown and finally, the timing was perfect. I knew with an uncanny certainty that this was the start of an unforgettable love story. Cheesy? Sure. But to be completely honest, I had never felt this way about someone before.</p>

<p>Despite the challenges of distance and my plan to graduate early, our story continued to unfold. We went on a trip to Seattle that winter and fell in love with the city. It was in Seattle that we began to plan our future together. We returned home, rushed our applications to graduate school at the University of Washington, and crammed for the GRE. By some miracle, Krists and I were accepted to our first-choice graduate programs. The next few months were filled with planning, working, and saving for our big move. </p>

<p>In the fall of 2010, we found ourselves with a U-Haul filled with donated furniture and eleven dollars to our name. We drove - let's be real, Krists drove - from San Clemente to Seattle. This was our big adventure into the unknown, to a city that we had thought about for the better part of a year. It was our city. It still is. </p>

<p><b>From Krists: </b></p>
<p>Being together in the heart of Seattle now, I have never felt so inspired to live. We were hooked on the city after first coming here together, so we did everything we could to make sure we could call Seattle home. Driving out of San Clemente at 4:00 in the morning in a U-Haul with everything we owned, beginning an 1800 mile drive (at 55mph) to our city, to continue our education and start careers, to move in together, I thought: "Wow, we have no clue what we're doing. But hey, you ready?"  And she said, "Definitely."</p>

<img src="albums/album1/K&C10.jpg" style="width:26%;float:left;padding:5px;" />
<p>Back when we were still waiting to hear back from the University of Washington, determined to move to Seattle, I decided I was going to propose. I knew she'd say yes, but there was one problem: she is impossible to surprise. Really, give it a try! I've learned I can't say even a word about something meant to be a surprise, because she will still get information from that. So what did I do? I told her I was going to propose. Not immediately, but sometime within two years. I told her it would not be at a predictable time like a fancy dinner, and it would not be on a holiday.</p>

<p>Then what? I bought a ring on Thanksgiving. On Christmas morning, I got down on one knee in my pajamas, to her and her family. Seamless plan. She didn't see it coming until the ring was in her hand and the house fell silent. As glorious as that moment was for the romance, I also felt proud of the surprised face I saw just then, and knew I'd made a great decision. </p>

<p><b>From Christiana: </b></p>
<p>Perhaps it's fitting that a story that began over coffee should continue in the coffee capital of the world. Now we get to embark on our next adventure: marriage. We would love for you to be a part of our story, and join us in Seattle on June 23, 2012. </p>

<br/>
</div>
<hr style="width:70%;left:15%;color:#800517;background-color:#800517;height:2px;"></hr>
</div>

<script type="text/javascript">
if (document.getElementById('text')){
	function resizeVideo() {
		document.getElementById('text').style.width = (document.getElementById('mainImage').width * .80) + 'px';
		document.getElementById('text').style.height = ((document.getElementById('mainImage').width * .80) * (1/1.5)) + 'px';
	}
	resizeVideo();
	setTimeout("resizeVideo();", 1500);
	setTimeout("resizeVideo();", 3000);
	setTimeout("resizeVideo();", 6000);
	setTimeout("resizeVideo();", 9000);
	setTimeout("resizeVideo();", 12000);
	}
remap();
</script>

<!-- preload some images for menu -->
<img src="mainHomeButton.jpg" alt="" width="100%" class="preload" />
<img src="mainStory.jpg" alt="" width="100%" class="preload" />
<img src="mainDetails.jpg" alt="" width="100%" class="preload" />
<img src="mainRegistry.jpg" alt="" width="100%" class="preload" />
<img src="mainGuestbook.jpg" alt="" width="100%" class="preload" />
<img src="mainPhotos.jpg" alt="" width="100%" class="preload" />
<img src="mainVideo.jpg" alt="" width="100%" class="preload" />
<img src="mainRsvp.jpg" alt="" width="100%" class="preload" />

</body>
</html>