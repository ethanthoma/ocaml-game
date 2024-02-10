open Float
open Raylib
open Types

let angle = div pi 3.
let rho = 300.

let offset = 
    let y_offset = mul rho @@ sin angle in
    let z_offset = mul rho @@ cos angle in
    Vector3.create 0. y_offset z_offset

let init =
    let target = Vector3.create 0. 0. 0. in
    let up = Vector3.create 0. 1. 0. in
    let fovy = 45. in
    let proj = CameraProjection.Perspective in
    Camera.create offset target up fovy proj
;;

let update { camera; player; _ } =
    if is_key_down Key.Space then
        let target = player.position in
        let position = Vector3.add target offset in
        Camera.set_position camera position;
        Camera.set_target camera target;
        camera
    else
        camera 
;;
