<?xml version="1.0" encoding="ISO-8859-1" ?>

<ncl id="exampleGame" xmlns="http://wwwl.ncl.prg-br/NCL3.0/EDTVProfile">
    <head>
        <ruleBase>
            <rule comparator="eq" id="t1" value="true" var="chegou" />
            <rule comparator="eq" id="t2" value="true" var="chegou" />
        </ruleBase>
        <connectorBase id="connBaseId" >
        <importBase alias="conn" documentURI="defaultConnBase.ncl" />
        </connectorBase>

    </head>

    <body>

        <switch id="switch1" >
            <switchPort id="spForm" >
                <mapping component="pChurch" />
                <mapping component="pHospital" />
            </switchPort>

            <bindRule constituent="pChurch" rule="t1" />
            <bindRule constituent="pHospital" rule="t2" />

            <context id="church" >
                <port id="pChurch" component="churchLocation" />

                <media id="churchLocation" type="text/xml" src="church.gml" />
                <media id="imagem" type="image/png" src="image.png" />

                <link xconnector="onEnteringStartN">
                    <bind role="onEntering" component="churchLocation" />
                    <bind role="start" component="imagem" />
                    <bind role="start" component="pCastle" />
                </link>
            </context>

            <context id="hospital" >
                <port id="pHospital" component="hospitalLocation" />

                <media id="hospitalLocation" type="text/xml" src="hospital.gml" />
                <media id="audio" type="audio.mp3" src="audio.mp3" />

                <link xconnector="onEnteringStartN">
                    <bind role="onEntering" component="hospitalLocation" />
                    <bind role="start" component="audio" />
                    <bind role="start" component="pCastle" />
                </link>
            </context>

            <context id="castle" >
                <port id="pCastle" component="castleLocation" />

                <media id="castleLocation" type="text/xml" src="castle.gml" />
                <media id="video" type="video/mpeg" src="video.mpeg" />
            </context>
        </switch>

    </body>
</ncl>

