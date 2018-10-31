<?xml version="1.0" encoding="ISO-8859-1"?>
<ncl id="exampleGame" xmlns="http://www.ncl.org.br/NCL3.0/EDTVProfile">
	<head>
		<connectorBase id="connBaseId">
			<!--<importBase alias="conn" documentURI="defaultConnBase.ncl"/>-->
			<causalConnector id="onEnteringStart">
				<simpleCondition role="onEntering"/>
				<simpleAction role="start" />
			</causalConnector>
		</connectorBase>
	</head>
	<body>
		<port id="pEntrance1" component="church" interface="pChurch"/>
		<!--port id="pEntrance2" component="hospital" interface="pHospital"/>-->
		<!--port id="pEntrance3" component="parque" interface="pParque"/>-->
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
			<port id="phospital" component="hospitalLocation"/>
			<property name="mandatory" value="true"/>
			<property name="occurance" value="unbounded"/>
			<property name="score" value="10"/>

			<media id="hospitalLocation" type="text/xml" src="hospital.jpeg"/>
            <media id="imagem" type="imagem/jpeg" src="imagem.jpeg"/>
			
			<link xconnector="onEnteringStart">
				<bind role="onEntering" component="hospitalLocation"/>
				<bind role="start" component="imagem"/>
				<bind role="start" component="parque"/>
			</link>
		</context>
		
		<context id="parque">
			<port id="pParque" component="parqueLocation"/>
			<property name="mandatory" value="true"/>
			<property name="occurance" value="unbounded"/>
			<property name="score" value="10"/>

			<media id="parqueLocation" type="text/xml" src="parque.obj"/>
            <media id="objeto" type="parque/obj" src="parque.obj"/>
			
			<link xconnector="onEnteringStart">
				<bind role="onEntering" component="parqueLocation"/>
				<bind role="start" component="objeto"/>
			</link>
		</context>

	</body>
</ncl>

