require "lib/class"
require "teams/player"
class "coda1" {}

function coda1:init(world, team)
   createPlayer(self, world, team, 100, 100)
end

function coda1:update(dt)
   
end

function coda1:draw()
   love.graphics.setColor(255,0,0,255)
   love.graphics.circle("fill", self.body:getX(), self.body:getY(), self.shape:getRadius())
end