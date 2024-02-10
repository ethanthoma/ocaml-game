open Raylib
open Types

let init = 
    let id = 69 in
    let position = Vector3.create 0. 10. 0. in
    let size = Vector3.create 20. 20. 20. in
    let target = position in
    let vel = 3. in
    let color = Color.yellow in
    { id; position; size; target; vel; color; }
;;

let update { mouse; player; _ } = 
    let target =
        if is_mouse_button_pressed MouseButton.Right &&
            RayCollision.hit mouse.world_collision
        then
            RayCollision.point mouse.world_collision
        else 
            player.target
    in let player = { player with target } in
    Entity.move_entity_to_target player
;;
