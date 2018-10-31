<?xml version="1.0" encoding="ISO-8859-1"?>
<ncl id="exampleGame" xmlns="http://www.ncl.org.br/NCL3.0/EDTVProfile">
	<head>
		<ruleBase>
			<rule id="rTime1" var="legal.team" value="1" comparator="eq"/>
			<rule id="rTime2" var="legal.team" value="2" comparator="eq"/>
		</ruleBase>
		<connectorBase id="connBaseId">
			<!--<importBase alias="conn" documentURI="defaultConnBase.ncl"/>-->
			<causalConnector id="onEnteringStart">
				<simpleCondition role="onEntering"/>
				<simpleAction role="start"/>
			</causalConnector>
		</connectorBase>
	</head>
	<body>
		<port id="pEntrance1" component="times" />
		<!--port id="pEntrance2" component="hospital" interface="pHospital"/>-->
		<!--port id="pEntrance3" component="parque" interface="pParque"/>-->
		<context id="times">
			<switch id="form">
				<switchPort id="sPTimes">
					<mapping component="time1"/>
					<mapping component="time2"/>
				</switchPort>
				<bindRule constituent="time1" rule="rTime1"/>
				<bindRule constituent="time2" rule="rTime2"/>
				<context id="time1">
					<port id="pIgreja" component="igrejaLocation"/>
					<media id="igrejaLocation" type="text/xml" src="igreja.jpeg"/>
					<media id="imagem" type="igreja/jpeg" src="igreja.jpeg"/>
					<link xconnector="onEnteringStart">
						<bind role="onEntering" component="igrejaLocation"/>
						<bind role="start" component="imagem"/>
						<bind role="start" component="castelo"/>
					</link>
				</context>
				<context id="time2">
					<port id="pHospital" component="hospitalLocation"/>
					<media id="hospitalLocation" type="text/xml" src="hospital.mp3"/>
					<media id="audio" type="hospital/audio" src="hospital.mp3"/>
					<link xconnector="onEnteringStart">
						<bind role="onEntering" component="hospitalLocation"/>
						<bind role="start" component="audio"/>
						<bind role="start" component="castelo"/>
					</link>
				</context>
				<context id="castelo">
					<port id="pCastelo" component="casteloLocation"/>
					<media id="casteloLocation" type="text/xml" src="castelo.avi"/>
					<media id="video" type="castelo/avi" src="castelo.avi"/>
					<link xconnector="onEnteringStart">
						<bind role="onEntering" component="casteloLocation"/>
						<bind role="start" component="video"/>
					</link>
				</context>
			</switch>
		</context>
	</body>
</ncl>
