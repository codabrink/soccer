require "lib/class"
require "teams/player"
coda1 = class:new()

function coda1:init(world, team)
   createPlayer(self, world, team, 100, 100)
end

function coda1:update(dt)
   
end

function coda1:draw()
   printme = "lkjsdf"
   love.graphics.setColor(255,0,0,255)
   love.graphics.circle("fill", self.body:getX(), self.body:getY(), self.shape:getRadius())
end