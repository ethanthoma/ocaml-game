open Raylib

type player = {
    x: int;
    y: int;
}

type state = 
    | Menu 
    | Game of player

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
    | Menu -> Game { x = (width / 2); y = (height / 2) }
    | Game _ -> Menu

let update current_state = 
    match current_state with
    | Menu ->
        if is_key_pressed Key.Enter then
            Game { x = (width / 2); y = (height / 2) }
        else
            Menu
    | Game player ->
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
        in
        Game { x = x; y = y }

let render_menu () =
    clear_background Color.raywhite;
    draw_text 
        "hit ENTER to start, move with WASD" 
        (width / 4)
        (height / 2) 
        20
        Color.red

let render_game player =
    clear_background Color.black;
    draw_rectangle
        player.x
        player.y
        20
        20
        Color.yellow

let render current_state =
    begin_drawing ();
    match current_state with
    | Menu -> render_menu (); end_drawing ()
    | Game player -> render_game player; end_drawing ()

let rec loop current_state () =
    match window_should_close () with
    | true -> close_window ()
    | false -> 
        let new_state = update current_state in
        render new_state;
        loop new_state ()

let () = setup () |> loop Menu
