require "lib/class"
class "goal" {}

local image=love.graphics.newImage("res/goal.png")
local font=love.graphics.newFont(14);
local scoreFont=love.graphics.newFont(16);

function goal:init(world, x, y, rotation, ball, teamNum, scoreColor)
   self.ready=true
   self.ball=ball
   self.timeLeft=0
   self.score=0
   self.teamNum=teamNum
   self.color={}
   self.color.r=scoreColor[1]
   self.color.g=scoreColor[2]
   self.color.b=scoreColor[3]
   self.color.a=scoreColor[4]
   self.body = love.physics.newBody(world, x, y)
   --0,0, 0,80, 80,28, 80,27, 1,80, 1,1, 28,1, 28,0)
   self.shape1 = love.physics.newEdgeShape(-14,-40, -14,40)
   self.fixture1 = love.physics.newFixture(self.body, self.shape1, 1)
   self.shape2 = love.physics.newEdgeShape(-14,40, 14,40)
   self.fixture2 = love.physics.newFixture(self.body, self.shape2, 1)
   self.shape3 = love.physics.newEdgeShape(-14,-40, 14,-40)
   self.fixture3 = love.physics.newFixture(self.body, self.shape3, 1)

   if(image) then self.image=image end

   self.body:setAngle(math.rad(rotation))
end

function goal:getCenter()
   return self.body:getPosition()
end

function goal:scored()
   self.ball.body:setX(500)
   self.ball.body:setY(280)
   self.ball.body:setLinearVelocity(0,0)
   for k, team in pairs(teams) do
      for k, player in ipairs(team) do
	 resetPlayers()
      end
   end
end

function goal:update(dt)
   self:checkBall(dt);
   if(self.timeLeft>0) then
      self.timeLeft=self.timeLeft-dt
      self.drawScore=true
   else
      self.drawScore=false
      self.ready=true
   end
end

function goal:checkBall(dt)
   ballX, ballY=self.ball:getPos()
   upperX, upperY=self.body:getWorldPoint(14, 40)
   lowerX, lowerY=self.body:getWorldPoint(-14, -40)
   if(upperX<lowerX) then upperX,lowerX=lowerX,upperX end
   if(upperY<lowerY) then upperY,lowerY=lowerY,upperY end
   if(ballX>lowerX and ballX<upperX and ballY>lowerY and ballY<upperY and self.ready) then
      self.ready=false
      self.score=self.score+1
      self.timeLeft=3
      self:scored()
   end
end

function goal:draw()
   love.graphics.setColor(255,255,255,255)
   love.graphics.draw(self.image, self.body:getX(), self.body:getY(), self.body:getAngle(),  1, 1, self.image:getWidth()/2, self.image:getHeight()/2)
   love.graphics.setColor(255,100,100,255)
   love.graphics.setFont(font)
   if(self.drawScore) then love.graphics.print("GOAL!", self.body:getX(), self.body:getY()) end

   --draw score in upper left corner
   love.graphics.setColor(40, 40, 40, 255)
   love.graphics.rectangle('fill', 0, 20*self.teamNum-20, 50, 20)
   love.graphics.setFont(scoreFont)
   love.graphics.setColor(self.color.r,self.color.g,self.color.b,self.color.a)
   love.graphics.print(self.score, 20, 20*self.teamNum-20)

   love.graphics.line(self.body:getWorldPoints(self.shape1:getPoints()))
end