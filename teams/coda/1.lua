require "lib/class"
require "teams/player"
require "teams/coda/pcoda"
class "coda1" : extends(pcoda)

function coda1:init(team, x, y)
   self:createPlayer(team, x, y)
end

function coda1:update(dt)
      self:moveTowardsBall(1)
      if self:getDistanceFrom(objects.ball) < 30 then
	 objects.ball:kick(90,130)
      end
end
