extends Control
@export var skill_index := 0
var remaining := 0.0
var duration := 1.0
var available := true

func set_cooldown(seconds: float, total: float, enabled: bool) -> void:
    remaining = seconds
    duration = maxf(0.1, total)
    available = enabled
    queue_redraw()

func _draw() -> void:
    var c := size * 0.5
    var radius := minf(size.x, size.y) * 0.43
    var palette := [Color("#4dc9ff"), Color("#ffad50"), Color("#5de5a0"), Color("#e9aaff")]
    var accent: Color = palette[skill_index]
    draw_circle(c, radius, Color("#18283c") if available else Color("#242735"))
    draw_arc(c, radius, 0.0, TAU, 48, accent.darkened(0.48), 4.0, true)
    if remaining > 0.0:
        var ratio := clampf(remaining / duration, 0.0, 1.0)
        draw_arc(c, radius, -PI / 2.0, -PI / 2.0 + TAU * ratio, 48, accent, 6.0, true)
    var ink := accent if available else Color("#737b8a")
    if skill_index == 0:
        var shield := PackedVector2Array([c + Vector2(0,-24),c + Vector2(21,-15),c + Vector2(18,10),c + Vector2(0,26),c + Vector2(-18,10),c + Vector2(-21,-15)])
        draw_colored_polygon(shield, ink.darkened(0.40))
        for i in range(shield.size()):
            draw_line(shield[i], shield[(i+1)%shield.size()], ink, 4.0, true)
        draw_line(c+Vector2(0,-15),c+Vector2(0,15),ink,3.0,true)
    elif skill_index == 1:
        draw_line(c+Vector2(-22,21),c+Vector2(20,-21),ink,7.0,true)
        draw_line(c+Vector2(20,-21),c+Vector2(13,-21),Color.WHITE,3.0,true)
        draw_line(c+Vector2(-26,4),c+Vector2(-7,23),ink,5.0,true)
        draw_line(c+Vector2(-14,23),c+Vector2(-2,10),ink,4.0,true)
    elif skill_index == 2:
        draw_rect(Rect2(c+Vector2(-7,-26),Vector2(14,52)),ink)
        draw_rect(Rect2(c+Vector2(-26,-7),Vector2(52,14)),ink)
        draw_circle(c,7,Color.WHITE)
    else:
        var star := PackedVector2Array()
        for i in range(10):
            var angle := -PI/2.0 + float(i)*PI/5.0
            var rad := 28.0 if i%2==0 else 12.0
            star.append(c+Vector2(cos(angle),sin(angle))*rad)
        draw_colored_polygon(star,ink)
        draw_circle(c,6,Color.WHITE)
