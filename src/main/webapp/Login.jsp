<html>
<head>
<title>TODO supply a title</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width">
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
	<%@include file="Header.jsp"%>
	<script>
            jQuery.validator.addMethod("checkemail", function(value, element) {
                return /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(value) || /^[0-9]{10}$/.test(value);
            }, "Please enter the email format as abc@gmail.com");

            jQuery(document).ready(function($) {
                $("#Login").validate({
                    rules: {
                        email: {
                            required: true,
                            checkemail: true
                        },
                        pw: {
                            required: true,
                            minlength: 6
                        },
                    },
                    messages: {
                        email: {
                            required: "Please enter the email.",
                        },
                        pw: {
                            required: "Please enter the password.",
                            minlength: "Please enter the password greater than or equal to 6.",
                        },
                    }
                });
            });
		</script>
	<style>
	
	.form-container {
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: rgba(255, 255, 255, 0.7);
	padding: 40px;
	border-radius: 10px;
	text-align: center;
}

.form-container h2 {
	text-align: center;
	margin-bottom: 0px;
}
body {
	position: relative;
	background-image: url('images/holi.jpg');
	background-size: cover;
	background-repeat: no-repeat;
	margin: 0;
	padding: 0;
}

.form-group {
	margin-bottom: 0px;
	text-align: left;
}

.form-group label {
	font-weight: bold;
	margin-bottom: 0px;
}

.form-group input {
	width: 100%;
	padding: 8px;
	border: 1px solid #ccc;
	border-radius: 5px;
	margin-bottom: 10px;
}

.form-group button {
	width: 100%;
	padding: 10px;
	background-color: green;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	font-size: 16px;
	margin-top: 10px;
}

.error {
	color: red;
}

.button {
	padding: 5px;
	width: 6%;
	background: cornflowerblue;
	color: white;
}

#msg {
	background: green;
	color: black;
	border: 1px solid green;
	width: 24%;
	font-weight: bold;
	font-size: 25px;
	padding: 5px;
}

td input {
	display: block;
}
</style>
<center>
	<% if (request.getAttribute("status") != null) {%>
		<div id="msg">
			<%= request.getAttribute("status")%></div>
		<%}%>
		<div class="form-container">
		<h2>Sign In</h2>
		<br>
		<form method="post" id="Login" action="register">
			<div class="form-group">
				<input type="email" id="mailId" name="email" placeholder="Email">
			</div>
			<div class="form-group">
				<input type="password" id="pwd" name="pw"
					placeholder="Password">
			</div>
			<div class="form-group">
				<button type="submit" name="Login" value="Login">Login</button>
				<%--Upon clicking the value="Login" it will navigate to the servlet page provided in the "action" i.e, register--%>
				<div class="form-group" style="text-align: center">
					<br> <a href="Fpass.jsp" style="color: green;">Forgot
						Password?</a>
				</div>
			</div>
		</form>
	</div>
</center>
<%@include file="Footer.jsp"%>
</body>
</html>




