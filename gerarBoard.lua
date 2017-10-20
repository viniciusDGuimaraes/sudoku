function contains(num, tabela)
	for i = 1, #tabela do
		if tabela[i] == num then
			return true
		end
	end
	return false
end

function removeItem(tabela, valor)
	for i = 1, #tabela do
		if tabela[i] == valor then
			table.remove(tabela, i)
			return
		end
	end
end

function gerarRandomNum(sudoku, index)
	local candidatos = {1, 2, 3, 4, 5, 6, 7, 8, 9}

	local linha = math.floor(index/9)
	local coluna = index % 9

	local grid_x = math.floor(linha / 3) * 3
	local grid_y = math.floor(coluna / 3) * 3

	local j = 0
	while j < coluna do
		if contains(sudoku[linha * 9 + j + 1], candidatos) then
			removeItem(candidatos, sudoku[linha * 9 + j + 1])
		end
		j = j + 1
	end

	local i = 0
	while i < linha do
		if contains(sudoku[i * 9 + coluna + 1], candidatos) then
			removeItem(candidatos, sudoku[i * 9 + coluna + 1])
		end
		i = i + 1
	end

	for _i = 0, 2 do
		for _j = 0, 2 do
			if contains(sudoku[(grid_x + _i) * 9 + grid_y + _j + 1], candidatos) then
				removeItem(candidatos, sudoku[(grid_x + _i) * 9 + grid_y + _j + 1])
			end
		end
	end

	if #candidatos == 0 then
		randomNum = -1
	else
		randomNum = candidatos[math.random(#candidatos)]
		removeItem(candidatos, randomNum)
	end
	return randomNum
end

function gerarBoard()
	sudoku = {}
	for i = 1, 81 do
		table.insert(sudoku, 0)
	end

	i = 0
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

function printSudoku()
	for i = 1, #sudoku, 9 do
		print(sudoku[i] .. ' ' .. sudoku[i+1] .. ' ' .. sudoku[i+2] .. ' ' .. sudoku[i+3] .. ' ' .. sudoku[i+4] .. ' ' .. sudoku[i+5] .. ' ' .. sudoku[i+6] .. ' ' .. sudoku[i+7] .. ' ' .. sudoku[i+8])
	end
end

math.randomseed(os.time())
sudoku = gerarBoard()
printSudoku()