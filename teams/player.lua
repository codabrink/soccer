function createPlayer(self, world, team, x, y)
   self.body = love.physics.newBody(world, x, y, "dynamic")
   self.shape = love.physics.newCircleShape(8)
   self.fixture = love.physics.newFixture(self.body, self.shape, 1)
end