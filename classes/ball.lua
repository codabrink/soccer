require "lib/class"
ball = class:new()

function ball:init(world, x, y, image)
   self.body = love.physics.newBody(world, x, y, "dynamic") --place the body in the center of the world and make it dynamic, so it can move around
   self.shape = love.physics.newCircleShape(4) --the ball is 40 cm
   self.fixture = love.physics.newFixture(self.body, self.shape, 1) -- Attach fixture to body and give it a density of 1.
   self.fixture:setRestitution(0.9) --let the ball bounce
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
   if(objects.ball.image) then
      love.graphics.draw(objects.ball.image, objects.ball.body:getX(), objects.ball.body:getY(), objects.ball.body:getAngle(),  1, 1, objects.ball.image:getWidth()/2, objects.ball.image:getHeight()/2)
   else
      love.graphics.setColor(193, 47, 14) --set the drawing color to red for the ball
      love.graphics.circle("fill", objects.ball.body:getX(), objects.ball.body:getY(), objects.ball.shape:getRadius())
   end
   
end