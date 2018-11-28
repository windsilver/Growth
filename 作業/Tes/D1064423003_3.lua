local composer = require( "composer" )
local scene = composer.newScene()
local centerX = display.contentCenterX 
local centerY = display.contentCenterY 

local Bg3   = display.newImage("bg/D1064423003_3.jpg",centerX,centerY)
      Bg3.width = centerX*1.8
      Bg3.height = centerY*1.8
      Bg3.name = "Bg3"




function onTouch(event)
  if event.phase == "began" then
    if event.target.name == "Bg3" then
		  composer.gotoScene("D1064423003",{effect = "slideLeft",time = 500})
    end
  end
end



function scene:create( event )
    local sceneGroup = self.view
    sceneGroup:insert(Bg3)
    Bg3:addEventListener( "touch", onTouch )
 end

function scene:show( event )
    local sceneGroup = self.view
	end

function scene:hide( event )
    local sceneGroup = self.view
    
	end

function scene:destroy( event )
    local sceneGroup = self.view
    composer.removeScene("D10064423003_2")
	end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene

