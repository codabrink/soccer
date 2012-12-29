require "lib/class"
ball = class:new()

function ball:init(x, y)
	self.body = love.physics.newBody(world, x, y, "dynamic") --place the body in the center of the world and make it dynamic, so it can move around
	self.shape = love.physics.newCircleShape(4) --the ball is 40 cm
	self.fixture = love.physics.newFixture(self.body, self.shape, 1) -- Attach fixture to body and give it a density of 1.
	self.fixture:setRestitution(0.9) --let the ball bounce
end

function ball:update(dt)

end