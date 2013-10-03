class "pmike" : extends(player) {
    color = {50,50,255,255}
}

function pmike:kickWithAngleCorrection(m, player)
    player:kick(100, m)
end

function pmike:getKickPositionOppositeGoal()
    -- figure out where ball is, then try to move opposite the direction we want to kick it in
    ballX, ballY = objects.ball:getPos()
    pX, pY=0,0
    goalX, goalY = self.team.otherTeam.goal:getPos()

    -- distance from the ball for kicking
    distance = 17

    -- a is angle in degrees
    -- d is distance from the goal to kick position
    a=math.atan2((goalX-ballX),(goalY-ballY))--*(180/math.pi)
    d=math.sqrt((math.abs(goalX-ballX))^2+(math.abs(goalY-ballY))^2)+distance
    pX=goalX-d*(math.sin(a))
    pY=goalY-d*(math.cos(a))
    return pX, pY
end
