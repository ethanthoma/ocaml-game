open Raylib
open Types

let move_entity_to_target entity =
    let open Float in
    let target = entity.target in
    let arrived =
        let x = sub (Vector3.x entity.position) (Vector3.x target) in
        let z = sub (Vector3.z entity.position) (Vector3.z target) in 
        max ( abs x ) ( abs z ) <= entity.vel
    in let position = 
        match arrived with
        | true ->
            Vector3.create 
                ( Vector3.x target )
                ( Vector3.y entity.position )
                ( Vector3.z target)
        | false -> 
            let dx, dz = (
                sub (Vector3.x target) (Vector3.x entity.position),
                sub (Vector3.z target) (Vector3.z entity.position)
            ) in
            let t = atan2 dz dx in
            Vector3.create 
                (cos t |> mul entity.vel |> add (Vector3.x entity.position))
                (Vector3.y entity.position)
                (sin t |> mul entity.vel |> add (Vector3.z entity.position))
    in
    { entity with position; }
;;

let render entity =
    draw_cube_v
        entity.position
        entity.size
        entity.color
;;
