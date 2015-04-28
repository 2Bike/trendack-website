<html>
	<head>
		<meta charset="UTF-8">
		<title>Trendack - The new[s]paper</title>

		<link rel="stylesheet" href="css/index.css">
		<link rel="stylesheet" type="text/css" media="screen,projection" href="css/cssmap-europe/cssmap-europe.css">
		
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
 		<script type="text/javascript" src="http://cssmapsplugin.com/4/jquery.cssmap.js"></script>
 		<script type="text/javascript" src="js/map.js"></script> 
	</head>
	<body>
		<!-- OPENING WRAPPER DIV -->
		<div class="wrapper">
			<div class="ribbon-wrapper-green">
				<div class="ribbon-green">BETA</div>
			</div>
			<div class="header"> 
				<h1>Trendack - New[s]paper</h1>
				<h4><i>A twitter visualization project</i></h4>
			</div>
			<hr>
				<!-- OPEN MAP -->
				<div id="map-europe">
					<ul class="europe">
					  <li class="eu1"><a href="#albania">Albania</a></li>
					  <li class="eu2"><a href="#andorra">Andorra</a></li>
					  <li class="eu3"><a href="#austria">Austria</a></li>
					  <li class="eu4"><a href="#belarus">Belarus</a></li>
					  <li class="eu5"><a href="#belgium">Belgium</a></li>
					  <li class="eu6"><a href="#bosnia-and-herzegovina">Bosnia and Herzegovina</a></li>
					  <li class="eu7"><a href="#bulgaria">Bulgaria</a></li>
					  <li class="eu8"><a href="#croatia">Croatia</a></li>
					  <li class="eu10"><a href="#czech-republic">Czech Republic</a></li>
					  <li class="eu11"><a href="#denmark">Denmark</a></li>
					  <li class="eu12"><a href="#estonia">Estonia</a></li>
					  <li class="eu13"><a href="#france">France</a></li>
					  <li class="eu14"><a href="#finland">Finland</a></li>
					  <li class="eu15"><a href="#georgia">Georgia</a></li>
					  <li class="eu16"><a href="#germany">Germany</a></li>
					  <li class="eu17"><a href="#greece">Greece</a></li>
					  <li class="eu18"><a href="#hungary">Hungary</a></li>
					  <li class="eu19"><a href="#iceland">Iceland</a></li>
					  <li class="eu20"><a href="#ireland">Ireland</a></li>
					  <li class="eu21"><a href="#san-marino">San Marino</a></li>
					  <li class="eu22"><a href="#italy">Italy</a></li>
					  <li class="eu23"><a href="#kosovo">Kosovo</a></li>
					  <li class="eu24"><a href="#latvia">Latvia</a></li>
					  <li class="eu25"><a href="#liechtenstein">Liechtenstein</a></li>
					  <li class="eu26"><a href="#lithuania">Lithuania</a></li>
					  <li class="eu27"><a href="#luxembourg">Luxembourg</a></li>
					  <li class="eu28"><a href="#macedonia">Macedonia <abbr title="The Former Yugoslav Republic of Macedonia">(F.Y.R.O.M.)</abbr></a></li>
					  <li class="eu29"><a href="#malta">Malta</a></li>
					  <li class="eu30"><a href="#moldova">Moldova</a></li>
					  <li class="eu31"><a href="#monaco">Monaco</a></li>
					  <li class="eu32"><a href="#montenegro">Montenegro</a></li>
					  <li class="eu33"><a href="#netherlands">Netherlands</a></li>
					  <li class="eu34"><a href="#norway">Norway</a></li>
					  <li class="eu35"><a href="#poland">Poland</a></li>
					  <li class="eu36"><a href="#portugal">Portugal</a></li>
					  <li class="eu37"><a href="#romania">Romania</a></li>
					  <li class="eu38"><a href="#russian-federation">Russian Federation</a></li>
					  <li class="eu39"><a href="#serbia">Serbia</a></li>
					  <li class="eu40"><a href="#slovakia">Slovakia</a></li>
					  <li class="eu41"><a href="#slovenia">Slovenia</a></li>
					  <li class="eu42"><a href="#spain">Spain</a></li>
					  <li class="eu43"><a href="#sweden">Sweden</a></li>
					  <li class="eu44"><a href="#switzerland">Switzerland</a></li>
					  <li class="eu46"><a href="#ukraine">Ukraine</a></li>
					  <li class="eu47"><a href="#united-kingdom">United Kingdom</a></li>
					</ul>
				<!-- CLOSES MAP -->
				</div>
			<hr>
			<!-- COLUMNS - START -->
			<div class="columns">

				<!-- LEFT -->
				<div class="column-left">
					<p class="col-header one-edge-shadow">Statistics</p>
					<div id="statistics-list" class="one-edge-shadow">
						<p id="countries-in">_____ countries participating.</p>
						<p id="trends-gathered">Gathered _____ trends.</p>
						<p id="tweets-got">Containing _____ tweets.</p>
					</div>
				</div>
				<!-- LEFT -->

				<!-- CENTER -->
				<div class="column-center">
					<p id="trends-at" class="col-header one-edge-shadow">Trends at ...</p>
					<div id="trends-list" class="one-edge-shadow">
						<!-- Full list printed in "map.js" file -->
					</div>
				</div>
				<!-- CENTER -->

				<!-- RIGHT -->
				<div class="column-right">
					<p id="tweets-for" class="col-header one-edge-shadow">Tweets for ...</p>
					<div id="tweets-list" class="one-edge-shadow">
						<ul id="tweets-list-element" style="text-align: left;" >
							<!-- Full list printed in "map.js" file - trendClicked() -->
						</ul>
					</div>
				</div> 
				<!-- RIGHT -->

			<!-- COLUMNS - END -->
			</div>
		<!-- CLOSES WRAPPER -->	
		</div>
	</body>
</html>