require 'classes/ball'
require 'classes/goal'

objects = {}
bg = love.graphics.newImage("res/field.png");
teams = {}

function love.load()
  love.physics.setMeter(10)
  world = love.physics.newWorld(0, 0, true)
  objects.ball = ball:new(world, 500, 280, ballImage)
  objects.goal1 = goal:new(world, 40, 280, 0)
  objects.goal2 = goal:new(world, 960, 280, 180)

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
end

function loadTeam(team)
   teams[team] = {}
   teamDir = "teams/"..team
   files = love.filesystem.enumerate(teamDir)
   for k, file in ipairs(files) do
      loadstring("require "..file)
   end
   for i=1,1 do
      local s = team..i..":init(world, teams[team])"
      teams[team][i] = loadstring(s)
   end
end