open Raylib
open Types

let width = 800
let height = 450

let setup () =
    init_window 
        width 
        height 
        "raylib [core] example - basic window";
    set_target_fps 60
;;

let update current_state = 
    match current_state with
    | Menu _ -> Menu.update current_state
    | Game _ -> Game.update current_state
;;

let render current_state =
    begin_drawing ();
    match current_state with
    | Menu _ -> Menu.render current_state; end_drawing ()
    | Game _ -> Game.render current_state; end_drawing ()
;;

let rec loop current_state () =
    match window_should_close () with
    | true -> close_window ()
    | false -> 
        let new_state = update current_state in
        render new_state;
        loop new_state ()
;;

let () = setup () |> loop (Menu {width; height})
