open Float
open Raylib
open Types

let update (player: player) = 
    let vel = player.vel in
    let x, y = (player.x, player.y) in
    let target =
        match is_mouse_button_pressed MouseButton.Right with
        | true -> get_mouse_position ()
        | false -> player.target
    in 
    let dx, dy = (
        sub (Vector2.x target) x,
        sub (Vector2.y target) y
    ) in
    let t = atan2 dy dx in
    let x, y = (
        cos t |> mul vel |> add x,
        sin t |> mul vel |> add y
    ) in
    { x; y; vel; target; }
;;

let render (player: player) = 
    let x, y = (player.x, player.y) in
    clear_background Color.black;
    draw_rectangle (to_int x) (to_int y) 20 20 Color.yellow
;;
