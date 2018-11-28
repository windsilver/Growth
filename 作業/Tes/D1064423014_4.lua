local composer = require( "composer" )
local scene = composer.newScene()
local centerX = display.contentCenterX 
local centerY = display.contentCenterY 

local Bg4   = display.newImage("bg/D1064423014_4.jpg",centerX,centerY)
      Bg4.width = centerX*2
      Bg4.height = centerY*2
      Bg4.name = "Bg4"




function onTouch(event)
  if event.phase == "began" then
    if event.target.name == "Bg4" then
		  composer.gotoScene("D1064423014",{effect = "slideDown",time = 500})
    end
  end
end



function scene:create( event )
    local sceneGroup = self.view
    sceneGroup:insert(Bg4)
    Bg4:addEventListener( "touch", onTouch )
 end

function scene:show( event )
    local sceneGroup = self.view
	end

function scene:hide( event )
    local sceneGroup = self.view
    
	end

function scene:destroy( event )
    local sceneGroup = self.view
    composer.removeScene("D10064423014_2")
	end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene

