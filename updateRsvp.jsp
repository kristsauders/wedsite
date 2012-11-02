<%@ page contentType="text/html; charset=iso-8859-1" language="java" %>
<%@ page import="java.sql.*"%>
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
        
<% 
String nameIn = request.getParameter("nameIn");
String guestsIn = request.getParameter("guestsIn");
String attendingIn = request.getParameter("attendingIn");
String commentsIn = request.getParameter("commentsIn");
String songRequestsIn = request.getParameter("songRequestsIn");
String date = new java.util.Date().toString();
String updateRsvp = request.getParameter("updateRsvp");
String auth = (String) session.getAttribute("rsvpAuth");
if((auth==null) || (!auth.equalsIgnoreCase("true"))){
	response.sendRedirect("rsvp.jsp");
}
if(updateRsvp!=null) {
Class.forName("com.mysql.jdbc.Driver");
String url = "jdbc:mysql://localhost:3306/RSVP";
Connection con = DriverManager.getConnection(url,"krists", "Seattle2010");
String sql = 
	  "INSERT INTO rsvp (name,guests,attending,comments,date) values (?,?,?,?,?)";
	  PreparedStatement pst = 
	  con.prepareStatement(sql);
	  pst.setString(1, nameIn);
	  pst.setString(2, guestsIn);
	  pst.setString(3, attendingIn);
	  pst.setString(4, commentsIn);
	  pst.setString(5, date);
	  int numRowsChanged = pst.executeUpdate();
	  pst.close();
	  
	  Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class",
				"javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "465");

		Session sessionMail = Session.getInstance(props,
			new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("kristsauders","L0rd0fSand");
				}
			});

		try {

			Message message = new MimeMessage(sessionMail);
			message.setFrom(new InternetAddress("kristsauders@gmail.com"));
			message.setRecipients(Message.RecipientType.TO,
					InternetAddress.parse("kristsauders@gmail.com,krists.christiana@gmail.com,christiana.reid@gmail.com"));
			message.setSubject("New Wedding RSVP");
			message.setText("Someone just RSVP'd to the wedding: \n\n Name: " + nameIn + "\n\n Date: " + date + "\n\n Guests: \n" + guestsIn + "\n\n Attending: " + attendingIn + "\n\n Comments: \n" + commentsIn + "\n\n Song Requests: \n" + songRequestsIn);

			Transport.send(message);
		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}

}
%>
        
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

<body>

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
<img name="rsvp" id="rsvp"  style="width:16%;left:42%;position:absolute;" src="rsvp.png" alt="Cannot display image" border=0/><br>
<br/>
<div align="center"><br/>
<% if(updateRsvp==null) { %>
<form method="post" name="updateRsvp" action="">
<b>Name: </b><br/><input type="text" name="nameIn" size="25"/><br/><br/>
<b>Guests: </b><br/><textarea rows=5 name="guestsIn" ></textarea><br/>
<br/>Gladly Attending: <input type="radio" name="attendingIn" value="yes"/> &nbsp; &nbsp; Sadly Missing It: <input type="radio" name="attendingIn" value="no"/><br/>
<br/><b>Comments: </b><br/><textarea rows=6 cols=80 name="commentsIn"></textarea><br/>
<br/>Do you have a song request? Write it down here, and we'll let our DJ know! <br/><br/><textarea rows=6 cols=80 name="songRequestsIn"></textarea><br/><br/>
<input type="hidden" name="updateRsvp" value="true" />
<input type="submit" value="Submit" />
</form>
<% } %>
<br/><br/>
<% if(attendingIn!=null) { %>
<% if(attendingIn.equalsIgnoreCase("yes")) { %>
Thank you, we look forward to seeing you there!
<% } %>
<% if(attendingIn.equalsIgnoreCase("no")) { %>
Thank you for letting us know, we're sad you won't be there!
<% } } %>
</div>
</div>

<script type="text/javascript">
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