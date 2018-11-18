-- 
-- Abstract: FrameAnimation2 -- bouncing balls animated with table listeners for the "enterFrame" event
-- 
-- Version: 1.2 (uses new viewableContentHeight, viewableContentWidth properties)
-- 
-- Sample code is MIT licensed, see http://www.coronalabs.com/links/code/license
-- Copyright (C) 2010 Corona Labs Inc. All Rights Reserved.

-- Demonstrates how to use table listeners for event handling, for more of an object-oriented
-- approach. This is an example of one convenient way to structure and organize code.
--
-- Note how all of the variables accessed inside the enterFrame method are local.
-- Also, note that for table listeners, the method name must be the same as the event 
-- you register for.
--
-- Like "FrameAnimation1", this is frame-based animation. See "TimeAnimation" for an example of
-- how to do time-based, framerate-independent animation.
--
-- Supports Graphics 2.0
------------------------------------------------------------

display.setStatusBar( display.HiddenStatusBar )

display.setDefault( "background", 80/255 )

toi = 20

local function _random(i)
	if(i==1)then
		l = math.random(-10,10)
		if(l==0)then
			return _random(1)
		end
		return l/10
	end
	if(i==2)then
		return math.random(30,60)/10
	end
end

local function newBall( params )
	local xpos = display.contentWidth*0.5
	local ypos = display.contentHeight*0.5
	local circle = display.newCircle( xpos, ypos, math.random(10,20) );
	circle:setFillColor( math.random(0,10)/10, math.random(0,10)/10, math.random(1,10)/10, 255 );
	circle.xdir = _random(1)
	circle.ydir = _random(1)
	circle.xspeed = _random(2)
	circle.yspeed = _random(2)
	circle.radius = math.random(10,20)

	return circle
end


local collection = {}

-- Iterate through params array and add new balls into an array
for i = 0 , toi ,1 do
	local ball = newBall( toi )
	collection[ #collection + 1 ] = ball
end

-- Get current edges of visible screen (accounting for the areas cropped by "zoomEven" scaling mode in config.lua)
local screenTop = display.screenOriginY
local screenBottom = display.viewableContentHeight + display.screenOriginY
local screenLeft = display.screenOriginX
local screenRight = display.viewableContentWidth + display.screenOriginX

function collection:enterFrame( event )
	for _,ball in ipairs( collection ) do
		local dx = ( ball.xspeed * ball.xdir );
		local dy = ( ball.yspeed * ball.ydir );
		local xNew, yNew = ball.x + dx, ball.y + dy

		local radius = ball.radius
		if ( xNew > screenRight - radius or xNew < screenLeft + radius ) then
			ball.xdir = -ball.xdir
		end
		if ( yNew > screenBottom - radius or yNew < screenTop + radius ) then
			ball.ydir = -ball.ydir
		end

		ball:translate( dx, dy )
	end
end

Runtime:addEventListener( "enterFrame", collection );
    