<?xml version="1.0" encoding="ISO-8859-1"?>
<ncl id="main" xmlns="http://www.ncl.org.br/NCL3.0/EDTVProfile">
	<head>
		<regionBase>
			<region id="rgFullScreen" left="0" top="0" width="800" height="600" zIndex="0"/>
			<region id="rgBoard" top="25" left="125" width="549" height="549" zIndex="1"/>
			<region id="rgLua" top="25" left="125" width="549" height="549" zIndex="2"/>
		</regionBase>
		<descriptorBase>
			<descriptor id="dsFullScreen" region="rgFullScreen"/>
			<descriptor id="dsBoard" region="rgBoard"/>
			<descriptor id="dsLua" region="rgLua"/>
		</descriptorBase>
		<connectorBase>
			<causalConnector id="onBeginStart">
				<simpleCondition role="onBegin"/>
				<simpleAction role="start"/>
			</causalConnector>
			<causalConnector id="onKeySelectionStopNStartN">
				<connectorParam name="keyCode"/>
				<simpleCondition role="onSelection" key="$keyCode"/>
				<compoundAction operator="seq">
					<simpleAction role="stop" max="unbounded" qualifier="par"/>
					<simpleAction role="start" max="unbounded" qualifier="par"/>
				</compoundAction>
			</causalConnector>
		</connectorBase>
	</head>
	<body>
		<port id="pFundo" component="fundo"/>
		<media id="fundo" src="Imagens/blank.gif" descriptor="dsFullScreen"/>

		<port id="pTabuleiro" component="tabuleiro"/>
		<media id="tabuleiro" src="Imagens/sudoku_board.bmp" descriptor="dsBoard"/>
		
		<port id="pTabuleiro" component="gerarBoard"/>
		<media id="gerarBoard" src="gerarBoard.lua" descriptor="dsLua"/>
		
		<!--<port id="entryPoint" component="lua"/>
		<media type="application/x-ginga-settings" id="programSettings">
        	<property name="service.currentKeyMaster" value="luaIdx"/>
		</media>-->

		<link xconnector="onBeginStart">
			<bind role="onBegin" component="tabuleiro"/>
			<bind role="start" component="gerarBoard"/>
		</link>

		<link xconnector="onKeySelectionStopNStartN">
			<linkParam name="keyCode" value="BLUE"/>
			<bind role="onSelection" component="tabuleiro"/>
			<bind role="stop" component="gerarBoard"/>
			<bind role="stop" component="tabuleiro"/>
			<bind role="stop" component="fundo"/>
			<bind role="start" component="gerarBoard"/>
			<bind role="start" component="tabuleiro"/>
			<bind role="start" component="fundo"/>
		</link>
	</body>
</ncl>

