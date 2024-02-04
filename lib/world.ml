open Raylib

let render world =
    let p1,p2,p3,p4 = world in
    draw_triangle_3d p3 p2 p1 Color.blue;
    draw_triangle_3d p4 p3 p1 Color.blue
;;
