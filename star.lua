entity = require("yengine.entity")
local star=  {}
star.__index = star
setmetatable(star,{__index = entity})

function star:new(x2,y2,img2)  

	o =  entity:new(x2,y2,img2)
	setmetatable(o,self)
	o.type = "star"
  o.cur_alpha = 1 --current alpha
	return o

end--new

function star:yupdate()
  
  self:fade()
  self:click()

end--update

function star:click()
  
  if(self.cur_alpha<0)then--only if alpha bigger then 0
    return
  end
  
  if(self.ytap)then
    --print(self.world.points)
    self:rand_pos()
    self.world.points = self.world.points+1--i miss ++ 
    self.ytap=false
  end--if

end--click

function star:fade()  
  
  self:alpha(self.cur_alpha)
  if(self.cur_alpha>0)then--if alpha bigger then 0
    self.cur_alpha = self.cur_alpha-0.005
  end--if

end--fade

function star:rand_pos()  
  self.x=math.random(5,280)
  self.y=math.random(5,300)
end--rand_pos

return star