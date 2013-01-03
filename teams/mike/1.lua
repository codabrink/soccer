require "lib/class"
require "teams/mike/pmike"
class "mike1" : extends(pmike)

function mike1:init(team,x,y)
   self:createPlayer(team, 550, 280)
end

function mike1:update(dt)
      self:moveTowardsBall(1)
      if self:getDistanceFrom(objects.ball) < 30 then
		self:kick(270,200)
      end
end

function mike1:reset()
	
end