local mt = class()
function mt:ctor()
    self.data = {}
end
function mt:get_top()
end
function mt:push(obj)
    table.insert(self.data,1,obj)
end
function mt:pop()
    if #self.data >= 1 then
        local top = self.data[1]
        table.remove(self.data,1,obj)
        return top
    else
        return false
    end
end
function mt:draw()
    for i = 1, #self.data do
        self.data[i]:draw()
    end
end
function mt:callback(msg,...)
    for i=1,#self.data do
        if self.data[i]:callback(msg,...) then
            return true
        end
    end
    return false
end
return mt