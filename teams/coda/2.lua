require "lib/class"
require "teams/player"
class "coda2" : extends(player)

function coda2:init(world, team)
   self:createPlayer(world, team, 150, 100)
end

function coda2:update(dt)

end
