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
	   if(document.all === undefined) {
		   var elImage = document.getElementById("mainImage");
	   } else {
		   var elImage = document.all.mainImage;
	   } 
      var elMap = getMap(elImage);
      var perc = elImage.width / 1800;
      if (null != elMap) {
    	  //Have to reset coords to original in this case
    	  elMap.areas[0].coords = "462,1342,546,1375";
    	  elMap.areas[1].coords = "610,1342,762,1375";
    	  elMap.areas[2].coords = "826,1342,948,1375";
    	  elMap.areas[3].coords = "1010,1342,1099,1375";
    	  elMap.areas[4].coords = "1161,1342,1525,1375";
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

<img name="mainImage" id="mainImage" style="width: 100%;" src="checkback.jpg" alt="Cannot display image" usemap="#mainMap" border=0/>
<map name="mainMap" id="mainMap">
<area shape="rect" coords="462,1342,546,1375" href="checkback.jsp" alt="RSVP" title="RSVP"    />
<area shape="rect" coords="610,1342,762,1375" href="checkback.jsp" alt="Registry" title="Registry"    />
<area shape="rect" coords="826,1342,948,1375" href="checkback.jsp" alt="Hotels" title="Hotels"    />
<area shape="rect" coords="1010,1342,1099,1375" href="checkback.jsp" alt="Maps" title="Maps"    />
<area shape="rect" coords="1161,1342,1525,1375" href="checkback.jsp" alt="Pix & Other Fun Stuff" title="Pix & Other Fun Stuff"    />
</map> 

</body>
</html>
