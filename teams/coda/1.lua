require "lib/class"
require "teams/player"
class "coda1" : extends(player) {
   sd = 80
}

function coda1:init(team)
   self:createPlayer(team, 100, 100)
end

function coda1:update(dt)
   dx, dy = self:getDiffs()
   hx, hy = self.body:getLinearVelocity()
   fy = dy
   fx = dx
   if math.abs(dy) < self.sd and samePolarity(hy,fy) then fy = -fy * 4 end
   if math.abs(dx) < self.sd and samePolarity(hx,fx) then fx = -fx * 4 end
   printme = fx
   self.body:applyForce(fx,fy)
end

function samePolarity(a,b)
   if a > 0 and b > 0 or a < 0 and b < 0 then return true else return false end
end