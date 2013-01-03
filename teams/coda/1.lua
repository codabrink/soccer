require "lib/class"
require "teams/player"
require "teams/coda/proprietary"
class "coda1" : extends(proprietary)

function coda1:init(team)
   self:createPlayer(team, 100, 100)
end

function coda1:update(dt)
      self:moveTowardsBall(1)
      if self:getDistanceFrom(objects.ball) < 30 then
	 objects.ball:kick(90,130)
      end
end
