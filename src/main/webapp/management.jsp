<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Offers Management</title>
    </head>
    <body>
        <h1>Insert Form</h1>

        <form action='offers.jsp' method='post'>
            <table>
                <tr>
                    <th>Business ID:</th>
                    <td><input type='text' name='businessId' size='10' required/></td>
                </tr>
                <tr>
                    <th>Business Name:</th>
                    <td><input type='text' name='businessName' size='20' required/></td>
                </tr>
                <tr>
                    <th>Latitude:</th>
                    <td><input type='text' name='latitude' size='30' required/></td>
                </tr>
                <tr>
                    <th>Longitude:</th>
                    <td><input type='text' name='longitude' size='30' required/></td>
                </tr>
                <tr>
                    <th>Offer:</th>
                    <td><input type='text' name='offer' size='40' required/></td>
                </tr>
                <tr>
                    <td colspan="2"><input type="submit" value="Send"></td>
                </tr>
            </table>
        </form>
        <%-- start web service invocation --%><hr/>
        <%
            try {
                gr.teicm.offersaroundws.services.OfferstempWS_Service service = new gr.teicm.offersaroundws.services.OfferstempWS_Service();
                gr.teicm.offersaroundws.services.OfferstempWS port = service.getOfferstempWSPort();
                // TODO initialize WS operation arguments here
                int businessId = Integer.parseInt(request.getParameter("businessId"));
                java.lang.String businessName = request.getParameter("businessName");
                float latitude = Float.parseFloat(request.getParameter("latitude"));
                float longitude = Float.parseFloat(request.getParameter("longitude"));
                java.lang.String offer = request.getParameter("offer");
                // TODO process result here
                java.lang.String result = port.insertOffer(businessId, businessName, latitude, longitude, offer);
                out.println("<font color='blue'>"+result+"</font>");
            } catch (Exception ex) {
                out.println("<font color='blue'>"+"Insert data..."+"</font>");
            }     
        %>
        <%-- end web service invocation --%><hr/>
        
        <h1>Search Offer</h1>
        <form action='offers.jsp' method='post'>
            <table>
                <tr>
                    <th>Business ID:</th>
                    <td><input type='text' name='businessId' size='10' required/></td>
                </tr>
                <tr>
                    <td colspan="2"><input type="submit" value="Search"></td>
                </tr>
            </table>
        </form>
        <%-- start web service invocation --%><hr/>
        <%
            try {
                gr.teicm.offersaroundws.services.OfferstempWS_Service service = new gr.teicm.offersaroundws.services.OfferstempWS_Service();
                gr.teicm.offersaroundws.services.OfferstempWS port = service.getOfferstempWSPort();
                // TODO initialize WS operation arguments here
                int businessId = Integer.parseInt(request.getParameter("businessId"));
                // TODO process result here
                java.lang.String result = port.searchOffer(businessId);
                out.println("<font color='blue'>"+"Search Result "+result+"</font>");
            } catch (Exception ex) {
               out.println("<font color='blue'>"+"Send ID for search..."+"</font>");
            }  
        %>
        <%-- end web service invocation --%><hr/>
    </body>
</html>
