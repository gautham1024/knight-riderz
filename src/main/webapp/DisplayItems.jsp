<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*, java.util.Base64" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Items List</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f7f7f7;
        margin: 0;
        padding: 20px;
    }
    h1 {
        text-align: center;
        color: #333;
    }
    .container {
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
    }
    .item {
        width: 250px;
        border: 1px solid #ccc;
        margin: 10px;
        background-color: #fff;
        border-radius: 5px;
        overflow: hidden;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    .item img {
        width: 100%;
        height: auto;
    }
    .item-details {
        padding: 10px;
    }
    .item-name {
        font-size: 1.2em;
        margin: 0;
        color: #333;
    }
    .item-brand {
        font-size: 1em;
        color: #666;
    }
    .item-cost {
        font-size: 1.2em;
        color: #ff5733;
        margin-top: 5px;
    }
</style>
</head>
<body>

<h1>Items List</h1>



<div class="container">
    <%!
        private static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
        private static final String DB_URL = "jdbc:mysql://localhost:3306/knightriderz";
        private static final String DB_USER = "root";
        private static final String DB_PASSWORD = "tiger";
    %>

    <%
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            // Connect to the database
            Class.forName(JDBC_DRIVER);
            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            // Get customer ID from the session or wherever it is stored
            int customerId = (int)request.getAttribute("customerId");
            session.setAttribute("customerId", customerId);// Replace with actual customer ID retrieval code
            
            
            
            String sql;
        
                // Prepare SQL query to retrieve all items
                sql = "SELECT * FROM itemslist";
                pstmt = conn.prepareStatement(sql);
            
            rs = pstmt.executeQuery();

            // Loop through the result set and display items
            while (rs.next()) {
                String productName = rs.getString("name");
                String productBrand = rs.getString("brand");
                double cost = rs.getDouble("cost");
                Blob imageBlob = rs.getBlob("image");

                // Convert image to Base64
                InputStream inputStream = imageBlob.getBinaryStream();
                ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                byte[] buffer = new byte[4096];
                int bytesRead = -1;
                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);
                }
                byte[] imageData = outputStream.toByteArray();
                String base64Image = Base64.getEncoder().encodeToString(imageData);

                // Display item details
    %>
                <div class="item">
                    <img src="data:image/jpeg;base64,<%= base64Image %>" alt="<%= productName %>">
                    <div class="item-details">
                        <h2 class="item-name"><%= productName %></h2>
                        <p class="item-brand">Brand: <%= productBrand %></p>
                        <p class="item-cost">$<%= cost %></p>
                        <form action="purchase.jsp" method="post">
                            <input type="hidden" name="customerId" value="<%= customerId %>">
                            <input type="hidden" name="productName" value="<%= productName %>">
                            <input type="hidden" name="productCost" value="<%= cost %>">
                            <button class="buy-button" type="submit">Buy</button>
                        </form>
                    </div>
                </div>
    <%
            }
        } catch (SQLException | ClassNotFoundException e) {
            out.println("An error occurred: " + e.getMessage());
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                out.println("An error occurred while closing resources: " + e.getMessage());
            }
        }
    %>
</div>

</body>
</html>
