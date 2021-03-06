<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- Generated by NCL Eclipse -->
<ncl id="new_ncl_file" xmlns="http://www.ncl.org.br/NCL3.0/EDTVProfile">
	<head>
		<connectorBase>
			<causalConnector id="onEnteringStart">
				<simpleCondition role="onEntering"/>
				<simpleAction role="start" max="unbounded"/>
			</causalConnector>
			<causalConnector id="onLeavingStop">
				<simpleCondition role="onLeaving"/>
				<simpleAction role="stop" max="unbounded"/>
			</causalConnector>
		</connectorBase>
	</head>

	<body>
		<port id="pEntrance1" component="churchLocation" interface="pChurch"/>
		
		<property name="mandatory" value="true"/>
		<property name="occurance" value="unbounded"/>
		<property name="score" value="10"/>
		
		<media id="churchLocation" type="text/xml" src="church.gml">
			<area id="pChurch"/>
		</media>
		<media id="hospLocation" type="text/xml" src="hosp.gml">
		</media>
		<media id="pracaLocation" type="text/xml" src="praca.gml">
		</media>
		
		<media id="video" type="video/mpeg" src="video.mpeg">
			
		</media>
		<media id="image" type="video/jpeg" src="imagem.png">
			
		</media>
		<media id="objeto" type="video/mpeg" src="obj.obj">
			<property name="mtl" value="obj.mtl"/>
			<property name="texture" value="obj.png"/>
		</media>
	
		<link xconnector="onEnteringStart">
			<bind role="onEntering" component="churchLocation">
				
			</bind>
			<bind role="start" component="video">
				
			</bind>
			<bind role="start" component="hospLocation">
				
			</bind>
		</link>
		<link xconnector="onEnteringStart">
			<bind role="onEntering" component="hospLocation">
				
			</bind>
			<bind role="start" component="image">
				
			</bind>
			<bind role="start" component="pracaLocation">
				
			</bind>
		</link>
		<link xconnector="onEnteringStart">
			<bind role="onEntering" component="pracaLocation">
				
			</bind>
			<bind role="start" component="objeto">
				
			</bind>
		</link>
	</body>
</ncl>