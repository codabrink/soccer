require "lib/class"
require "teams/player"
require "teams/mike/pmike"
class "mike1" : extends(pmike)

function mike1:init(team,x,y)
   self:createPlayer(team, x, y)
end

function mike1:update(dt)
      self:moveTowardsBall(1)
      if self:getDistanceFrom(objects.ball) < 30 then
	 objects.ball:kick(90,130)
      end
end

function mike1:reset()

end