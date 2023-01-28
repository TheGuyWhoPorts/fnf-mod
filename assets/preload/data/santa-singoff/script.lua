local lefties = {'MXHypno', 'ZephGrimbo', 'RebootedAmbris'} --guys that go to left, are right
local rightos = {'FCMiku', 'Aconic', 'Jojoexe'} --guys that go right, are from left
local Lshmoove = {'0','0','0'}
local Rshmoove = {'0','0','0'}
local L_ypos = {'350','470','300'}
local R_ypos= {'420','420','320'}

function onCreate()
	setPropertyFromClass('GameOverSubstate', 'characterName', 'dead')

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