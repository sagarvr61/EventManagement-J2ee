<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<title>TODO supply a title</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width">
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>
</head>
<body>
	<%@include file="Header.jsp"%>
	<script>



            //            jQuery.validator.addMethod( name, method [, message ] )
//            
// value---> "current value of the validated element".
//elememt---> " element to be validated ".

            jQuery.validator.addMethod("checkemail", function(value, element) {
                return /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(value) || /^[0-9]{10}$/.test(value);
            });
            jQuery(document).ready(function($) {
                $("#signup").validate({
                    //ignore: [],
                    rules: {
                        name: {
                            required: true
                        },
                        email: {
                            required: true,
                            checkemail: true
                        },
                        phone: {
                            required: true,
                            minlength: 10,
                            maxlength: 10
                        },
                        pw: {
                            required: true,
                            minlength: 6
                        },
                        cp: {
                            required: true,
                            minlength: 6,
                            equalTo: "#pw"
                        }
                    },
                    messages: {
                        name: {
                            required: "Please enter the name."
                        },
                        email: {
                            required: "Please enter the email.",
                            email: "Please enter valid email id"
                        },
                        phone: {
                            required: "Please enter the number.",
                            minlength: "Please enter the  10 digit number .",
                            maxlength: "more than 10 digits."
                        },
                        pw: {
                            required: "Please enter the password.",
                            minlength: "Please enter the password greater than or equal to  6.",
                        },
                        cp: {
                            required: "Please reenter the password.",
                            minlength: "Please enter the password greater than or equal to 6.",
                            equalTo: "mismatch password"
                        }
                    }
                });
            });
        </script>
	<style>
	body {
	position: relative;
	background-image: url('images/lock.jpg');
	background-size: cover;
	background-repeat: no-repeat;
	margin: 0;
	padding: 0;
}
	
	
	
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

.form-group {
	margin-bottom: 0px;
	text-align: left;
}

.form-group label {
	font-weight: bold;
	margin-bottom: 0px;
}

.form-group input {
	max-width: 400px;
	padding: 8px;
	border: 1px solid #ccc;
	border-radius: 5px;
	margin-bottom: 10px;
	height: 20px;
	vertical-align: middle;
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

input {
	display: block;
}

#msg {
	background: red;
	color: black;
	border: 1px solid red;
	width: 24%;
	font-weight: bold;
	font-size: 25px;
	padding: 5px;
}
</style>
	<center>

		<br>
		<br>

		<% if (request.getAttribute("status") != null) {%>
		<div id="msg">
			<%= request.getAttribute("status")%></div>
		<%}%>


<div class="form-container">
		<h2> Registration Form</h2>
		<br>
		<form method="post" id="Register" action="register">
			<div class="form-group" position="absolute">
				<input type="text" id="name" name="name"
					placeholder="Username">
				<%--the name field is essential for form validation and to take the input data to the servlet --%>
			</div>
			<div class="form-group">
				<input type="number" id="phone" name="phone"
					placeholder="Phone Number">
			</div>
			<div class="form-group">
				<input type="email" id="mailId" name="email" placeholder="Email">
			</div>
			<div class="form-group">
				<input type="password" id="pw" name="pw"
					placeholder="Password">
			</div>
			<div class="form-group">
				<input type="password" id="conPass" name="cp"
					placeholder="Confirm Password">
			</div>
			<div class="form-group">
				<button type="submit" name="register" value="Register">Submit</button>
				<%--Upon clicking the value="submit" it will navigate to the servlet page provided in the "action" i.e, register--%>
			</div>
		</form>
	</div>


	</center>
	<%@include file="Footer.jsp"%>
</body>
</html>
