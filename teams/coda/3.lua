require "lib/class"
require "teams/player"
require "teams/coda/pcoda"
class "coda3" : extends(pcoda)

function coda3:init(team, x, y)
   self:createPlayer(team, x, y)
end

function coda3:update(dt)
end

