open Types
open Raylib

let update state =
    let p1,p2,p3,p4 = state.world in
    let player = Player.update (p1,p2,p3,p4) state.camera state.player in
    let camera = 
        let cam = state.camera in
        Camera.set_target cam ( Vector3.create 0. 0. 0. );
        cam
    in
    let enemies = List.map ( Enemy.update player ) state.enemies in
    { state with camera; player; enemies }
;;

let render state =
    let p1,p2,p3,p4 = state.world in
    let open Raylib in
    clear_background Color.black;
    begin_mode_3d state.camera;
    draw_triangle_3d p3 p2 p1 Color.blue;
    draw_triangle_3d p4 p3 p1 Color.blue;
    draw_circle_3d 
        ( Mouse.get_mouse_col (p1,p2,p3,p4) state.camera ) 
        5. 
        ( Vector3.create 1. 0. 0. ) 
        90. 
        Color.red;
    List.iter Entity.render state.enemies;
    Entity.render state.player;
    end_mode_3d ()
;;
