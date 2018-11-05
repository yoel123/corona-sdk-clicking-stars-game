yworld = require("yengine.world")

ye = require("yengine.ye")

ystar = require("star")
ysun = require("sun")


ygame = yworld:new()

ygame.points = 0
ygame.rank = "none"
ygame.ptext = nil--points text
ygame.rtext = nil--rank text

function ygame:create( event )

  yworld:create()

  ygame.points = 0--reset just incase
  ygame.ptext = ye:txt("points: "..ygame.points,50,10,14)
  ygame.rtext = ye:txt("rank: "..ygame.rank,150,25,14)

  sun = ysun:new(200,200,"res/sun.png")

  
  for i  = 1,  5 do
    star1 = ystar:new(100,100,"res/Star.png")
    star1:rand_pos()
    self:add(star1)
  end
 -- self:add(star1)
  self:add(sun)

end--create

ygame:yinit()

local function gameLoop(event)
  ygame:update()

  ygame.ptext.text = "points: "..ygame.points--update points text
  ygame.rtext.text = "rank: "..ygame.rank--update rank text

  if(ygame.points>10)then
    ygame.rank = "star clicker"
  end

  if(ygame.points>20)then
    ygame.rank = "pro star clicker"
  end
  if(ygame.points>25)then
    ygame.rank = "master star clicker"
  end
  if(ygame.points>30)then
    ygame.rank = "no life"
  end
  if(ygame.points>35)then
    ygame.rank = "you shod stop you know"
  end
  if(ygame.points>40)then
    ygame.rank = "this game never ends"
  end
  if(ygame.points>45)then
    ygame.rank = "just sying its youre life..."
  end
  if(ygame.points>50)then
    ygame.rank = "good job you win"
  end
  if(ygame.points>60)then
    ygame.rank = "you can stop now"
  end
  

end


gameLoopTimer = timer.performWithDelay( 16,gameLoop , 0 )


return ygame.yscene