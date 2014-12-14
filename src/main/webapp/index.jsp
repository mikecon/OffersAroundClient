<%@page import="gr.teicm.offersaroundws.services.Offerstemp"%>
<%@page import="java.util.Date" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta charset="utf-8">
        <link rel="stylesheet" type="text/css" href="Stylesheet.css">
        <title>Offers Around</title>  
        <script type="text/javascript" src="parseTable.js" ></script>
        <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=true"></script>       
        <script type="text/javascript" src="geolocation.js" ></script>
         <style>
	      html { height: 100% }
	      body { height:75%; }
	      #map-canvas { height:100% ; margin-right:2%;  margin-left:2%; padding: 0 }          
	    </style>
    </head>
    <%
        Date date=new Date();
        %>
    <body>
        <!--Create hidden HTML table from database records to be converted as 
        javascript array-->
        <table id="records" hidden>
            <thead>
                <tr>
                   <th>Business Id</th>
                   <th>Business Name</th>
                   <th>Latitude</th>
                   <th>Longitude</th>
                   <th>Offer</th>
                </tr>
               </thead>
               <tbody>
            <%
                try {
                    gr.teicm.offersaroundws.services.OfferstempWS_Service service = new gr.teicm.offersaroundws.services.OfferstempWS_Service();
                    gr.teicm.offersaroundws.services.OfferstempWS port = service.getOfferstempWSPort();
                    // TODO process result here
                    java.util.List<gr.teicm.offersaroundws.services.Offerstemp> result = port.allOffers();
                    
                    for(Offerstemp offer : result) {
                        out.println("<tr>");
                        out.println("<td>");
                        out.println(offer.getBusinessId());
                        out.println("</td>");
                        out.println("<td>");
                        out.println(offer.getBusinessName());
                        out.println("</td>");
                        out.println("<td>");
                        out.println(offer.getLatitude());
                        out.println("</td>");
                        out.println("<td>");
                        out.println(offer.getLongitude());
                        out.println("</td>");
                        out.println("<td>");
                        out.println(offer.getOffer());
                        out.println("</td>");
                        out.println("</tr>");
                    }
                    
                } catch (Exception ex) {
                    out.println("exception" + ex);
                }
            %>
               </tbody>
        </table>
            
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
        <script language="JavaScript1.2">
        function openlist()
        {
            window.open("list.xhtml","mywindow1","menubar=1,resizable=1,width=350,height=450");
        }
        </script>
        <script language="JavaScript1.2">
        function openmanagement()
        {
            window.open("management.xhtml","mywindow2","menubar=1,resizable=1,width=350,height=450");
        }
        </script>
        <script language="JavaScript1.2">
        function loginform()
        {
            window.open("loginform.jsp","mywindow3","menubar=1,resizable=1,width=350,height=350");
        }
        </script>
           
        <p>
            <button id="readbutton"  type="button" onclick='location.href="javascript: openwindow()"' >Read about the project</button>
        </p>
        <p>
            <button id="listbutton"  type="button" onclick='location.href="javascript: openlist()"' >List</button>
        </p>
        <p>
            <button id="managementbutton"  type="button" onclick='location.href="javascript: openmanagement()"' >Management</button>
        </p>
        <p>
            <button id="loginformbutton"  type="button" onclick='location.href="javascript: loginform()"' >Business LogIn</button>
        </p>
    
    </body>
</html>
