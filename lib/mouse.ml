open Raylib

let get_mouse_pos_in_world (p1,p2,p3,p4) camera = 
    let pos = get_mouse_position () in
    let ray = get_mouse_ray pos camera in
    let col = get_ray_collision_quad ray p1 p2 p3 p4 in
    RayCollision.point col
;;

let render camera world = 
    draw_circle_3d 
        ( get_mouse_pos_in_world world camera ) 
        5. 
        ( Vector3.create 1. 0. 0. ) 
        90. 
        Color.red;
