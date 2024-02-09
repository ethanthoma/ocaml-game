open Raylib
open Types

let update { mouse; player; _ } = 
    let target =
        match
        is_mouse_button_pressed MouseButton.Right &&
        RayCollision.hit mouse.world_collision
        with
        | true -> RayCollision.point mouse.world_collision
        | false -> player.target
    in let player = { player with target } in
    Entity.move_entity_to_target player
;;
