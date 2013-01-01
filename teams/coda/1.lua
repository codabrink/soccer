require "lib/class"
require "teams/player"
local p = class:new()

function p:init(world, team, x, y)
   createPlayer(self, world, team, x, y)
end

function p:update(dt)
   
end

function p:draw()
   love.graphics.setColor(255,0,0,255)
   love.graphics.circle("fill", self.body:getX(), self.body:getY(), self.shape:getRadius())
end