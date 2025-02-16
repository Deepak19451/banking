<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Modify Data</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<!-- Include Font Awesome for icons -->
<style>
body {
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
	background: linear-gradient(0deg, rgba(195, 77, 34, 1) 0%,
		rgba(253, 195, 45, 0.9698004201680672) 87%);
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

label {
	font-weight: bold;
	display: flex;
	align-items: center;
}

input, select {
	width: 100%;
	padding: 8px;
	margin: 8px 0;
	box-sizing: border-box;
	border: 1px solid #ccc;
	border-radius: 4px;
}

input[type="submit"] {
	background-color: #4CAF50;
	color: white;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

input[type="submit"]:hover {
	background-color: #45a049;
}

.note {
	color: red;
	font-weight: bold;
	text-align: center;
}

.icon {
	margin-right: 10px;
}
</style>
</head>
<body>
	<h2>Modify Existing Data</h2>
	<form class="form" id="modifyForm" action="Modify" method="post">
		<p class="note">Note: Full name must remain the same in order
			to modify other details.</p>
		<hr>
		<label for="fullName"><i class="fas fa-user icon"></i>Full
			Name:</label> <input type="text" id="fullName" name="fullName" required><br>
		<label for="address"><i class="fas fa-map-marker-alt icon"></i>Address:</label>
		<input type="text" id="address" name="address" required><br>
		<label for="mobileNo"><i class="fas fa-phone icon"></i>Mobile
			Number:</label> <input type="text" id="mobileNo" name="mobileNo" required><br>
		<label for="email"><i class="fas fa-envelope icon"></i>Email:</label>
		<input type="email" id="email" name="email" required><br>
		<label for="accountType"><i class="fas fa-credit-card icon"></i>Account
			Type:</label> <select id="accountType" name="accountType" required>
			<option value="Saving">Saving</option>
			<option value="Current">Current</option>
		</select><br> <label for="balance"><i
			class="fas fa-money-bill icon"></i>Balance:</label> <input type="number"
			id="balance" name="balance" required><br> <label
			for="dob"><i class="fas fa-calendar-alt icon"></i>Date of
			Birth:</label> <input type="date" id="dob" name="dob" required><br>
		<input type="submit" value="Modify Data">
	</form>

	<script>
        // Call the validateModifyForm function when the page is loaded
        window.onload = function() {
            validateModifyForm();
        };

        // Function to validate modify form data
        function validateModifyForm() {
            var modifyForm = document.getElementById("modifyForm");

            modifyForm.addEventListener("submit", function(event) {
                var fullName = document.getElementById("fullName").value;
                var address = document.getElementById("address").value;
                var mobileNo = document.getElementById("mobileNo").value;
                var email = document.getElementById("email").value;
                var accountType = document.getElementById("accountType").value;
                var balance = document.getElementById("balance").value;
                var dob = document.getElementById("dob").value;

                var error = "";

                if (!fullName.trim()) {
                    error += "Full Name is required.\n";
                }
                if (!address.trim()) {
                    error += "Address is required.\n";
                }
                if (!mobileNo.trim() || mobileNo.length !== 10 || isNaN(mobileNo)) {
                    error += "Mobile Number must be 10 digits.\n";
                }
                if (!email.trim() || !validateEmail(email)) {
                    error += "Valid Email is required.\n";
                }
                if (!accountType.trim()) {
                    error += "Account Type is required.\n";
                }
                if (balance.trim() === "" || balance < 1000) {
                    error += "Balance should be at least 1000.\n";
                }
                if (!dob.trim()) {
                    error += "Date of Birth is required.\n";
                }

                if (error !== "") {
                    alert(error);
                    event.preventDefault(); // Prevent form submission
                }
            });
        }

        // Function to validate email format
        function validateEmail(email) {
            var re = /\S+@\S+\.\S+/;
            return re.test(email);
        }
    </script>
</body>
</html>
