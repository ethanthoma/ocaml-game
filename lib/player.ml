open Float
open Raylib
open Types

let update p camera player = 
    let target =
        match is_mouse_button_pressed MouseButton.Right with
        | true -> 
            Mouse.get_mouse_col p camera
        | false -> player.target
    in 
    let player = { player with target } in
    let arrived =
        let x = sub (Vector3.x player.position) (Vector3.x target) in
        let z = sub (Vector3.z player.position) (Vector3.z target) in 
        max ( abs x ) ( abs z ) <= player.vel
    in
    match arrived with
    | true -> 
        let position = Vector3.create 
            ( Vector3.x target )
            ( Vector3.y player.position )
            ( Vector3.z target)
        in
        { player with position }
    | false -> Entity.move_entity_to_target player
;;
