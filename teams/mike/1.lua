require "lib/class"
require "teams/mike/pmike"
class "mike1" : extends(pmike)

function mike1:init(team,x,y)
    self:createPlayer(team, x, y)
end

function mike1:update(dt)
    pX,pY = self:getKickPositionOppositeGoal(15)
    debug(pX, pY, 255, 255, 0)
    self:moveTowardsLocation(pX, pY, 1)
    self:getClosestOpponentPosition()
    if self:getDistanceFrom(objects.ball) < 17 then
        self:kickTowardsGoal(15)
    end
end

function mike1:reset()

end
