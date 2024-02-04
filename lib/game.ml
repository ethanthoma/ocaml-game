open Types
open Raylib

let update state =
    let player = Player.update state.world state.camera state.player in
    let camera = 
        let cam = state.camera in
        Camera.set_target cam ( Vector3.create 0. 0. 0. );
        cam
    in
    let enemies = List.map ( Enemy.update player ) state.enemies in
    { state with camera; player; enemies }
;;

let render state =
    clear_background Color.black;
    begin_mode_3d state.camera;
        World.render state.world;
        Mouse.render state.camera state.world;
        List.iter Entity.render state.enemies;
        Entity.render state.player;
    end_mode_3d ()
;;
