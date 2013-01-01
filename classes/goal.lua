require "lib/class"
goal = class:new()

local image=love.graphics.newImage("res/goal.png")

function goal:init(world, x, y)
   self.body = love.physics.newBody(world, x, y)
   self.shape = love.physics.newPolygonShape(28,0,0,0,80,0,28,80);
   self.fixture = love.physics.newFixture(self.body, self.shape, 1)
   if(image) then self.image=image end
end

function goal:draw()
	love.graphics.setColor(255,255,255,255)
	love.graphics.draw(self.image, self.body:getX(), self.body:getY(), self.body:getAngle(),  1, 1, self.image:getWidth()/2, self.image:getHeight()/2)
end