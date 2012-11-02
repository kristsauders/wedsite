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
<%@ page import="java.util.Random"%>
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
Random randomGenerator = new Random();
int randomInteger = randomGenerator.nextInt(10000);;
String nameIn = request.getParameter("nameIn");
String commentIn = request.getParameter("commentIn");
String dateIn = new java.util.Date().toString();
String updateGuestbook = request.getParameter("updateGuestbook");
String captcha = request.getParameter("captcha");
String nameDisplayed = "";
String commentDisplayed = "";
if(updateGuestbook!=null){
if(!captcha.equalsIgnoreCase((String)session.getAttribute("captcha"))){
	nameDisplayed = nameIn;
	commentDisplayed = commentIn;
} else {
Class.forName("com.mysql.jdbc.Driver");
String urlIn = "jdbc:mysql://localhost:3306/guestbook";
Connection conIn = DriverManager.getConnection(urlIn,"krists", "Seattle2010");
String sql = 
	  "INSERT INTO guestbook (name,comment,date) values (?,?,?)";
	  PreparedStatement pst = 
	  conIn.prepareStatement(sql);
	  pst.setString(1, nameIn);
	  pst.setString(2, commentIn);
	  pst.setString(3, dateIn);
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
					InternetAddress.parse("kristsauders@gmail.com,christiana.reid@gmail.com,krists.christiana@gmail.com"));
			message.setSubject("New Wedsite Guestbook Comment");
			message.setText("Someone just posted a comment in the wedsite guestbook: \n\n Name: " + nameIn + "\n\n Date: " + dateIn + "\n\n Comment: \n" + commentIn);

			Transport.send(message);
		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
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
	if (document.getElementById('text')){
		document.getElementById('text').style.width = (document.getElementById('mainImage').width * .80) + 'px';
		document.getElementById('text').style.height = ((document.getElementById('mainImage').width * .50) * (1/1.5)) + 'px';
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

<div name="text" id="text" style="position:absolute;width:80%;height:100%;left:10%;top:2%;font-family:Arial;font-size:14px;" >
<img name="guestbook" id="guestbook"  style="left:33%;width:34%;position:absolute;" src="guestbook.png" alt="Cannot display image" border=0/><br/><br/>
<br/>
<hr style="color:#800517;background-color:#800517;height:2px;"></hr>
<div name="comments" id="comments" align="center" style="height:100%;overflow:scroll;overflow-x:hidden;">

<% 
Class.forName("com.mysql.jdbc.Driver");
String url = "jdbc:mysql://localhost:3306/guestbook";
Connection con = DriverManager.getConnection(url,"krists", "Seattle2010");
Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
ResultSet rs = stmt.executeQuery("SELECT * " + "from guestbook ORDER BY id DESC");

while(rs.next()){
int theInt= rs.getInt("id");
String name = rs.getString("name");
String comment = rs.getString("comment");
String date = rs.getString("date");
%>
<p>
<b>Name:</b> <%=name %><br/>
<b>Date:</b> <%=date %><br/>
<b>Comment:</b> <%=comment %><br/>
</p><img src="divider.png" style="width:20%" />
<%
}
%>
</div>
<hr style="color:#800517;background-color:#800517;height:2px;"></hr>
<div align="center"><br/>
<form method="post" name="updateGuestbook" action="">
<b>Name: </b><br/><input type="text" name="nameIn" value="<%=nameDisplayed%>" /><br/>
<b>Comment: </b><br/><textarea rows=6 cols=80 name="commentIn"><%=commentDisplayed%></textarea><br/>
<br/><img src="captcha.jsp?randomInteger=<%=randomInteger%>" width="150" height="80"/><br/><br/>
<b>Enter the phrase in the image above: </b>
<input type="text" name="captcha" /><br/>
<input type="hidden" name="updateGuestbook" value="true" />
<img src="hand.png" style="width:80px;" /><input type="submit" value="Submit" />
</form>
</div>
</div>

<script type="text/javascript">
if (document.getElementById('text')){
	function resizeVideo() {
		document.getElementById('text').style.width = (document.getElementById('mainImage').width * .80) + 'px';
		document.getElementById('text').style.height = ((document.getElementById('mainImage').width * .50) * (1/1.5)) + 'px';
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
