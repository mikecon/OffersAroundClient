<%@page import="java.util.Date" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta charset="utf-8">
        <link rel="stylesheet" type="text/css" href="Stylesheet.css">
        <title>Offers Around</title>
         <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=true"></script>
	    <script src="jeolocator.js"></script>
	    <style>
	      html { height: 100% }
	      body { height:75%; }
	      #map-canvas { height:100% ; margin-right:3%;  margin-left:35%; padding: 0 }          
	    </style>
    </head>
    
    
    <%
        Date date=new Date();
        %>
    <body>
        <h1>Welcome to Offers Around</h1>
        <h3>Find everything near you</h3>
        <p id="date">Today is <%= date%> </p>
         
	 <div id="map-canvas">
	  </div>
        <script language="JavaScript1.2">
        function openwindow()
        {
            window.open("About.html","mywindow","menubar=1,resizable=1,width=350,height=250");
        }
        </script>
            
        <p>
            <button id="readbutton"  type="button" onclick='location.href="javascript: openwindow()"' >Read about the project</button>
          
        </p>

    </body>
</html>
