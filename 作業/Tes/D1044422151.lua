local composer = require( "composer" )
local scene = composer.newScene()
local centerX = display.contentCenterX 
local centerY = display.contentCenterY 
local Bg   = display.newImage("bg/D1044422151_1.png",centerX,centerY)
local _Return   = display.newImage("bg/Return.png",centerX,centerY*1.8)
      _Return.name = "Re"




function onTouch(event)
  if event.phase == "began" and event.target.name == "Re" then
		composer.gotoScene("menu",{effect = "fade",time = 200})
  end
end



function scene:create( event )
    local sceneGroup = self.view
    sceneGroup:insert(Bg)
    sceneGroup:insert(_Return)
    _Return:addEventListener( "touch", onTouch )
 end

function scene:show( event )
    local sceneGroup = self.view
	end

function scene:hide( event )
    local sceneGroup = self.view
    
	end

function scene:destroy( event )
    local sceneGroup = self.view
    composer.removeScene("D1044422151")
	end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene

