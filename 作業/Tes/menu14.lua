local composer = require( "composer" )
local scene = composer.newScene()
local centerX = display.contentCenterX 
local centerY = display.contentCenterY 
local bg = display.newImage("bg/bg14.jpg",centerX,centerY)
        bg.width = centerX*2
        bg.height = centerX*2
local up = display.newImage("up.png",centerX,centerY-centerX*1.25)
	up.name = "up1"
local down = display.newImage("down.png",centerX,centerY+centerX*1.25)
	down.name = "down1"

function onTouch(event)
        if event.phase == "began" then
            if event.target.name == "up1" then
				composer.gotoScene("menu13",{effect = "slideLeft",time = 500})
                    
            end 
            if event.target.name == "down1" then
				composer.gotoScene("menu",{effect = "slideLeft",time = 500})       
            end 
        end
    end



function scene:create( event )
    local sceneGroup = self.view
    sceneGroup:insert(bg)
    sceneGroup:insert(up)
    sceneGroup:insert(down)
    up:addEventListener( "touch", onTouch )
    down:addEventListener( "touch", onTouch )


 end

function scene:show( event )
    local sceneGroup = self.view
	end

function scene:hide( event )
    local sceneGroup = self.view
    
	end

function scene:destroy( event )
    local sceneGroup = self.view
    composer.removeScene("menu14")
	end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene

