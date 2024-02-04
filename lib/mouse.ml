open Raylib

let get_mouse_col (p1,p2,p3,p4) camera = 
    let pos = get_mouse_position () in
    let ray = get_mouse_ray pos camera in
    let col = get_ray_collision_quad ray p1 p2 p3 p4 in
    RayCollision.point col
;;
