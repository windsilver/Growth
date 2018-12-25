local composer = require( "composer" )
local scene = composer.newScene()

centerX = display.contentCenterX --相對X
centerY = display.contentCenterY --相對Y

--------------------------------------------------------------------
local bg = display.newImage("Image/Bg/1.png",centerX,centerY)
	bg.width = centerX*2
	bg.height = centerY*2
--------------------------------------------------------------------
local blackBox = display.newRect(centerX,centerY,centerX*2,centerY*2)
	blackBox:setFillColor(255/255,160/255,200/255)
	blackBox.alpha = 1
local title = display.newImage("Image/menu/Glowth.png",centerX,centerY)
	title.width = title.width/10
	title.height = title.height/10
	title.alpha = 1
--------------------------------------------------------------------

--[[
此為記錄用
--]]


--------------------------------------------------------------------
function scene:create( event )
    local sceneGroup = self.view
    sceneGroup:insert(bg)
    sceneGroup:insert(blackBox)
    sceneGroup:insert(title)
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