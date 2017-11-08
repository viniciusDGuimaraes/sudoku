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

primeiroQuadrante = "Imagens/" .. sudokuResolvido[1] .. ".png"
segundoQuadrante = "Imagens/" .. sudokuResolvido[2] .. ".png"
terceiroQuadrante = "Imagens/" .. sudokuResolvido[3] .. ".png"
quartoQuadrante = "Imagens/" .. sudokuResolvido[4] .. ".png"
quintoQuadrante = "Imagens/" .. sudokuResolvido[5] .. ".png"
sextoQuadrante = "Imagens/" .. sudokuResolvido[6] .. ".png"
setimoQuadrante = "Imagens/" .. sudokuResolvido[7] .. ".png"
oitavoQuadrante = "Imagens/" .. sudokuResolvido[8] .. ".png"
nonoQuadrante = "Imagens/" .. sudokuResolvido[9] .. ".png"


local img = canvas:new(primeiroQuadrante)
local dx, dy = img:attrSize()
local banana = { img=img, x=0, y=0, dx=dx, dy=dy }

canvas:attrColor('white')
canvas:drawRect('fill', 0,0, canvas:attrSize())
canvas:compose(banana.x, banana.y, banana.img)

local img2 = canvas:new(segundoQuadrante)
local dx, dy = img:attrSize()
local banana2 = { img2=img2, x=61, y=0, dx=dx, dy=dy }

canvas:compose(banana2.x, banana2.y, banana2.img2)

local img3 = canvas:new(terceiroQuadrante)
local dx, dy = img:attrSize()
local banana3 = { img3=img3, x=122, y=0, dx=dx, dy=dy }

canvas:compose(banana3.x, banana3.y, banana3.img3)

local img4 = canvas:new(quartoQuadrante)
local dx, dy = img:attrSize()
local banana4 = { img4=img4, x=183, y=0, dx=dx, dy=dy }

canvas:compose(banana4.x, banana4.y, banana4.img4)

local img5 = canvas:new(quintoQuadrante)
local dx, dy = img:attrSize()
local banana5 = { img5=img5, x=244, y=0, dx=dx, dy=dy }

canvas:compose(banana5.x, banana5.y, banana5.img5)

local img6 = canvas:new(sextoQuadrante)
local dx, dy = img:attrSize()
local banana6 = { img6=img6, x=305, y=0, dx=dx, dy=dy }

canvas:compose(banana6.x, banana6.y, banana6.img6)

local img7 = canvas:new(setimoQuadrante)
local dx, dy = img:attrSize()
local banana7 = { img7=img7, x=366, y=0, dx=dx, dy=dy }

canvas:compose(banana7.x, banana7.y, banana7.img7)

local img8 = canvas:new(oitavoQuadrante)
local dx, dy = img:attrSize()
local banana8 = { img8=img8, x=427, y=0, dx=dx, dy=dy }

canvas:compose(banana8.x, banana8.y, banana8.img8)

local img9 = canvas:new(nonoQuadrante)
local dx, dy = img:attrSize()
local banana9 = { img9=img9, x=488, y=0, dx=dx, dy=dy }

canvas:compose(banana9.x, banana9.y, banana9.img9)

canvas:flush()
