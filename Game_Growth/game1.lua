local composer = require( "composer" )
local scene = composer.newScene()

centerX = display.contentCenterX --相對X
centerY = display.contentCenterY --相對Y
local switch_chara = 0 --角色切換次數用
local switch_random = 0--隨機
local bgInt = 0 -- 圖檔數字
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

local bleed = display.newImage("Image/Bg/5.png",centerX,centerY)
	bleed.width = centerX*4
	bleed.height = centerY*4
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
local switch_bool = false
local switch_RL = false

function move(event)
	if event.phase == "began"  then
	  	MouseX = event.x;
	elseif event.phase == "ended"  then
	  	MouseX2 = event.x;
	  	if(MouseX2>MouseX and switch_bool == false) then
	  		bg[4].x = centerX*-1
	  		Runtime:addEventListener("enterFrame",switchMove)
	  		switch_RL = true
	  		switch_bool = true
	  		if bgInt==3 then
	  			bgInt = 0
	  		else
	  			bgInt = bgInt+1
	  		end

	  	elseif(MouseX2<MouseX and switch_bool == false) then
	  		bg[4].x = centerX*3
	  		Runtime:addEventListener("enterFrame",switchMove)
	  		switch_RL = false
	  		switch_bool = true
	  		if bgInt==0 then
	  			bgInt = 3
	  		else
	  			bgInt = bgInt-1
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
	end
end

--[[
此為記錄用
--]]


--------------------------------------------------------------------
function scene:create( event )
    local sceneGroup = self.view
    sceneGroup:insert(1,bleed)
	for i=0 , 3 do
	sceneGroup:insert(bg[i])
	sceneGroup:insert(chara[i])
	end
    sceneGroup:insert(10,bg[4])--bg加入群組
    Runtime:addEventListener( "touch", move )

end

function scene:show( event )
end

function scene:hide( event )
end

function scene:destroy( event )
	composer.removeScene("game1")
end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )


return scene