local lefties = {'AxellKojin', 'PinkieTiels'} --guys that go to left, are right
local rightos = {'GodZTenma', 'ringchain'} --guys that go right, are from left
local Lshmoove = {'0','0'}
local Rshmoove = {'0','0'}
local L_ypos = {'410','490'}
local R_ypos= {'250','470'}

function onCreate()
	makeLuaSprite('blackness', nil, 0, 0)
	makeGraphic('blackness', screenWidth, screenHeight, '000000')
	setObjectCamera('blackness', 'other')
	addLuaSprite('blackness', false)
	setProperty('blackness.alpha',0)

	for i = 1,#lefties do
		makeLuaSprite(lefties[i], 'bg/FG-'..lefties[i], 1500, L_ypos[i])
		scaleObject(lefties[i], 0.6, 0.6)
		addLuaSprite(lefties[i], true)
	end
	
	for i = 1,#rightos do
		makeLuaSprite(rightos[i], 'bg/FG-'..rightos[i], -1000, R_ypos[i])
		scaleObject(rightos[i], 0.6, 0.6)
		addLuaSprite(rightos[i], true)
	end
end

function onEvent(n, val1, val2)
	if n == 'Move a Dude' then --for shmooving
		nameofarray = tostring(val1)
		value = tonumber(val2)
		
		if nameofarray == 'L' then
			Lshmoove[value] = lefties[value]
		elseif nameofarray == 'R' then
			Rshmoove[value] = rightos[value]
		end
	end
end

function onBeatHit()
	if curBeat == 32 then
		Rshmoove[1] = rightos[1]
	elseif curBeat == 64 then
		Rshmoove[2] = rightos[2]
	elseif curBeat == 96 then
		Lshmoove[1] = lefties[1]
	elseif curBeat == 126 then
		Lshmoove[2] = lefties[2]
	elseif curBeat == 276 then
		setProperty('blackness.alpha',1)
	end
end

function onUpdate(elapsed)
	for i = 1,#lefties do
		if Lshmoove[i] == lefties[i] then
			doTweenX(lefties[i], lefties[i], -1000, 15, 'linear')
			Lshmoove[i] = '0' --turn it off
		end
	end
	for i = 1,#rightos do
		if Rshmoove[i] == rightos[i] then
			doTweenX(rightos[i], rightos[i], 1500, 15, 'linear')
			Rshmoove[i] = '0' --turn it off
		end
	end
end