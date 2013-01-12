require "lib/class"
require "teams/dummy/pdummy"
class "dummy3" : extends(pdummy)

function dummy3:init(team,x,y)
   self:createPlayer(team, x, y)
end

function dummy3:update(dt)

end

function dummy3:reset()

end