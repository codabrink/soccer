require 'classes/ball'

function love.load()
  love.physics.setMeter(10) --the height of a meter our worlds will be 64px
  world = love.physics.newWorld(0, 0, true) --create a world for the bodies to exist in with horizontal gravity of 0 and vertical gravity of 9.81

  objects = {} -- table to hold all our physical objects
  
  --let's create the ground
  objects.ground = {}
  objects.ground.body = love.physics.newBody(world, 650/2, 650-50/2) --remember, the shape (the rectangle we create next) anchors to the body from its center, so we have to move it to (650/2, 650-50/2)
  objects.ground.shape = love.physics.newRectangleShape(650, 50) --make a rectangle with a width of 650 and a height of 50
  objects.ground.fixture = love.physics.newFixture(objects.ground.body, objects.ground.shape); --attach shape to body
  
  --let's create a ball
  objects.ball = ball:new(world, 500, 300)

  --initial graphics setup
  love.graphics.setBackgroundColor(72, 160, 14) --set the background color to a nice blue
  love.graphics.setMode(1000, 600, false, true, 0) --set the window dimensions to 650 by 650
end


function love.update(dt)
	world:update(dt) --this puts the world into motion
	ball:update(dt)
  
	--here we are going to create some keyboard events
	if love.keyboard.isDown("right") then
		objects.ball:kick(90, 1)
	elseif love.keyboard.isDown("left") then
		objects.ball:kick(270, 1)
	elseif love.keyboard.isDown("down") then
		objects.ball:kick(180, 1)
	elseif love.keyboard.isDown("up") then
		objects.ball:kick(0, 1)
	end
end

function love.draw()
  love.graphics.setColor(193, 47, 14) --set the drawing color to red for the ball
  love.graphics.circle("fill", objects.ball.body:getX(), objects.ball.body:getY(), objects.ball.shape:getRadius())
end