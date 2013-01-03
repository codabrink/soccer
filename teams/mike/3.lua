require "lib/class"
require "teams/mike/pmike"
class "mike3" : extends(pmike)

function mike3:init(team,x,y)
   self:createPlayer(team, x, y)
end

function mike3:update(dt)
      self:moveTowardsBall(1)
      if self:getDistanceFrom(objects.ball) < 30 then
	 objects.ball:kick(90,130)
      end
end

function mike3:reset()

end