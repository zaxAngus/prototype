function show_ui(ui_name)
    local ui = require"ui.interface"..ui_name
    ui:init()
    G.ui_stack:push(ui)
end