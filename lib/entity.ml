open Raylib
open Types

let move_entity_to_target entity =
    let open Float in
    let dx, dz = (
        sub (Vector3.x entity.target) (Vector3.x entity.position),
        sub (Vector3.z entity.target) (Vector3.z entity.position)
    ) in
    let t = atan2 dz dx in
    let position = Vector3.create 
        (cos t |> mul entity.vel |> add (Vector3.x entity.position))
        (Vector3.y entity.position)
        (sin t |> mul entity.vel |> add (Vector3.z entity.position))
     in
    { entity with position; }
;;

let render entity =
    let open Raylib in
    draw_cube_v
        entity.position
        entity.size
        entity.color
;;
