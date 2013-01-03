require "lib/class"
require "teams/player"
require "teams/coda/pcoda"
class "coda4" : extends(pcoda)

function coda4:init(team)
   self:createPlayer(team, 100, 100)
end

function coda4:update(dt)
      self:moveTowardsBall(1)
end

