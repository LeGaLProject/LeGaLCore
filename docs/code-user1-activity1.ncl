<?xml version="1.0" encoding="ISO-8859-1"?>
<ncl id="exampleGame" xmlns="http://www.ncl.org.br/NCL3.0/EDTVProfile">
	<head>
		<connectorBase id="connBaseId">
			<importBase alias="conn" documentURI="defaultConnBase.ncl"/>
		</connectorBase>
	</head>
	<body>
		<port id="pEntrance1" component="church" interface="pChurch"/>		
		<context id="church">
			<port id="pChurch" component="churchLocation"/>
			<property name="mandatory" value="true"/>
			<property name="occurance" value="unbounded"/>
			<property name="score" value="10"/>

			<media id="churchLocation" type="text/xml" src="church.gml"/>
            <media id="video" type="video/mpeg" src="video.mpeg"/>
			
			<link xconnector="onEnteringStart">
				<bind role="onEntering" component="churchLocation"/>
				<bind role="start" component="video"/>
				<bind role="start" component="hospital"/>
			</link>
		</context>
		
		<context id="hospital">
			<port id="pHospital" component="hospLocation"/>
			<property name="mandatory" value="true"/>
			<property name="occurance" value="unbounded"/>
			<property name="score" value="10"/>

			<media id="hospLocation" type="text/xml" src="church.gml"/>
            <media id="imag1" src="imag1.png"/>
			
			<link xconnector="onEnteringStart">
				<bind role="onEntering" component="hospLocation"/>
				<bind role="start" component="imag1"/>
				<bind role="start" component="park"/>
			</link>
		</context>
		
		<context id="park">
			<port id="pPark" component="parkLocation"/>
			<property name="mandatory" value="true"/>
			<property name="occurance" value="unbounded"/>
			<property name="score" value="10"/>

			<media id="parkLocation" type="text/xml" src="church.gml"/>
            <media id="parkobj" src="park.obj">
            	<property name="mtl" value="a.mtl"/>
            	<property name="texture" value="a.png"/>
            </media>
            	
			
			<link xconnector="onEnteringStart">
				<bind role="onEntering" component="parkLocation"/>
				<bind role="start" component="parkobj"/>
			</link>
		</context>
		
		
	</body>
</ncl>

