class "player" {
   speedLimit = 110
}

function player:createPlayer(team, x, y)
   self.body = love.physics.newBody(world, x, y, "dynamic")
   self.shape = love.physics.newCircleShape(8)
   self.fixture = love.physics.newFixture(self.body, self.shape, 1)
   self.body:setMass(.6)
   self.team = team
end

function player:draw()
   love.graphics.setColor(255,0,0,255)
   love.graphics.circle("fill", self.body:getX(), self.body:getY(), self.shape:getRadius())
end

function player:getDiffs()
   return objects.ball:getX() - self.body:getX(), objects.ball:getY() - self.body:getY()
end

function player:moveTowardsBall(m)
   dx, dy = self:getDiffs()
   self.body:applyForce(dx, dy)
end

function player:moveTowardsLocation(x,y,m)

end

function player:moveTowardsAngle(a,m)
   a = (a == 0) and 360 or a
   self.body:applyForce(math.sin(math.pi*(angle/180))*m*10, -math.cos(math.pi*(angle/180))*m*10)
end

function player:govern(dt)
   -- govern speed
   local x, y = self.body:getLinearVelocity()
   local h = math.sqrt(x*x+y*y)
   if h > self.speedLimit then
      local reduce = self.speedLimit / h
      self.body:setLinearVelocity(x*reduce, y*reduce)
   end
end