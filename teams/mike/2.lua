require "lib/class"
require "teams/mike/pmike"
class "mike2" : extends(pmike)

function mike2:init(team,x,y)
   self:createPlayer(team, x, y)
end

function mike2:update(dt)
	--self:moveTowardsBall(1)
	if self:getDistanceFrom(objects.ball) < 17 then
		self:kickWithAngleCorrection(20, self)
	end
end

function mike2:reset()

end