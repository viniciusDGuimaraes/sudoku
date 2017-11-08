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

for i = 1, #sudoku, 9 do
	print(sudoku[i] .. ' ' .. sudoku[i+1] .. ' ' .. sudoku[i+2] .. ' ' .. 
	sudoku[i+3] .. ' ' .. sudoku[i+4] .. ' ' .. sudoku[i+5] .. ' ' ..
	sudoku[i+6] .. ' ' .. sudoku[i+7] .. ' ' .. sudoku[i+8])
end

q1 = "Imagens/" .. sudoku[1] .. ".png"
q2 = "Imagens/" .. sudoku[2] .. ".png"
q3 = "Imagens/" .. sudoku[3] .. ".png"
q4 = "Imagens/" .. sudoku[4] .. ".png"
q5 = "Imagens/" .. sudoku[5] .. ".png"
q6 = "Imagens/" .. sudoku[6] .. ".png"
q7 = "Imagens/" .. sudoku[7] .. ".png"
q8 = "Imagens/" .. sudoku[8] .. ".png"
q9 = "Imagens/" .. sudoku[9] .. ".png"
q10 = "Imagens/" .. sudoku[10] .. ".png"
q11 = "Imagens/" .. sudoku[11] .. ".png"
q12 = "Imagens/" .. sudoku[12] .. ".png"
q13 = "Imagens/" .. sudoku[13] .. ".png"
q14 = "Imagens/" .. sudoku[14] .. ".png"
q15 = "Imagens/" .. sudoku[15] .. ".png"
q16 = "Imagens/" .. sudoku[16] .. ".png"
q17 = "Imagens/" .. sudoku[17] .. ".png"
q18 = "Imagens/" .. sudoku[18] .. ".png"
q19 = "Imagens/" .. sudoku[19] .. ".png"
q20 = "Imagens/" .. sudoku[20] .. ".png"
q21 = "Imagens/" .. sudoku[21] .. ".png"
q22 = "Imagens/" .. sudoku[22] .. ".png"
q23 = "Imagens/" .. sudoku[23] .. ".png"
q24 = "Imagens/" .. sudoku[24] .. ".png"
q25 = "Imagens/" .. sudoku[25] .. ".png"
q26 = "Imagens/" .. sudoku[26] .. ".png"
q27 = "Imagens/" .. sudoku[27] .. ".png"
q28 = "Imagens/" .. sudoku[28] .. ".png"
q29 = "Imagens/" .. sudoku[29] .. ".png"
q30 = "Imagens/" .. sudoku[30] .. ".png"
q31 = "Imagens/" .. sudoku[31] .. ".png"
q32 = "Imagens/" .. sudoku[32] .. ".png"
q33 = "Imagens/" .. sudoku[33] .. ".png"
q34 = "Imagens/" .. sudoku[34] .. ".png"
q35 = "Imagens/" .. sudoku[35] .. ".png"
q36 = "Imagens/" .. sudoku[36] .. ".png"
q37 = "Imagens/" .. sudoku[37] .. ".png"
q38 = "Imagens/" .. sudoku[38] .. ".png"
q39 = "Imagens/" .. sudoku[39] .. ".png"
q40 = "Imagens/" .. sudoku[40] .. ".png"
q41 = "Imagens/" .. sudoku[41] .. ".png"
q42 = "Imagens/" .. sudoku[42] .. ".png"
q43 = "Imagens/" .. sudoku[43] .. ".png"
q44 = "Imagens/" .. sudoku[44] .. ".png"
q45 = "Imagens/" .. sudoku[45] .. ".png"
q46 = "Imagens/" .. sudoku[46] .. ".png"
q47 = "Imagens/" .. sudoku[47] .. ".png"
q48 = "Imagens/" .. sudoku[48] .. ".png"
q49 = "Imagens/" .. sudoku[49] .. ".png"
q50 = "Imagens/" .. sudoku[50] .. ".png"
q51 = "Imagens/" .. sudoku[51] .. ".png"
q52 = "Imagens/" .. sudoku[52] .. ".png"
q53 = "Imagens/" .. sudoku[53] .. ".png"
q54 = "Imagens/" .. sudoku[54] .. ".png"
q55 = "Imagens/" .. sudoku[55] .. ".png"
q56 = "Imagens/" .. sudoku[56] .. ".png"
q57 = "Imagens/" .. sudoku[57] .. ".png"
q58 = "Imagens/" .. sudoku[58] .. ".png"
q59 = "Imagens/" .. sudoku[59] .. ".png"
q60 = "Imagens/" .. sudoku[60] .. ".png"
q61 = "Imagens/" .. sudoku[61] .. ".png"
q62 = "Imagens/" .. sudoku[62] .. ".png"
q63 = "Imagens/" .. sudoku[63] .. ".png"
q64 = "Imagens/" .. sudoku[64] .. ".png"
q65 = "Imagens/" .. sudoku[65] .. ".png"
q66 = "Imagens/" .. sudoku[66] .. ".png"
q67 = "Imagens/" .. sudoku[67] .. ".png"
q68 = "Imagens/" .. sudoku[68] .. ".png"
q69 = "Imagens/" .. sudoku[69] .. ".png"
q70 = "Imagens/" .. sudoku[70] .. ".png"
q71 = "Imagens/" .. sudoku[71] .. ".png"
q72 = "Imagens/" .. sudoku[72] .. ".png"
q73 = "Imagens/" .. sudoku[73] .. ".png"
q74 = "Imagens/" .. sudoku[74] .. ".png"
q75 = "Imagens/" .. sudoku[75] .. ".png"
q76 = "Imagens/" .. sudoku[76] .. ".png"
q77 = "Imagens/" .. sudoku[77] .. ".png"
q78 = "Imagens/" .. sudoku[78] .. ".png"
q79 = "Imagens/" .. sudoku[79] .. ".png"
q80 = "Imagens/" .. sudoku[80] .. ".png"
q81 = "Imagens/" .. sudoku[81] .. ".png"


canvas:attrColor('white')
canvas:drawRect('fill', 0,0, canvas:attrSize())

local img1 = canvas:new(q1)
local num1 = { img1=img1, x=0, y=0 }
canvas:compose(num1.x, num1.y, num1.img1)

local img2 = canvas:new(q2)
local num2 = { img2=img2, x=61, y=0 }
canvas:compose(num2.x, num2.y, num2.img2)

local img3 = canvas:new(q3)
local num3 = { img3=img3, x=122, y=0 }
canvas:compose(num3.x, num3.y, num3.img3)

local img4 = canvas:new(q4)
local num4 = { img4=img4, x=183, y=0 }
canvas:compose(num4.x, num4.y, num4.img4)

local img5 = canvas:new(q5)
local num5 = { img5=img5, x=244, y=0 }
canvas:compose(num5.x, num5.y, num5.img5)

local img6 = canvas:new(q6)
local num6 = { img6=img6, x=305, y=0 }
canvas:compose(num6.x, num6.y, num6.img6)

local img7 = canvas:new(q7)
local num7 = { img7=img7, x=366, y=0 }
canvas:compose(num7.x, num7.y, num7.img7)

local img8 = canvas:new(q8)
local num8 = { img8=img8, x=427, y=0 }
canvas:compose(num8.x, num8.y, num8.img8)

local img9 = canvas:new(q9)
local num9 = { img9=img9, x=488, y=0 }
canvas:compose(num9.x, num9.y, num9.img9)

local img10 = canvas:new(q10)
local num10 = { img10=img10, x=0, y=61 }
canvas:compose(num10.x, num10.y, num10.img10)

local img11 = canvas:new(q11)
local num11 = { img11=img11, x=61, y=61 }
canvas:compose(num11.x, num11.y, num11.img11)

local img12 = canvas:new(q12)
local num12 = { img12=img12, x=122, y=61 }
canvas:compose(num12.x, num12.y, num12.img12)

local img13 = canvas:new(q13)
local num13 = { img13=img13, x=183, y=61 }
canvas:compose(num13.x, num13.y, num13.img13)

local img14 = canvas:new(q14)
local num14 = { img14=img14, x=244, y=61 }
canvas:compose(num14.x, num14.y, num14.img14)

local img15 = canvas:new(q15)
local num15 = { img15=img15, x=305, y=61 }
canvas:compose(num15.x, num15.y, num15.img15)

local img16 = canvas:new(q16)
local num16 = { img16=img16, x=366, y=61 }
canvas:compose(num16.x, num16.y, num16.img16)

local img17 = canvas:new(q17)
local num17 = { img17=img17, x=427, y=61 }
canvas:compose(num17.x, num17.y, num17.img17)

local img18 = canvas:new(q18)
local num18 = { img18=img18, x=488, y=61 }
canvas:compose(num18.x, num18.y, num18.img18)

local img19 = canvas:new(q19)
local num19 = { img19=img19, x=0, y=122 }
canvas:compose(num19.x, num19.y, num19.img19)

local img20 = canvas:new(q20)
local num20 = { img20=img20, x=61, y=122 }
canvas:compose(num20.x, num20.y, num20.img20)

local img21 = canvas:new(q21)
local num21 = { img21=img21, x=122, y=122 }
canvas:compose(num21.x, num21.y, num21.img21)

local img22 = canvas:new(q22)
local num22 = { img22=img22, x=183, y=122 }
canvas:compose(num22.x, num22.y, num22.img22)

local img23 = canvas:new(q23)
local num23 = { img23=img23, x=244, y=122 }
canvas:compose(num23.x, num23.y, num23.img23)

local img24 = canvas:new(q24)
local num24 = { img24=img24, x=305, y=122 }
canvas:compose(num24.x, num24.y, num24.img24)

local img25 = canvas:new(q25)
local num25 = { img25=img25, x=366, y=122 }
canvas:compose(num25.x, num25.y, num25.img25)

local img26 = canvas:new(q26)
local num26 = { img26=img26, x=427, y=122 }
canvas:compose(num26.x, num26.y, num26.img26)

local img27 = canvas:new(q27)
local num27 = { img27=img27, x=488, y=122 }
canvas:compose(num27.x, num27.y, num27.img27)

local img28 = canvas:new(q28)
local num28 = { img28=img28, x=0, y=183 }
canvas:compose(num28.x, num28.y, num28.img28)

local img29 = canvas:new(q29)
local num29 = { img29=img29, x=61, y=183 }
canvas:compose(num29.x, num29.y, num29.img29)

local img30 = canvas:new(q30)
local num30 = { img30=img30, x=122, y=183 }
canvas:compose(num30.x, num30.y, num30.img30)

local img31 = canvas:new(q31)
local num31 = { img31=img31, x=183, y=183 }
canvas:compose(num31.x, num31.y, num31.img31)

local img32 = canvas:new(q32)
local num32 = { img32=img32, x=244, y=183 }
canvas:compose(num32.x, num32.y, num32.img32)

local img33 = canvas:new(q33)
local num33 = { img33=img33, x=305, y=183 }
canvas:compose(num33.x, num33.y, num33.img33)

local img34 = canvas:new(q34)
local num34 = { img34=img34, x=366, y=183 }
canvas:compose(num34.x, num34.y, num34.img34)

local img35 = canvas:new(q35)
local num35 = { img35=img35, x=427, y=183 }
canvas:compose(num35.x, num35.y, num35.img35)

local img36 = canvas:new(q36)
local num36 = { img36=img36, x=488, y=183 }
canvas:compose(num36.x, num36.y, num36.img36)

local img37 = canvas:new(q37)
local num37 = { img37=img37, x=0, y=244 }
canvas:compose(num37.x, num37.y, num37.img37)

local img38 = canvas:new(q38)
local num38 = { img38=img38, x=61, y=244 }
canvas:compose(num38.x, num38.y, num38.img38)

local img39 = canvas:new(q39)
local num39 = { img39=img39, x=122, y=244 }
canvas:compose(num39.x, num39.y, num39.img39)

local img40 = canvas:new(q40)
local num40 = { img40=img40, x=183, y=244 }
canvas:compose(num40.x, num40.y, num40.img40)

local img41 = canvas:new(q41)
local num41 = { img41=img41, x=244, y=244 }
canvas:compose(num41.x, num41.y, num41.img41)

local img42 = canvas:new(q42)
local num42 = { img42=img42, x=305, y=244 }
canvas:compose(num42.x, num42.y, num42.img42)

local img43 = canvas:new(q43)
local num43 = { img43=img43, x=366, y=244 }
canvas:compose(num43.x, num43.y, num43.img43)

local img44 = canvas:new(q44)
local num44 = { img44=img44, x=427, y=244 }
canvas:compose(num44.x, num44.y, num44.img44)

local img45 = canvas:new(q45)
local num45 = { img45=img45, x=488, y=244 }
canvas:compose(num45.x, num45.y, num45.img45)

local img46 = canvas:new(q46)
local num46 = { img46=img46, x=0, y=305 }
canvas:compose(num46.x, num46.y, num46.img46)

local img47 = canvas:new(q47)
local num47 = { img47=img47, x=61, y=305 }
canvas:compose(num47.x, num47.y, num47.img47)

local img48 = canvas:new(q48)
local num48 = { img48=img48, x=122, y=305 }
canvas:compose(num48.x, num48.y, num48.img48)

local img49 = canvas:new(q49)
local num49 = { img49=img49, x=183, y=305 }
canvas:compose(num49.x, num49.y, num49.img49)

local img50 = canvas:new(q50)
local num50 = { img50=img50, x=244, y=305 }
canvas:compose(num50.x, num50.y, num50.img50)

local img51 = canvas:new(q51)
local num51 = { img51=img51, x=305, y=305 }
canvas:compose(num51.x, num51.y, num51.img51)

local img52 = canvas:new(q52)
local num52 = { img52=img52, x=366, y=305 }
canvas:compose(num52.x, num52.y, num52.img52)

local img53 = canvas:new(q53)
local num53 = { img53=img53, x=427, y=305 }
canvas:compose(num53.x, num53.y, num53.img53)

local img54 = canvas:new(q54)
local num54 = { img54=img54, x=488, y=305 }
canvas:compose(num54.x, num54.y, num54.img54)

local img55 = canvas:new(q55)
local num55 = { img55=img55, x=0, y=366 }
canvas:compose(num55.x, num55.y, num55.img55)

local img56 = canvas:new(q56)
local num56 = { img56=img56, x=61, y=366 }
canvas:compose(num56.x, num56.y, num56.img56)

local img57 = canvas:new(q57)
local num57 = { img57=img57, x=122, y=366 }
canvas:compose(num57.x, num57.y, num57.img57)

local img58 = canvas:new(q58)
local num58 = { img58=img58, x=183, y=366 }
canvas:compose(num58.x, num58.y, num58.img58)

local img59 = canvas:new(q59)
local num59 = { img59=img59, x=244, y=366 }
canvas:compose(num59.x, num59.y, num59.img59)

local img60 = canvas:new(q60)
local num60 = { img60=img60, x=305, y=366 }
canvas:compose(num60.x, num60.y, num60.img60)

local img61 = canvas:new(q61)
local num61 = { img61=img61, x=366, y=366 }
canvas:compose(num61.x, num61.y, num61.img61)

local img62 = canvas:new(q62)
local num62 = { img62=img62, x=427, y=366 }
canvas:compose(num62.x, num62.y, num62.img62)

local img63 = canvas:new(q63)
local num63 = { img63=img63, x=488, y=366 }
canvas:compose(num63.x, num63.y, num63.img63)

local img64 = canvas:new(q64)
local num64 = { img64=img64, x=0, y=427 }
canvas:compose(num64.x, num64.y, num64.img64)

local img65 = canvas:new(q65)
local num65 = { img65=img65, x=61, y=427 }
canvas:compose(num65.x, num65.y, num65.img65)

local img66 = canvas:new(q66)
local num66 = { img66=img66, x=122, y=427 }
canvas:compose(num66.x, num66.y, num66.img66)

local img67 = canvas:new(q67)
local num67 = { img67=img67, x=183, y=427 }
canvas:compose(num67.x, num67.y, num67.img67)

local img68 = canvas:new(q68)
local num68 = { img68=img68, x=244, y=427 }
canvas:compose(num68.x, num68.y, num68.img68)

local img69 = canvas:new(q69)
local num69 = { img69=img69, x=305, y=427 }
canvas:compose(num69.x, num69.y, num69.img69)

local img70 = canvas:new(q70)
local num70 = { img70=img70, x=366, y=427 }
canvas:compose(num70.x, num70.y, num70.img70)

local img71 = canvas:new(q71)
local num71 = { img71=img71, x=427, y=427 }
canvas:compose(num71.x, num71.y, num71.img71)

local img72 = canvas:new(q72)
local num72 = { img72=img72, x=488, y=427 }
canvas:compose(num72.x, num72.y, num72.img72)


local img73 = canvas:new(q73)
local num73 = { img73=img73, x=0, y=488 }
canvas:compose(num73.x, num73.y, num73.img73)

local img74 = canvas:new(q74)
local num74 = { img74=img74, x=61, y=488 }
canvas:compose(num74.x, num74.y, num74.img74)

local img75 = canvas:new(q75)
local num75 = { img75=img75, x=122, y=488 }
canvas:compose(num75.x, num75.y, num75.img75)

local img76 = canvas:new(q76)
local num76 = { img76=img76, x=183, y=488 }
canvas:compose(num76.x, num76.y, num76.img76)

local img77 = canvas:new(q77)
local num77 = { img77=img77, x=244, y=488 }
canvas:compose(num77.x, num77.y, num77.img77)

local img78 = canvas:new(q78)
local num78 = { img78=img78, x=305, y=488 }
canvas:compose(num78.x, num78.y, num78.img78)

local img79 = canvas:new(q79)
local num79 = { img79=img79, x=366, y=488 }
canvas:compose(num79.x, num79.y, num79.img79)

local img80 = canvas:new(q80)
local num80 = { img80=img80, x=427, y=488 }
canvas:compose(num80.x, num80.y, num80.img80)

local img81 = canvas:new(q81)
local num81 = { img81=img81, x=488, y=488 }
canvas:compose(num81.x, num81.y, num81.img81)

canvas:flush()


