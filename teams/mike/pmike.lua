class "pmike" : extends(player) {
    color = {50, 50, 255, 255}
}

function pmike:kickWithAngleCorrection(m, player)
    player:kick(100, m)
end

function pmike:getKickPositionOppositeGoal(kickingDistance)
    -- figure out where ball is, then try to move opposite the direction we want to kick it in
    ballX, ballY = objects.ball:getPos()
    pX, pY = 0, 0
    goalX, goalY = self.team.otherTeam.goal:getPos()

    -- default distance from the ball for kicking
    distance = 17

    -- a is angle in degrees
    -- d is distance from the goal to kick position
    a=math.atan2((goalX - ballX), (goalY - ballY)) --*(180/math.pi)
    d=self:getDistanceBetweenPoints(goalX, goalY, ballX, ballY) + (kickingDistance and kickingDistance or distance)
    pX = goalX - d * (math.sin(a))
    pY = goalY - d * (math.cos(a))
    return pX, pY
end

function pmike:getDistanceBetweenPoints(x1, y1, x2, y2)
    return math.sqrt((math.abs(x1 - x2))^2 + (math.abs(y1 - y2))^2)
end

function pmike:getClosestOpponentPosition(towardsGoal)
    for i, opponent in ipairs(self:otherTeam()) do
        oX = opponent.body:getX()
        oY = opponent.body:getY()
        debug(oX, oY)
    end
end

function pmike:getPos()
    pX = self.body:getX()
    pY = self.body.getY()
    return pX, pY
end
