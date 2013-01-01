function class(name)
  local newclass={}
  _G[name]=newclass
  newclass.__members={}
  function newclass.define(class,members)
    for k,v in pairs(members) do
      class.__members[k]=v
    end
  end
  function newclass.extends(class,base)
    class.super=base
    for k,v in pairs(base.__members) do
      class.__members[k]=v
    end
    return setmetatable(class,{__index=base,__call=class.define})
  end
  function newclass.new(class,...)
    local object={}
    for k,v in pairs(class.__members) do
      object[k]=v
    end
    setmetatable(object,{__index=class})
    if object.init then
      object:init(...)
    end
    return object
  end
  return setmetatable(newclass,{__call=newclass.define})
end


--[[
Copyright (c) 2009 Bart Bes

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.


__HAS_SECS_COMPATIBLE_CLASSES__ = true

local class_mt = {}

function class_mt:__index(key)
    return self.__baseclass[key]
end

class = setmetatable({ __baseclass = {} }, class_mt)

function class:new(...)
    local c = {}
    c.__baseclass = self
    setmetatable(c, getmetatable(self))
    if c.init then
        c:init(...)
    end
    return c
end 
]]