<?xml version="1.0" encoding="ISO-8859-1" ?>

<ncl id="exampleGame" xmlns="http://wwwl.ncl.prg-br/NCL3.0/EDTVProfile">
    <head>
        <connectorBase id="connBaseId" >
        <importBase alias="conn" documentURI="defaultConnBase.ncl" />
        </connectorBase>
    </head>

    <body>
        <port id="pEntrance1" component="church" interface="pChurch"/>

        <context id="church" >
            <port id="pChurch" component="churchLocation" />
            <property name="mandatory" value="true" />
            <property name="occurance" value="unbounded" />
            <property name="score" value="10" />

            <media id="churchLocation" type="text/xml" src="church.gml" />
            <media id="video" type="video/mpeg" src="video.mpeg" />

            <link xconnector="onEnteringStartN" >
                <bind role="onEntering" component="churchLocation" />
                <bind role="start" component="video" />
                <bind role="start" component="pHospital" />
            </link>
        </context>

        <context id="hospital" >
            <port id="pHospital" component="hospitalLocation" />

            <media id="hospitalLocation" type="text/xml" src="hospital.gml" />
            <media id="image" type="image/png" src="image.png" />

            <link xconnector="onEnteringStartN" >
                <bind role="onEntering" component="hospitalLocation" />
                <bind role="start" component="image" />
                <bind role="start" component="pPark" />
            </link>
        </context>

        <context id="park" >
            <port id="pPark" component="parkLocation" />

            <media id="parkLocation" type="text/xml" src="park.gml" />
            <media id="3dObject" type="text/plain" src="object.ojg" >
                <property name="mtl" value="a.mtl" />
                <property name="texture" value="a.png" />
            </media>

            <link xconnector="onEnteringStartN" >
                <bind role="onEntering" component="parkLocation" />
                <bind role="start" component="3dObject" />
            </link>

        </context>

    </body>
</ncl>
