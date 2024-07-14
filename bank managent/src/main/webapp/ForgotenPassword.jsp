<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Create_Account</title>
<style>
/* Google Fonts - Poppins */
/* @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap'); */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Poppins', sans-serif;
}

.container {
    height: 100vh;
    width: 100%;
    display: flex;
    align-items: center;
    justify-content: center;
    /* background-color: #52d416; */
    column-gap: 30px;
    background-color: rgb(245, 205, 97);
}

.form {
    position: absolute;
    max-width: 430px;
    width: 100%;
    padding: 30px;
    border-radius: 6px;
}

.form.signup {
    opacity: 0;
    pointer-events: none;
}

.forms.show-signup .form.signup {
    opacity: 1;
    pointer-events: auto;
}

.forms.show-signup .form.login {
    opacity: 0;
    pointer-events: none;
}

header {
    font-size: 28px;
    font-weight: 600;
    color: #232836;
    text-align: center;
}

form {
    margin-top: 30px;
}

.field {
    position: relative;
    height: 50px;
    width: 100%;
    margin-top: 20px;
    border-radius: 6px;
}

.field input, .field button {
    height: 100%;
    width: 100%;
    border: none;
    font-size: 16px;
    font-weight: 400;
    border-radius: 6px;
}

.field input {
    outline: none;
    padding: 0 15px;
    border: 1px solid #CACACA;
}

.field input:focus {
    border-bottom-width: 2px;
}

.eye-icon {
    position: absolute;
    top: 50%;
    right: 10px;
    transform: translateY(-50%);
    font-size: 18px;
    color: #8b8b8b;
    cursor: pointer;
    padding: 5px;
}

.field button {
    color: #fff;
    background-color: red;
    transition: all 0.3s ease;
    cursor: pointer;
}

.field button:hover {
    background-color: #016dcb;
}

.form-link {
    text-align: center;
    margin-top: 10px;
}

.form-link span, .form-link a {
    font-size: 14px;
    font-weight: 400;
    color: #232836;
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
    margin: 36px 0;
    background-color: #d4d4d4;
}

.line::before {
    content: 'Or';
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    background-color: #FFF;
    color: #8b8b8b;
    padding: 0 15px;
}

.error {
    color: red;
    text-align: center;
    margin-top: 10px;
}
</style>
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
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
</script>
</head>
<body>
    <form id="createAccountForm" action="ForgotenPassword" method="post" onsubmit="validateForm(event)">
        <div class="form login">
            <div class="form-content">
                <header>Reset Password</header>
                <div class="field input-field">
                    <input type="text" name="username" id="username" placeholder="Full Name" class="input" required> 
                </div>
                <div class="field input-field">
                    <input type="text" name="mobileNo" id="oldpassword" placeholder="Mobile No" class="password" required> 
                </div>
                <div class="field input-field">
                    <input type="password" name="password1" id="newpassword" placeholder="New Password" class="password" required> 
                </div>
                <div class="field input-field">
                    <input type="password" name="password2" id="confirmpassword" placeholder="Confirm Password" class="password" required> 
                </div>
                <div class="field button-field">
                    <button type="submit" id="submitButton">Change Password</button>
                </div>
                <div id="error-message" class="error"></div>
            </div>
        </div>
    </form>
</body>
</html>