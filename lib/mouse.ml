open Raylib
open Types

let get_mouse_pos_in_world (p1,p2,p3,p4) camera = 
    let pos = get_mouse_position () in
    let ray = get_mouse_ray pos camera in
    let col = get_ray_collision_quad ray p1 p2 p3 p4 in
    RayCollision.point col
;;

let add_y_offset pos offset = 
    Vector3.create
        ( Vector3.x pos )
        ( Float.add offset ( Vector3.y pos ))
        ( Vector3.z pos )
;;

let init world camera =
    let p1,p2,p3,p4 = world in
    let pos = get_mouse_position () in
    let ray = get_mouse_ray pos camera in
    let world_collision = get_ray_collision_quad ray p1 p2 p3 p4 in
    let entity = Option.None in
    { ray; world_collision; entity }
;;

let update { world; camera; mouse; enemies; _ } = 
    let p1,p2,p3,p4 = world in
    let pos = get_mouse_position () in
    let ray = get_mouse_ray pos camera in
    let world_collision = get_ray_collision_quad ray p1 p2 p3 p4 in
    let entity = 
        match Raylib.is_mouse_button_pressed MouseButton.Left with
        | true -> 
            Enemy.enemy_clicked mouse enemies 
        | false -> mouse.entity
    in { ray; world_collision; entity }
;;

let render mouse = 
    (
        match RayCollision.hit mouse.world_collision with
        | true ->
            draw_circle_3d 
                ( add_y_offset ( RayCollision.point mouse.world_collision ) 1. )
                5. 
                ( Vector3.create 1. 0. 0. ) 
                90. 
                Color.green
        | false -> ()
    );
    (
        match mouse.entity with
        | Some entity -> Enemy.outline entity
        | None -> ()
    );
;;
