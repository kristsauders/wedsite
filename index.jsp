<%@ page contentType="text/html; charset=iso-8859-1" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<%
session.setAttribute("video", "yes");
%>
<html>
<head>
<title>Reid-Auders Wedding</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<style type="text/css" media="screen">
  body { margin: -10px 0 0 -10px; }
  html body { margin: 0; padding: 0; }
  
#overlay {
z-index:1000;
position:fixed;
top:5%;
bottom:0;
left:20%;
width:66%;
height:80%;
visibility:hidden;
}
#overlay2 {
z-index:800;
position:absolute;
top:0;
bottom:0;
left:0;
width:100%;
opacity:1;
-moz-opacity:1;
filter:alpha(opacity=100);
visibility:hidden;
}
#ps_close{
	background:#000 url(close.png) no-repeat center center;
	cursor:pointer;
	width:60px;
	height:60px;
	position:fixed;
	right:50px;
	top:35px;
	z-index:1000;
	-moz-border-radius:20px;
	-webkit-border-radius:20px;
	border-radius:10px;	
	opacity:0.6;
	filter:progid:DXImageTransform.Microsoft.Alpha(opacity=60);	
	visibility:hidden;
}
#ps_close:hover{
	opacity:0.8;
	filter:progid:DXImageTransform.Microsoft.Alpha(opacity=80);	
}
</style>
<style type="text/css">
<!--/*--><![CDATA[/*><!--*/
   img.preload { display: none; }
/*]]>*/-->
</style>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>   
<script src="http://a.vimeocdn.com/js/froogaloop2.min.js"></script>   

<script type="text/javascript">

        jQuery(document).ready(function() {
        	var f;
        	Froogaloop( $('#vimeoFrame')[0] ).addEvent('ready', function() {
            	f = $f( $('#vimeoFrame')[0] );   
                f.addEvent('finish', function() {
                    hideOverlay();
                });
            });  
        });

</script>
        
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
       }
       
       window.onresize = function remapResize() {
	//Resize video
	if (document.getElementById('overlay')){
	document.getElementById('overlay').style.width = (document.getElementById('mainImage').width * .60) + 'px';
	document.getElementById('overlay').style.height = ((document.getElementById('mainImage').width * .60) * (1/1.5)) + 'px';
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
   }
   
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
   
   var $ps_close		= $('#ps_close');
function showOverlay() {
	var o = document.getElementById('overlay');
	var o2 = document.getElementById('overlay2');
	var ps = document.getElementById('ps_close');
	o.style.visibility = 'visible';
	o2.style.visibility = 'visible';
	ps.style.visibility = "visible";
	}
	function hideOverlay() {
	var o = document.getElementById('overlay');
	var o2 = document.getElementById('overlay2');
	var ps = document.getElementById('ps_close');
	o.style.visibility = 'hidden';
	o2.style.visibility = 'hidden';
	ps.style.visibility = "hidden";
	$f( $('#vimeoFrame')[0] ).api('api_unload');
	remapResize();
	}
	function changeBackground(image) {
		document.getElementById('mainImage').src = image;
	}
	
         </script>
</head>

<body onload="remap();">

<%if((!(request.getParameter("video")==null)) || ((String) session.getAttribute("video")==null)) { %>
	

<div id="overlay">
<iframe id="vimeoFrame" src="http://player.vimeo.com/video/25670565?title=0&amp;byline=0&amp;portrait=0&amp;autoplay=1&amp;api=1&amp;player_id=vimeoFrame" style="width:100%;height:100%;" frameborder="0"></iframe>
</div>
<div id="ps_close" onclick="hideOverlay();"></div>
<div id="overlay2">
<img src="mainBlur.jpg" border=0 style="width:100%;position:absolute;"/>
</div>
<%}%>

<img name="mainImage" id="mainImage" style="width:100%;position:absolute;" src="main.jpg" alt="Cannot display image" usemap="#mainMap" border=0/>
<img name="mainImageHome" id="mainImageHome" style="width:100%;position:absolute;" src="mainHome.jpg" alt="Cannot display image" border=0/>
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

<script type="text/javascript">
if (document.getElementById('overlay')){
function resizeVideo() {
	document.getElementById('overlay').style.width = (document.getElementById('mainImage').width * .60) + 'px';
	document.getElementById('overlay').style.height = ((document.getElementById('mainImage').width * .60) * (1/1.5)) + 'px';

}
resizeVideo();
setTimeout("resizeVideo();", 1500);
setTimeout("resizeVideo();", 3000);
setTimeout("resizeVideo();", 6000);
setTimeout("resizeVideo();", 9000);
setTimeout("resizeVideo();", 12000);
showOverlay();
}
remap();
</script>


</body>
</html>