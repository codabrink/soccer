require "lib/class"
require "teams/mike/pmike"
class "mike4" : extends(pmike)

function mike4:init(team,x,y)
   self:createPlayer(team, x, y)
end

function mike4:update(dt)
      self:moveTowardsBall(1)
      if self:getDistanceFrom(objects.ball) < 30 then
	 objects.ball:kick(90,130)
      end
end

function mike4:reset()

end