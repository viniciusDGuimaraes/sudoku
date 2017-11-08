<?xml version="1.0" encoding="ISO-8859-1"?>
<ncl id="main" xmlns="http://www.ncl.org.br/NCL3.0/EDTVProfile">
	<head>
		<regionBase>
			<region id="rgFullScreen" left="0" top="0" width="800" height="600" zIndex="0"/>
			<region id="rgBoard" top="25" left="125" width="550" height="550" zIndex="1">
				<region id="rgQuadro11" top="1%" width="10%" height="10%"/> 
			</region>
		</regionBase>
		<descriptorBase>
			<descriptor id="dsFullScreen" region="rgFullScreen"/>
			<descriptor id="dsBoard" region="rgBoard"/>
			<descriptor id="dsQuadro11" region="rgQuadro11" focusIndex="2" moveUp="73" moveDown="11" moveLeft="81" moveRight="3" focusBoardColor="red"/>
		</descriptorBase>
		<connectorBase>
			<causalConnector id="onBeginStart">
				<simpleCondition role="onBegin"/>
				<simpleAction role="start"/>
			</causalConnector>
		</connectorBase>
	</head>
	<body>
		<port id="pFundo" component="fundo"/>
		<media id="fundo" src="Imagens/blank.gif" descriptor="dsFullScreen"/>

		<port id="pTabuleiro" component="tabuleiro"/>
		<media id="tabuleiro" src="Imagens/sudoku_board.bmp" descriptor="dsBoard"/>
		
		<port id="pTabuleiro" component="gerarBoard"/>
		<media id="gerarBoard" src="gerarBoard.lua" descriptor="dsBoard"/>

		<port id="p1" component="1"/>
		<media id="1" src="Imagens/0.png" descriptor="dsQuadro11"/>

		<link xconnector="onBeginStart">
			<bind role="onBegin" component="tabuleiro"/>
			<bind role="start" component="gerarBoard"/>
		</link>


        <!--<media id="gerarBoard" src="gerarBoard.lua" descriptor="dsLuaBase"/>

		<link xconnector="onBeginStart">
			<bind role="onBegin" component="tabuleiro"/>
			<bind role="start" component="gerarBoard"/>
		</link> -->
	</body>
</ncl>
