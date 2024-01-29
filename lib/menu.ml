open Raylib
open Types

let update current_state = 
    match current_state with
    | Menu meta ->
        if is_key_pressed Key.Enter then
            Game { x = (meta.width / 2); y = (meta.height / 2) }
        else
            current_state 
    | _ -> current_state
;;

let render current_state =
    match current_state with
    | Menu meta ->
        clear_background Color.raywhite;
        draw_text 
            "hit ENTER to start, move with WASD" 
            (meta.width / 4)
            (meta.height / 2) 
            20
            Color.red
    | _ -> ()
;;
