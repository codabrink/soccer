require 'classes/ball'

walls=true
bg=love.graphics.newImage("field.png");
ballImage=love.graphics.newImage("ball.png");

function love.load()
  love.physics.setMeter(10) --the height of a meter our worlds will be 64px
  world = love.physics.newWorld(0, 0, true) --create a world for the bodies to exist in with horizontal gravity of 0 and vertical gravity of 9.81

  objects = {} -- table to hold all our physical objects
  
	if(walls) then 
		--let's create the ground
		objects.walls = {}

		objects.walls.top = {}
		objects.walls.top.body = love.physics.newBody(world, 500, 0)
		objects.walls.top.shape = love.physics.newRectangleShape(1000, 1)
		objects.walls.top.fixture = love.physics.newFixture(objects.walls.top.body, objects.walls.top.shape)

		objects.walls.right = {}
		objects.walls.right.body = love.physics.newBody(world, 1000, 280)
		objects.walls.right.shape = love.physics.newRectangleShape(1, 560)
		objects.walls.right.fixture = love.physics.newFixture(objects.walls.right.body, objects.walls.right.shape)

		objects.walls.bottom = {}
		objects.walls.bottom.body = love.physics.newBody(world, 500, 560)
		objects.walls.bottom.shape = love.physics.newRectangleShape(1000, 1)
		objects.walls.bottom.fixture = love.physics.newFixture(objects.walls.bottom.body, objects.walls.bottom.shape)

		objects.walls.left = {}
		objects.walls.left.body = love.physics.newBody(world, 0, 280)
		objects.walls.left.shape = love.physics.newRectangleShape(1, 560)
		objects.walls.left.fixture = love.physics.newFixture(objects.walls.left.body, objects.walls.left.shape)

	end
  
  --let's create a ball
  objects.ball = ball:new(world, 500, 280, ballImage)

  --initial graphics setup
  --love.graphics.setBackgroundColor(72, 160, 14) --set the background color to a nice blue
  love.graphics.setMode(1000, 560, false, true, 0) --set the window dimensions to 650 by 650
end


function love.update(dt)
	world:update(dt) --this puts the world into motion
	ball:update(dt)
  
	--here we are going to create some keyboard events
	if love.keyboard.isDown("right") then
		objects.ball:kick(90, 75)
	elseif love.keyboard.isDown("left") then
		objects.ball:kick(270, 75)
	elseif love.keyboard.isDown("down") then
		objects.ball:kick(180, 75)
	elseif love.keyboard.isDown("up") then
		objects.ball:kick(0, 75)
	end
end

function love.draw()
	love.graphics.setColor(255,255,255,128)
	love.graphics.draw(bg)
	love.graphics.setColor(255,255,255,255)
	if(objects.ball.image) then love.graphics.draw(objects.ball.image, objects.ball.body:getX(), objects.ball.body:getY(), objects.ball.body:getAngle(),  1, 1, objects.ball.image:getWidth()/2, objects.ball.image:getHeight()/2)
	else
		love.graphics.setColor(193, 47, 14) --set the drawing color to red for the ball
		ove.graphics.circle("fill", objects.ball.body:getX(), objects.ball.body:getY(), objects.ball.shape:getRadius())
	end
  
end