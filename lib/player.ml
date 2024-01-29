open Raylib
open Types

let update player = 
    let x, y = (player.x, player.y) in
    let x =
        match (is_key_down Key.A, is_key_down Key.D) with
        | true, false -> x - 10;
        | false, true ->  x + 10;
        | _, _ -> x 
    in let y =
        match (is_key_down Key.W, is_key_down Key.S) with
        | true, false -> y - 10;
        | false, true ->  y + 10;
        | _, _ -> y 
    in { x = x; y = y }
;;

let render player = 
    let x, y = (player.x, player.y) in
    clear_background Color.black;
    draw_rectangle x y 20 20 Color.yellow
;;
