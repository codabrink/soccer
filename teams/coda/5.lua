require "lib/class"
require "teams/player"
require "teams/coda/pcoda"
class "coda5" : extends(pcoda)

function coda5:init(team, x, y)
   self:createPlayer(team, x, y)
end

function coda5:update(dt)
end

