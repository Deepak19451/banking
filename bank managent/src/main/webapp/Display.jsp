<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Display Data</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
}

.container {
	max-width: 800px;
	margin: 0 auto;
	padding: 20px;
	background-color: #fff; /* White container background */
	border-radius: 8px;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.1); /* Soft shadow effect */
}

h2 {
	text-align: center;
	margin-bottom: 20px;
	color: #333; /* Dark gray heading */
}

iframe {
	width: 100%;
	height: 500px;
	border: none;
	border-radius: 8px;
	overflow: hidden; /* Hide scrollbars */
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}
</style>
</head>
<body>
	<div class="container">
		<h2>Existing Data in the Database</h2>
		<iframe src="Display"></iframe>
	</div>
</body>
</html>
