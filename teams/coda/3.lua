require "lib/class"
require "teams/player"
require "teams/coda/proprietary"
class "coda3" : extends(proprietary)

function coda3:init(team)
   self:createPlayer(team, 100, 100)
end

function coda3:update(dt)
      self:moveTowardsBall(1)
end

