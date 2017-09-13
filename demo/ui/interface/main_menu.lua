local window = require "ui.window.base"
local button = require "ui.widget.button"
local main_menu = window.new(0,0,120,720)
function main_menu:init()
    self.children[1] = button.new(10,10,100,50,self)
    self.children[2] = button.new(10,70,100,50,self)
end
return main_menu