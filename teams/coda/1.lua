require "lib/class"
require "teams/player"
class "coda1" : extends(player)

function coda1:init(world, team)
   self:createPlayer(world, team, 100, 100)
end

function coda1:update(dt)
   
end
