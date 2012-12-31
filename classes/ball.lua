require "lib/class"
ball = class:new()

function ball:init(world, x, y, image)
	self.body = love.physics.newBody(world, x, y, "dynamic") --place the body in the center of the world and make it dynamic, so it can move around
	self.shape = love.physics.newCircleShape(4) --the ball is 40 cm
	self.fixture = love.physics.newFixture(self.body, self.shape, 1) -- Attach fixture to body and give it a density of 1.
	self.fixture:setRestitution(0.9) --let the ball bounce
	self.body:setLinearDamping(2);
	
	if(image) then self.image=image end
end

function ball:update(dt)

end

function ball:kick(angle, magnitude)
	if angle == 0 then angle=360 end
	self.body:applyForce(math.sin(math.pi*(angle/180))*magnitude*10, -math.cos(math.pi*(angle/180))*magnitude*10) --0 degrees is up, 90 right, etc
end