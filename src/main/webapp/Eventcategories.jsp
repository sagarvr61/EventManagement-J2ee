<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style>
/*<!-- categories-->*/


.container3 {
	width: 250px;
	height: 300px;
	perspective: 800px;
	display: inline-block;
	margin: 0 75px;
}

.card {
	height: 100%;
	width: 250px;
	position: relative;
	transition: transform 1000ms;
	transform-style: preserve-3d;
	left: 140px;
}

.front, .back {
	height: 100%;
	width: 100%;
	border-radius: 2rem;
	box-shadow: 0 0 5px 2px rgba(50, 50, 50, 0.25);
	position: absolute;
	backface-visibility: hidden;
}

.front {
	height: 300px;
	width: 250px;
	background-size: 100% 100%;
}

.container3:hover>.card {
	cursor: pointer;
	transform: rotateY(180deg);
}

.back {
	background-color: #3a3a3a;
	color: white;
	transform: rotateY(180deg);
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	gap: 2rem;
}

.learn-more-button {
	padding: 10px 20px;
	background-color: #3a3a3a;
	color: white;
	text-decoration: none;
	border-radius: 5px;
	border: 2px solid white;
	font-size: 16px;
	cursor: pointer;
}
.categories {
	margin: 40px 0;
}
.desc {
	position: absolute;
	text-align: center;
	top: 80%;
	left: 52%;
	transform: translate(-50%, -50%);
	color: #fff;
	font-size: 40px;
}

.small-container {
	max-width: 1080px;
	margin: auto;
	padding-left: 25px;
	padding-right: 25px;
}

.title {
	text-align: center;
	margin: 0 auto 80px;
	position: relative;
	line-height: 60px;
	color: red;
}

.title::after {
	content: '';
	background: orangered;
	width: 100px;
	height: 5px;
	border-radius: 15px;
	position: absolute;
	bottom: 0;
	left: 50%;
	transform: translateX(-50%);
}
.sagar{
background-repeat: no-repeat; 
background-size: cover;
margin-top: -60px;

}

.row {
	display: flex;
	align-items: center;
	flex-wrap: wrap;
	justify-content: space-around;
}

.categories .col-3 {
	flex-basis: 30%;
	min-width: 250px;
	margin-bottom: 0px;
	text-align: center;
	padding: 40px 10px;
	/*    box-shadow: 0 0 20px 0px rgba(0,0,0,0.1);*/
	cursor: pointer;
	transition: transform 0.5s;
}

.categories .col-3 img {
	width: 150px;
	height: 150px;
	margin-top: 20px;
	border-radius: 50%;
}

.categories .col-3:hover {
	transform: translateY(-10px);
}
</style>
</head>
<body>
<div id="myCarousel" class="carousel" data-ride="carousel"
		data-interval="3000">
		<ol class="indicators" style="display: none">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
			<li data-target="#myCarousel" data-slide-to="3"></li>
			<li data-target="#myCarousel" data-slide-to="4"></li>
		</ol>

		<div class="carousel-inner">
			<div class="item active" style="height: 50rem; opacity: 0.8">
				<img src="img/wedding.jpg" alt="Los Angeles"
					style="width: 100%; height: 100%" class="overlay">
				<div class="container"
					style="font-color: white; font-family: times new roman;">
					<p class="container1">
						<b>Welcome</b>
					</p>
					<p class="desc">Make any occasion unforgettable...</p>
				</div>
			</div>
			<div class="item" style="height: 50rem; opacity: 1.0">
				<img src="img/coorporate.jpg" alt="Image 2"
					style="width: 100%; height: 100%" class="overlay">
				<div class="container"
					style="font-color: white; font-family: times new roman">
					<p class="container2">
						<b>About Us</b>
					</p>
					<p class="desc2">Event Decorations are a full-service wedding
						and event planners, design and coordination company based in India
						who are passionate about our work and are committed to assist our
						clients with all aspects of the planning process from start to
						finish.</p>
				</div>
			</div>
			<div class="item" style="height: 50rem; opacity: 0.8">
				<img src="images/wed.jpeg" alt="Image 2"
					style="width: 100%; height: 100%" class="overlay">
			</div>
			<div class="item" style="height: 50rem; opacity: 0.8">
				<img src="img/b2.jpg" alt="Image 2"
					style="width: 100%; height: 100%" class="overlay">
			</div>
			<div class="item" style="height: 50rem; opacity: 0.8">
				<img src="images/wed2.jpeg" alt="Image 2"
					style="width: 100%; height: 100%" class="overlay">
			</div>
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#myCarousel"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
	</div><br>



<div class="sagar" style="background-image: url(images/even.jpg)">
	<div class="categories">
		<div class="small-container">
			<div class="events"
		style="text-align: center; font-family: Lucida Handwriting; font-size: 50px; background-color: yellow">
		<p>Simple & Classy Events...!</p>
	</div>
		</div>
		</div>
	
	
			<div class="container3" >
		<div class="card">
			<div class="front" style="background-image: url(images/bday.jpg)">
			</div>
			<div class="back">
				<div class="info" style="text-align: center">
					<h2>Birthday</h2>
					<p>Turning another year older? Let us make it bolder!</p>
					<br> <a href="Events.jsp?event_category=birthday" class="learn-more-button">View
						More</a>
				</div>
			</div>
		</div>
	</div>
	
	<div class="container3" >
		<div class="card" >
			<div class="front" style="background-image: url(images/wedcard.jpg)">
			</div>
			<div class="back">
				<div class="info" style="text-align: center">
					<h2>Wedding</h2>
					<p>A stylish wedding begins with us</p>
					<br>
					<a href="Events.jsp?event_category=wedding" class="learn-more-button" name="Wedding">View More</a>
				</div>
			</div>
		</div>
	</div>
	
	<div class="container3">
		<div class="card">
			<div class="front" style="background-image: url(images/concert.jpg)">
			</div>
			<div class="back">
				<div class="info" style="text-align: center">
					<h2>Coorporate</h2>
					<p>Exclusive events, priceless memories</p>
					<br>
					<a href="Events.jsp?event_category=coorporate" class="learn-more-button" name="Concert">View More</a>
				</div>
			</div>
		</div>
	</div>
			

		
	</div>
	
</body>
</html>
