require "lib/class"
require "teams/player"
class "coda2" {}

function coda2:init(world, team)
   createPlayer(self, world, team)
end