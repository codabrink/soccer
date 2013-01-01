require "lib/class"
require "teams/player"
local coda1 = class:new()

function coda1:init(world, team, x, y)
   createPlayer(self, world, team, x, y)
end

function coda1:update(dt)
   
end

function coda1:draw()
   love.graphics.setColor(255,0,0,255)
   love.graphics.circle("fill", self.body:getX(), self.body:getY(), self.shape:getRadius())
end