class "pcoda" : extends (player) {
   color = {255,0,0,255}
}

function pcoda:kickToLocation(x,y)

end

function pcoda:closePlayers()
   distances = {}
   for k, player in ipairs(self.team) do
      if player ~= self then
	 n = #distances+1
	 distances[n] = {}
	 distances[n].distance = self:getDistanceFrom(player)
	 distances[n].player = player
      end
   end
   for i = 1, #distances do
      for j = 2, #distances do
	 if distances[j].distance < distances[j-1].distance then
	    temp = distances[j-1]
	    distances[j-1] = distances[j]
	    distances[j] = temp
	 end
      end
   end
   return distances
end

function pcoda:isBallBehind()
    
end