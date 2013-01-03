require "lib/class"
class "ball" {}

function ball:init(world, x, y)
   self.body = love.physics.newBody(world, x, y, "dynamic")
   self.shape = love.physics.newCircleShape(4) --the ball is 40 cm
   self.fixture = love.physics.newFixture(self.body, self.shape, 1)
   self.fixture:setRestitution(0.9)
   self.body:setLinearDamping(2)
   self.body:setAngularDamping(1.5)
   self.body:setMass(.05)

   self.image = love.graphics.newImage("res/ball.png")
end

function ball:update(dt)
   randomChange = math.random(1,10)
   randomChange = randomChange/5
   self.body:setLinearDamping(1.9+randomChange)
end

function ball:kick(angle, magnitude)
   angle = (angle == 0) and 360 or angle
   self.body:applyForce(math.sin(math.pi*(angle/180))*magnitude*10, -math.cos(math.pi*(angle/180))*magnitude*10)
end

function ball:kickTowardsGoal(goal, m)
   gx, gy = goal:getCenter()
   sx, sy = self.body:getPosition()
   dx = gx - sx
   dy = gy - sy
   ratio = m / math.sqrt(dx*dx+dy*dy)
   self.body:applyForce(dx*ratio, dy*ratio)
end

function ball:draw()
   love.graphics.setColor(255,255,255,255)
   love.graphics.draw(self.image, self.body:getX(), self.body:getY(), self.body:getAngle(),  1, 1, self.image:getWidth()/2, self.image:getHeight()/2)
end

function ball:getPos() return self.body:getX(), self.body:getY() end
function ball:getX() return self.body:getX() end
function ball:getY() return self.body:getY() end
function ball:getLinearVelocity() return self.body:getLinearVelocity() end
