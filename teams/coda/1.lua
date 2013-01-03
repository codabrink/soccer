require "lib/class"
require "teams/player"
require "teams/coda/proprietary"
class "coda1" : extends(proprietary) {
   sd = 0
}

function coda1:init(team)
   self:createPlayer(team, 100, 100)
end

function coda1:update(dt)
   --[[dx, dy = self:getDiffs()
   hx, hy = self.body:getLinearVelocity()
   fy = dy
   fx = dx
   if math.abs(dy) < self.sd and samePolarity(hy,fy) then fy = -fy * 4 end
   if math.abs(dx) < self.sd and samePolarity(hx,fx) then fx = -fx * 4 end
   printme = fx
   self.body:applyForce(fx,fy)
      ]]
      self:moveTowardsBall(.1)
end

