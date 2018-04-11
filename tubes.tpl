<html>
	<head>
		<title>Tubes</title>
		<link rel="stylesheet" type="text/css" href="{% static 'css/game.css' %}" />
		<style type="text/css">
			.rectangles {
				max-width: 50%;
			}
			.rectangles .rectangle {
				display: inline-block;
				border: 1px solid yellow;
				background-color: yellow;
				position: relative;
				margin: -2px;
			}

			.rectangles .rectangle .circle {
			  background-color: white;
			  border-radius: 100%;
			  position: absolute;
			  margin: 2.5px;
			}
		</style>
		
	</head>
	<body>
		<script type="text/javascript">
			var moves = 0;
			var circleList = [];
			var points = [];
			
			function loadPoints(){
				var str = document.getElementById("points").innerHTML;
				var values = str.substring(1,str.length-1).split(',');
				for(var i=0;i<values.length;i++){
					points.push(parseInt(values[i]));
				}
			}
			
			function moveIncrement(){
				moves++;
			}
			
			var circle = 0;
			function tubes(object){
				if(document.getElementById(object.id).style.backgroundColor != "white"){
					circle = object.id;
					moveIncrement();
				}
				else{
					tubesExit(object);
				}
			}
			
			function tubesExit(object){
				if(points.indexOf(parseInt(object.id)) != -1 && document.getElementById(object.id).style.backgroundColor == document.getElementById(circle).style.backgroundColor){
					circle = 0;
					circleList = [];
				}
				else{
					for(var i=0;i<circleList.length;i++){
						document.getElementById(circleList[i]).style.backgroundColor = "white";
					}
					circle = 0;
					circleList = [];
				}				
			}
			
			function mouseEnteringCircle(object){
				if(circle != 0 && document.getElementById(object.id).style.backgroundColor == "white"){
					circleList.push(object.id);
					document.getElementById(object.id).style.backgroundColor = document.getElementById(circle).style.backgroundColor;
				}				
				else if(circle!=0 && document.getElementById(object.id).style.backgroundColor != "white"){
					tubesExit(object);
				}
			}
		</script>
		%squares = 0
		%points = []
		%index = 0
		%colors = ["red","blue","green","brown","purple"]
		%for row in rows:
			%if(index==0):
				%squares = row
			%else:
				%points.append(row)
			%end
			%index = index + 1
		%end
		
		<div id="points" style="display:none">{{points}}</div>
		<script type="text/javascript">
			loadPoints()
		</script>
		<div class="rectangles">
		%count = 0;
		%for index1 in range(1,int(squares)+1):
			%for index2 in range(0,int(squares)):
				%count = count + 1
				<div class="rectangle" style="width: {{400/squares}}px; height: {{400/squares}}px;" id="rectangle{{count}}">
					%if(count in points):
						<div class="circle" style="width: {{400/squares - 5}}px; height: {{400/squares - 5}}px; background-color:{{colors[index1-1]}}" id="{{count}}" onclick="return tubes(this)" onmousedown="return tubes(this)" onmouseup="return tubesExit(this)" onmouseenter="return mouseEnteringCircle(this)"></div>
					%else:
						<div class="circle" style="width: {{400/squares - 5}}px; height: {{400/squares - 5}}px; background-color: white;" id="{{count}}" onmouseenter="return mouseEnteringCircle(this)" onclick="return tubes(this)" onmouseup="return tubesExit(this)"></div>
					%end
				</div>
			%end
			<br/>
		%end
		</div>
	</body>
</html>