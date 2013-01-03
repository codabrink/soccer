require "lib/class"
require "teams/player"
require "teams/coda/pcoda"
class "coda2" : extends(pcoda)

function coda2:init(team)
   self:createPlayer(team, 150, 100)
end

function coda2:update(dt)

end
