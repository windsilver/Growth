local composer = require( "composer" )
local scene = composer.newScene()
local centerX = display.contentCenterX 
local centerY = display.contentCenterY 

local Bg2   = display.newImage("bg/D1064423014_2.jpg",centerX,centerY)
      Bg2.width = centerX*2
      Bg2.height = centerY
      Bg2.name = "Bg2"




function onTouch(event)
  if event.phase == "began" then
    if event.target.name == "Bg2" then
		  composer.gotoScene("D1064423014",{effect = "slideRight",time = 500})
    end
  end
end



function scene:create( event )
    local sceneGroup = self.view
    sceneGroup:insert(Bg2)
    Bg2:addEventListener( "touch", onTouch )
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

