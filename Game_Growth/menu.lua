local composer = require( "composer" )
local scene = composer.newScene()

local centerX = display.contentCenterX --相對X
local centerY = display.contentCenterY --相對Y
--------------------------------------------------------------------
local bg1 = display.newImage("Image/Bg/1.png",centerX,centerY)--載入背景1
bg1.width = centerX*2
bg1.height = centerY*2
bg1.alpha = 1;

local bg2 = display.newImage("Image/Bg/2.png",centerX,centerY)--載入背景2
bg2.width = centerX*2
bg2.height = centerY*2
bg2.alpha = 0;

local bg3 = display.newImage("Image/Bg/3.png",centerX,centerY)--載入背景3
bg3.width = centerX*2
bg3.height = centerY*2
bg3.alpha = 0;

local bg4 = display.newImage("Image/Bg/4.png",centerX,centerY)--載入背景4
bg4.width = centerX*2
bg4.height = centerY*2
bg4.alpha = 0;

local chara = display.newImage("Image/Chara/3.png",centerX/1.4,centerY/1.4)--載入角色
chara.width = chara.width*1.2
chara.height = chara.height*1.2


--------------------------------------------------------------------




--[[
此為記錄用
--]]


--------------------------------------------------------------------
function scene:create( event )
    local sceneGroup = self.view
    sceneGroup:insert(bg1)--bg加入群組
    sceneGroup:insert(bg2)
    sceneGroup:insert(bg3)
    sceneGroup:insert(bg4)
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