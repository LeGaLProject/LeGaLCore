<?xml version="1.0" encoding="ISO-8859-1"?>
<ncl id="exampleGame" xmlns="http://www.ncl.org.br/NCL3.0/EDTVProfile">
	<head>
		<ruleBase>
			<rule id="teamA" var="legal.team" comparator="eq" value="A"/>
			<rule id="teamB" var="legal.team" comparator="eq" value="B"/>
		</ruleBase>
		<connectorBase id="connBaseId">
			<importBase alias="conn" documentURI="defaultConnBase.ncl"/>
		</connectorBase>
	</head>
	<body>
	
		<switch id="comeco">
			<switchPort id="spComeco">
				<mapping component="church"/>
				<mapping component="hospital"/>
			</switchPort>
			
			<bindRule constituent="church" rule="teamA"/>
			<bindRule constituent="hospital" rule="teamB"/>
			
			<context id="church">
				<port id="pChurch" component="churchLocation"/>
				<property name="mandatory" value="true"/>
				<property name="occurance" value="unbounded"/>
				<property name="score" value="10"/>
				
				<media id="churchLocation" type="text/xml" src="church.gml"/>
				<media id="img"  src="img1.png"/>
				
				<link xconnector="onEnteringStart">
					<bind role="onEntering" component="churchLocation"/>
					<bind role="start" component="img"/>
					<bind role="start" component="castelo1"/>
				</link>
				
				<context id="castelo1">
					<port id="pCastelo1" component="casteloLocation1"/>
					<property name="mandatory" value="true"/>
						<property name="occurance" value="unbounded"/>
					<property name="score" value="10"/>
		
					<media id="casteloLocation1" type="text/xml" src="church.gml"/>
		            <media id="win1" src="video.mp4"/>
		            	
					
					<link xconnector="onEnteringStart">
						<bind role="onEntering" component="casteloLocation1"/>
						<bind role="start" component="win1"/>
					</link>
				</context>
				
			</context>
			
			<context id="hospital">
				<port id="pHospital" component="hospLocation"/>
				<property name="mandatory" value="true"/>
				<property name="occurance" value="unbounded"/>
				<property name="score" value="10"/>
				
				<media id="hospLocation" type="text/xml" src="church.gml"/>
				<media id="audio" src="audio.mp3"/>
				
				<link xconnector="onEnteringStart">
					<bind role="onEntering" component="hospLocation"/>
					<bind role="start" component="audio"/>
					<bind role="start" component="castelo2"/>
				</link>
				
				<context id="castelo2">
					<port id="pCastelo2" component="casteloLocation2"/>
					<property name="mandatory" value="true"/>
						<property name="occurance" value="unbounded"/>
					<property name="score" value="10"/>
		
					<media id="casteloLocation2" type="text/xml" src="church.gml"/>
		            <media id="win2" src="video.mp4"/>
		            	
					
					<link xconnector="onEnteringStart">
						<bind role="onEntering" component="casteloLocation2"/>
						<bind role="start" component="win2"/>
					</link>
				</context>
			</context>
			
			
		</switch>
	</body>
</ncl>
