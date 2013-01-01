require 'classes/ball'
require 'classes/goal'

objects = {}
bg = love.graphics.newImage("res/field.png");
teams = {}

printme = ''

function love.load()
  love.physics.setMeter(10)
  world = love.physics.newWorld(0, 0, true)
  objects.ball = ball:new(world, 500, 280, ballImage)
  objects.goal1 = goal:new(world, 40, 280, 0, objects.ball)
  objects.goal2 = goal:new(world, 960, 280, 180, objects.ball)
  objects.goal3 = goal:new(world, 500, 60, 90, objects.ball)
  objects.goal4 = goal:new(world, 500, 500, 270, objects.ball)

   loadTeam("coda")

   love.graphics.setMode(1000, 560, false, true, 0)
end

function love.keypressed(key)
   if key == "q" then
      love.event.push("quit")
   end
end

function love.update(dt)
	world:update(dt)
	objects.ball:update(dt)
	objects.goal1:update(dt)
	objects.goal2:update(dt)
	objects.goal3:update(dt)
	objects.goal4:update(dt)
  
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
   --draw dat field
   love.graphics.setColor(255,255,255,128)
   love.graphics.draw(bg)
   objects.ball:draw()
   objects.goal1:draw()

   for k, team in pairs(teams) do
      for k, player in ipairs(team) do
	 player:draw()
      end
   end


   love.graphics.print(printme, 100, 100)
   objects.goal2:draw()
   objects.goal3:draw()
   objects.goal4:draw()
end

function loadTeam(team)
   teams[team] = {}
   teamDir = "teams/"..team
   files = love.filesystem.enumerate(teamDir)
   for k, file in ipairs(files) do
      assert(loadstring('require "'..teamDir.."/"..string.sub(file,1,-5)..'"'))()
   end
   for i=1,1 do
      teams[team][i] = assert(loadstring("return "..team..i..":new(world, teams[team])")())
   end
end
