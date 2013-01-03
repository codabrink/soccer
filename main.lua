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
  objects.goals = {}

   loadTeam("coda")
   loadTeam("mike")

   love.graphics.setMode(1000, 560, false, true, 0)
end

function love.keypressed(key)
   if key == "q" then
      love.event.push("quit")
   elseif key == "right" then
      objects.ball:kick(90, 75)   
   elseif key == "left" then
      objects.ball:kick(270, 75)
   elseif key == "up" then
      objects.ball:kick(0, 75)
   elseif key == "down" then
      objects.ball:kick(180, 75)
   end
end

function love.update(dt)
   world:update(dt)
   objects.ball:update(dt)
   for k, team in pairs(teams) do
	team.goal:update(dt)
      for k, player in ipairs(team) do
	 player:update()
	 player:govern()
      end
   end
end

function love.draw()
   --draw dat field
   love.graphics.setColor(255,255,255,128)
   love.graphics.draw(bg)
   objects.ball:draw()

   for k, team in pairs(teams) do
	team.goal:draw()
      for k, player in ipairs(team) do
	 player:draw()
      end
   end
   love.graphics.print(printme, 100, 100)
end

function loadTeam(team)
   teams[team] = {}
   teamDir = "teams/"..team
   files = love.filesystem.enumerate(teamDir)
   for k, file in ipairs(files) do
      assert(loadstring('require "'..teamDir.."/"..string.sub(file,1,-5)..'"'))()
   end
   for i=1,(table.getn(files)-1) do
      teams[team][i] = assert(loadstring("return "..team..i..":new(teams[team])")())
   end
   if(table.getn(teams)==1) then x,y,r=960,280,180
   else x,y,r=40,280,0 end
	teams[team].goal = goal:new(world, 40, 280, 0, objects.ball, 1, {255, 50, 50, 255})
end
