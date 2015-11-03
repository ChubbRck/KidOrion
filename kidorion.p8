pico-8 cartridge // http://www.pico-8.com
version 4
__lua__
state = 1
p = {
	accel = {x = 0, y = 0},
	x = 60, --64,
	y = 48, --35,
	lives = 3,
	landed = true,
	baseaccel = .1, -- was .1
	vel = {x = 0, y = 0},
	bounce = 0.4 ,
	score = 0,
	landingthreshold = 0.5,
	maxvel = 3, -- was 2
	rot = 0,
	fuel = 50,
	fueldepleterate = .03,
	health = 50,
	canmove = true,
	energy = 50,
	maxcoll = .2,
	collfactor = 2,
	damagethreshold = .8, -- was .5
	dead = false,
	atgoal = false,
	hasitem = false,
	hascannon = false,
	hurt = false,
	hurtfactor = 0
}


spaceram = {
x = 75,
y = -350,
velx = 0,
vely = 0,
accelx = 0,
accely = 0,
mode = 1,
health = 5,
hurt = false
}
spaceramsprite = 66
spaceramcounter = 1
itemcache = {}
bullets = {}
phrases = {
"suh-weet!",
"ooh yeah!",
"got it!",
"what now?",
"noice!",
"yoink!"
}
vicphrases = {
"suh-weet!",
"ooh yeah!",
"mega!",
"solid!",
"noice!",
"rufus!",
"so rad!",
"points!",
"wild!",
"me like!",
"huzzah!",
"wo there!",
"eeee!",
"boss!",
"gimme!",
"uh huh"
}
stars = {}
scorebursts = {}
parts = {}

mcount = 1
pyc = 1
sp1 = {43,6}
sp2 = {6,43}

sps = {sp1, sp2}

cam = {
	x = 64,
	y = 64
	--count = 0
}
--journeymsg = {
--m= {"y","e","a","a","a","!"  },
--	mcount = 0,
--	timer=0,
--	buffer = 1
--}

--journeymsg2 = {
--m= {"k","e","e","p"," ","g","o","i","n","g","!"},
--	mcount = 0,
--	timer=0,
--	buffer = 1
--}
oldsprite = 98
finalmsg = {

	m = "beware the space ram!",
	mmax = 21,
	mcount = 0,
	timer=0,
	buffer = 1

}

spiralmsg = {
--m= {"w","a","r","n","i","n","g","!"  },
m = "warning!",
mmax = 8,
	mcount = 0,
	timer=0,
	buffer = .5
}
spiralmsg2 = {
--m= {"y","o","u","r"," ","f","u","e","l"," ","t","a","n","k"," ","i","s"," ","l","e","a","k","i","n","g","!"  },
	m = "your fuel tank is leaking!",
	mmax = 24,
	mcount = 0,
	timer=0,
buffer = 1
}


climbmsg2 = {
m= "gravity is twice as strong",	
mmax = 24,
mcount = 0,
	timer=0,
	buffer = .1
}
climbmsg3 = {
m = "on this planet!",
	mmax = 15,
	mcount = 0,
	timer=0,
	buffer = .5
}
intromsg ={
	m= "kid orion, do you read me?",
	mmax = 25,
	mcount = 0,
	timer=0,
	buffer = 1
}
intromsg2 = {
	--m= {"t","h","i","s"," ","i","s"," ","b","a","b","y"," ","h","e","r","b","e","r","t"},
	m = "this is baby herbert.",
	mmax = 21,
	mcount = 0,
	timer=0,
	buffer = 1
}

intromsg3 = {
	m = "i'm stranded in dimension z",
	mmax = 25,
	mcount = 0,
	timer=0,
	buffer = 0.25
}

intromsg4 = {
	--m= {"i"," ","d","o","n","'","t"," ","h","a","v","e"," ","m","u","c","h"," ","t","i","m","e"," ","l","e","f","t","."},
	m = "i don't have much time left.",
	mmax = 27,
	mcount = 0,
	timer=0,
	buffer = 1
}
intromsg5 = {
	--m= {"h", "e","l","p"," ","m","e"," ","k","i","d"," ","o","r","i","o","n","!"},
	m = "help me kid orion!",
	mmax = 18,
	mcount = 0,
	timer=0,
	buffer = 1
}

intromsgs = {
msgs = {intromsg, intromsg2, intromsg3, intromsg4, intromsg5},
marker = 1
}

journeymsgs = {
msgs = {},
marker = 1
}

spiralmsgs = {
msgs = {spiralmsg, spiralmsg2},
marker = 1
}

climbmsgs = {
msgs = {spiralmsg, climbmsg2, climbmsg3},
marker = 1
}

finalmsgs = {
msgs = {finalmsg},
marker = 1
}
allmsgs = {intromsgs, journeymsgs, spiralmsgs, climbmsgs, finalmsgs}
g = {
	spritethruster = 4,
	gravity = 0.04,
	backgroundcounter = 1,
	timer = 0,
	marktimer = 0,
	srtimer = 0
}
level1={
	origin = {x=0,y=0},
	offset = {x=0,y=-320},
	w = 24,
	h = 48,
	itemreq = false,
	title = "practice launch"
	}
level2 = {
origin = {x=24,y=0},
	offset = {x=0,y=-192 },
	itemreq = false,
	w = 32,
	h = 32, -- in 8x8
	title = "the journey begins"
}

level3 = {
origin = {x=0,y=32},
	offset = {x=0,y=-192 },
	itemreq = true,
	title = "find the lost data",
	w = 56,
	h = 32 -- in 8x8 sprites
}

level4  = {    
origin = {x=56,y=0},
	offset = {x=-32,y=-448 },
	itemreq = false,
	title = "the climb",
	w = 24, 
	h = 64 -- in 8x8 sprites
}

level5 = {
origin = {x=80,y=0},
	offset = {x=-160,y=-448 },
	itemreq = false,
	title = "rescue baby herbert",
	w = 56, 
	h = 64 -- in 8x8 sprites
}
 
levels = {
level1,
level2,
level3,
level4,
level5
}
pylon1 = {
x = 6,
y = 6
}
pylon2 = {
x=9,
y=6
}
pylon3 = {
x=38,
y=17
}
pylon4 = {
x=41,
y=17
}
pylon5 = {
x = 10,
y = 54
}
pylon6 = {
x = 5,
y = 54
}
pylon5a = {
x = 35,
y = 48
}
pylon6a = {
x = 37,
y = 48
}
pylon7 = {
x = 58,
y = 3
}
pylon8 = {
x = 62,
y = 3
}
pylon9 = {
x = 118,
y = 6
}
pylon10 = {
x = 123,
y = 6
}
pylons = {
pylon1, pylon2, pylon3, pylon4, pylon5, pylon6, pylon7, pylon5a, pylon6a,pylon8,pylon9,pylon10
}

gasblobs = {}

levelcounter = 5
paltimer = 1
clevel = levels[levelcounter]
clevel = level5

function storeitem(tile,locx,locy)
local item = {
t=tile,
x=locx,
y=locy
}

add(itemcache,item)
--insert an item at a map location into the cache
end

function clearcache() 
for item in all(itemcache) do
del(itemcache, item)
end

end
function restoreitems()
for item in all(itemcache) do
local x = item.x
local y = item.y
local t = item.t
mset(flr((x-clevel.offset.x)/8)+clevel.origin.x,flr((y-clevel.offset.y)/8)+clevel.origin.y, t)
--mset(0,0,t)--go through all the gotten items and restore em
mset(x,y,t)
end
end



function runtitlescreen()
paltimer +=1
	 if (btnp(4)) cls() state = 1.5
	 

	 -- add to string
	 
	 
end

function firebullet()
local b=create_part(p.x+4,p.y+4, bullets, 100)
   local truerot = p.rot % 1 * 360
			b.vel.x = cos(((truerot-90)/360)) * -1 * 3
   b.vel.y = (-1 * sin(((truerot-90)/360)) * 3)
   b.isbullet = true
   p.energy -= 5
   sfx(9) 
end
function checkinput()
	if (levelcounter == 3) then
		p.fuel -= .01
	end
	if (btnp(4) and p.hascannon and p.energy > .25) then
		firebullet()
	end
	if (btn(2) and p.fuel > 0 and p.energy > 0 or btn(5) and p.fuel > 0 and p.energy > 0) then
				g.spritethruster = 20
			p.fuel -= p.fueldepleterate
			p.energy -= .5
			 
		--	explode()
			-- create x and y accel based on rotation
			sfx(0)
			truerot = p.rot % 1 * 360
			p.accel.x = cos(((truerot-90)/360)) * -1 * p.baseaccel
   p.accel.y = (-1 * sin(((truerot-90)/360)) * p.baseaccel) +g.gravity/4
			p.landed = false
		else
		
			if p.energy < 15 then
			p.energy += .25
			elseif p.energy < 30 then
			p.energy += .40
			elseif p.energy < 50 then
			p.energy += .5
			end
		g.spritethruster = 4
			if (not p.landed) p.accel.y = g.gravity p.accel.x = 0
			
		end
	
		if (btn(0)) then
			--p.accel.x = -.01
			if (not p.landed) p.rot += 0.03125
			
		elseif (btn(1)) then
			--p.accel.x = .01
			if (not p.landed) p.rot -= .03125
	
		else
			--p.accel.x = 0
		end
end


function gameover()
state = 5
clearcache()
end

function managemovement()
  oldvelx = p.vel.x
		oldvely = p.vel.y
		matched = false
		
		if not p.landed then
			p.vel.x += p.accel.x
			p.vel.y += p.accel.y
   
   if (p.vel.x^2 + p.vel.y^2) > p.maxvel^2 then
   	p.vel.x = oldvelx 
   	p.vel.y = oldvely
   end		
			newx = p.x + p.vel.x
			
			
			if checkwall(newx, p.y) or checkwall(newx, p.y+1) or checkwall(newx, p.y+4) or checkwall(newx,p.y+7) or checkwall(newx+7, p.y) or checkwall(newx+7, p.y+1) or checkwall(newx+7, p.y+4) or checkwall(newx+7,p.y+7) then
				p.vel.x *= -1 * p.bounce
				matched = true
				sfx(1)
		
		applydamage(sqrt(p.vel.x^2 + p.vel.y^2))
			else
				p.x = newx
			end
		
			newy = p.y + p.vel.y
			if checkwall(p.x, newy) or checkwall(p.x +1, newy) or checkwall(p.x+4, newy) or checkwall(p.x+7, newy) or checkwall(p.x, newy+7) or checkwall(p.x+4, newy+7) or checkwall(p.x+7, newy+7) then
				matched = true
				p.vel.y *= -1 * p.bounce	
				sfx(1)
		
		applydamage(sqrt(p.vel.x^2 + p.vel.y^2))
			else
				p.y = newy
			end
			if not matched and checkwall(p.x+7+.1, p.y+7+.1) or checkwall(p.x+7+.1, p.y+.1) or checkwall(p.x + 1, p.y + .1) or checkwall (p.x + p.vel.x, p.y+7 + .1) then		
			sfx(1)
		
		applydamage(sqrt(p.vel.x^2 + p.vel.y^2))
		
			p.vel.x *= -1 * p.bounce 
			p.vel.y *= -1 * p.bounce
			end
			if not matched and checkwall(p.x+7+p.vel.x, p.y+7+p.vel.y) or checkwall(p.x+7+p.vel.x, p.y+p.vel.y) or checkwall(p.x + p.vel.x, p.y + p.vel.y) or checkwall (p.x + p.vel.x, p.y+7 + p.vel.y) then		
			
		
	--		p.vel.x = p.vel.x * -1 
	--		p.vel.y = p.vel.y * -1
			end
			if (abs(p.vel.y) < p.landingthreshold) and (abs(oldvely) < p.landingthreshold) then
				if (sgn(p.vel.y)) ~= (sgn(oldvely)) then
				if (checkwall(p.x+4,p.y+8+.1))then
				p.landed = true
				p.rot = 0
				p.vel.y = 0
				p.vel.x = 0
				checkgoal(p.x, p.y)
				if p.fuel <= 0 then
					p.canmove = false
				end
				end
		end 
			end
	end
end

function checkforgameover()
		
if p.health < 0 then
			p.canmove = false
			
	end
end
function limit()
	if p.health > 50 then
		p.health = 50
	end 
	if p.fuel > 50 then
		p.fuel = 50
	end
	if p.energy > 50 then
		p.energy = 50
	end
end
function resetspaceram()
spaceram.x = 75
spaceram.y = -350
spaceram.velx = 0
spaceram.vely = 0
spaceram.accelx = 0
spaceram.accely = 0
spaceram.mode = 1
spaceram.health = 5
spaceram.hurt = false
end
function create_star()

local star = {}

add (stars, star)
return star

end

function create_part(plx, ply, dest, lm)

local part = {
	x = plx,
	y = ply,
	limit = lm,
	vel = {
	x = .1,
	y = .1
	},
	t= 0
}

add(dest,part)

return part
end

function explode(locx,locy)
-- create a bunch of particles
	sfx(11)
 for i=1,16 do
     np=create_part(locx,locy, parts, 100)
      
     np.vel.x = cos(i/16)*2
     np.vel.y = sin(i/16)*2
  end   
-- turn an explosion flag on?
end

function _init()
	cls()
	create_stars()
end

function animatepylons()
-- go through pylon array
mset(6,6,53)
for py in all(pylons) do

mset(py.x,py.y,51+flr(pyc))

--py.c +=.1
--py.c = py.c % 3
end
pyc += .1
pyc = pyc % 3
end
function _update()
	g.timer += .1
	
	if state == 1 then
		cam.x = 0
		cam.y = 0
		runtitlescreen()
		--print(#intromsg.m + 30*intromsg.buffer)		
	end
	
	if state == 1.5 then
		if (runmessage(allmsgs[levelcounter])) then
			
			state = 2.5
		
		end
		
		if btnp(5) then
			state = 2.5
			resetmsgs()
		end

	end
	
	if state == 2 then
		foreach(parts, move_part)
		
		animatepylons()
		if levelcounter == 3 and not p.dead then
		local rndnum = rnd(100)
		if (rndnum <= 75) then
			local gb = create_part(p.x+4,p.y+4, gasblobs, 45)
			gb.vel.y = rnd(10)/10
			gb.vel.x = 0
		end
		end
		for sb in all(scorebursts) do
			sb.vel.x *= .9
			sb.vel.y *= .9
		end
		foreach(scorebursts, move_part)
		foreach(gasblobs, move_part)
		foreach(bullets, move_part)
		if levelcounter == 5 then
		updatespaceram()
		end
		if p.canmove then
			
			if g.timer > g.marktimer + 20 then
			cannonmsg = false
			end
			if levelcounter == 4 then
				 g.gravity = 0.09
			else
				g.gravity = 0.04
			end
			checkinput()
			managemovement()
			limit()
			checkforitems()
			checkforgameover()		
			if g.timer > g.marktimer + 0.5 then
			p.hurtfactor = 0
			end
		elseif p.atgoal then 
			if p.fuel >= 0 then
				if (flr(g.timer*5) % 2 == 0) then
					p.fuel -= 1
					p.score += 10
					sfx(6)
						if (flr(g.timer*5) % 4 == 0) then
					local sb = create_part(p.x-4,p.y-4, scorebursts, 45)
		sb.vel.x = cos(rnd(10)/10)*3
		sb.vel.y = cos(rnd(10)/10)*3
		srand(rnd(1200))
		sb.val= vicphrases[flr(rnd(#vicphrases)+1)]
		sb.col = 3
		end
					g.timer +=1
					
				end
			elseif p.energy >= 0 then
				if (flr(g.timer*5) % 2 == 0) then
					p.energy -= 2
					p.score += 2
					sfx(8)
						if (flr(g.timer*5) % 4 == 0) then
					local sb = create_part(p.x-4,p.y-4, scorebursts, 45)
		sb.vel.x = cos(rnd(10)/10)*3
		sb.vel.y = cos(rnd(10)/10)*3
		srand(rnd(1200))
		sb.val= vicphrases[flr(rnd(#vicphrases)+1)]
		sb.col = 9
		end
					g.timer +=1
				end
			elseif p.health >= 0 then
				if (flr(g.timer*5) % 2 == 0) then
					p.health -= 1
					p.score += 10
					if (flr(g.timer*5) % 4 == 0) then
					local sb = create_part(p.x-4,p.y-4, scorebursts, 45)
		sb.vel.x = cos(rnd(10)/10)*3
		sb.vel.y = cos(rnd(10)/10)*3
		srand(rnd(1200))
		sb.val= vicphrases[flr(rnd(#vicphrases)+1)]
		sb.col = 8
		end
					sfx(6)
					g.timer +=1
					g.marktimer = g.timer
				end
			else
				if g.timer - g.marktimer > 5 then
				nextlevel()
				end
			end
	
	--gameover()
		elseif not p.dead then
		p.dead = true
		g.marktimer = g.timer
			if p.fuel >= 0 then
				explode(p.x,p.y)
			else
			-- fuel out
			end
		else
		
			if g.timer - g.marktimer > 11 then
			 loselife()
			end
		end
	end
	if state == 2.5 then
	camera(0,0)
	
	if (btnp(4)) then
	 	cls()
	 	resetplayer()
	 	
	 	state=2
	 	end
	end	
	if state == 3 then
	
	end
	if state == 5 then
	restart()
	end
end

function move_star(st)

st.vel = {x = p.vel.x*.05, y = p.vel.y*.05}
st.rx += st.vel.x
st.ry += st.vel.y
if abs(st.rx - flr(st.rx)) <= 0.5 then
st.x = flr(st.rx)
else
st.x = flr(st.rx + 1) 
end

if abs(st.ry - flr(st.ry)) <= 0.5 then
st.y = flr(st.ry)
else
st.y = flr(st.ry + 1) 
end



end
function move_part(pt)
if (pt.t > pt.limit) then
del (parts, pt)
del (scorebursts, pt)
del (gasblobs, pt)
del (bullets, pt)
end

pt.x += pt.vel.x
pt.y += pt.vel.y
-- slow down vels here
--pt.vel.x *= .98
--pt.vel.y *= .98
pt.t += 1

if pt.isbullet then
	local itemtile = getsprite(pt.x,pt.y)
	if itemtile == 47 then
	cleartile(pt.x, pt.y)
	sfx(10)
	del (bullets, pt)
	elseif fget(itemtile,7) then
	del (bullets, pt)
	elseif spaceram.health > 0 and pt.x > spaceram.x and pt.x < spaceram.x+16 and pt.y > spaceram.y and pt.y < spaceram.y + 16 then
	del (bullets, pt)
	spaceram.health -= 1
	sfx(12)
	spaceram.hurt = true
	if spaceram.health == 0 then
	explode(spaceram.x, spaceram.y)
	end
end
end
end
function draw_bullets(b)
line(b.x-1,b.y,b.x+1,b.y,7)
line(b.x,b.y-1,b.x,b.y+1,7)
end
function draw_gbs(gb)
pset(gb.x, gb.y,3)
end
function draw_sbs(sb)
cursor(sb.x,sb.y)
if sb.t % 10 <= 5 then
color(7)
else
color(sb.col)
end
print(sb.val)
end

function draw_part(pt)
local col
if pt.t % 5 == 0 then

col = 7
else
col = 12
end
circfill(pt.x, pt.y, 7, 7)

circfill(pt.x, pt.y, 4, col)
end

function loselife()
p.lives -= 1
restoreitems()
resetspaceram()
	if p.lives < 0 then
		gameover()
	else
		resetplayer()
	end
end
function checkgoal(x,y)

local itemtile = getsprite(x+4, y+8+4)
	
--local itemtile = mget(flr((x+4)/8),(flr((y+8+4)+320)/8))
		if fget(itemtile,0) and not clevel.itemreq or fget(itemtile,0) and p.hasitem then
			cls()
			p.atgoal = true
			p.canmove = false
		--	nextlevel()
		end
end

function clear_stars()
	for i=1,#stars do
	del(stars,stars[i])
	end
end
function create_stars()
for i=1,30 do
	 			local star = create_star()
	 			srand(rnd(1200))
	 			star.x = flr(rnd(128))
	 			star.y = flr(rnd(128))
	 			star.rx = star.x
	 			star.ry = star.y
	 			star.col = 5 + flr(rnd(3))			
	 	end
end
function nextlevel()
resetmsgs()
camera(0,0)
resetplayer()
restoreitems()
clearcache()
clear_stars()
	for i=1,#gasblobs do
	del(gasblobs,gasblobs[i])
	end
create_stars()
--stars = {}
--create_stars()
state = 1.5
p.canmove = true
p.atgoal = false
levelcounter += 1
if levelcounter == 6 then
state = 10
g.marktimer = g.timer
else
clevel = levels[levelcounter]
cls()
end

end

function resetplayer()
cls()
--restart camera
camera(0,0)
--state = 1
p.health = 50
p.vel.x = 0
p.vel.y = 0
p.accel.x = 0
p.accel.y = 0
p.rot = 0
p.x = 60 --64,
p.y = 48
p.energy = 50
p.fuel = 50
p.dead = false
p.atgoal = false
p.canmove = true
p.hasitem = false
p.hascannon = false

end

function resetmsgs()
for msgcol in all(allmsgs) do
	for msg in all(msgcol.msgs) do
		msg.mcount = 0
		msg.timer = 0
	end 
	msgcol.marker = 1
end
end
function restart()
resetplayer()
resetspaceram()
state = 1
p.lives = 3
levelcounter = 1
p.score = 0
clevel = level1
--replace this with a loop

resetmsgs()

--intromsg.mcount = 0
--intromsg.timer = 0
--intromsg2.mcount = 0
--intromsg2.timer = 0
clevel = level1
end

function checkforitems()
-- iterate through item array
-- check if player is colliding with any of them
checkitem(p.x, p.y)
checkitem(p.x+8, p.y)
checkitem(p.x, p.y+8)
checkitem(p.x+8, p.y+8)

end
function applydamage(mag)
	if abs(mag) > p.damagethreshold then
		p.health -= mag * p.collfactor
		
	end
	if abs(mag) > 1.2 then
	sfx(13)
	p.hurtfactor = 32
	g.marktimer = g.timer
	end
	
	
end
function cleartile(x, y)
mset(flr((x-clevel.offset.x)/8)+clevel.origin.x,flr((y-clevel.offset.y)/8)+clevel.origin.y,49)
end
function checkitem(x, y)
--local itemtile = mget(flr(x/8),(flr(y+320)/8))
	local itemtile = getsprite(x,y)
	
	if itemtile == 5 then
		if p.hasitem then
		storeitem(itemtile,x,y)
			cleartile(x,y)
			
		end
	end
	
	if itemtile == 18 then
		p.hascannon = true
		cannonmsg = true
		g.marktimer = g.timer
		storeitem(itemtile,x,y)
		cleartile(x,y)
		sfx(2)
	end
	if (fget(itemtile,6))then -- gas
		--set space to empty
		storeitem(itemtile,x,y)
		cleartile(x,y)
	
		if p.fuel <= 40 then
		p.fuel += 10
		else
		p.fuel = 50
		end
		sfx(2)
		local sb = create_part(x,y, scorebursts, 45)
		sb.vel.x = cos(rnd(10)/10)*2
		sb.vel.y = cos(rnd(10)/10)*2
		sb.val="fuel!"
		sb.col = 3
		-- play sfx
		-- increase var

	elseif (fget(itemtile,5))then
		storeitem(itemtile,x,y)
		cleartile(x,y)
		
		if p.health <= 40 then
			p.health += 10
		else
			p.health = 50
		end
		local sb = create_part(x,y, scorebursts, 45)
		sb.vel.x = cos(rnd(10)/10)*2
		sb.vel.y = cos(rnd(10)/10)*2
		sb.val="health!"
		sb.col = 8
		sfx(2)
	

	elseif (fget(itemtile,4))then
		storeitem(itemtile,x,y)
		cleartile(x,y)
		if p.energy <= 40 then
			p.energy += 10
		else
			p.energy = 50
		end
		local sb = create_part(x,y, scorebursts, 45)
		sb.vel.x = cos(rnd(10)/10)*2
		sb.vel.y = cos(rnd(10)/10)*2
		sb.val="energy!"
		sb.col = 9
		sfx(2)
	elseif (fget(itemtile,3))then
		storeitem(itemtile,x,y)
		cleartile(x,y)
		itemval = 500
		if itemtile == 23 then
			itemval = 750			
		elseif itemtile == 21 then
			itemval = 1000
		elseif itemtile == 34 then
		itemval = 1250
		else
			itemval = 500
		
		end
		p.score = p.score + itemval/10
		local sb = create_part(x,y, scorebursts, 45)
		sb.vel.x = cos(rnd(10)/10)*2
		sb.vel.y = cos(rnd(10)/10)*2
		sb.val=itemval
		sb.col = 12
		sfx(2)
	elseif (fget(itemtile,2))then
		storeitem(itemtile,x,y)
		cleartile(x,y)
		p.hasitem = true
		sfx(2)
		local sb = create_part(x,y, scorebursts, 45)
		sb.vel.x = cos(rnd(10)/10)*2
		sb.vel.y = cos(rnd(10)/10)*2
		sb.val= phrases[1 + flr(rnd(#phrases))]
		sb.col = 12
	end
end 

function getsprite(x,y)
	return mget(flr((x-clevel.offset.x+clevel.origin.x*8)/8),(flr(y+(clevel.origin.y*8)-clevel.offset.y)/8))
end

function checkwall(x, y)
--mget(flr(x/8),(flr(y+320)/8))
	local tile = getsprite(x, y)

	if (fget(tile,7))then
		
		return true		
	else
		return false
	end

end
function drawbg()

-- draw stars
for star in all(stars) do
pset(flr(cam.x + star.x), flr(cam.y + star.y), star.col)

end

if levelcounter == 1 or levelcounter == 4 or levelcounter == 6 then
 
spr(62,flr(8+cam.x),flr(8+cam.y))
spr(45,flr(16+cam.x),flr(32+cam.y))
spr(26,flr(64+cam.x),flr(24+cam.y))
spr(42,flr(88+cam.x),flr(16+cam.y))
spr(62,flr(112+cam.x),flr(40+cam.y))
spr(43,flr(48+cam.x),flr(104+cam.y))
spr(38,flr(104+cam.x),flr(104+cam.y),2,2)
spr(45,flr(112+cam.x),flr(120+cam.y),2,2)
end

if levelcounter == 2 then
	spr(58,flr(64+cam.x),flr(34+cam.y))
	spr(26,flr(34+cam.x),flr(14+cam.y))
	spr(62,flr(84+cam.x),flr(64+cam.y))
end
if levelcounter == 5 or levelcounter == 3 then
spr(40,flr(84+cam.x),flr(24+cam.y),2,2)
spr(59,flr(25+cam.x),flr(74+cam.y))
spr(45,flr(30+cam.x),flr(14+cam.y))
spr(42,flr(106+cam.x),flr(94+cam.y))
spr(45,flr(115+cam.x),flr(90+cam.y))
--map(113,0,cam.x,cam.y,16,16)

end
end
function runmessage(msgcol)
 local mk = msgcol.marker
 local msg = msgcol.msgs[mk]
	if msg then
	local scursor = flr((128 - (msg.mmax * 4.25))/2)
 --local scursor =4
	if mk == 1 and msg.mcount == 1 then
		rectfill(0,38,128,82,6)
		rectfill(2,40,125,80,3)
	end
	cursor(scursor,58)
	color(11)
--foreach(msg.m, function(i)
	
--end)
	msg.timer = msg.timer +1
	if (msg.timer % 3 == 0) then
		--cursor(scursor + msg.mcount*4,58)
		if (msg.mcount<msg.mmax) then
			print(msg.m)
			--print(#msgcol.msgs)
			sfx(3)
		end
		msg.mcount += 1

	end
	if msg.mcount >= msg.mmax + 30*msg.buffer then
		cls()
		rectfill(0,38,128,82,6)
				rectfill(2,40,125,80,3)
		msgcol.marker += 1
		if (msgcol.marker > #msgcol.msgs) then
			-- reset marker
		
		intromsgs.marker =1 	
		return true
		end
	else
		return false
	end
	else
	return true
	end
end

function drawhud()

	rectfill(cam.x, 128-58+cam.y, cam.x +16, cam.y+128, 0)
		cursor(1+cam.x, 128-56+cam.y)
		color(3)
		print("f")
		rectfill(0+cam.x,128+cam.y,4+cam.x,128-flr(p.fuel)+cam.y, 3)
	 cursor(7+cam.x, 128-56+cam.y)
		color(9)
		print("e")
	 rectfill(6+cam.x,128+cam.y,10+cam.x,128-flr(p.energy)+cam.y,9)
	 cursor(13+cam.x, 128-56+cam.y)
		color(8)
		print("h")
	 rectfill(12+cam.x,128+cam.y,16+cam.x,128-flr(p.health)+cam.y,8)
		color(7)
		local scorestring = "score: " .. p.score
		cursor(cam.x+128 - (#scorestring*4) - 4, cam.y)
		if p.score > 0 then
		print(scorestring)
		else
		print("score:")
		--print(spaceram.accelx)
		end
		cursor(cam.x+124, cam.y)
		print("0")
		for i=1,p.lives do
			spr(0,129-9*i+cam.x,120+cam.y)
		end
end
function _draw()
	if state == 1.5 then
		--print(intromsgs.marker)
	end
	if state == 1 then
		-- draw title screen
		--runbackground()
		cls()
		--print(g.timer)
		local sp = sps[(flr(g.timer) % 2) +1]
		drawbg()
		--map(113,0,0,0,16,16)
		--pal(9,8,1)
		for i=1,12 do
			if (i % 2 == 0) then 
			spr(sp[1],8+i*8,32)
			else 
			spr(sp[2],8+i*8,32)
			end
		end
		
		for i=1,12 do
			
			if (i % 2 == 0) then 
			spr(sp[1],8+i*8,80)
			else 
			spr(sp[2],8+i*8,80)
			end
		end
		
		for i=1,6 do
		if (i % 2 == 0) then
			spr(sp[2],16,32+i*8)
			else
			spr(sp[1],16,32+i*8)
			end --43 is 1, 6 is 2
		end
		
		for i=1,6 do
		if (i % 2 == 0) then
			spr(sp[1],104,32+i*8)
			else
			spr(sp[2],104,32+i*8)
			end
		end
		--rectfill(0, 0, 128, 128, 0)
		spr(68, 32,40,8,4)
		if ((flr(g.timer/3) % 2) + 1) == 1 then
		print("press z to start", 34,100,7)
		end
		print("robysoft",64-16,10, 6)
		print("presents",64-16,18,5)
		
		
--runmessage(intromsg)
		if paltimer % 2 == 0 then
			--pal (8,7)
		else
		pal()
		end



	end
	if state ==2.5 then
		cls()
		local titlelength = #(clevel.title)
		color(6)
		cursor((128-(7*4))/2, 50)
		print("stage " .. levelcounter)
		cursor(flr((128 - (titlelength * 4.25))/2), 60)
		print(clevel.title)
	end
	 if state == 5 then
	 cls()
	 end
	 
	 if state == 10 then
	 	cls()
	 	
	 	cam.x = 0
	 	cam.y = 0
	 	drawbg()
	 	color(2 + g.timer % 11)
	 	g.timer += .3
	 	cursor(38,24)
	 	print ("congratulations!")
	 	if g.timer - g.marktimer > 10 then
	 	color(7)
	 	cursor(14,44)
	 	print("base score:")
	 	if (p.score >= 1000) then
	 	cursor(94,44)
	 	else 
	 	cursor(98,44)
	 	end
	 	print(p.score .. "0")
	 	end
	 	if g.timer - g.marktimer > 20 then
	 	cursor(14,54)
	 	print("lives left: " .. p.lives)
	 	
	 	
	 	if g.timer - g.marktimer > 30 then
	 	line(14,64,112,64,7)
	 	end
	 	cursor(98,54)
	
	 	print(p.lives * 2000)
	 	end
	 	if g.timer - g.marktimer > 40 then
	 	cursor(14,74)
	 	print("final score:")
	 	
	 	cursor(94,74)
	 	print((p.score + (p.lives * 2000)/10) .. "0")
	 	end
	 	if g.timer - g.marktimer > 50 then
 		cursor(14,94)
 		print ("your rank:")
 		end
 		if g.timer - g.marktimer > 70 then
 		local fs = generaterank(p.score + (p.lives * 2000)/10)
 		cursor (116-(#fs*4), 94)
 		print(fs)
 		end
 		if g.timer - g.marktimer > 200 then
	 	restart()
	 	end
	 end
	if state == 2 then
						
			cam.x = p.x - 64	
			cam.y = p.y - 64
			
			camera(cam.x,cam.y)--rectfill(0,0,128,128,0)
			
			
		cls()
		

		drawbg() -- level dependent?
	--map(0,0, 0,-320, 24,48)			
				map(clevel.origin.x, clevel.origin.y, clevel.offset.x, clevel.offset.y, clevel.w, clevel.h)
				drawintro()
				
				foreach(gasblobs,draw_gbs)
				foreach(bullets,draw_bullets)
				
				
				if not p.dead or p.fuel <= 0 then
		local r=flr(p.rot*20)/20
  local s=sin(r)
  local c=cos(r)
  local b=s*s+c*c
  	for y=-4,4 do for x=-4,4 do
    local ox=( s*y+c*x)/b
    local oy=(-s*x+c*y)/b
    
    local col=sget(ox+4,oy+p.hurtfactor + g.spritethruster)
    if col>0 then 
      pset(p.x+4+x,p.y+y+4,col)
	 		end
	 	end end
	 end
	 if p.dead and p.fuel <=0 then
	 	color(8)
	 	rectfill(64-12+cam.x, 32+cam.y, 64+18+cam.x, 36+cam.y)
	 	
	 	cursor(64-12+cam.x,32+cam.y)
	 	
	 	color(7)
	 	
	 	print ("fuel out")
	 
	 end
	 if cannonmsg then
	 	 	color(8)
	 	rectfill(22+cam.x, 32+cam.y, 104+cam.x, 36+cam.y)
	 	
	 	cursor(cam.x+22,32+cam.y)
	 	
	 	color(7)
	 	
	 	print ("use z to fire cannon!")
	 end
	 --pset(p.x, p.y, 15)
	 --pset(p.x+8, p.y+8, 15)
	 foreach(parts,draw_part)
	 foreach(scorebursts,draw_sbs)
	 if levelcounter == 5 then
	 drawspaceram()
	 end
	 drawhud()
	end
	
end


function updatespaceram()
	if spaceram.health > 0 then
	spaceram.velx += spaceram.accelx
	spaceram.vely += spaceram.accely
	
	if spaceram.velx > 1 then 
		spaceram.velx = 1
		end
		if spaceram.velx < -1 then 
		spaceram.velx = -1
		end
		if spaceram.vely > 1 then 
		spaceram.vely = 1
		end
		if spaceram.vely < -1 then 
		spaceram.vely = -1
		end
	--spaceram.velx = 1 + spaceram.accelx
	spaceram.x += spaceram.velx
	spaceram.y += spaceram.vely
--check for collision with player
if abs((spaceram.x + 8)-(p.x + 4)) < 12 and not p.dead and abs((spaceram.y + 8)-(p.y + 4)) < 12 then
--compare positions
sfx(13)
p.landed = false
if spaceram.x + 8 > p.x + 4 then
p.vel.x = -3
else 
p.vel.x = 3
end

if spaceram.y + 8 > p.y + 4 then
p.vel.y = -3
else 
p.vel.y = 3
end

end
	local dist = abs(p.x +4 - spaceram.x+8) + abs(p.y+4 - spaceram.y+8)
	local disttohome = abs(75 - spaceram.x+8) + abs(-350 - spaceram.y+8)
	local targetx
	local targety
if dist < 100 then
spaceram.mode = 1
targetx = p.x
targety = p.y
elseif disttohome > 100 then
spaceram.mode = 1
targetx = 75
targety = -350
else 
spaceram.mode = 2
end

	 -- seek
	 if (spaceram.mode == 1) then
	 if spaceram.x > targetx then
	 spaceram.accelx = -.03
	 --spaceram.velx = 2
	 else 
	 spaceram.accelx = .03
	 end	
	 
	 if spaceram.y > targety then
	 spaceram.accely = -.04
	 --spaceram.velx = 2
	 else 
	 spaceram.accely = .04
	 end	
	
	
	
	else
	
	--local ch1 = flr(rnd(3))-1
	--local ch2 = flr(rnd(3))-1
	
	spaceram.accelx = 0
	spaceram.accely = 0
		if g.timer - g.srtimer >= 2 then
		--spaceram.accelx = ch1 * rnd(.005)
		--spaceram.accely = ch2 * rnd(.005)
  spaceram.velx=cos(g.timer)/5
  spaceram.vely=cos(g.timer)/5
  g.srtimer = g.timer	

	end
	end
 	-- if spaceram is near player, move toward him
 	-- otherwise, if spaceram is too far from original location, head back
 	-- otherwise, wander randomly 
end
end
function drawspaceram()
spaceramcounter += 1

if spaceram.hurt then
oldsprite = spaceramsprite
spaceramsprite = 108
else 
spaceramsprite = oldsprite
if spaceramcounter % 30 == 0 then

local chance = rnd(100)

if chance < 50 then
spaceramsprite = 98
oldsprite = 98
else
spaceramsprite = 66
oldsprite = 66
end
end

end
if spaceram.health > 0 then
if spaceram.mode == 1 then
if spaceram.accelx < 0 then
	spr(spaceramsprite,spaceram.x, spaceram.y,2,2, true)
else
 spr(spaceramsprite,spaceram.x, spaceram.y,2,2)
end
else
if spaceram.velx < 0 then
	spr(spaceramsprite,spaceram.x, spaceram.y,2,2, true)
else
 spr(spaceramsprite,spaceram.x, spaceram.y,2,2)
end
end
end
spaceram.hurt = false
end


function generaterank(finalscore)

if finalscore > 4000 then
return "star of stars"
elseif finalscore > 3500 then
return "real hero"
elseif finalscore > 3000 then
return "quite solid"
elseif finalscore > 2000 then
return "journeyman"
elseif finalscore > 1000 then
return "satisfactory"
else
return "space guppy"
end


end
function drawintro()
if levelcounter == 1 and p.canmove then
	 	cursor(15,-96)
	 	color(13)
	 	print("collect") 
	 	cursor(15,-90)
	 	print("extra fuel")
	 	
	-- 	cursor(120,-126)
	-- 	color(13)
	-- 	print("gems are") 
	 --	cursor(120,-120)
	-- 	print("bonus points")
	 	
	 --	cursor(44,-180)
	 --	print("get energy") 
	 --	cursor(48,-174)
	 --	print("to boost")
	 	
	 --	cursor(50,-300)
	 	--print("land to") 
	 	--cursor(50,-294)
	 	--print("advamce")
	 	
	 
	 end   
end
__gfx__
00666600000000000000000000bbbb00000888806666666600055000000660005555555500eeee0088888888aaa11111111aaaaa650000008080808000000000
06ddad6000000000000000000b5575b000880080777777770057750000333300567777650eeee7e088000088aa11111111aaaaaa560000000808080800000000
6ddddad60000000000000000b555575b80800080cccccccc05766d5003aaaa3057788775eeeeee7e80800808a11111111aaaaaaa053333508080808000000000
6ddddad60000000000000000b555575b88888888cccccccc576776d503a3333057888875eeeeee7e8008800811111111aaaaaaaa035335300808080800000000
66dddd660000000000000000b555555b80800880cccccccc576776d503aaaa3057888875eeeeee7e800880081111111aaaaaaaa1033353308080808000000000
66dddd6600000000000000000b5555b080800800cccccccc05766d5003a3333057788775eeeeeeee80800808111111aaaaaaaa11033533300808080800000000
6066660600000000000000000bbbbbb08880880077777777005dd50003aaaa30567777650eeeeee08800008811111aaaaaaaa111035335308080808000000000
606006060000000000000000bb0bb0bb088800006666666600055000003333005555555500eeee00888888881111aaaaaaaa1111053333500808080800000000
000000000000000000000000aaaa0000c55555c00000000000599000000000005544544566666666222200006666666666666666955555590000000000000000
000000000000000000000000a00a0000c555c5cc0a0a0a0a0595590009fffff0544444446600006600022020655cc55660066006599999950000000000000000
000000000000000000cccc00a00a0000c555c5cca9a9a9a95959959009fff7f0444554446060060600255200655cc55660066006555995550000000000000000
00000000000000000c7777c0a00aaaaac55555cc444444445959959009fff7f04454554466666666025dd5206cccccc660066006555995550000000000000000
0000000000000000c777711ca00aaaaaccccccccddd55ddd5959959009fffff05454455466666666025dd5206cccccc660066006555995550000000000000000
0000000000000000c777711ca00a0a0ac777777c4445544459599590009fff00454444446060060600255200655cc55660066006555995550000000000000000
00000000000000000c7777c0a00a0a0ac777777c44444444059559000009f000444554446600006602022000655cc55660066006599999950000000000000000
000000000000000000cccc00aaaa0000c777777c4444444400599000009fff005455554566666666000022226666666666666666955555590000000000000000
0066660000000000000000000000000000000000000bb000000000999900000000000033bb00000000eee90000333c0055665665000000000000000058888885
06ddad600000000000000000000000000088780000bbbb00000099999ee90000000033333bbb00000ee4ee90033c33b056666666005660000000000085555558
6ddddad6000000000f7fff7000f7ff0008878880036bbbb000099999eee990000003333333bbb0004444e499cccc3cbb66655666056676000000000085888858
6ddddad600000000ffff7fff0ffff7f0088878803336bbbb0099994eeeee990000d33333dddbbb00844444493ccccccb66565566056666600000000085888858
66dddd660000000088888888088888800888878033336bbb0999944eeeeee99003d53333353bbbb088e9ee9933cbccbb56566556056666000000000085888858
66dddd6600000000333333330333333008888780033336b0099944eeeeee4e90033dd3333333bbb0888e8e44333c3ccc65666666005660000000000085888858
6766667600000000444444440444444008887880003333009994444ee4484e99333333333333bbbb0888844003333cc066655666000000000000000085555558
6068860600000000ffffffff0f7ff7f00087880000033000499444444444ee993333dd333333bbbb0088840000333c0056555565000000000000000058888885
00000000000000000000000000088000000870000007800044444444444eee9933333ddd3333bbbb00bbb3000088ee000000000000000000000dd000d666666d
00000000000000000000000000d888000088870000878800ee44488eeeeeee993333355dd333bbbb0bb3bbb008888ee00000000000000000005dd5006dddddd6
00000000000000000000000000d8880000888700008878000ee88888e8eeee900333333ddd33bbb03333b355888888ee000000000000000005dddd506d6666d6
000000000000000000000000000d800000088000000870000ee888888884444003333333333bbbb0b3333335888888ee0000000000000000ddd66ddd6d6666d6
00000000000000000000000000055000000550000005500000ee88888884440000d33333333bbb00bb353355888888ee0000000000000000ddd66ddd6d6666d6
000000000000000000000000000550000005500000055000000e888888444000000dd33333bbb000bb53b333888888ee000000000000000005dddd506d6666d6
000000000000000000000000005555000055550000555500000088888e440000000055d33bbb000005bbb33008888ee00000000000000000005dd5006dddddd6
00000000000000000000000005555550055555500555555000000088ee00000000000055bb00000000bbb3000088ee000000000000000000000dd000d666666d
00888800000000000000777777770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0866a680000000000007755577777000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
86666a68000000000077577757777700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
86666a68000000000775777775777e00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
88666688000000007757755577eeeee0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
88666688000000007757757557e777ee000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
80888808000000007757757757eeeeee008888888888888000000000000000000000000000000000000000000000000000008008080888000000000000000000
80800808000000000757777757eeeee0008788787877788000000000000000000000000000000000000000000000000000008080080800800000000000000000
0000000000000000e775777577ce7770008787887878878000000000000000000000000000000000000000000000000000008800080800800000000000000000
0000000000000000ec7755577ccc7770008778887878878000000000000000000000000000000000000000000000000000008000080800800000000000000000
0000000000000000eec77777cccc0000008788887878878000000000000000000000000000000000000000000000000000008800080800800000000000000000
000000000000000000ecc77ccccc0000008778887878878000000000000000000000000000000000000000000000000000008080080800800000000000000000
000000000000000000eecccccccc7700008787887878878000000000000000000000000000000000000000000000000000008008080888000000000000000000
00000000000000000000eee00cccc770008788787877788000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000e00000cccc0008888888888888000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00888800000000000000777777770000000999999999900999999999900999999999009999999999000099999000099000006666666600000000000000000000
0866a680000000000007755577777000009888888888890988888888890988888889098888888888900988888900988900066555666660000000000000000000
86666a68000000000077577757777700009888888888890988888888890988888889098888888888909888888890988900665666566666000000000000000000
86666a68000000000775777775777e00009888999988890988999988890099888990098889999888909888988890988906656666656666000000000000000000
88666688000000007757755577eeeee0009889000098890989000098890009888900098890000988909889098890988966566555666666600000000000000000
88666688000000007757757557e777ee009889000098890989000098890009888900098890000988909889098890988966566565566777660000000000000000
87888878000000007757757757eeeeee009889000098890989000098890009888900098890000988909889098890988966566566566666660000000000000000
80888808000000000757777757eeeee0009889000098890988999988890009888900098890000988909889098890988906566666566666600000000000000000
0000000000000000e775777577ce7770009889000098890988888888890009888900098890000988909889098890988966656665665666600000000000000000
0000000000000000ec7755577ccc7770009889000098890988888888900009888900098890000988909889098890988966665556655566600000000000000000
0000000000000000eec77777cccc0000009889000098890988999988890009888900098890000988909889098890988966666666555500000000000000000000
000000000000000000ecc77ccccc7770009889000098890988900098890009888900098890000988909889098890988900655665555500000000000000000000
000000000000000000eeccccccccccc0009888999988890988900098890099888990098889999888909889098889888900665555555566000000000000000000
00000000000000000000eee0000cccc0009888888888890988900098890988888889098888888888909889098888888900006660055556600000000000000000
000000000000000000000e0000000000009888888888890988900098890988888889098888888888909889009888889000000600000555500000000000000000
00000000000000000000000000000000000999999999900999000099900999999999009999999999000990000999990000000000000000000000000000000000
a02323131313131323232323131313f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3a0b1131313131313
131313131391131391131313131313a0a0131313131313131313001313c213131313131313131313131313131313131313131313131313131313131313138181
a023231313131313232323232323f3f3131313f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3a0b1b11313131313
131313139191716191911313131313a0a01313131313131313130013131313131313131313131313131313131313131313131313131313131313131313131381
a0232323232323232323232323f3f3f31313131313f3f3f3f3f3f313131313131313131313131313f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3b1b1b1b113131313
131391911391919191139191131313a0a01313131313131313130013131313131313131313131313131313131313131313131313131313131313131313131381
a0232323232323232323232323f3f3f3131313131313f3f3f3f30013131313131313131313131313131313131313f3f3f3f3f3f3f3f3f3f3a013131313131313
131313131313131313131313131313a0a01313919191131313130013131313131313131313131313131313131313131313131313131313131313131313131381
a0232323232323232323232323f3f3f3131313131313f3f313130013131313131313131313131313131313131313131313f3f3f3f3f3f3f3a013131313131313
131313131313131313131313131313a0a01313131313131313130013131313131313131313131313131313131313131313131313131313131313131313131381
f3f3f3f3f32323232323232323f3f3f313131313131313131313131313131313131313131313131313131313131313131313f3f3f3f3f3f3a013701313131313
131313131313131313131313131313a0a01313131313131313131313131313131313000000000000131313131313131313131313131313131313131313131381
f3f30000131313232323232323f3f3f31313131313131313131313131313131313131313131313131313131313131313131313f3f3f3f3f3b1b1b1b113131313
131313131313131313131313131313a0a01313131313131313131313d01313131313000000000000131313131313131313131313131313131313131313131381
f3f30000000013131313131313f3f3f3131313f3f313131313131313131313131313131313131313131313131313131313131313f3f3f3f3a0b1b11313131313
131313131313131313131313131313a0a0131313131313131313139191911313131300000000000013131313c2131313c2c21313131313131313131313131381
f3f3000000001313131313131313f3f3131313f3f31313131313131313131313131313131313131313131313131313131313131313f3f3f3a0b1131313131313
131313131313131313131313131370a0a0131313131313131313131313131313131300000000000013131313c2131313c2c21313131313131313131313131381
f3f3000000001300000000000000f3f380d080f3f3131313131313131313131313f3f3f3f3f3f3f3f3f3f313131313131313131313f3f3f3a013131313131313
131313131313131313a01313131361a0a01313131313131313131313131313131313000000000000131313c2c2617161c2c21313131313131313131313131381
f3f3000000001300000000000000f3f3f3f3f3f3f31313131313131313131313f3f31313131313131313f3f313131313131313131313f3f3a013131313131313
131313131313131313a01313131313a0a0131313131313131313131313131313131300000000000013131313c2c2c2c2c2c2c2c2131313131313131313131381
f3f3000000001300000000000000f3f3f3f3f3f3f3f3131313131313131313f3f313131313131313131313f313131313131313131313f3f3a01313131313b1b1
131313131313131313a01313131313a0a01313131313131313131313131313131313000000000000131313131313131313131313131313131313131313131381
f3f3000000001300000000000000f3f36161f3f31313131313131313131313f31313131313131313131313f3f3131313131313131313f3f3a013131380d09113
131313131313131313a01313131313a0a01313131313131313131313131313131313000000000000131313131313131313131313131313131313131313131381
f3f3000000001300000000000000f3f30213f3f31313131313131313131313f3131313131313131313131313f3d01313131313131313f3f3a013131391919113
131313131313131313a01313131313a0a01313131313131313131313131313131313131313131313131313131313131313131313131313131313131313131381
f3f3000000f313000000f3000000f3f30213f3f31313131313131313131313f3131313131313131313131313f3f31313131313131313f3f3a013131313131313
1313a0a0a013131313131313131313a0a01313131391919113131313131313131313131313131313131313131313131313131313131313131381131313138181
f3f3f3f3f3f3c0b0c0b0f3f3f3f3f3f30213f3f31313131313131313131313f3131313131313131313131313f3f3f313131313131313f3f3a013131313131313
131313131313131313131313131313a0a013131313131313131313131313131313131313131313131313131313131313131313131313131381f313131313f381
b0c0b0c0b0c0b0c0b0c0b0c0b0c0b0c0020213f3f313131313131313131313f3f31313334133131313131313f3f31313131313131313f3f3a013131313131313
131313131313131313131313131391a0a013131313131313131313131313131313131313131313131313131313131313131313131313131381f313131313f381
a0131313131313131313131313131313131313f3f3f313131313131313131313f3f3f3f3f3f3f31313131313f3131313131313131313f3f3a013131313131313
131313131313131313131313131313a0a013131313131313131313131313131313131313131313131313131313131313131313131313131381f313131313f381
a013131313131313131313131313131313131313f3f3f3131313131313131313131313131313131313131313f3131313131313131313f3f3a0a0a01313131313
131313131313701313131313131313a0a013131313131313131313131313131313131313139013131313131313131313131313131313131381f3131313f3f381
a013130000000000000000001313131313131313f3f3f3f313131313131313131313131313131313131313f3f3131313131313131313f3f3a013131313131313
131313131313131313131313131313a0a013131313131313131313131313131313131313d1d1d1131313131313131313131313131313138181f313131313f381
a01313000000000000000000131313131313131313f3f3f3f3131313131313131313701313131313131313f313131313131313131370f3f3a013131313131313
131313131313131313131313131313a0a013131313131313131313131313131313131313131313131313131313131313131313131313818181f313131313f381
a0131313131313131313131313131313131313131313f3f3f3f313131313131313131313131313131313f3f3131313131313131313f3f3f3a013131313131313
131313131313131313131313131313a0a013131313131313131313131313131313131313131313131313131313131313131313131313818181f313131313f381
a01313131333131313133323131313131313131313131313f3f3f313131313131313131313131313f3f3f313131313131313131313f313f3a013131313131313
131313131313131313131313131313a0a013131313131313131313131313131313131313131313131313131313131313131313131381818181f313131313f381
a013131313f3e0e0e0e0f3231313131313131313131313131313f3f3f3131313131313f3f3f3f3f3f3131313131313131313131313f313f3a013131313131313
131313131313131313131313131313a0a013131313131313131313131313131313131313131313131313131313131313131313138181818181f313131313f381
a0131313131313131313131313131313131313131313131313131313f3f3f3f3f3f3f3f3f313131313131313131313131313131313f313f3a013131313b1b1b1
131313131313131313131313131313a0a013131313131313131313131313131313131313131313131313131313131313131313138181818181f3f3131313f381
a0131313131313131313131313131313131313131313131313131313131313131313131313131313131313131313131313131313131313f3a013131313131313
131313131313131313131313131313a0a013131381818113131313131313131313131313131313131313131313131313131313138181818181f313131313f381
a0131313131313131313131313131313131313131313131313131313131313131313131313131313131313131313131313131313131313f3a013131313131313
131313131313131313131313139191a0a013138181818181811313131313131313131313131313131313131313131313131313818181f3f3f3f313131313f381
a0131313131313131313131313131313131313131313131313131313131313131313131313131313131313131313131313f3f313131313f3a013131313131313
131313131313131313131391911313a0a081818181818181818113131313131313131313131313131313131313131313131381818181f313131313131313f381
a01313131313131313131313131313131313131313131313131313131313131313131313131313131313131313131313f3f3f313131313f3a0f3131313131313
131313131313131313131313131313a0a081818181818181818181811313131313131381811313131313131313131313131381818181f313131313131313f381
a01313131313131313131313131313131313131313131313131313131313131313131313131313f3f3f3f3f3f3f3f3f3f3131313131313f3a0f3f31313131313
131313131313131313131313131313a0a081818181818181818181818113131313818181818181131313131313131313138181818181f313131313131313f381
a0131313131313131313131313131313131313131313131313131313131313131313131313f3f3f3f3f3f3f3f3f3f3f313139013131313f3a0f3f3f313131313
13131313131313131313131313d013a0a081818181818181818181818181131381818181818181811313131313131381818181818181f313615161131313f381
b0c0b0c0b0c0b0c0b0c0b0c0b0c0b0c0f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3a0a0a0a0a0a0a0a0
a0a091919191a0a0a0a0a0a0a0a0a0a0a081818181818181818181818181818181818181818181818181c0b0c0b08181818181818181f3f3f3f3f3f3f3f3f381
__gff__
0000000080800010200880808040818000000004040808088080008080800000000008000000000000000000800000800000000000000000000000000000008000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0a0f0f0f0f0f0f0f0f0f0f0f0f0f0f0a01010131323232320a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c2c
0a01013131313131010101010101010a01000031323232320a3132323132323232323232323131323232323219323232323232323232320a0a313131313131313131181818181818181818181818180a2c313131313131312c2c2c2c2c2c3131313131313131313131313131313131313131313131313131313131310031312c
0a31313131313131313101010101310a31000031323232320a3132323132323232323232323232323232323219323232323232323232320a0a313131313131313131311818181818181818181818180a2c31313131313131312c2c2c2c2c2c31313131313131313131313160606031310101010101313131313131313131312c
0a31313131000000000000010131310a31000031323232320a3132313131313131313232323232323232323219323232323232321332320a0a313331313133313131313218181818181818181818180a2c31313131313131312c2c2c2c2c2c2c223131313131313131313131313131313131313131313131313131313131312c
0a31313131313131313101313131310a31000031010132320a3100323131313131313232323232323232323219323232323219191919190a0a3f3f0e0e0e3f3f3131313118181818181818181818180a2c311715163131313131312c2c2c2c2c2c3131313131313131313131313131313131313131311c1c05051c1c3131312c
0a31313100000000000000313131310a31000031323232320a3100320a0a0a0a0a0a3232323207323232323232323232323232323232320a0a181818181818183131313131181818181818181818180a2c2c0a0a0a313131313131312c2c2c2c2c2c313131313131313131313131313131313131311c1c313131311c1c31312c
0a31313131313331313331313161610a31000031323232320a3100320a313232310a3232323232323232323232323232323232323232320a0a183f3f181818181831313131311818181818181818180a2c2c2c313131313131313131312c2c2c2c2c2c2c31313131313131313131313131313131311c3331033131331c31312c
0a31313131313f0e0e3f31313131610a01013131323232320a3100310a313132310a3232323232323232323232323232323232323232320a0a3f31313f1818181831313131313118181818181818180a0a2c2c2c2c3131313131313131312c2c2c2c2c2c2c2c3131313131313131313131313131311c1c0e0e0e0e1c1c10312c
0a31313131313131313131313131310a61013131323232320a3100320a311731310a3232323232323232323232323232323232323232320a0a3f3131313f3f183131313131313131181818181818180a0a16162c2c2c313131313131313131312c2c2c2c2c2c2c2c31313131313131313131313131311c1c1c1c1c1c1010312c
0a31313131313131313131313131310a20613131313232310a3100320a0a0a32310a3232323232323232323232323232323232323232320a0a3f0d31313131313131313131313131311818181818180a0a16162c2c2c2c2c3131313131313131312c2c2c2c2c2c2c2c31313131313131313131313131313131313c000010312c
0a31163131313131313131313108310a20613131313232310a31003231313132310a3232323232323232323232323232323232323232320a0a183f32313131313131313131313131313f3f3f3f3f180a0a1616312c2c2c2c31313131313131313131312c2c2c2c2c2c3131313131313131313c3131313131313110000031312c
0a0a0a0a31313131313131310a0a0a0a20313131313232310a31003231313132310a3232323232323232323232323232323232313232320a0a18183f32313131313131313131313131313131313f180a0a313131312c2c2c3131313131313131313131312c2c2c2c2c31313131313131313131313d3132313131313d0031312c
3f3f3f3f31313131313131313f3f3f3f31013232323232310a31000a0a0a0a0a0a0a3131323232323232323232323232323232323232320a0a1818183f313131313131313131313131313131313f180a0a31313131312c2c2c2c313131313131313131312c2c2c2c3131313131313131313131313131313d313131000031312c
3f3f3f3f31313131313131313f3f3f3f31013232323232310a310a0a3132323232323131313f3f05053f3f3232323232323232313232320a0a18181831313131313131313131313131313108313f180a0a2f2f2f2f2f2f2f2c19313131312c31313131312c2c2c2c31313131313c31313131313131313110313131000031312c
3f3f3f3f00313131313131313f3f3f3f31013232323232320a0a0a0a3132323232323132323f323232313f3232323232323232313132320a0a1818313131313131310a0a3131313131313f3f3f3f180a0a313131313131313119313131312c31313131312c2c2c31313131313131313131313c3131313110313d313d3131312c
3f3f3f3f00000731310731313f3f3f3f01013232323232320a0a0a313132323232323132323f313232313f3232323232323232323132320a0a183131310731313131313131313131313118181818180a0a313131313131313119310d07312c313131312c2c2c313131313131313131313131313131313110103131003131312c
3f3f3f000000000000000001013f3f3f31013232323232320a0a31323132323232323232323f313232313f3232323232323232323132320a0a313131313131313131313131313131313131181818180a0a313131313131313119191919192c3131312c2c31313131313131313131313131313131313131313131313f3f3f3f3f
3f3f3f000031313131310001313f3f3f31013232323232320a3132323132323232323232323f333232333f3232323232323232323132320a0a313131313131313131313131313131313131181818180a0a313131313131313131313131312c3131312c2c31313131313131313131313131313131313131313131313f3110313f
3f3f0000000000010101010131313f3f01013232323232320a3132313132323232323232323f3f0e0e3f3f3232323232323232323132320a0a313131313131313131313131313131313131181818180a0a313131313131313131313131312c3131312c2c31313131313131313131313131313131313131313131312f3131313f
3f3f0000000000000101010101313f3f32013232323232320a3132313132323232323232323232323232323232320a0a0a0a0a0a3132320a0a313131313131313131313131313131313131311818180a0a313131313131313131313131312c3131312c2c31083131313131313131313131313131313131313131312f3131313f
3f00000000000000000101010101003f32013232323232320a3109313132323232323232323232323232323232323232323232323232320a0a313131313131313131313131313131313131311818180a0a313131313131313131313131312c313131312c2c2c2c2c313131313131313131313131313131313131312f3131313f
3f00000000000000000000000101003f32323232323232320a3f3f3f3f3f3f3f32323232323232323232323232323232323232323232320a0a313131313131313131313131313131313131311818180a0a313131313131313131313131312c313131312c6c6d2c2c313131313131313131313131313131313131313f3113313f
3f00000000010101010101010101010a0a0a0a0a0a0a0a0a0a3232323132323232323232323232323232323232323232323232323232320a0a313131310a0a0a0a31313131313131313131313118180a0a311531310a3131310a313131312c313131312c7c7d2c2c313131313131313131313131313131313131313f3f3f3f3f
0a000000000000000001000001010131313131313131310a0a3132323132323232323232323232323232323232323232323232323231320a0a313131313131313131313131313131313131313118180a0a0a0a0a0a0a3131310a313131312c073131312c2c2c2c2c313131313131313131313131313131313131313131313118
0a000000000000000001313101010100000000000000310a0a3132323132323131323232323232323232323232323232323232323232310a0a313131313131313131313131313131313131313118180a0a0a313131313131310a31313131312c3131312c2c2c3131313131313131313131313131313131313131313131313118
0a313131313100000031310101010000000000000000000a0a3132323132323132323232323232323232323232323232323232323208320a0a313131313131313131313131313131313131313131310a0a31313131313131310a31313131312c3131312c2c2c3131313131313131313131313131313131313131313131313118
0a313131313131313131310100000000000000000009000a0a313232313231323232323232323232323232323232323232323232323f3f0a0a313131313131313131313131313131313131313131310a0a31123131313131310a31313131172c3131312c2c3131313131313131313131311b1b1b313131313131313131313118
0a31313131313131313131313131310a0a0a0a0a0a0a0a0a0a3132323131313232323f3f32323f3f3232323232323232323232323232320a0a313131313131313131313131313131313131313131310a0a0a0a3131313131310a313131312c313131312c2c3131313131313131313131311b1b1b313131313131313131313118
0a00003100003131313131313131313f31313131313131310a3131313132313131313f313f3f32323232323232323232323131313131310a0a313131313131313131313131313131313131313131310a0a0a0a0a0a0a0a0a0a0a313131312c313131312c2c313131313131313131313131313131313131313131313131313118
0a00003131313131313232323131313f31313131313131310a3232323132323232323f31313232323232323232323232323232323232320a0a313131313131313131313131313131313131313131310a0a313131313131313131313131312c31313131312c313131313131313131313131313131313131313131313131313118
0a000d3131313131313232323100003f31313131313131310a3232323132323231323f31163232323219193232323232323232323232320a0a313131313131313131313131193131193131313131310a0a313131313131313131313131312c3131313131312c3131313131313131313131313131313131313131313131313118
0a0a0a3131313131313232323100003f31313131313131310a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a0a313131313131313131313131193131193131313131310a0a313131313131313131313131312c313131313131313131313131313131313131313131313131313131313131310d18
__sfx__
010112021063010630106300f6300163001630016300163001630016300160001600016003260032600073000360032600326003260032600326000c60010600176001b600246000450014100046000460004600
000400000c1700a1700817005100031002c6001b5002050013500255001a5002850005500265002b5000c5002550029500265002b5002e5000b5000d5002f5001e50021500225000950007500225000650021500
010b000010700107701d7702477017700167001570013700137001570015700177000c700137000e7001e70033700207002a7003b7000670010700327003c7002a700007002c7000070036700007000070000700
010100001847000400004000040007400004000040004400054000540007400044000540004400044000440004400044000440004400004000040000400004000040000400004000040000400004000040000400
003201140071000710007100071000710027100271002710027100271000710007100071000710007100271002710027100271002710047000070000700007000070000700007000070000700007000070000700
011000000e47610476114760e476104760e67610676106760e676106761067611676116760e1760e17610176111760e27610276112760e27610276112760e27610276112760e27610276112760e2761027611276
011900001c7751c7051c7051c7051c7051c7051c7051c7051c7051c7051c7051c7051c7051c7051c7051c7051f7051f7051f7051f7051f7051f7051d7051d7051d7051d7051d7051d7051d7051d7051d7051d705
001000001707016070150700000000000000000000000000000002600026000280002a00028000280002800028000280002800028000280000000000000000000000000000000000000000000000000000000000
011600371f7750f7050f7050f7050d7050f7050d7050f7050d7050f7051a705187051a7051c7051c7051d7051f7051f70524705247050d70518705247051a7050070500705007050070500705007050070500705
011000002d7732d7032d7032d7032d7032d7032d7032d7031c7032d7032d703044052d7032d7032d7032d7032d7032d7032d7032d7032d7032d7032d7032d7032d7032d7032d7032d7032d7032d7032d7032d703
011d000004473002030050300603005030060324603006030050302503004030e0031c00310003104030440304403044030440304403044030440304403044030440304403044030440304403044030440309603
01120000154731347311473104730e4730747305473034530345303433034130340303403104051040511403114051140611403114030340310403104030c403004050240500402024020440304403024010b403
0010000011453004030c4030c40310403104031140311403114031140311403114030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0010000011453104230c4130000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0110000010003150731300310073000030e073110730000310073000030000315073000030000300003100730000315073000030000300003100730000300003000031507300003000031007310073000030e073
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__music__
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344

