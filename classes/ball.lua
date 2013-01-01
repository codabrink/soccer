require "lib/class"
ball = class:new()

function ball:init(world, x, y, image)
   self.body = love.physics.newBody(world, x, y, "dynamic")
   self.shape = love.physics.newCircleShape(4) --the ball is 40 cm
   self.fixture = love.physics.newFixture(self.body, self.shape, 1)
   self.fixture:setRestitution(0.9)
   self.body:setLinearDamping(2)
   
   if(image) then self.image=image end
end

function ball:update(dt)

end

function ball:kick(angle, magnitude)
   if angle == 0 then angle=360 end
   self.body:applyForce(math.sin(math.pi*(angle/180))*magnitude*10, -math.cos(math.pi*(angle/180))*magnitude*10) --0 degrees is up, 90 right, etc
end

function ball:draw()
   if(self.image) then
      love.graphics.setColor(255,255,255,255)
      love.graphics.draw(self.image, self.body:getX(), self.body:getY(), self.body:getAngle(),  1, 1, self.image:getWidth()/2, self.image:getHeight()/2)
   else
      love.graphics.setColor(193, 47, 14) --set the drawing color to red for the ball
      love.graphics.circle("fill", self.body:getX(), self.body:getY(), self.shape:getRadius())
   end
   
end