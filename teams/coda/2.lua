require "lib/class"
require "teams/player"
local p = class:new()

function p:init(world, team, x, y)
   createPlayer(self, world, team, x, y)
end