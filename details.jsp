<%@ page contentType="text/html; charset=iso-8859-1" language="java" %>
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

<img name="mainImage" id="mainImage" style="width: 100%;" src="main.jpg" alt="Cannot display image" usemap="#mainMap" border=0/>
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
<br/>
<hr style="left:15%;width:70%;color:#800517;background-color:#800517;height:2px;"></hr>
<div name="story" id="story" align="left" style="position:relative;left:15%;width:70%;height:100%;overflow:scroll;overflow-x:hidden;">
<p><b><u>Getting to Seattle </u></b></p>
<p><b>From the airport </b></p>
<p>The Light Link rail will get you from the Seattle-Tacoma International Airport to downtown in about 45 minutes, and is the most affordable option. You could also rent a car or take a taxi, both of which are available at the airport. </p>

<p><b><u>Staying in Seattle </u></b></p>
<p>It just so happens that the Rock and Roll Marathon, the Solstice Parade and Pride Weekend coincide with our wedding date. Because of this--and the gorgeous Seattle summer--we recommend you book your accommodations early, as lots of people will be visiting the city. We've pulled together a list of great hotels in central locations, but feel free to book wherever you feel comfortable. </p>

<p><b>Hotels we recommend </b></p>

<p><a href="http://www.hotelmaxseattle.com">HOTEL MAX</a><br/>
620 Stewart Street<br/>

<iframe scrolling="no" marginheight="0" marginwidth="0" 
src="http://maps.google.com/maps/ms?ie=UTF&msa=0&msid=206936346922233503719.0004b7f39d66c3bac8337&output=embed" style="height:400px;width:55%;float:right;padding:0px;" >
</iframe>

Seattle, WA 98101<br/>
206.728.6299<br/>
Hotel Max is one of the most artsy spots in Seattle. From the chic pink lobby to the menu of pillows, this place is a classic Seattle experience. It's located in the center of the city, just blocks away from Pike Place Market, Downtown shopping, and excellent restaurants. 
<br/>
Pricing: From $170 per night
</p>

<p><a href="http://hotelandra.com">HOTEL ANDRA</a><br/>
2000 Fourth Avenue<br/>
Seattle, WA 98121<br/>
206.448.8600<br/>
This hotel holds a lot of sentimental value for us; this is the first place we stayed when we visited Seattle back in December 2009. It's right in the heart of downtown, and walkable to many of the main attractions. The hotel's restaurant--Lola--is delicious, too. One of our favorite things to do is to go to happy hour at Lola!<br/>
Pricing: $200+ per night
</p>

<p><a href="http://www.hotel1000seattle.com">HOTEL 1000</a><br/>
1000 First Avenue<br/>
Seattle, WA 98104 <br/>
206.957.1000<br/>
Hotel 1000 boasts a spa, high-tech lobby, and excellent customer service. It's also located in Downtown, and is an ideal location for meeting up in the city. <br/>
Pricing: $250+ per night
</p>

<p><b>Lodging alternatives: </b></p>

<p>
If you'd prefer to feel like a local, or have a large party to accommodate, 
we would recommend looking at the listings on Vacation Rentals By Owner. 
A house or flat in Capitol Hill, Lower Queen Anne, Belltown, or Downtown would be ideal, 
and is a much more affordable option for staying in the city! <a href="http://www.vrbo.com/vacation-rentals/usa/washington/puget-sound/seattle">Visit their website to find out more. </a>
</p>

<p><b><u>The Wedding Venue </u></b></p>

<p><b>Georgetown Ballroom </b></p>

<p>
5623 Airport Way S  <br>
Seattle, WA 98108<br/>
<a href="http://www.georgetownballroom.com">http://www.georgetownballroom.com </a>
</p><br/>

<p><b>Directions</b></p>

<p>
The Georgetown Ballroom is located about 3 miles south of Downtown, in a historic neighborhood known for being the "original" Seattle. We are securing some transportation options for those of you who will not have a car. Because of potential road closures (thanks to the Rock and Roll marathon), we would suggest taking I-5 instead of surface streets. 
</p

<p>
From I-5 North and I-5 South:<br/>
   - Take Exit 162 (Corson Ave./ Michigan St)<br/>
   - Go to the light, Turn LEFT, immediately get  into the far RIGHT lane and Go STRAIGHT on S. Bailey St.<br/>
   - Go 3 blocks block to the 4-way stop, Turn LEFT (L) on 13th Ave S.<br/>
   - Continue to the light.  Turn LEFT (L) onto  Airport Way South.<br/>
   - Go 5 blocks.  The Georgetown Ballroom is on the LEFT side of the street, 5625 and 5623 Airport Way S, just North of Two Tartes Bakery.<br/>
   - Parking available on street. <br/>
   - For additional parking during events, look for Calamity Jane's and turn LEFT onto Carstens Place S.<br/>
   - Follow the signs for Georgetown Ballroom (GTB) parking and additional lots.
</p>

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
remapResize();
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