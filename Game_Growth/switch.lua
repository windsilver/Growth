display.setStatusBar(display.HiddenStatusBar)
local composer = require( "composer" )
local scene = composer.newScene()

local bg = display.newImage("Image/Bg/5.png",centerX,centerY)--載入背景1	
bg.width = centerX*2
bg.height = centerY*2
bg.alpha = 1	 

local function switch( event )	
		composer.gotoScene("menu",{effect = "slideRight",time = 500})
		print("sw")
end


function scene:create( event )
	local sceneGroup = self.view
    sceneGroup:insert(bg)--bg加入群組
	timer.performWithDelay(550,switch)

end

function scene:show( event )

end

function scene:hide( event )
	 composer.removeScene("switch")
	 
end
function scene:destroy( event )   
end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene