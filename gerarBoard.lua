--Função para verificar se uma tabela contém um certo valor
function contains(valor, tabela)
	for i = 1, #tabela do
		if tabela[i] == valor then
			return true
		end
	end
	return false
end

--Função para remover um item da tabela pelo seu valor
function removeItem(tabela, valor)
	for i = 1, #tabela do
		if tabela[i] == valor then
			table.remove(tabela, i)
			return
		end
	end
end

function gerarRandomNum(sudoku, index)
	--Números possíveis para inserir no board
	local candidatos = {1, 2, 3, 4, 5, 6, 7, 8, 9}

	--Identifica as coordenadas pelo índice passado
	local linha = math.floor(index/9)
	local coluna = index % 9

	--Identifica a submatriz onde se encontra o índice
	local grid_x = math.floor(linha / 3) * 3
	local grid_y = math.floor(coluna / 3) * 3

	--Confere os números da linha e remove da tabela os números já inseridos
	local j = 0
	while j < coluna do
		if contains(sudoku[linha * 9 + j + 1], candidatos) then
			removeItem(candidatos, sudoku[linha * 9 + j + 1])
		end
		j = j + 1
	end

	--Confere os números da coluna e remove da tabela os números já inseridos
	local i = 0
	while i < linha do
		if contains(sudoku[i * 9 + coluna + 1], candidatos) then
			removeItem(candidatos, sudoku[i * 9 + coluna + 1])
		end
		i = i + 1
	end

	--Confere os números da submatriz e remove da tabela os números já inseridos
	for _i = 0, 2 do
		for _j = 0, 2 do
			if contains(sudoku[(grid_x + _i) * 9 + grid_y + _j + 1], candidatos) then
				removeItem(candidatos, sudoku[(grid_x + _i) * 9 + grid_y + _j + 1])
			end
		end
	end

	--Se não houver um número válido para ser inserido retorna -1 e zera a tabela
	if #candidatos == 0 then
		randomNum = -1
	-- Se houver pelo menos um número dentro da tabela, seleciona um aleatóriamente e o remove da tabela
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
	--Insere números aleatórios na tabela. Caso não exista um número válido, a tabela é zerada
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

local img = canvas:new('Imagens/1.png')
local dx, dy = img:attrSize()
local banana = { img=img, x=0, y=0, dx=dx, dy=dy }

canvas:attrColor('white')
canvas:drawRect('fill', 0,0, canvas:attrSize())
canvas:compose(banana.x, banana.y, banana.img)

local img2 = canvas:new('Imagens/2.png')
local dx, dy = img:attrSize()
local banana2 = { img2=img2, x=55, y=0, dx=dx, dy=dy }

canvas:compose(banana2.x, banana2.y, banana2.img2)
canvas:flush()
