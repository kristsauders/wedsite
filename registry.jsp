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

<div name="text" id="text" style="position:absolute;width:60%;left:10%;top:20%;font-family:Arial;font-size:14px;" >
<img name="registry" id="registry"  style="left:37%;width:26%;position:absolute;" src="registry.png" alt="Cannot display image" border=0/><br/><br/>
<br/>
<hr style="left:25%;width:50%;color:#800517;background-color:#800517;height:2px;"></hr>
<div name="story" id="story" align="center" style="position:relative;left:25%;width:50%;height:20%;">
<p>Love giving gifts? Awesome! We've registered at the following locations:</p>

<p><a href="http://www.honeyluna.com/Honeymoon-Registry-112174-Hawaii-Kauai-Christiana-Reid-Krists-Auders.html"><b>Honey Luna</b></a>: We are taking our honeymoon in Kauai, Hawaii. This site allows you to sponsor various adventures while on our trip, from a spa day to riding ATVs in the jungle. </p>

<p><a href="http://www.crateandbarrel.com/Gift-Registry/Guest/View-Registry.aspx?grid=4762552"><b>Crate and Barrel</b></a></p>
<br/>
</div>
<hr style="width:50%;left:25%;color:#800517;background-color:#800517;height:2px;"></hr>
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