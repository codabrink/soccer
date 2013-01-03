class "player" {
   speedLimit = 130
}

function player:createPlayer(team, x, y)
   self.body = love.physics.newBody(world, x, y, "dynamic")
   self.shape = love.physics.newCircleShape(8)
   self.fixture = love.physics.newFixture(self.body, self.shape, 1)
   self.body:setMass(.6)
   self.team = team
   if(self.team==nil) then printme="HELP!" end
end

function player:draw()
   love.graphics.setColor(self.color[1],self.color[2],self.color[3],self.color[4])
   love.graphics.circle("fill", self.body:getX(), self.body:getY(), self.shape:getRadius())
end

function player:getDiffs()
   return objects.ball:getX() - self.body:getX(), objects.ball:getY() - self.body:getY()
end
function player:getDistanceFrom(o)
   dx = math.abs(o:getX() - self.body:getX())
   dy = math.abs(o:getY() - self.body:getY())
   return math.sqrt(dx*dx+dy*dy)
end

function player:moveTowardsBall(m)
   if m > 1 or m < 0 then return end
   dx, dy = self:getDiffs()
   ratio = ((self.speedLimit * m) / math.sqrt(dx*dx+dy*dy))
   self.body:applyForce(dx*ratio, dy*ratio)
end

function player:moveTowardsLocation(x,y,m)
   if m > 1 or m < 0 then return end
   dx = x - self.body:getX()
   dy = y - self.body:getY()
   ratio = ((self.speedLimit * m) / math.sqrt(dx*dx+dy*dy))
end

function player:moveTowardsAngle(a,m)
   if m > 1 or m < 0 then return end
   a = (a == 0) and 360 or a
   self.body:applyForce(math.sin(math.pi*(angle/180))*m*self.speedLimit, -math.cos(math.pi*(angle/180))*m*self.speedLimit)
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

function player:kick(angle, magnitude)
	if(magnitude > 200) then magnitude=200 end
	if(self:getDistanceFrom(objects.ball) <= 30) then
		objects.ball:kick(angle, magnitude)
	end
end

-- misc functions

function samePolarity(a,b)
   return a > 0 and b > 0 or a < 0 and b < 0
end

function player:getTeam()
   return self.team
end