local composer = require( "composer" )
local scene = composer.newScene()

local centerX = display.contentCenterX --相對X
local centerY = display.contentCenterY --相對Y
--------------------------------------------------------------------
local bg = display.newImage("Image/Bg/1.jpg",centerX,centerY)--載入背景
bg.width = centerX*2
bg.height = centerY*2

local chara = display.newImage("Image/Chara/3.png",centerX/1.4,centerY/1.4)--載入角色
chara.width = chara.width*2
chara.height = chara.height*2


--------------------------------------------------------------------


print(chara.width..'+'..chara.height)

--[[
此為記錄用
--]]


--------------------------------------------------------------------
function scene:create( event )
    local sceneGroup = self.view
    sceneGroup:insert(bg)--bg加入群組
    sceneGroup:insert(chara)--chara加入群組
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