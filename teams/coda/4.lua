require "lib/class"
require "teams/player"
require "teams/coda/pcoda"
class "coda4" : extends(pcoda)

function coda4:init(team, x, y)
   self:createPlayer(team, x, y)
end

function coda4:update(dt)
end

