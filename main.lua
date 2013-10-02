require 'classes/ball'
require 'classes/goal'
require 'lib/util'

objects = {}
bg = love.graphics.newImage("res/field.png");
teams = {}
numTeams=0

width = 1000
height = 560

printme = ''
testX = 0
testY = 0

function love.load()
    love.physics.setMeter(10)
    world = love.physics.newWorld(0, 0, true)
    objects.ball = ball:new(world, width / 2, height / 2)
    objects.goals = {}

    loadTeam("coda")
    loadTeam("mike")

    love.graphics.setMode(width, height, false, true, 0)
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
    --printme = love.timer.getTime()
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

    for k, team in ipairs(teams) do
        team.goal:draw()
        for k, player in ipairs(team) do
            player:draw()
        end
    end
    love.graphics.setColor(255,255,255,255)
    love.graphics.print(printme, 100, 100)
    if(testX and testY) then
	love.graphics.line(testX-5, testY, testX+5, testY)
	love.graphics.line(testX, testY-5, testX, testY+5)
    end
end

function loadTeam(team)
    if numTeams == 2 then return end
    numTeams = numTeams + 1

    -- load player classes
    teams[team] = {}
    teams[team].name = team
    teamDir = "teams/"..team
    files = love.filesystem.enumerate(teamDir)
    for k, file in ipairs(files) do
        assert(loadstring('require "'..teamDir.."/"..string.sub(file,1,-5)..'"'))()
    end
    for i=1,2 do
        y = math.random(height)
        x = (numTeams == 1) and math.random(width / 2) + width / 2 or math.random(width / 2)
        z = teams[team]
        teams[team][i] = assert(loadstring("return "..team..i..":new(z, x, y)")())
    end

    -- goal things
    if numTeams == 1 then
        x, y, r = 960, 280, 180
    else
        x, y, r = 40, 280, 0
    end
    teams[team].goal = goal:new(world, x, y, r, objects.ball, numTeams, teams[team][1].color, teams)

    -- set up references
    teams[team].number = numTeams
    teams[numTeams] = teams[team]
    if (numTeams == 2) then
        teams[1].otherTeam = teams[2]
        teams[2].otherTeam = teams[1]
    end
end


function resetPlayers()
    for k, team in ipairs(teams) do
        for k, player in ipairs(team) do
            y = math.random(height)
            x = (player.team.number == 1) and math.random(width / 2) + width / 2 or math.random(width / 2)
            player.body:setPosition(x, y)
            player.body:setLinearVelocity(0,0)
            if(player.reset) then player:reset() end
        end
    end

    objects.ball.body:setPosition(width / 2, height / 2)
    objects.ball.body:setLinearVelocity(0,0)
end