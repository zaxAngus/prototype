local mt = class()
function mt:ctor(x,y,w,h,parent)
    self.parent = parent
    self.children = {}
    --尺寸、位置参数
    if parent then
        self.x = x + parent.x
        self.y = y + parent.y
    else
        self.x = x
        self.y = y
    end
        self.w = w
        self.h = h
end
function mt:update()

end
function mt:draw()
    
end
function mt:callback(msg,...)

end
