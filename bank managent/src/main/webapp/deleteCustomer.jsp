<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Delete Customer</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<!-- Include Font Awesome for icons -->

<style>
body {
    font-family: Arial, sans-serif;
    margin: 0;
    background-color: #EBF4F6; /* Light background color */
}

h2 {
    text-align: center;
    margin-bottom: 20px;
    color: #071952; /* Dark blue for headings */
}

.form {
    max-width: 500px;
    margin: 0 auto;
    background-color: #fff;
    padding: 20px;
    border-radius: 12px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.form label {
    display: flex;
    align-items: center;
    font-weight: bold;
    color: #071952; /* Dark blue for labels */
}

.form input[type="text"], input[type="number"] {
    width: calc(100% - 22px); /* Full width minus padding */
    padding: 12px; /* Added padding for better spacing */
    margin: 8px 0;
    box-sizing: border-box;
    border-radius: 6px;
    font-size: 16px;/* Increased font size for readability */
}

.form input[type="submit"] {
    width: 100%;
    background-color: #e74c3c; /* Red color for delete action */
    color: white;
    padding: 12px; /* Added padding for better button size */
    margin: 8px 0;
    border: none;
    border-radius: 6px;
    cursor: pointer;
    font-size: 16px; /* Increased font size for readability */
    transition: background-color 0.3s;
}

.form input[type="submit"]:hover {
    background-color: #c0392b; /* Darker shade of red on hover */
}

.icon {
    margin-right: 10px;
    color: #37B7C3; /* Teal color for icons */
}
</style>
</head>
<body>
    <h2>Delete Customer</h2>
    <form class="form" action="Delete" method="post">
        <label for="fullName"><i class="fas fa-user icon"></i>Full Name:</label>
        <input type="text" id="fullName" name="username" required><br>
        <label for="mobileNo"><i class="fas fa-phone icon"></i>Mobile Number:</label>
        <input type="text" id="mobileNo" name="phoneNo" required><br>
        <input type="submit" value="Delete Customer">
    </form>
</body>
</html>