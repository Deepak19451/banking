<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Create_Account</title>

<script>
function validateForm(event) {
    event.preventDefault();
    const password1 = document.getElementById('newpassword').value;
    const password2 = document.getElementById('confirmpassword').value;
    const errorMessage = document.getElementById('error-message');

    if (password1 !== password2) {
        errorMessage.textContent = "Passwords do not match. Please try again.";
    } else {
        errorMessage.textContent = "";
        document.getElementById('createAccountForm').submit();
    }
}

function togglePasswordVisibility(id) {
    const passwordField = document.getElementById(id);
    const eyeIcon = document.getElementById(${id}-eye);
    if (passwordField.type === "password") {
        passwordField.type = "text";
        eyeIcon.classList.add("bx-show");
        eyeIcon.classList.remove("bx-hide");
    } else {
        passwordField.type = "password";
        eyeIcon.classList.add("bx-hide");
        eyeIcon.classList.remove("bx-show");
    }
}
</script>

<style>
/* Google Fonts - Poppins */
/* @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap'); */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Poppins', sans-serif;
}

body {
    background-color: #EBF4F6;
}

.container {
    height: 100vh;
    width: 100%;
    display: flex;
    align-items: center;
    justify-content: center;
}

.form {
    max-width: 480px; /* Increased form width */
    width: 100%;
    padding: 40px; /* Increased padding */
    border-radius: 8px; /* Slightly larger border radius */
    background-color: #FFFFFF;
    box-shadow: 0 0 12px rgba(0, 0, 0, 0.1); /* Slightly stronger shadow */
}

header {
    font-size: 30px; /* Increased font size */
    font-weight: 600;
    color: #071952;
    text-align: center;
}

form {
    margin-top: 30px;
}

.field {
    position: relative;
    height: 55px; /* Increased height */
    width: 100%;
    margin-top: 25px; /* Increased margin */
    border-radius: 8px; /* Slightly larger border radius */
}

.field input, .field button {
    height: 100%;
    width: 100%;
    border: none;
    font-size: 18px; /* Increased font size */
    font-weight: 400;
    border-radius: 8px; /* Slightly larger border radius */
}

.field input {
    outline: none;
    padding: 0 20px; /* Increased padding */
    border: 1px solid #CACACA;
    background-color: #EBF4F6;
}

.field input:focus {
    border-bottom-width: 2px;
    border-color: #37B7C3;
}

.eye-icon {
    position: absolute;
    top: 50%;
    right: 15px; /* Increased space for eye icon */
    transform: translateY(-50%);
    font-size: 20px; /* Increased font size */
    color: #8b8b8b;
    cursor: pointer;
    padding: 5px;
}

.field button {
    color: #fff;
    background-color: #088395;
    transition: all 0.3s ease;
    cursor: pointer;
}

.field button:hover {
    background-color: #37B7C3;
}

.form-link {
    text-align: center;
    margin-top: 15px; /* Increased margin */
}

.form-link span, .form-link a {
    font-size: 16px; /* Increased font size */
    font-weight: 400;
    color: #071952;
}

.form a {
    color: #0171d3;
    text-decoration: none;
}

.form-content a:hover {
    text-decoration: underline;
}

.line {
    position: relative;
    height: 1px;
    width: 100%;
    margin: 40px 0; /* Increased margin */
    background-color: #d4d4d4;
}

.line::before {
    content: 'Or';
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    background-color: #FFFFFF;
    color: #8b8b8b;
    padding: 0 15px;
}

.error {
    color: #FF4C4C;
    margin-top: 15px; /* Increased margin */
}

.bx {
    font-family: "Boxicons";
}

.bx-hide::before {
    content: "\f06e"; /* Boxicons icon for hiding password */
}

.bx-show::before {
    content: "\f06e"; /* Boxicons icon for showing password */
}
</style>

<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>
    <div class="container">
        <form id="createAccountForm" action="ResetPassword" method="post" onsubmit="validateForm(event)">
            <div class="form">
                <div class="form-content">
                    <header>Reset Password</header>
                    <div class="field input-field">
                        <input type="text" name="username" id="username" placeholder="Full Name" class="input" required> 
                    </div>
                    <div class="field input-field">
                        <input type="password" name="oldpassword" id="oldpassword" placeholder="Old Password" class="password" required> 
                        <i class="bx bx-hide eye-icon" id="oldpassword-eye" onclick="togglePasswordVisibility('oldpassword')"></i>
                    </div>
                    <div class="field input-field">
                        <input type="password" name="password1" id="newpassword" placeholder="New Password" class="password" required> 
                        <i class="bx bx-hide eye-icon" id="newpassword-eye" onclick="togglePasswordVisibility('newpassword')"></i>
                    </div>
                    <div class="field input-field">
                        <input type="password" name="password2" id="confirmpassword" placeholder="Confirm Password" class="password" required> 
                        <i class="bx bx-hide eye-icon" id="confirmpassword-eye" onclick="togglePasswordVisibility('confirmpassword')"></i>
                    </div>
                    <div class="field button-field">
                        <button type="submit" id="submitButton">Change Password</button>
                    </div>
                    <div id="error-message" class="error"></div>
                </div>
            </div>
        </form>
    </div>
</body>
</html>