--Fun��o para verificar se uma tabela cont�m um certo valor
function contains(valor, tabela)
	for i = 1, #tabela do
		if tabela[i] == valor then
			return true
		end
	end
	return false
end

--Fun��o para remover um item da tabela pelo seu valor
function removeItem(tabela, valor)
	for i = 1, #tabela do
		if tabela[i] == valor then
			table.remove(tabela, i)
			return
		end
	end
end

function checkForVictory()
	for linha = 1, 9 do
		numeros = {-1}
		for coluna = 1, 9 do
			if contains(sudoku[(linha - 1) * 9 + coluna], numeros) then
				return false
			else
				table.insert(numeros, sudoku[(linha - 1) * 9 + coluna])
			end
		end
	end

	for coluna = 1, 9 do
		numeros = {-1}
		for linha = 1, 9 do
			if contains(sudoku[(linha - 1) * 9 + coluna], numeros) then
				return false
			else
				table.insert(numeros, sudoku[(linha - 1) * 9 + coluna])
			end
		end
	end

	for x = 0, 8, 3 do
		for y = 0, 8, 3 do
			for _i = 0, 2 do
				for _j = 0, 2 do
					if contains(sudoku[(x + _i) * 9 + y + _j + 1], numeros) then
						return false
					else
						table.insert(numeros, sudoku[(x + _i) * 9 +y + _j + 1])
					end
				end
			end
		end
	end

	return true
end

function gerarRandomNum(sudoku, index)
	--N�meros poss�veis para inserir no board
	local candidatos = {1, 2, 3, 4, 5, 6, 7, 8, 9}

	--Identifica as coordenadas pelo �ndice passado
	local linha = math.floor(index/9)
	local coluna = index % 9

	--Identifica a submatriz onde se encontra o �ndice
	local grid_x = math.floor(linha / 3) * 3
	local grid_y = math.floor(coluna / 3) * 3

	--Confere os n�meros da linha e remove da tabela os n�meros j� inseridos
	local j = 0
	while j < coluna do
		if contains(sudoku[linha * 9 + j + 1], candidatos) then
			removeItem(candidatos, sudoku[linha * 9 + j + 1])
		end
		j = j + 1
	end

	--Confere os n�meros da coluna e remove da tabela os n�meros j� inseridos
	local i = 0
	while i < linha do
		if contains(sudoku[i * 9 + coluna + 1], candidatos) then
			removeItem(candidatos, sudoku[i * 9 + coluna + 1])
		end
		i = i + 1
	end

	--Confere os n�meros da submatriz e remove da tabela os n�meros j� inseridos
	for _i = 0, 2 do
		for _j = 0, 2 do
			if contains(sudoku[(grid_x + _i) * 9 + grid_y + _j + 1], candidatos) then
				removeItem(candidatos, sudoku[(grid_x + _i) * 9 + grid_y + _j + 1])
			end
		end
	end

	--Se n�o houver um n�mero v�lido para ser inserido retorna -1 e zera a tabela
	if #candidatos == 0 then
		randomNum = -1
	-- Se houver pelo menos um n�mero dentro da tabela, seleciona um aleat�riamente e o remove da tabela
	else
		randomNum = candidatos[math.random(#candidatos)]
		removeItem(candidatos, randomNum)
	end
	return randomNum
end

function gerarBoard()
	-- Cria um board zerado
	sudoku = {}
	for i = 1, 81 do
		table.insert(sudoku, 0)
	end

	i = 0
	--Insere n�meros aleat�rios na tabela. Caso n�o exista um n�mero v�lido, a tabela � zerada
	while i < 81 do
		randomNum = gerarRandomNum(sudoku, i)
		if randomNum == -1 then
			for i = 1, 81 do
				sudoku[i] = 0
			end
			i = 0
		else
			sudoku[i+1] = randomNum
			i = i + 1
		end
	end
	return sudoku
end

function retirarNums()
	local quantVazios = math.random(40,42)
	local cont = 0
	while cont < quantVazios do
		local index = math.random(81)

		while sudoku[index] == 0  do
			index = math.random(81)
		end

		sudoku[index] = 0
		cont = cont + 1
	end
	return sudoku
end


math.randomseed(os.time())

sudokuResolvido = gerarBoard()

sudoku = {}

for i = 1, 81 do
	table.insert(sudoku, 0)
end

for i = 1, 81 do
	sudoku[i] = sudokuResolvido[i]
end

sudoku = retirarNums()

permitido = {}

for i = 1, 81 do
	if sudoku[i] == 0 then
		table.insert(permitido,i)
	end
end

for i = 1, #sudokuResolvido, 9 do
	print(sudokuResolvido[i] .. ' ' .. sudokuResolvido[i+1] .. ' ' .. sudokuResolvido[i+2] .. ' ' .. 
	sudokuResolvido[i+3] .. ' ' .. sudokuResolvido[i+4] .. ' ' .. sudokuResolvido[i+5] .. ' ' ..
	sudokuResolvido[i+6] .. ' ' .. sudokuResolvido[i+7] .. ' ' .. sudokuResolvido[i+8])
end

canvas:attrColor('white')
canvas:drawRect('fill', 0,0, canvas:attrSize())

local img = canvas:new("Imagens/sudoku_board.bmp")
canvas:compose(0, 0, img)

for i = 1, 81 do
	local linha = math.floor((i-1)/9)
	local coluna = (i-1) % 9
	local img = canvas:new("Imagens/" .. sudoku[i] .. ".png")
	local num = { img=img, x=coluna*61, y=linha*61 }
	canvas:compose(num.x, num.y, num.img)
end
local img = canvas:new('Imagens/cursor.png')
local cursor = { img=img, x=244, y=244 }
canvas:compose(cursor.x, cursor.y, cursor.img)
canvas:flush()

function redraw()
	canvas:attrColor('white')
	canvas:drawRect('fill', 0,0, canvas:attrSize())

	local img = canvas:new("Imagens/sudoku_board.bmp")
	canvas:compose(0, 0, img)

	for i = 1, 81 do
		local linha = math.floor((i-1)/9)
		local coluna = (i-1) % 9
		local img = canvas:new("Imagens/" .. sudoku[i] .. ".png")
		local num = { img=img, x=coluna*61, y=linha*61 }
		canvas:compose(num.x, num.y, num.img)
	end
	local img = canvas:new('Imagens/cursor.png')
	local cursor = { img=img, x=cursor.x, y=cursor.y }
	canvas:compose(cursor.x, cursor.y, cursor.img)
	canvas:flush()
end

function handler(evt)
	if (evt.class == 'key') and (evt.type == 'press') then
		if evt.key == 'CURSOR_UP' then
			if cursor.y > 0 then
				cursor.y = cursor.y - 61
			else
				cursor.y = 488
			end
		elseif evt.key == 'CURSOR_DOWN' then
			if cursor.y < 488 then
				cursor.y = cursor.y + 61
			else
				cursor.y = 0
			end
		elseif evt.key == 'CURSOR_LEFT' then
			if cursor.x > 0 then
				cursor.x = cursor.x - 61
			else
				cursor.x = 488
			end
		elseif evt.key == 'CURSOR_RIGHT' then
			if cursor.x < 488 then
				cursor.x = cursor.x + 61
			else
				cursor.x = 0
			end
		end
	end
	redraw()

	if evt.key == '1' then
		coluna = (math.floor(cursor.x/61)) + 1
		linha = math.floor(cursor.y/61)
		index = (linha * 9) + coluna
		if contains(index, permitido) then
			sudoku[index] = 1
		end
	elseif evt.key == '2' then
		coluna = (math.floor(cursor.x/61)) + 1
		linha = math.floor(cursor.y/61)
		index = (linha * 9) + coluna
		if contains(index, permitido) then
			sudoku[index] = 2
		end
	elseif evt.key == '3' then
		coluna = (math.floor(cursor.x/61)) + 1
		linha = math.floor(cursor.y/61)
		index = (linha * 9) + coluna
		if contains(index, permitido) then
			sudoku[index] = 3
		end
	elseif evt.key == '4' then
		coluna = (math.floor(cursor.x/61)) + 1
		linha = math.floor(cursor.y/61)
		index = (linha * 9) + coluna
		if contains(index, permitido) then
			sudoku[index] = 4
		end
	elseif evt.key == '5' then
		coluna = (math.floor(cursor.x/61)) + 1
		linha = math.floor(cursor.y/61)
		index = (linha * 9) + coluna
		if contains(index, permitido) then
			sudoku[index] = 5
		end
	elseif evt.key == '6' then
		coluna = (math.floor(cursor.x/61)) + 1
		linha = math.floor(cursor.y/61)
		index = (linha * 9) + coluna
		if contains(index, permitido) then
			sudoku[index] = 6
		end
	elseif evt.key == '7' then
		coluna = (math.floor(cursor.x/61)) + 1
		linha = math.floor(cursor.y/61)
		index = (linha * 9) + coluna
		if contains(index, permitido) then
			sudoku[index] = 7
		end
	elseif evt.key == '8' then
		coluna = (math.floor(cursor.x/61)) + 1
		linha = math.floor(cursor.y/61)
		index = (linha * 9) + coluna
		if contains(index, permitido) then
			sudoku[index] = 8
		end
	elseif evt.key == '9' then
		coluna = (math.floor(cursor.x/61)) + 1
		linha = math.floor(cursor.y/61)
		index = (linha * 9) + coluna
		if contains(index, permitido) then
			sudoku[index] = 9
		end
	elseif evt.key == '0' then
		coluna = (math.floor(cursor.x/61)) + 1
		linha = math.floor(cursor.y/61)
		index = (linha * 9) + coluna
		if contains(index, permitido) then
			sudoku[index] = 0
		end
	end
	redraw()
	if checkForVictory() then
		print('Você venceu')
	end
end
event.register(handler)