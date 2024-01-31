open Raylib
open Types

let update current_state = 
    match current_state with
    | Menu { player=player; enemies=enemies; } ->
        if is_key_pressed Key.Enter then
            Game { player; enemies; }
        else
            current_state 
    | _ -> current_state
;;

let render current_state =
    match current_state with
    | Menu _ ->
        clear_background Color.raywhite;
        draw_text 
            "hit ENTER to start, move with WASD" 
            200
            200
            20
            Color.red
    | _ -> ()
;;
