local composer = require( "composer" )
local scene = composer.newScene()

centerX = display.contentCenterX --相對X
centerY = display.contentCenterY --相對Y
--------------------------------------------------------------------
local bg1 = display.newImage("Image/Bg/1.png",centerX,centerY)--載入背景1	
bg1.width = centerX*2
bg1.height = centerY*2
bg1.alpha = 1
local bg2 = display.newImage("Image/Bg/2.png",centerX,centerY)--載入背景2
bg2.width = centerX*2
bg2.height = centerY*2
bg2.alpha = 0	
local bg3 = display.newImage("Image/Bg/3.png",centerX,centerY)--載入背景3	
bg3.width = centerX*2
bg3.height = centerY*2
bg3.alpha = 0	
local bg4 = display.newImage("Image/Bg/4.png",centerX,centerY)--載入背景4	
bg4.width = centerX*2
bg4.height = centerY*2
bg4.alpha = 0
local switch_bg = display.newImage("Image/Bg/5.png",centerX*3,centerY)--載入切換用背景
switch_bg.width = centerX*2
switch_bg.height = centerY*2
switch_bg.alpha = 1

bgInt = 1



local chara = display.newImage("Image/Chara/3.png",centerX/1.4,centerY/1.4)--載入角色
chara.width = chara.width*1.2
chara.height = chara.height*1.2
--------------------------------------------------------------------
local switch_bool = false
local switch_RL = false
function move(event)
	  if event.phase == "began"  then
	  	MouseX = event.x;
	  end
	  if event.phase == "ended"  then
	  	MouseX2 = event.x;
	  		if(MouseX2>MouseX and switch_bool == false) then
	  			print("switch1")
	  			switch_bg.x = centerX*-1
	  			Runtime:addEventListener("enterFrame",switchMove)
	  			switch_bool = true
	  			switch_RL = true
	  		elseif(MouseX2<MouseX and switch_bool == false) then
	  			print("switch2")
	  			switch_bg.x = centerX*3
	  			Runtime:addEventListener("enterFrame",switchMove)
	  			switch_bool = true
	  			switch_RL = false
			end
	  end	  
end


function switchMove( event )
	if(switch_bg.x<centerX*3 and switch_RL == true) then
			switch_bg.x = switch_bg.x + 100
	elseif(switch_bg.x>centerX*-1 and switch_RL == false) then
			switch_bg.x = switch_bg.x - 100
	else
		Runtime:removeEventListener("enterFrame",switchMove)	
		switch_bool = false
	end
end

--[[
此為記錄用
--]]


--------------------------------------------------------------------
function scene:create( event )
    local sceneGroup = self.view
    sceneGroup:insert(bg1)--bg加入群組
    sceneGroup:insert(bg2)--bg加入群組
    sceneGroup:insert(bg3)--bg加入群組
    sceneGroup:insert(bg4)--bg加入群組
    sceneGroup:insert(switch_bg)--bg加入群組
    sceneGroup:insert(chara)--chara加入群組
    switch_bg:toFront()
    Runtime:addEventListener( "touch", move )

end

function scene:show( event )
end

function scene:hide( event )
end

function scene:destroy( event )

	composer.removeScene("menu")
end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )


return scene