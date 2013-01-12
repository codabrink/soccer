class "pmike" : extends(player) {
   color = {50,50,255,255}
}

function pmike:kickWithAngleCorrection(m, player)
	player:kick(100, m)
end

function pmike:getInPositionToKick(player, whereToX, whereToY)
	--figure out where ball is, then try to move opposite the direction we want to kick it in
	ballX, ballY = objects.ball:getPos()
	pX, pY=0,0
	--a is angle in degrees, d is distance from the whereTo point the player needs to get to
	a=math.atan2((whereToX-ballX),(whereToY-ballY))--*(180/math.pi)
	d=math.sqrt((math.abs(whereToX-ballX))^2+(math.abs(whereToY-ballY))^2)+17
	pX=whereToX-d*(math.sin(a))
	pY=whereToY-d*(math.cos(a))
	testX = pX
	testY = pY
	player:moveTowardsLocation(pX, pY, 1)
end