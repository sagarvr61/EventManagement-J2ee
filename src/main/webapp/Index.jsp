<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<style>
body {
	position: relative;
	background-image: url('img/dar.jpg');
	background-size: cover;
	background-repeat: no-repeat;
	margin: 0;
	padding: 0;
}
.desc2{

}
h1 {

	text-align: center;
	text-shadow: 2px 1px 2px black;
	margin-top: 60px;
}

.errmsg {
	background: green;
	padding: 10px;
	width: 50%;
	color: white;
	font-weight: bold;
}
</style>
<body>
	<%@include file="Header.jsp"%>
	<center>
		<% if (request.getAttribute("status") != null) {%>
		<h1 class="errmsg">
			<%= request.getAttribute("status")%></h1>
		<%}%>
		<br>
		<div>
			<h1>Welcome To Event Management</h1>
		</div>
		<p class="desc2"><strong>Event Decorations are a full-service wedding
						and event planners, design and coordination company based in India
						who are passionate about our work and are committed to assist our
						clients with all aspects of the planning process from start to
						finish.</strong></p>
		<% if (session.getAttribute("uname") != null) {%>
		<h1>
			Welcome
			<%= session.getAttribute("uname")%></h1>
		<%}%>
	</center>
	<%@include file="Footer.jsp"%>
</body>
</html>
