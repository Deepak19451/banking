<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Customer Dashboard</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<!-- Include Font Awesome for icons -->
<style>
body {
    font-family: Arial, sans-serif;
    background-color: #2a8d96;
    margin: 0;
    padding: 0;
    display: flex;
    min-height: 100vh;
}

.sidebar {
    width: 15vw; /* Reduced width of the sidebar */
    height: 320vh;
    padding: 20px;
    display: flex;
    flex-direction: column;
    align-items: center;
    background-color: white;
}

.sidebar .profile-photo-container {
    text-align: center;
    margin-bottom: 20px;
}

.sidebar .profile-photo-container img {
    border-radius: 50%;
    width: 100px; /* Adjusted size */
    height: 100px; /* Adjusted size */
    object-fit: cover;
}

.sidebar .profile-photo-container input[type="file"] {
    margin-top: 10px;
    display: none; /* Hide the file input */
}

.sidebar .details-item {
    margin-bottom: 10px;
    display: flex;
    align-items: center;
    color: #071952;
    font-size: 14px; /* Adjusted font size */
}

.sidebar .details-item i {
    margin-right: 8px; /* Adjusted spacing */
}

.sidebar .details-item strong {
    margin-right: 5px;
}

.sidebar .details-container {
    display: block; /* Display by default */
}

.sidebar .advertisements {
    margin-top: 70px; /* Adjusted margin to prevent overlap */
    width: 100%;
    background-color: #f9f9f9;
    padding: 10px;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    text-align: center;
}

.sidebar .advertisements h3 {
    color: #071952;
    margin: 0;
}

.menu-button {
    display: none; /* Hide menu button */
}

.menu-dropdown {
    display: block;
    background: white;
    border-radius: 5px;
    z-index: 10;
    padding: 10px;
}

.menu-dropdown a {
    display: block;
    padding: 10px;
    color: #071952;
    text-decoration: none;
    margin-bottom: 10px;
    text-align: center;
}

.menu-dropdown a:hover {
    background-color: #f4f4f4;
}

.main-content {
    padding: 20px;
    padding-top: 0;
    margin: 0;
    width: calc(100% - 200px); /* Adjusted width */
    display: flex;
    justify-content: center; /* Center horizontally */
}

.dashboard-container {
    max-width: 1000px; /* Adjust as needed for centering */
    background-color: ##2a8d96;
    padding: 20px;
    padding-top: 0;
    margin-top: 0;
    border-radius: 8px;
    width: 100%; /* Full width of its container */
    display: flex;
    flex-direction: column;
    align-items: center; /* Center content horizontally */
}

h1 {
    text-align: center;
    color: #071952;
}



.atm-card-container {
    display: flex;
    justify-content: center; /* Center cards horizontally */
    flex-wrap: wrap;
    gap: 20px;
    max-width: 100%; /* Adjust as needed for centering */
}

.atm-card {
    background-color: white;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    padding: 20px;
    width: 100%;
    max-width: 500px;
}

.input-container {
    margin-bottom: 15px;
    position: relative;
}

.input-container label {
    display: block;
    margin-bottom: 5px;
}

.input-container input {
    width: calc(100% - 30px);
    padding: 10px 30px 10px 10px;
    border-radius: 5px;
    border: 1px solid #37B7C3;
}

.input-container input:focus + .fa {
    color: #37B7C3;
}

.fa {
    position: absolute;
    right: 10px;
    top: calc(50% - 0.5em);
    color: #aaa;
}

button {
    background-color: white;
    color: tomato;
    padding: 10px;
    border: none;
    border-radius: 5px;
    font-size: 16px;
    font-weight: 700;
    cursor: pointer;
    transition: background-color 0.3s ease;
    text-align: left;
}

button:hover {
    color: green;
}

.transaction-history {
    margin-top: 20px;
}

.transaction-history p {
    color: #a52a42;
    text-align: center;
    margin-bottom: 20px;
}

.transaction-history table {
    width: 100%;
    border-collapse: collapse;
}

.transaction-history th, .transaction-history td {
    padding: 8px;
    text-align: left;
    border-bottom: 1px solid #ddd;
}

.download-btn {
    margin-top: 20px;
    display: block;
    width: 97%;
    padding: 10px;
    border: none;
    border-radius: 5px;
    background-color: tomato;
    color: #fff;
    font-size: 16px;
    cursor: pointer;
    transition: background-color 0.3s ease;
    text-align: center;
    text-decoration: none;
}

.download-btn:hover {
    background-color: red;
}

/* Logout button specific styling */
.logout-button {
    text-decoration: none;
    padding: 10px;
    border-radius: 10px;
    display: block;
    width: 10vw;
    margin: 20px auto 0 auto;
}

h1 {
    background-color: white;
    height: 10vh;
    width: 83vw;
    margin-top: 0;
    text-align: center;
    padding-top: 25px;
}

.details-container{
     margin-top: 15vh;
     padding: 10px;
}
.transaction-history{
    height: 80vh;
    overflow-x: scroll;
    overflow-y: scroll;

}


</style>
</head>
<body>
    <div class="sidebar">
        <div class="details-container">
            <div class="details-item">
                <i class="fas fa-user icon"></i><strong>Full Name:</strong> <span id="fullName"></span>
            </div>
            <div class="details-item">
                <i class="fas fa-user icon"></i><strong>Account No:</strong> <span id="account"></span>
            </div>
            <div class="details-item">
                <i class="fas fa-map-marker-alt icon"></i><strong>Address:</strong> <span id="address"></span>
            </div>
            <div class="details-item">
                <i class="fas fa-phone icon"></i><strong>Mobile Number:</strong> <span id="mobileNo"></span>
            </div>
            <div class="details-item">
                <i class="fas fa-envelope icon"></i><strong>Email:</strong> <span id="email"></span>
            </div>
            <div class="details-item">
                <i class="fas fa-credit-card icon"></i><strong>Account Type:</strong> <span id="accountType"></span>
            </div>
            <div class="details-item">
                <i class="fas fa-address-card icon"></i><strong>ID Proff:</strong> <span id="id_proff"></span>
            </div>
            <div class="details-item">
                <i class="fas fa-id-card icon"></i><strong>ID Proff Number:</strong> <span id="id_proff_number"></span>
            </div>
            <div class="details-item">
                <i class="fas fa-calendar-alt icon"></i><strong>Date of Birth:</strong> <span id="dob"></span>
            </div>
           
            
            
            <form action="CheckBalance" method="post">
                <button class="logout-button"  type="submit">Check Balance</button>
            </form>
                
            <button onclick="refreshPage()" class="logout-button" >Refresh Page</button>
            


            <a style="text-decoration:none;" href="ResetPassword.jsp" >
                <button class="logout-button"  type="submit">Reset Password</button>
            </a>
            <form action="LogOut" method="post">
                <button class="logout-button" type="submit">Logout</button>
            </form>
   			<form action="Close" method="post">
                <button class="logout-button"  type="submit">Close Account</button>
            </form>
            
        </div>
    </div>

    <div class="main-content">
        <div class="dashboard-container">
				<h1>Welcome, <span style="color: rgb(132, 6, 250);" id="head"></span> </h1>            
				<div class="atm-card-container">
                <div class="atm-card">
                    <h2>Deposit Amount</h2>
                    <form action="Deposit" method="post">
                        <div class="input-container">
                            <label for="MobileNumber"><i class="fas fa-mobile-alt"></i> Password:</label>
                            <input type="password" id="MobileNumber" name="password" placeholder="Enter Mobile Number" required>
                        </div>
                        <div class="input-container">
                            <label for="DepositAmount"><i class="fas fa-money-bill"></i> Deposit Amount:</label>
                            <input type="text" id="DepositAmount" name="amount" placeholder="Enter Amount" required>
                        </div>
                        <button class="btns" type="submit">Deposit</button>
                    </form>
                </div>

                <div class="atm-card">
                    <h2>Withdraw</h2>
                    <form action="Withdraw" method="post">
                        <div class="input-container">
                            <label for="MobileNumber-withdraw"><i class="fas fa-mobile-alt"></i> Password :</label>
                            <input type="password" id="MobileNumber-withdraw" name="password" placeholder="Enter Mobile Number" required>
                        </div>
                        <div class="input-container">
                            <label for="WithdrawAmount"><i class="fas fa-money-bill"></i> Withdraw Amount :</label>
                            <input type="text" id="WithdrawAmount" name="amount" placeholder="Enter Amount" required>
                        </div>
                        <button class="btns" type="submit">Withdraw</button>
                    </form>
                </div>

                <div class="atm-card">
                    <h2>Pay</h2>
                    <form action="Pay" method="post">
                        <div class="input-container">
                            <label for="accountNo"><i class="fas fa-mobile-alt"></i> Account Number :</label>
                            <input type="text" id="accountNo" name="acountNo" placeholder="Enter Account Number" required>
                        </div>
                        <div class="input-container">
                            <label for="MobileNumber-withdraw"><i class="fas fa-mobile-alt"></i> Password :</label>
                            <input type="password" id="MobileNumber-withdraw" name="password" placeholder="Enter Password" required>
                        </div>
                        <div class="input-container">
                            <label for="WithdrawAmount"><i class="fas fa-money-bill"></i> Pay Amount :</label>
                            <input type="text" id="WithdrawAmount" name="amount" placeholder="Enter Amount" required>
                        </div>
                        <button class="btns" type="submit">Pay</button>
                    </form>
                </div>
            </div>

            <div class="atm-card transaction-history">
                <p>Note: Make sure to refresh the page after any sort of transaction in order to download transaction history.</p>
                <h2>Transaction History</h2>
                <table id="transaction-table">
                    <!-- Transaction history will be displayed here -->
                </table>
                <a href="TransactionHistoryServlet?download=true" class="download-btn" download>Download Transaction History</a>
            </div>
        </div>
    </div>

    <script>
        function refreshPage() {
            window.location.reload();
        }

        function getUrlParameter(name) {
            name = name.replace(/[\[]/, '\\[').replace(/[\]]/, '\\]');
            var regex = new RegExp('[\\?&]' + name + '=([^&#]*)');
            var results = regex.exec(location.search);
            return results === null ? '' : decodeURIComponent(results[1].replace(/\+/g, ' '));
        }

        // Function to fetch transaction history
        function fetchTransactionHistory() {
            fetch('Transaction')
                .then(response => response.text())
                .then(data => {
                    // Update the table with the received transaction history
                    document.getElementById('transaction-table').innerHTML = data;
                })
                .catch(error => console.error('Error fetching transaction history:', error));
        }

        // Ensure the elements exist before setting their properties
        function setElementTextContent(id, text) {
            var element = document.getElementById(id);
            if (element) {
                element.textContent = text;
            } else {
                console.error(`Element with ID '${id}' not found.`);
            }
        }

        // Call fetchTransactionHistory function initially to load transaction history
        fetchTransactionHistory();

        // Fetch and display user details
        var fullName = getUrlParameter('fullName');
        var account = getUrlParameter('account');
        var address = getUrlParameter('address');
        var mobileNo = getUrlParameter('mobileNo');
        var email = getUrlParameter('email');
        var accountType = getUrlParameter('accountType');
        var balance = getUrlParameter('balance');
        var id_proff_type = getUrlParameter('id_proff_type');
        var id_proff_no = getUrlParameter('id_proff_no');
        var dob = getUrlParameter('dob');


        setElementTextContent('fullName', fullName);
        setElementTextContent('account', account);
        setElementTextContent('address', address);
        setElementTextContent('mobileNo', mobileNo);
        setElementTextContent('email', email);
        setElementTextContent('accountType', accountType);
        setElementTextContent('id_proff', id_proff_type);
        setElementTextContent('id_proff_number', id_proff_no);
        setElementTextContent('dob', dob);
        setElementTextContent('balance', balance);
        setElementTextContent('head', fullName.toUpperCase());
    </script>
</body>
</html>
s