<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Banking Operations</title>
<style>
body {
    margin: 0;
    padding: 0;
    font-family: Arial, sans-serif;
    background-color: #EBF4F6; /* Light background color */
    display: flex;
    min-height: 100vh;
    flex-direction: column;
    overflow-x:hidden;
    overflow-y:scroll;
}

header {
    width: 100%;
    background-color: #071952; /* Dark blue header */
    color: #fff;
    padding: 20px;
    display: flex;
    justify-content: center;
    align-items: center;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    position: fixed; /* To position the log out button */
}

header h1 {
    margin: 0;
    font-family: Arial, sans-serif;
}

.logout-text {
    color: #fff;
    text-decoration: none;
    background-color: #071952; /* Dark blue button color */
    padding: 10px 20px;
    border-radius: 5px;
    border: 2px solid #071952;
    position: absolute; /* Absolute positioning */
    right: 50px; /* Positioning to the right */
    font-family: Arial, sans-serif; /* Changed to normal font */
}

.logout-text:hover {
    background-color: #088395; /* Darker blue on hover */
    border-color: #088395; /* Match border color on hover */
}

.sidebar {
    width: 250px;
    background-color: #071952; /* Dark blue sidebar */
    color: #fff;
    display: flex;
    flex-direction: column;
    padding: 20px;
    box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
    position: fixed;
    height: 100vh;
    top: 0px;
        padding-top: 100px;
     /* Below header */
}

.sidebar .menu-item {
    padding: 15px;
    margin: 10px 0;
    background-color: #37B7C3; /* Light teal */
    color: #fff; /* White text */
    text-align: center;
    border-radius: 10px;
    cursor: pointer;
    transition: background-color 0.3s;
}

.sidebar .menu-item:hover {
    background-color: #088395; /* Darker teal on hover */
}

.sidebar .menu-item .text {
    font-size: 20px; /* Adjust text size */
    font-weight: bold;
    margin-bottom: 10px;
}

.sidebar .menu-item p {
    font-size: 16px; /* Adjust description text size */
}

.content {
    margin-left: 270px; 
    padding: 20px;
    width: calc(100% - 270px); /* Adjust for sidebar */
    background-color: #fff;
    border-radius: 10px;
    box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
}

footer {
    margin-top: 20px;
    text-align: center;
}

#loadedContent {
    display: none;
    margin-top: 100px;
    padding: 20px;
    background-color: #fff;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

@media (max-width: 768px) {
    .sidebar {
        width: 100%;
        height: calc(100% - 60px); /* Adjust for header */
        top: 60px;
        position: relative; /* Ensure sidebar is not fixed on smaller screens */
        box-shadow: none; /* Remove box-shadow for cleaner look */
    }

    .content {
        margin-left: 0;
        width: 100%;
    }
}
</style>
</head>
<body>
    <header>
        <h1>Admin Dashboard</h1>
        <form action = "adminLogout" method="post">
        	<button type="submit" class="logout-text" >Log Out</button>
        </form>
    </header>

    <div class="sidebar" id="sidebar">
        <div class="menu-item" onclick="loadContent('Registration.jsp')">
            <div class="text">Registration</div>
            <p>Register new accounts.</p>
        </div>
        
        <div class="menu-item" onclick="loadContent('Modify.jsp')">
            <div class="text">Modify</div>
            <p>Modify existing accounts.</p>
        </div>
        
        <div class="menu-item" onclick="loadContent('deleteCustomer.jsp')">
            <div class="text">Delete</div>
            <p>Delete accounts.</p>
        </div>
        <div class="menu-item" onclick="loadContent('Display.jsp')">
            <div class="text">Display</div>
            <p>Display account information.</p>
        </div>
    </div>

    <div class="content" id="loadedContent">

    </div>
    	<script>
        // Function to load content dynamically
        function loadContent(url) {
            var xhr = new XMLHttpRequest();
            xhr.open('GET', url, true);
            xhr.onreadystatechange = function() {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    var loadedContent = document.getElementById('loadedContent');
                    loadedContent.style.display = 'block'; // Show the loaded content
                    loadedContent.innerHTML = xhr.responseText;

                    // Call the validation function based on the loaded content
                    if (url === 'Modify.html') {
                        validateModifyForm();
                    }
                }
            };
            xhr.send();
        }

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
        
        function validateForm() {
            var fullName = document.getElementById("fullName").value;
            var address = document.getElementById("address").value;
            var mobileNo = document.getElementById("mobileNo").value;
            var email = document.getElementById("email").value;
            var accountType = document.getElementById("accountType").value;
            var balance = document.getElementById("balance").value;
            var dob = document.getElementById("dob").value;
            var idProof = document.getElementById("idProof").value;
            var idProofNumber = document.getElementsByName("id_proff_number")[0].value;

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
            // Additional validation for ID Proof
            if (idProof === "Aadhar") {
                if (idProofNumber.trim().length !== 12 || isNaN(idProofNumber)) {
                    error += "Aadhar Number must be 12 digits.\n";
                }
            } else if (idProof === "PAN") {
                var panRegex = /^([a-zA-Z]){5}([0-9]){4}([a-zA-Z]){1}?$/;
                if (!panRegex.test(idProofNumber)) {
                    error += "Invalid PAN Number format.\n";
                }
            }

            if (error !== "") {
                alert(error);
                return false;
            }

            return true;
        }

        function validateEmail(email) {
            var re = /\S+@\S+\.\S+/;
            return re.test(email);
        }
    </script>
    
</body>
</html>