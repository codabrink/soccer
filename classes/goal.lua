require "lib/class"
goal = class:new()

local image=love.graphics.newImage("res/goal.png")

function goal:init(world, x, y, rotation)
   self.body = love.physics.newBody(world, x, y)
   --0,0, 0,80, 80,28, 80,27, 1,80, 1,1, 28,1, 28,0)
   self.shape1 = love.physics.newEdgeShape(-14,-40, -14,40)
   self.fixture1 = love.physics.newFixture(self.body, self.shape1, 1)
   self.shape2 = love.physics.newEdgeShape(-14,40, 14,40)
   self.fixture2 = love.physics.newFixture(self.body, self.shape2, 1)
   self.shape3 = love.physics.newEdgeShape(-14,-40, 14,-40)
   self.fixture3 = love.physics.newFixture(self.body, self.shape3, 1)
   if(image) then self.image=image end
   
   self.body:setAngle(math.rad(rotation))
end

function goal:draw()
	love.graphics.setColor(255,255,255,255)
	love.graphics.draw(self.image, self.body:getX(), self.body:getY(), self.body:getAngle(),  1, 1, self.image:getWidth()/2, self.image:getHeight()/2)
	--love.graphics.line(self.body:getWorldPoints(self.shape1:getPoints()))
	--love.graphics.line(self.body:getWorldPoints(self.shape2:getPoints()))
	--love.graphics.line(self.body:getWorldPoints(self.shape3:getPoints()))
end