function contains(num, tabela)
	for i = 1, #tabela do
		if tabela[i] == num
			return true
	end
	return false
end

function gerarRandomNum(sudoku, index)
	candidatos = {1, 2, 3, 4, 5, 6, 7, 8, 9}
	
	linha = index / 9
	coluna = index % 9

	grid_x = linha / 3 * 3
	grid_y = coluna / 3 * 3

	j = 0
	while j < coluna do
		if contains(sudoku[linha * 9 + j], candidatos) then
			table.remove(candidatos, sudoku[linha * 9 + j])
		end
		j = j + 1
	end

	i = 0
	while i < linha do
		if contains(sudoku[i * 9 + coluna], candidatos) then
			table.remove(candidatos, sudoku[i * 9 + coluna])
		end
		i = i + 1
	end

	for _i = 0, 3 do
		for _j = 0, 3 do
			if contains(sudoku[(grid_x + _i) * 9 + grid_y + _j], candidatos) then
				table.remove(candidatos, sudoku[(grid_x + _i) * 9 + grid_y + _j])
			end
		end
	end

	if #candidatos == 0 then
		randomNum = -1
	else
		randomNum = math.random(#candidatos)
		table.remove(candidatos, randomNum)
	end
	
	return randomNum
end

function gerarBoard()
	sudoku = {}
	for i = 0, 81 do
		table.insert(sudoku, 0)
	end

	i = 0
	while i < 81 do
		randomNum = gerarRandomNum(sudoku, i)
		if randomNum == -1 then
			for i = 0, 81 do
				table.insert(sudoku, 0)
			end
			i = 0
		else
			sudoku[i] = randomNum
			i = i + 1
	end
	return sudoku
end