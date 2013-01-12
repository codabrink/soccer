require "lib/class"
require "teams/dummy/pdummy"
class "dummy4" : extends(pdummy)

function dummy4:init(team,x,y)
   self:createPlayer(team, x, y)
end

function dummy4:update(dt)

end

function dummy4:reset()

end