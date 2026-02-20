require 'cairo'

function conky_draw_bars()

    if conky_window == nil then return end

    local cr = cairo_create(conky_window.cairo_surface)

    local function draw_bar(x, y, width, height, percent, bg, fg)

        -- Background
        cairo_set_source_rgba(cr, bg[1], bg[2], bg[3], bg[4])
        cairo_rectangle(cr, x, y, width, height)
        cairo_fill(cr)

        -- Foreground rounded
        local fill = width * percent
        if fill < height then fill = height end

        cairo_set_source_rgba(cr, fg[1], fg[2], fg[3], fg[4])
        cairo_arc(cr, x + height/2, y + height/2, height/2, math.pi/2, 3*math.pi/2)
        cairo_line_to(cr, x + fill - height/2, y)
        cairo_arc(cr, x + fill - height/2, y + height/2, height/2, -math.pi/2, math.pi/2)
        cairo_close_path(cr)
        cairo_fill(cr)
    end

    local cpu = tonumber(conky_parse('${cpu}')) / 100
    local mem = tonumber(conky_parse('${memperc}')) / 100

    draw_bar(20, 70, 200, 12, cpu,
        {0.2,0.2,0.2,0.4},
        {0.8,0.6,0.95,1})

    draw_bar(20, 100, 200, 12, mem,
        {0.2,0.2,0.2,0.4},
        {0.6,0.9,0.7,1})

    cairo_destroy(cr)
end
