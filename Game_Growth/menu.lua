local composer = require( "composer" )
local scene = composer.newScene()

centerX = display.contentCenterX --相對X
centerY = display.contentCenterY --相對Y

local title_Show = 0
--------------------------------------------------------------------
local bg = display.newImage("Image/Bg/1.png",centerX,centerY)
	bg.width = centerX*2
	bg.height = centerY*2
	bg.alpha = 0.4
local bg_while = display.newRect(centerX,centerY,centerX*2,centerY*2)
	bg_while:setFillColor(1)
--------------------------------------------------------------------
local blackBox = display.newRect(centerX,centerY,centerX*2,centerY*2)
	blackBox:setFillColor(255/255,160/255,200/255)
	blackBox.alpha = 1
local title = display.newImage("Image/Menu/Glowth.png",centerX*1.05,centerY)
	title.width = title.width/8
	title.height = title.height/8
	title.alpha = 0
local start = display.newImage("Image/Menu/Start.png",centerX,centerY*1.1)
	start.width = start.width/1.3
	start.height = start.height/1.3
	start.alpha = 0
local rule = display.newImage("Image/Menu/Rule.png",centerX,centerY*1.4)
	rule.width = rule.width/1.3
	rule.height = rule.height/1.3
	rule.alpha = 0
local chara = display.newImage("Image/Chara/1.png",centerX,centerY*1.05)
	chara.width = chara.width*1.3
	chara.height = chara.height*1.3
	chara.alpha = 0
--------------------------------------------------------------------
function titleShow( event )
	if(title_Show == 1) then
		if(title.y>centerY/1.5)then
			title.y = title.y-10
			blackBox.alpha = blackBox.alpha - 1/10
			timer.performWithDelay(10, titleShow)			
		else
			Runtime:addEventListener("enterFrame",select)
		end
	end

	if(title_Show == 0)then
		if(title.alpha~=1) then
			title.alpha = title.alpha + 0.03
		elseif (title.alpha ==1) then
			Runtime:removeEventListener("enterFrame",titleShow)
			title_Show = 1
			timer.performWithDelay(1000, titleShow)
		end
	end

	if(title_Show ==2)then
		if(blackBox.alpha~=1)then
			blackBox.alpha = blackBox.alpha + 1/20
		else
			Runtime:removeEventListener("enterFrame",titleShow)
			composer.gotoScene("game1")
		end
	end

end

function select( event )
	if(start.alpha~=1) then
		start.alpha = start.alpha + 0.1
		rule.alpha = rule.alpha + 0.1
		--chara.alpha = chara.alpha + 0.1
	else
		Runtime:removeEventListener("enterFrame",select)
	end
end
function startButton( event )
	if event.phase == "began"  then
		blackBox:setFillColor(0)
		title_Show = 2
		blackBox:toFront()
		start:removeEventListener("touch",startButton)
		Runtime:addEventListener("enterFrame",titleShow)
	end
end
--[[
此為記錄用
--]]


--------------------------------------------------------------------
function scene:create( event )
    local sceneGroup = self.view
    sceneGroup:insert(bg_while)
    sceneGroup:insert(bg)
    sceneGroup:insert(start)
    sceneGroup:insert(rule)
    sceneGroup:insert(chara)
    sceneGroup:insert(blackBox)
    sceneGroup:insert(title)
    titleShow(1)
    Runtime:addEventListener( "enterFrame", titleShow )
    start:addEventListener("touch",startButton)

    composer.removeScene("game1")
end

function scene:show( event )
end

function scene:hide( event )
end

function scene:destroy( event )
end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )


return scene