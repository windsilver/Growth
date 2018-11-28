local composer = require( "composer" )
local scene = composer.newScene()
local centerX = display.contentCenterX 
local centerY = display.contentCenterY 

local Bg1   = display.newImage("bg/D1064423014_1.jpg",centerX,centerY)
      Bg1.width = centerX*2
      Bg1.height = centerY
      Bg1.name = "Bg1"




function onTouch(event)
  if event.phase == "began" then
    if event.target.name == "Bg1" then
		  composer.gotoScene("D1064423014",{effect = "slideUp",time = 500})
    end
  end
end



function scene:create( event )
    local sceneGroup = self.view
    sceneGroup:insert(Bg1)
    Bg1:addEventListener( "touch", onTouch )
 end

function scene:show( event )
    local sceneGroup = self.view
	end

function scene:hide( event )
    local sceneGroup = self.view
    
	end

function scene:destroy( event )
    local sceneGroup = self.view
    composer.removeScene("D10064423014_1")
	end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene

