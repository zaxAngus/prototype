local mt = class()
function mt:ctor(x,y,w,h)
    self.x = nil
    self.y = nil
    self.w = nil
    self.h = nil
    self.parent = nil
    self.children = {}
    self.source = nil
end
function mt:init()
end
function mt:update()
    
end
function mt:draw()
    if self.source then
        love.graphics.draw(self.source,self.x,self.y)
    else
        love.graphics.rectangle("line",self.x,self.y)
    for i = 1, #self.children do
        self.children[i]:draw()
    end
end
function mt:callback(msg,...)
    --自己先回调函数
    --然后子UI接着回调函数
    local ret
    for i = 1, #self.children do
        ret = self.children[i]:callback(msg,...)
        if ret then
            return true
        end
    end
    return false
end