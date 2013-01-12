require "lib/class"
require "teams/dummy/pdummy"
class "dummy5" : extends(pdummy)

function dummy5:init(team,x,y)
   self:createPlayer(team, x, y)
end

function dummy5:update(dt)

end

function dummy5:reset()

end