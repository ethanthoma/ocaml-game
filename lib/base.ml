open Raylib
open Types

let width = 800
let height = 450
let title = "GAME"

let world = (
    Vector3.create ~-.200. 0. ~-.200.,
    Vector3.create 200. 0. ~-.200.,
    Vector3.create 200. 0. 200.,
    Vector3.create ~-.200. 0. 200.
)

let camera =
    let position = Vector3.create 200. 200. 0. in
    let target = Vector3.create 0. 0. 0. in
    let up = Vector3.create 0. 1. 0. in
    let fovy = 45. in
    let proj = CameraProjection.Perspective in
    Camera.create position target up fovy proj
;;

let mouse = Mouse.init world camera

let player = 
    let position = Vector3.create 10. 10. 10. in
    let size = Vector3.create 20. 20. 20. in
    let target = position in
    let vel = 3. in
    let color = Color.yellow in
    { position; size; target; vel; color; }
;;

let enemies = 
    Raylib.set_random_seed (Unsigned.UInt.of_int 42069);
    List.init 10 (fun _ -> Enemy.make_random world)
;;

let state = {
    camera;
    mouse;
    world;
    player;
    enemies;
}

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
