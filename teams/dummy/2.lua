require "lib/class"
require "teams/dummy/pdummy"
class "dummy2" : extends(pdummy)

function dummy2:init(team,x,y)
   self:createPlayer(team, x, y)
end

function dummy2:update(dt)

end

function dummy2:reset()

end