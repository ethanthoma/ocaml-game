open Types

let width = 800
let height = 450
let title = "GAME"

let world = World.init

let camera = Camera.init

let mouse = Mouse.init

let player = Player.init

let enemies = 
    Raylib.set_random_seed (Unsigned.UInt.of_int 42069);
    List.init 10 (fun id -> Enemy.make_random world id)
;;

let state = {
    camera;
    mouse;
    world;
    player;
    enemies;
}

open Raylib

let setup () =
    init_window width height title;
    set_target_fps 60
;;

let update state = 
    Game.update state
;;

let render state =
    begin_drawing ();
    Game.render state;
    end_drawing ()
;;

let rec loop current_state () =
    match window_should_close () with
    | true -> close_window ()
    | false -> 
        let new_state = update current_state in
        render new_state;
        loop new_state ()
;;

let () = setup () |> loop state
