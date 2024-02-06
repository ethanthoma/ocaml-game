open Raylib

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

let render camera world = 
    draw_circle_3d 
        ( add_y_offset ( get_mouse_pos_in_world world camera ) 1. )
        5. 
        ( Vector3.create 1. 0. 0. ) 
        90. 
        Color.green
;;
