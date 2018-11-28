local composer = require( "composer" )
local scene = composer.newScene()
local centerX = display.contentCenterX 
local centerY = display.contentCenterY 
local Bg   = display.newImage("bg/Bg1.png",centerX,centerY)

local D151 = display.newImage("bg/D1044422151.png",centerX,centerY/2)
	  D151.name = "D151"
      D151.width = centerX*1.5
      D151.height = centerY/3

local D003 = display.newImage("bg/D1064423003.png",centerX,centerY/1.12)
	  D003.name = "D003"
      D003.width = centerX*1.5
      D003.height = centerY/3

local D014 = display.newImage("bg/D1064423014.png",centerX,centerY*1.3)
	  D014.name = "D014"
      D014.width = centerX*1.5
      D014.height = centerY/3

local D029 = display.newImage("bg/D1064423029.png",centerX,centerY*1.7)
	  D029.name = "D029"
      D029.width = centerX*1.5
      D029.height = centerY/3




function onTouch(event)
    if event.phase == "began" then
        if event.target.name == "D151" then
			composer.gotoScene("D1044422151",{effect = "fade",time = 200}) 
        end
        if event.target.name == "D003" then
			composer.gotoScene("D1064423003",{effect = "fade",time = 200})       
        end
        if event.target.name == "D014" then
			composer.gotoScene("D1064423014",{effect = "fade",time = 200})       
        end 
        if event.target.name == "D029" then
			composer.gotoScene("D1064423029",{effect = "fade",time = 200})       
        end  
    end
end



function scene:create( event )
    local sceneGroup = self.view
    sceneGroup:insert(Bg)
    sceneGroup:insert(D151)
    sceneGroup:insert(D003)
    sceneGroup:insert(D014)
    sceneGroup:insert(D029)
    D151:addEventListener( "touch", onTouch )
    D003:addEventListener( "touch", onTouch )
    D014:addEventListener( "touch", onTouch )
    D029:addEventListener( "touch", onTouch )


 end

function scene:show( event )
    local sceneGroup = self.view
	end

function scene:hide( event )
    local sceneGroup = self.view
    
	end

function scene:destroy( event )
    local sceneGroup = self.view
    composer.removeScene("menu")
	end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene

