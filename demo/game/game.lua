local ui_stack = require"ui.ui_stack"
local mt = class()
function mt:ctor()
end
function mt:update(dt)
    
end
function mt:draw()
    G.ui_stack:draw()
end
function mt:callback(msg,...)
    if G.ui_stack:callback(msg,...) then return end
end
return mt


