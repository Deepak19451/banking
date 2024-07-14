<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome To Banking</title>
<style>
    body {
        font-family: Arial, sans-serif;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        background-color: rgba(14, 140, 159, 0.9);
        margin: 0;
        position: relative;
        overflow: hidden;
		flex-direction: column;
    }
    form {
        background: white;
        color: black;
        padding: 40px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        animation: fadeIn 1s ease-in-out;
        width: 400px;
        display: flex;
        flex-direction: column;
        align-items: center;
    }
    h2 {
        margin: 0 0 20px;
    }
    input, button {
        width: 100%;
        padding: 15px;
        margin: 15px 0;
        border: 1px solid #ccc;
        border-radius: 5px;
        text-align: center;
    }
    .neon-input {
        border: none;
        outline: none;
		background-color: #e0e0e0;
    }

    .input-container {
        position: relative;
        width: 100%;
    }
    .input-container input {
        width: calc(100% - 40px);
        padding-right: 40px;
    }
    .eye-icon {
        position: absolute;
        right: 10px;
        top: 50%;
        transform: translateY(-50%);
        cursor: pointer;
        color: black; /* Changed to black */
    }
    .neon-button {
        background-color: tomato;
        color: white;
        cursor: pointer;
        transition: background-color 0.3s, box-shadow 0.3s;
        border: none;
    }
    .neon-button:hover {
        background-color: rgb(236, 73, 45);
    }
    .normal-button {
        background-color: green;
        color: white;
        cursor: pointer;
        transition: background-color 0.3s, color 0.3s;
        border: 1px solid #088395;
        border-radius: 5px;
        width: 40%;
        margin: 0 1%;
    }
  
    @keyframes fadeIn {
        from {
            opacity: 0;
            transform: translateY(-20px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }
    .button-group {
        display: flex;
        align-items:center;
        justify-content: center;
        width: 100%;
    }
    .background-title {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        font-size: 50px;
        font-weight: bold;
        color: #071952;
        opacity: 0.1;
        animation: colorChange 3s infinite alternate;
    }
    @keyframes colorChange {
        0% {
            color: #071952;
        }
        100% {
            color: #088395;
        }
    }
	h1{
		color:#071952;
		font-size: 50px;
		font-family: Brush Script MT;
		font-weight: 50;
	}
</style>
</head>
<body>
	<h1>
		 Bank Management 
	</h1>
    <form action="adminLogin" method="post">
        <h2>Admin Login</h2>
        <div class="input-container">
            <input type="text" name="username" placeholder="username" class="neon-input">
        </div>
        <div class="input-container">
            <input type="password" name="password" placeholder="password" class="neon-input" id="password">
            <span class="eye-icon" onclick="togglePassword()">&#128065;</span>
        </div>
        <button type="submit" class="neon-button">Login</button>
        <div class="button-group">
            <button type="button" class="normal-button" onclick="location.href='login.jsp'">customer Login</button>
        </div>
    </form>
    <script>
        function togglePassword() {
            var passwordField = document.getElementById("password");
            if (passwordField.type === "password") {
                passwordField.type = "text";
            } else {
                passwordField.type = "password";
            }
        }
    </script>
</body>
</html>