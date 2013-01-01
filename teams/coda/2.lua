require "lib/class"
require "teams/player"
local coda2 = class:new()

function coda2:init(world, team)
   createPlayer(self, world, team)
end