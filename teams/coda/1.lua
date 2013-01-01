require "lib/class"
local p = class:new()

function p:init(world, team, x, y)
   self.body = love.physics.newBody(world, x, y, "dynamic")
   self.shape =love.physics.newCircleShape(8)
   self.fixture = love.physics.newFixture(self.body, self.shape, 1)
end

function p:update(dt)
   
end

function p:draw()
   love.graphics.setColor(255,0,0,255)
   love.graphics.circle("fill", self.body:getX(), self.body:getY(), self.shape:getRadius())
end