require "lib/class"
require "teams/player"
require "teams/coda/proprietary"
class "coda5" : extends(proprietary)

function coda5:init(team)
   self:createPlayer(team, 100, 100)
end

function coda5:update(dt)
      self:moveTowardsBall(1)
end

