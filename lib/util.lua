function clone(t)
   local new = {}
   local i, v = next(t, nil)
   while i do
      new[i] = v
      i, v = next(t, i)
   end
   return new
end