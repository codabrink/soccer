require "lib/class"
class "ball" {
   kickInterval = 3, -- time in seconds of how often the ball can be kicked (considering making per player)
   kicked = 0 -- time that the ball was last kicked
	     }

function ball:init(world, x, y)
   self.body = love.physics.newBody(world, x, y, "dynamic")
   self.shape = love.physics.newCircleShape(4) --the ball is 40 cm
   self.fixture = love.physics.newFixture(self.body, self.shape, 1)
   self.fixture:setRestitution(0.9)
   self.body:setLinearDamping(.8)
   self.body:setAngularDamping(1.5)
   self.body:setMass(.05)

   self.image = love.graphics.newImage("res/ball.png")
end

function ball:update(dt)
   randomChange = math.random(1,10)
   randomChange = randomChange/5
   if self:outsideBounds() then
      resetPlayers()
   end
end

function ball:outsideBounds()
   x, y = self.body:getPosition()
   return x > width or x < 0 or y > height or y < 0
end

function ball:kick(player, angle, magnitude)
   if love.timer.getTime() < self.kicked + self.kickInterval then return end

   self.kicked = love.timer.getTime()
   self.posession = player.team

   angle = (angle == 0) and 360 or angle
   self.body:applyLinearImpulse(math.sin(math.pi*(angle/180))*magnitude, -math.cos(math.pi*(angle/180))*magnitude)
end

function ball:kickTowardsGoal(player, goal, m)
   if love.timer.getTime() < self.kicked + self.kickInterval then return end

   self.kicked = love.timer.getTime()
   self.posession = player.team

   gx, gy = goal:getPos()
   sx, sy = self.body:getPosition()
   dx = gx - sx
   dy = gy - sy
   ratio = m / math.sqrt(dx*dx+dy*dy)
   self.body:applyLinearImpulse(dx*ratio, dy*ratio)
end

function ball:getLinearVelocity()
	return self.body:getLinearVelocity()
end

function ball:draw()
   love.graphics.setColor(255,255,255,255)
   love.graphics.draw(self.image, self.body:getX(), self.body:getY(), self.body:getAngle(),  1, 1, self.image:getWidth()/2, self.image:getHeight()/2)
end

function ball:getPos() return self.body:getX(), self.body:getY() end
function ball:getX() return self.body:getX() end
function ball:getY() return self.body:getY() end
function ball:getLinearVelocity() return self.body:getLinearVelocity() end
