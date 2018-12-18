local composer = require( "composer" )
local scene = composer.newScene()

centerX = display.contentCenterX --相對X
centerY = display.contentCenterY --相對Y
--------------------------------------------------------------------
local bg = display.newImage("Image/Bg/1.png",centerX,centerY)--載入背景1	
bg.width = centerX*2
bg.height = centerY*2
bg.alpha = 1	




local chara = display.newImage("Image/Chara/3.png",centerX/1.4,centerY/1.4)--載入角色
chara.width = chara.width*1.2
chara.height = chara.height*1.2

--------------------------------------------------------------------
function move(event)
	  if event.phase == "began"  then
	  	MouseX = event.x;
	  end
	  if event.phase == "ended"  then
	  	MouseX2 = event.x;
	  		if(MouseX2>MouseX) then
	  			composer.gotoScene("switch",{effect = "slideRight",time = 500})
	  		elseif(MouseX2<MouseX) then
	  			composer.gotoScene("switch",{effect = "slideleft",time = 500})
			end
	  end	  
end



--[[
此為記錄用
--]]


--------------------------------------------------------------------
function scene:create( event )
    local sceneGroup = self.view
    sceneGroup:insert(bg)--bg加入群組
    sceneGroup:insert(chara)--chara加入群組
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