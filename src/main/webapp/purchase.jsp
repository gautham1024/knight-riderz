<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Payment Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        form {
            width: 50%;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.1);
        }
        label {
            font-weight: bold;
        }
        input[type="text"], select {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <h1>Enter Your Address and Select Payment Mode:</h1>
    <form action="redirect.jsp" method="post">
           <label for="address">Enter Fullname:</label>
        <input type="text" id="name" name="address" size="20" required><br><br>
          <label for="address">Enter Mobile Number:</label>
        <input type="number" id="phno" name="address" size="20" required><br><br>
        <label for="address">Enter Street:</label>
        <input type="text" id="street" name="address" size="20" required><br><br>
          <label for="address">Enter Locality:</label>
        <input type="text" id="locality" name="address1" size="20" required><br><br>
          <label for="address">Enter City:</label>
        <input type="text" id="city" name="address" size="20" required><br><br>
          <label for="address">Enter State:</label>
        <input type="text" id="state" name="address" size="20" required><br><br>
          <label for="address">Enter Country:</label>
        <input type="text" id="country" name="address" size="20" required><br><br>
          <label for="address">Pincode:</label>
        <input type="number" id="pincode" name="address" size="10" required><br><br>
        <label for="paymentMode">Payment Mode:</label>
        <select id="paymentMode" name="paymentMode">
            <option value="gpay">Google Pay</option>
            <option value="phonepay">PhonePe</option>
            <option value="paypal">PayPal</option>
            <option value="internetBanking">Internet Banking</option>
            <option value="cashOnDelivery">Cash on Delivery</option>
        </select><br><br>
        <input type="submit" value="Submit">
    </form>
</body>
</html>
