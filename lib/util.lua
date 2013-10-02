function clone(t)
   local new = {}
   local i, v = next(t, nil)
   while i do
      new[i] = v
      i, v = next(t, i)
   end
   return new
end

function tsize(t)
   count = 0
   for _ in pairs(t) do count = count + 1 end
   return count
end