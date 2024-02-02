open Float
open Types

let make_random width height =
    let x = of_int (Raylib.get_random_value 0 width) in
    let y = of_int (Raylib.get_random_value 0 height) in
    { x; y; speed = 5.; }
;;

let update (player: player) enemy =
    let x, y = ( player.x, player.y ) in
    let x, y = (
        sub x enemy.x,
        sub y enemy.y
    ) in
    let t = atan2 y x in
    let s = enemy.speed in
    let x, y = (
        cos t |> mul s |> add enemy.x,
        sin t |> mul s |> add enemy.y
    ) in 
    { enemy with x; y; }
;;

let render enemy =
    let open Raylib in
    let x, y = ( enemy.x, enemy.y ) in
    draw_rectangle
        (to_int x)
        (to_int y)
        10
        10
        Color.green
;;
