open Raylib

let init = (
    Vector3.create ~-.200. 0. ~-.200.,
    Vector3.create 200. 0. ~-.200.,
    Vector3.create 200. 0. 200.,
    Vector3.create ~-.200. 0. 200.
)

let render (p1,p2,p3,p4)  =
    let color = Color.gray in
    draw_triangle_3d p3 p2 p1 color;
    draw_triangle_3d p4 p3 p1 color
;;
