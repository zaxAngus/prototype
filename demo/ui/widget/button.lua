local base = require "ui.widget.base" 
local mt = class(base)
function mt:ctor()
    --逻辑函数
    self.logic = nil
    --美术素材
    self.anim_focus = {}
    self.anim_nofocus = {}
    self.anim_active = false
    self.anim_count = 1
    --状态参数
    self.focus = false
    --debug
    self.debug = false
end
--更新动画帧
function mt:tick()
    self.anim_count = self.anim_count + 1

    if self.focus then
        if self.anim_count >= #self.anim_focus then
            self.anim_count = 1
        end
    else
        if self.anim_count >= #self.anim_nofocus then
            self.anim_count = 1
        end
    end
end
--检查鼠标位置
function mt:mouse(x,y)
    if x < self.x + self.w and x > self.x and y < self.y + self.h and y > self.y then
        self.focus = true
    else
        self.focus = false
    end
    self.anim_count = 1 
end
--update更新函数
function mt:update()
    --如果是动态的则切换下一帧
    if self.anim_active then
        self.tick()
    end
end
--draw函数
function mt:draw()
    if self.debug then 
        love.graphics.draw('line',self.x,self.y,self.w,self.h) 
    elseif self.focus then 
        love.graphics.draw(self.img_focus,self.x,self.y)
    elseif self.focus then 
        love.graphics.draw(self.img_nofocus,self.x,self.y) 
    end
end
--回调管理
function mt:callback(msg,...)
    if msg == "mousemoved" then
        return self:mouse(x,y,dx,dy)
    elseif msg == "mousepressed" and self.focus then
        return self.logic()
    end
end
return mt


