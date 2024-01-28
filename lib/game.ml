open Raylib

type state = Menu | Game

let width = 800
let height = 450

let setup () =
    init_window 
        width 
        height 
        "raylib [core] example - basic window";
    set_target_fps 60

let invert_state current_state =
    match current_state with
    | Menu -> Game
    | Game -> Menu

let update current_state = 
    match is_key_pressed Key.Enter with
    | true -> invert_state current_state 
    | false -> current_state

let render_menu () =
    clear_background Color.raywhite;
    draw_text 
        "Congrats! You created your first window!" 
        190 
        200 
        20
        Color.red

let render_game () =
    clear_background Color.black;
    draw_text
        "YOOOOOOOOOOOOOOOOOOOOOOO"
        190
        200
        20
        Color.yellow

let render current_state =
    begin_drawing ();
    match current_state with
    | Menu -> render_menu (); end_drawing ()
    | Game -> render_game (); end_drawing ()

let rec loop current_state () =
    match window_should_close () with
    | true -> close_window ()
    | false -> 
        let new_state = update current_state in
        render new_state;
        loop new_state ()

let () = setup () |> loop Menu
