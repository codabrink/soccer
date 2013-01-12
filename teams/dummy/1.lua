require "lib/class"
require "teams/player"
require "teams/dummy/pdummy"
class "dummy1" : extends(pdummy)

function dummy1:init(team,x,y)
   self:createPlayer(team, x, y)
end

function dummy1:update(dt)

end

function dummy1:reset()

end