local composer = require( "composer" )
local scene = composer.newScene()

centerX = display.contentCenterX --相對X
centerY = display.contentCenterY --相對Y
local MouseX = 0--紀錄滑鼠用1
local MouseX2 = 0--紀錄滑鼠用2
local switch_chara = 0 --角色切換次數用
local switch_random = 0--隨機
local bgInt = 0 -- 圖檔數字
local tesInt = nil --段落
local tesRe = 1 -- 文字位元點
local newText = "" -- 文字暫存
local switch_bool = false -- 切換場景用開關
local switch_RL = false -- 判斷切換位置
local itemInt = 0--身上物品數量
local storyMode = false --開始劇情時停止按鍵動作
local wallGraffiti = false --是否看見牆上塗鴉
local passNoteGet = false -- 是否獲得密碼筆記本
local clearPassNote = false -- 是否破解密碼

local pass={
	[0] = false,
	[1] = false,
	[2] = false,
	[3] = false,
	[4] = false,
	[5] = false,
	[6] = false,
	[7] = false,
	[8] = false,
	[9] = false,
}

local tes =
{
	[0] = "在熟悉的房間裡醒來",
	[1] = "明明還是自己的房間",
	[2] = "卻總覺得有些不同",
	[3] = "",
	[4] = "筆記本？怎麼會在這",
	[5] = "【獲得日記本】",

	[7] = "這不是我的筆記本",
	[8] = "而且貌似需要密碼",
	[9] = "先找找看有沒有線索好了",

	[11] = "真是的！誰在這裡亂塗鴉啦",
	[12] = "不過這些數字和英文好像跟筆記本有關",
	[13] = "記一下吧",

	[15] = "小時候有那麼一次",
	[16] = "全家人開開心心的一起去了遊樂園",
	[17] = "這是那時候留下的照片",
	[18] = "",
	[19] = "好像還有其他照片的樣子",
	[20] = "去翻一下相簿吧",

	[22] = "好像不是這樣，在思考一下好了",

	[24] = "阿！打開了",
	[25] = "雖然筆記本裡面一些字看不清楚",
	[26] = "不過有幾篇勉強能看懂",
	[27] = "",
	[28] = "５月６日",
	[29] = "今天爸爸帶著我們一起去了遊樂園",
	[30] = "媽媽還買了我最喜歡的娃娃給我",
	[31] = "最後我們一起在大門前拍了一張照片！",
	[32] = "",
	[33] = "８月３０日",
	[34] = "就跟他說不要搶了！",
	[35] = "我最喜歡的熊娃娃都快壞掉了！",
	[36] = "害我還要檢查有沒有哪裡被拉壞",
	[37] = "最討厭弟弟了",
	[38] = "",
	[39] = "１０月１５日",
	[40] = "天氣開始變冷了",
	[41] = "前幾天好不容易開花的小花",
	[42] = "也耐不住寒冷開始枯萎了",
	[43] = "要是再多注意澆水就好了",
	[44] = "",
	[45] = "１月１３日",
	[46] = "得到媽媽的稱讚了",
	[47] = "雖然只是簡單的積木組",
	[48] = "不過感覺好開心！",

	[50] = "",
}

--------------------------------------------------------------------
local bg = {--載入背景
	[0] = display.newImage("Image/Bg/1.png",centerX,centerY),
	[1] = display.newImage("Image/Bg/2.png",centerX,centerY),
	[2] = display.newImage("Image/Bg/3.png",centerX,centerY),
	[3] = display.newImage("Image/Bg/4.png",centerX,centerY),
	[4] = display.newImage("Image/Bg/5.png",centerX*3,centerY)
}
for i = 0 , 4 do
	bg[i].width = centerX*2
	bg[i].height = centerY*2
	if i~=0 and i~=4 then
		bg[i].alpha = 0
	end
end

local bleed = display.newImage("Image/Bg/5.png",centerX,centerY)--多於邊界
	bleed.width = centerX*4
	bleed.height = centerY*4
local textBox = display.newImage("Image/Bg/text.png",centerX,centerY*1.1)--文字框
	textBox.width = centerX*2
	textBox.height = centerY*2
	textBox.alpha = 0
local itemBox = display.newImage("Image/Item/ItemBox.png",centerX,centerY)--道具框
	itemBox.width = centerX*2
	itemBox.height = centerY*2
--------------------------------------------------------------------
local chara = {
	[0] = display.newImage("Image/Chara/1.png",centerX/1.4,centerY/1.4),
	[1] = display.newImage("Image/Chara/2.png",centerX*1.65,centerY/1.25),
	[2] = display.newImage("Image/Chara/3.png",centerX/1.9,centerY*1.55),
	[3] = display.newImage("Image/Chara/4.png",centerX/3.2,centerY/1.42)
}
for i = 0 , 3 do
	if(i>1) then
		chara[i].width = chara[i].width
		chara[i].height = chara[i].height
	else
		chara[i].width = chara[i].width*1.2
		chara[i].height = chara[i].height*1.2
	end

	if(i ~= 0) then
	chara[i].alpha = 0
	end

end
--------------------------------------------------------------------
local Text1_Options = 
{
	text = "",
	x = centerX,
	y = centerY*2.1,
	width = centerX*2,
	height = centerY,
	font = native.systemFont,
	fontSize = 60,
	align = "left"
}
local   Text1 = display.newText( Text1_Options )
Text1:setFillColor(1)
--------------------------------------------------------------------
local ItemOptions = {
	[0] = "",
	[1] = "",
	[2] = "",
	[3] = "",
	[4] = "",
}
local rightArrow = display.newImage("Image/Item/Right.png",centerX*1.85,centerY)
	rightArrow.width = rightArrow.width/2
	rightArrow.height = rightArrow.height/2
	rightArrow.alpha = 0
local leftArrow = display.newImage("Image/Item/Left.png",centerX/7,centerY)
	leftArrow.width = leftArrow.width/2
	leftArrow.height = leftArrow.height/2
	leftArrow.alpha = 0
local passNote = display.newImage("Image/Item/PasswordNote.png")
	passNote.width = passNote.width/5
	passNote.height = passNote.height/5
	passNote.alpha = 0
local passNoteBig = display.newImage("Image/Item/PasswordNote.png",centerX,centerY/2)
	passNoteBig.width = passNoteBig.width
	passNoteBig.height = passNoteBig.height
	passNoteBig.alpha = 0
local graffitiPuzzle = display.newImage("Image/Item/Puzzle_GraffitiUse.png",centerX,centerY)
	graffitiPuzzle.width = centerX*2
	graffitiPuzzle.height = centerY*2
	graffitiPuzzle.alpha = 0
--------------------------------------------------------------------
local Graffiti = display.newRect(centerX/2.1,centerY/1.5,centerX/10,centerY/10)
	Graffiti:setFillColor(1)
	Graffiti.alpha = 0
local PhotoFrame = display.newRect(centerX*1.55,centerY/2,centerX/2.2,centerY/8)
	PhotoFrame:setFillColor(1)
	PhotoFrame.alpha = 0
local PassButton = {
	[0] = display.newRect(centerX*1.675,centerY/1.12,centerX/10,centerX/10),
	[1] = display.newRect(centerX*1.675,centerY/7.2,centerX/10,centerX/10),
	[2] = display.newRect(centerX*1.675,centerY/4.6,centerX/10,centerX/10),
	[3] = display.newRect(centerX*1.675,centerY/3.3,centerX/10,centerX/10),
	[4] = display.newRect(centerX*1.675,centerY/2.6,centerX/10,centerX/10),
	[5] = display.newRect(centerX*1.675,centerY/2.13,centerX/10,centerX/10),
	[6] = display.newRect(centerX*1.675,centerY/1.8,centerX/10,centerX/10),
	[7] = display.newRect(centerX*1.675,centerY/1.56,centerX/10,centerX/10),
	[8] = display.newRect(centerX*1.675,centerY/1.39,centerX/10,centerX/10),
	[9] = display.newRect(centerX*1.675,centerY/1.25,centerX/10,centerX/10),	
}
for i = 0 , 9 do
	PassButton[i].alpha = 0
end
--------------------------------------------------------------------


function move(event)
	if(storyMode ==false)then
		if event.phase == "began"  then
		  	MouseX = event.x;
		elseif event.phase == "ended"  then
		  	MouseX2 = event.x;
		  	if MouseX2>MouseX and switch_bool == false then
		  		bg[4].x = centerX*-1
		  		Runtime:addEventListener("enterFrame",switchMove)
		  		switch_RL = true
		  		switch_bool = true
		  		rightArrow.alpha =0
			    leftArrow.alpha =0
		  		if bgInt==3 then
		  			bgInt = 0
		  		else
		  			bgInt = bgInt+1
		  		end
	  		elseif MouseX2<MouseX and switch_bool == false then
	  			bg[4].x = centerX*3
	  			Runtime:addEventListener("enterFrame",switchMove)
	  			switch_RL = false
	  			switch_bool = true
	  			rightArrow.alpha =0
				leftArrow.alpha =0
	  			if bgInt==0 then
	  				bgInt = 3
	  			else
	  				bgInt = bgInt-1
	  			end
			end
		end	  
	end
end

function switchMove( event )
	if(bg[4].x<centerX*3 and switch_RL == true) then
			bg[4].x = bg[4].x + 100
	elseif(bg[4].x>centerX*-1 and switch_RL == false) then
			bg[4].x = bg[4].x - 100
	else
		Runtime:removeEventListener("enterFrame",switchMove)
		rightArrow.alpha = 1
		leftArrow.alpha = 1
		switch_bool = false
	end
	if(bg[4].x<=centerX+20 and bg[4].x>=centerX-20) then
		switch_chara = switch_chara+1
		for i=0 ,3 do
			bg[i].alpha = 0
			chara[i].alpha = 0
		end
		if(switch_chara >= 5)then
			switch_random = math.random(0,7)%4
			switch_chara = 0
			print(switch_random)
		end
		if bgInt==switch_random and switch_chara ~= 4 then
			chara[bgInt].alpha = 1
		end
		bg[bgInt].alpha = 1
		bgTrigger(bgInt)
		print(bgInt)
	end
end

function bgTrigger( bgt )
	Graffiti.alpha = 0
	PhotoFrame.alpha = 0
	Graffiti:removeEventListener("touch", graffitiUse)

	if bgt == 1 then
		if wallGraffiti == false and clearPassNote == false then
			Graffiti.alpha = 0.1
			Graffiti:addEventListener("touch", graffitiUse)
		end
	end
	if bgt == 3 then
		PhotoFrame.alpha = 0.1
		PhotoFrame:addEventListener("touch",  photoUse)
	end


end

function itemOrder( item )
	if ItemOptions[0] == "" then
		item.x = centerX/4.5
		item.y = centerY*1.84
		ItemOptions[0] = item
	elseif ItemOptions[1] == "" then
		item.x = centerX/1.62
		item.y = centerY*1.84
		ItemOptions[1] = item
	elseif ItemOptions[2] == "" then
		item.x = centerX
		item.y = centerY*1.84
		ItemOptions[2] = item
	elseif ItemOptions[3] == "" then
		item.x = centerX*1.39
		item.y = centerY*1.84
		ItemOptions[3] = item
	elseif ItemOptions[4] == "" then
		item.x = centerX*1.78
		item.y = centerY*1.84
		ItemOptions[4] = item
	end
	itemInt = itemInt+1
	item.alpha = 1
	print("itemInt ="..itemInt)
end

function getItem(item)
	if item == 5 or item==9 then
		if(passNoteGet == false)then
			itemOrder(passNote)
			passNoteGet = true
		end
		passNote:addEventListener("touch",passNoteUse)
	end
	if item == 13 then
		bgTrigger( bgInt )
		wallGraffiti = true
	end
	if item == 48 then
		clearPassNote = true
	end
end

function passNoteUse(event)
	if(storyMode == false) then
		if wallGraffiti == false  then
			passNote:removeEventListener("touch",passNoteUse)
			text_Box(7)
		elseif(wallGraffiti == true and clearPassNote == false) then
			passNoteBig.alpha = 1
			storyMode = true
			newText = "請點擊四碼:"
			Text1.text = newText
			textBox.alpha = 1
			textBox.y = centerY
			for i = 0 , 9 do
				PassButton[i].alpha = 0.1
			end
			PassButton[0]:addEventListener("touch", passBut0)
			PassButton[1]:addEventListener("touch", passBut1)
			PassButton[2]:addEventListener("touch", passBut2)
			PassButton[3]:addEventListener("touch", passBut3)
			PassButton[4]:addEventListener("touch", passBut4)
			PassButton[5]:addEventListener("touch", passBut5)
			PassButton[6]:addEventListener("touch", passBut6)
			PassButton[7]:addEventListener("touch", passBut7)
			PassButton[8]:addEventListener("touch", passBut8)
			PassButton[9]:addEventListener("touch", passBut9)
		elseif clearPassNote == true then
			text_Box(28)
		end
	end
end
toto = 0
function passBut0( icc )
	print("逼0")
	PassButton[0]:removeEventListener("touch", passBut0)
	toto=toto+1
	pass[0] = true
	newText = newText..0
	Text1.text = newText
	TOTO()
end
function passBut1( icc )
	print("逼1")
	PassButton[1]:removeEventListener("touch", passBut1)
	toto=toto+1
	pass[1] = true
	newText = newText..1
	Text1.text = newText
	TOTO()
end
function passBut2( icc )
	print("逼2")
	PassButton[2]:removeEventListener("touch", passBut2)
	toto=toto+1
	pass[2] = true
	newText = newText..2
	Text1.text = newText
	TOTO()
end
function passBut3( icc )
	print("逼3")
	PassButton[3]:removeEventListener("touch", passBut3)
	toto=toto+1
	pass[3] = true
	newText = newText..3
	Text1.text = newText
	TOTO()
end
function passBut4( icc )
	print("逼4")
	PassButton[4]:removeEventListener("touch", passBut4)
	toto=toto+1
	pass[4] = true
	newText = newText..4
	Text1.text = newText
	TOTO()
end
function passBut5( icc )
	print("逼5")
	PassButton[5]:removeEventListener("touch", passBut5)
	toto=toto+1
	pass[5] = true
	newText = newText..5
	Text1.text = newText
	TOTO()
end
function passBut6( icc )
	print("逼6")
	PassButton[6]:removeEventListener("touch", passBut6)
	toto=toto+1
	pass[6] = true
	newText = newText..6
	Text1.text = newText
	TOTO()
end
function passBut7( icc )
	print("逼7")
	PassButton[7]:removeEventListener("touch", passBut7)
	toto=toto+1
	pass[7] = true
	newText = newText..7
	Text1.text = newText
	TOTO()
end
function passBut8( icc )
	print("逼8")
	PassButton[8]:removeEventListener("touch", passBut8)
	toto=toto+1
	pass[8] = true
	newText = newText..8
	Text1.text = newText
	TOTO()
end
function passBut9( icc )
	print("逼9")
	PassButton[9]:removeEventListener("touch", passBut9)
	toto=toto+1
	pass[9] = true
	newText = newText..9
	Text1.text = newText
	TOTO()
end

function TOTO( event )
	print(toto)
	if(toto==5) then
			passNoteBig.alpha = 0
			newText = ""
			toto = 0
			Text1.text = newText
			textBox.alpha = 0
			textBox.y = centerY*1.1
			storyMode = false
			if pass[1]==true and pass[2]==true and pass[5]==true and pass[0]==true then
				text_Box(24)
			else
				text_Box(22)
			end 
			for i = 0 , 9 do
				PassButton[i].alpha = 0
				pass[i] = false
				print("clear")
			end
	end
	if(toto ==4)then
			PassButton[0]:removeEventListener("touch", passBut0)
			PassButton[1]:removeEventListener("touch", passBut1)
			PassButton[2]:removeEventListener("touch", passBut2)
			PassButton[3]:removeEventListener("touch", passBut3)
			PassButton[4]:removeEventListener("touch", passBut4)
			PassButton[5]:removeEventListener("touch", passBut5)
			PassButton[6]:removeEventListener("touch", passBut6)
			PassButton[7]:removeEventListener("touch", passBut7)
			PassButton[8]:removeEventListener("touch", passBut8)
			PassButton[9]:removeEventListener("touch", passBut9)
			toto = toto+1
			timer.performWithDelay(1000,TOTO)
	end
end

function graffitiUse( event )
	if(storyMode == false) then
		Graffiti:removeEventListener("touch",graffitiUse)
		text_Box(11)
	end
end

function photoUse(every)
	PhotoFrame:removeEventListener("touch", photoUse)
	text_Box(15)
end

function text_Box( x )
	
	if(tesInt==0 and storyMode == false)then	tesInt = nil end
	
	if(tesInt==nil)then
		tesInt = x
		storyMode = true
	end	
	if(textBox.alpha~=1)then
		textBox.alpha = textBox.alpha+0.05
		rightArrow.alpha = rightArrow.alpha - 0.05
		leftArrow.alpha = leftArrow.alpha -0.05
		if(tesInt == 7) then

		elseif(tesInt == 11)then
			graffitiPuzzle.alpha = graffitiPuzzle.alpha +0.05
		end
		timer.performWithDelay(10 , text_Box)
		if(textBox.y>centerY)then
		textBox.y = textBox.y - (centerY*1.1-centerY)/8
		end
	else
		textBox.y = centerY
		timer.performWithDelay(100 , text )--, (string.len(tes[tesInt])/3)+1)
	end
end
function text(event)
	if 	tes[tesInt] == "" then
			newText = ""
			tesInt = tesInt+1
	end
	if  tesRe  < string.len(tes[tesInt]) then
		newText = newText..string.sub(tes[tesInt],tesRe ,tesRe+2)
		tesRe =tesRe +3
		print(newText..'\n\n')
		Text1.text = newText
		timer.performWithDelay(50 , text)
	else
		tesRe = 1
		textBox:addEventListener( "touch", nextText )
	end	
end
function nextText( event )
	if event.phase == "began"  and tes[tesInt+1] ~= nil then
		textBox:removeEventListener( "touch", nextText )
		tesInt = tesInt+1
		newText = newText..'\n'
		Text1.text = newText
		text_Box(tesInt)
	elseif tes[tesInt+1] == nil then
		Text1.text = ""
		newText = ""
		if(textBox.alpha~=0)then
			timer.performWithDelay(10 , nextText )
			textBox.alpha = textBox.alpha-0.05
			rightArrow.alpha = rightArrow.alpha + 0.05
			leftArrow.alpha = leftArrow.alpha + 0.05		
			if(textBox.y<centerY*1.1)then
				textBox.y = textBox.y + (centerY*1.1-centerY)/8
			end			
		else
			graffitiPuzzle.alpha = 0
			textBox.y = centerY*1.1
			getItem(tesInt)
			print(tesInt)
			if(tesInt~=0) or (tesInt~=nil) then tesInt = 0 end
			textBox:removeEventListener( "touch", nextText )
			storyMode = false
		end
	end
end
--[[
此為記錄用
--]]
		
text_Box(9)
--------------------------------------------------------------------
function scene:create( event )
    local sceneGroup = self.view
    sceneGroup:insert(bleed)
	for i=0 , 3 do
	sceneGroup:insert(bg[i])
	sceneGroup:insert(chara[i])
	end
	sceneGroup:insert(Text1)
    sceneGroup:insert(10,bg[4])--bg加入群組    
    sceneGroup:insert(textBox)
    sceneGroup:insert(itemBox)
    sceneGroup:insert(passNote)
    sceneGroup:insert(rightArrow)
    sceneGroup:insert(leftArrow)
    sceneGroup:insert(Graffiti)
    sceneGroup:insert(graffitiPuzzle)
    sceneGroup:insert(passNoteBig)





    bg[4]:toFront()
    textBox:toFront()
    Text1:toFront()
    bleed:toBack()
    Runtime:addEventListener( "touch", move )
    composer.removeScene("menu")


end

function scene:show( event )

end

function scene:hide( event )
end

function scene:destroy( event )
end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )


return scene