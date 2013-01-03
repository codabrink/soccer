require "lib/class"
require "teams/player"
require "teams/coda/pcoda"
class "coda2" : extends(pcoda)

function coda2:init(team, x, y)
   self:createPlayer(team, x, y)
end

function coda2:update(dt)

end
