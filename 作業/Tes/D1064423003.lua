local composer = require( "composer" )
local scene = composer.newScene()
local centerX = display.contentCenterX 
local centerY = display.contentCenterY 
local Bg   = display.newImage("bg/D1064423003_0.png",centerX,centerY)
      Bg.width = centerY*4
      Bg.height = centerY*2
local Bg1   = display.newImage("bg/D1064423003_1.jpg",centerX,centerY/3)
      Bg1.width = centerX/2
      Bg1.height = centerY/2
      Bg1.name = "Bg1"
local Bg2   = display.newImage("bg/D1064423003_2.jpg",centerX*1.6,centerY)
      Bg2.width = centerX/2
      Bg2.height = centerY/2
      Bg2.name = "Bg2"
local Bg3   = display.newImage("bg/D1064423003_3.jpg",centerX/2.4,centerY)
      Bg3.width = centerX/2
      Bg3.height = centerY/2
      Bg3.name = "Bg3"
local Bg4   = display.newImage("bg/D1064423003_4.jpg",centerX,centerY*1.7)
      Bg4.width = centerY/2
      Bg4.height = centerY/2
      Bg4.name = "Bg4"

local _Return   = display.newImage("bg/Return.png",centerX,centerY)
      _Return.name = "Re"




function onTouch(event)
  if event.phase == "began" then
    if event.target.name == "Re" then
		  composer.gotoScene("menu",{effect = "fade",time = 200})
    end
    if event.target.name == "Bg1" then
      composer.gotoScene("D1064423003_1",{effect = "slideDown",time = 500})
    end
    if event.target.name == "Bg2" then
      composer.gotoScene("D1064423003_2",{effect = "slideLeft",time = 500})
    end
    if event.target.name == "Bg3" then
      composer.gotoScene("D1064423003_3",{effect = "slideRight",time = 500})
    end
    if event.target.name == "Bg4" then
      composer.gotoScene("D1064423003_4",{effect = "slideUp",time = 500})
    end
  end
end



function scene:create( event )
    local sceneGroup = self.view
    sceneGroup:insert(Bg)
    sceneGroup:insert(Bg1)
    sceneGroup:insert(Bg2)
    sceneGroup:insert(Bg3)
    sceneGroup:insert(Bg4)
    sceneGroup:insert(_Return)
    _Return:addEventListener( "touch", onTouch )
    Bg1:addEventListener( "touch", onTouch )
    Bg2:addEventListener( "touch", onTouch )
    Bg3:addEventListener( "touch", onTouch )
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
    composer.removeScene("D10064423003")
	end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene

