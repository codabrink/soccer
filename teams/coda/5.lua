require "lib/class"
require "teams/player"
require "teams/coda/pcoda"
class "coda5" : extends(pcoda)

function coda5:init(team)
   self:createPlayer(team, 100, 100)
end

function coda5:update(dt)
      self:moveTowardsBall(1)
end

