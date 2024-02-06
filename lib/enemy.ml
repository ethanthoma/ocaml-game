open Float
open Types
open Raylib

let find_min_max (p1, p2, p3, p4) =
    let points = [p1; p2; p3; p4] in
    let initial = (
        ( Vector3.x p1), 
        ( Vector3.x p1), 
        ( Vector3.z p1), 
        ( Vector3.z p1)
    ) in
    let (min_x, max_x, min_z, max_z) =
        List.fold_left (fun (min_x, max_x, min_z, max_z) p ->
            let x, z = ( (Vector3.x p), (Vector3.z p)) in
            let min_x = if x < min_x then x else min_x in
            let max_x = if x > max_x then x else max_x in
            let min_z = if z < min_z then z else min_z in
            let max_z = if z > max_z then z else max_z in
            (min_x, max_x, min_z, max_z)
        ) initial points
    in
    (min_x, max_x, min_z, max_z)
;;

let make_random world =
    let min_x, max_x, min_z, max_z = find_min_max world in
    let position = 
        let x = of_int (Raylib.get_random_value (to_int min_x) (to_int max_x)) in
        let z = of_int (Raylib.get_random_value (to_int min_z) (to_int max_z)) in
        Vector3.create x 5. z in
    let size = Vector3.create 10. 10. 10. in
    let target = position in
    let vel = div (of_int (Raylib.get_random_value 1 18)) 9. in
    let color = Color.red in
    { position; size; target; vel; color; }
;;

let update player enemy =
    let target = player.position in
    Entity.move_entity_to_target { enemy with target }
;;
