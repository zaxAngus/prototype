local mt = class()
function mt:ctor()
    self.parent = nil
    self.children = {}
    --尺寸、位置参数
    self.x = nil
    self.y = nil
    self.w = nil
    self.h = nil
end
function mt:update()
end
function mt:draw()
end
function mt:callback(msg,...)
end
