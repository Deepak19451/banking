<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User Registration</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<!-- Include Font Awesome for icons -->

<style>
body {
		
	background-color:#ffff;
	font-family: Arial, sans-serif;
	margin: 0;
}

h2 {
	text-align: center;
	margin-bottom: 20px;
}

.form {
	max-width: 500px;
	margin: 0 auto;
	background: rgb(34, 193, 195);
	background: linear-gradient(0deg, rgba(34, 193, 195, 1) 0%,
		rgba(45, 98, 253, 1) 100%);
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

label {
	display: flex;
	align-items: center;
	font-weight: bold;
}

input[type="text"], input[type="email"], input[type="number"], input[type="date"],
	select {
	width: calc(100% - 30px);
	padding: 8px;
	margin: 8px 0;
	box-sizing: border-box;
	border: 1px solid #ccc;
	border-radius: 4px;
}

input[type="submit"] {
	width: 100%;
	background-color: #4CAF50;
	color: white;
	padding: 10px 20px;
	margin: 8px 0;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

input[type="submit"]:hover {
	background-color: #45a049;
}

.icon {
	margin-right: 10px;
	color: #888;
}

.error {
	color: red;
	font-size: 0.8em;
	margin-top: -10px;
	margin-bottom: 10px;
}
</style>
</head>
<body>
	<h2>New Customer Registration</h2>
	<form class="form" id="registrationForm" action="Register" method="post"
		onsubmit="return validateForm()">
		<label for="fullName"><i class="fas fa-user icon"></i>Full
			Name:</label> <input type="text" id="fullName" name="full_name" required><br>
		<label for="address"><i class="fas fa-map-marker-alt icon"></i>Address:</label>
		<input type="text" id="address" name="address" required><br>
		<label for="mobileNo"><i class="fas fa-phone icon"></i>Mobile
			Number:</label> <input type="text" id="mobileNo" name="mobile_no" required><br>
		<label for="email"><i class="fas fa-envelope icon"></i>Email:</label>
		<input type="email" id="email" name="email" required><br>
		<label for="accountType"><i class="fas fa-credit-card icon"></i>Account
			Type:</label> <select id="accountType" name="account_type" required>
			<option value="" disabled selected>Select Account Type</option>
			<option value="Saving">Saving</option>
			<option value="Current">Current</option>
		</select><br> <label for="balance"><i
			class="fas fa-money-bill icon"></i>Balance:</label> <input type="number"
			id="balance" name="balance" required><br> <label
			for="dob"><i class="fas fa-calendar-alt icon"></i>Date of
			Birth:</label> <input type="date" id="dob" name="dob" required><br>
		<label for="idProof"><i class="fas fa-id-card icon"></i>ID
			Proof:</label> <select id="idProof" name="id_proff" required>
			<option value="Aadhar">Aadhar Number</option>
			<option value="PAN">PAN Number</option>

		</select><br> <input type="text" name="id_proff_number"> <input
			type="submit" value="Register">
	</form>
</body>
</html>
