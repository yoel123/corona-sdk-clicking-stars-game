entity = require("yengine.entity")
local sun=  {}
sun.__index = sun
setmetatable(sun,{__index = entity})

function sun:new(x2,y2,img2)  

	o =  entity:new(x2,y2,img2)
	setmetatable(o,self)
	o.type = "sun"
	return o

end--new


function sun:yupdate()  
  
  self:click()
  
end--update


function sun:click()

  if(self.ytap)then
    self:rand_pos()
    self:reset_stars()
    self.ytap=false
  end--if

end--click

function sun:reset_stars()
  stars = self:get_by_type("star")
  
  for i  = 1,  #stars do
    stars[i].cur_alpha = 1
  end--for
end--reset_stars

function sun:rand_pos()  
  self.x=math.random(5,280)
  self.y=math.random(5,300)
end--rand_pos

return sun