require "lib/class"
require "teams/mike/pmike"
class "mike5" : extends(pmike)

function mike5:init(team,x,y)
   self:createPlayer(team, x, y)
end

function mike5:update(dt)
      self:moveTowardsBall(1)
      if self:getDistanceFrom(objects.ball) < 30 then
	 objects.ball:kick(90,130)
      end
end

function mike5:reset()

end