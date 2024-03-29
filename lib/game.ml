open Types

let update state =
    let mouse = Mouse.update state in
    let camera = Camera.update state in
    let player = Player.update state in
    let enemies = List.map ( Enemy.update player ) state.enemies in
    { state with camera; mouse; player; enemies }
;;

let render state =
    let open Raylib in
    clear_background Color.black;
    begin_mode_3d state.camera;
        World.render state.world;
        Mouse.render state.mouse state.enemies; 
        List.iter Entity.render state.enemies;
        Entity.render state.player;
    end_mode_3d ()
;;
