require "lib/class"
ball = class:new()

local image=love.graphics.newImage("res/ball.png")

function ball:init(world, x, y)
   self.body = love.physics.newBody(world, x, y, "dynamic")
   self.shape = love.physics.newCircleShape(4) --the ball is 40 cm
   self.fixture = love.physics.newFixture(self.body, self.shape, 1)
   self.fixture:setRestitution(0.9)
   self.body:setLinearDamping(2)

   if(image) then self.image=image end
end

function ball:update(dt)
	randomChange=math.random(1,10)
	randomChange=randomChange/5
	self.body:setLinearDamping(1.9+randomChange)
end

function ball:kick(angle, magnitude)
   if angle == 0 then angle=360 end
   self.body:applyForce(math.sin(math.pi*(angle/180))*magnitude*10, -math.cos(math.pi*(angle/180))*magnitude*10) --0 degrees is up, 90 right, etc
end

function ball:draw()
	love.graphics.setColor(255,255,255,255)
	love.graphics.draw(self.image, self.body:getX(), self.body:getY(), self.body:getAngle(),  1, 1, self.image:getWidth()/2, self.image:getHeight()/2)
end

function ball:getPos()
	return self.body:getX(), self.body:getY()
end