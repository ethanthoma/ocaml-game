open Float
open Types
open Raylib

let size = 10.
let color = Color.red

let box enemy = 
    let half_size = div size 2. in
    let x,y,z = (
        ( Vector3.x enemy.position ),
        ( Vector3.y enemy.position ),
        ( Vector3.z enemy.position )
    ) in BoundingBox.create 
        ( Vector3.create ( sub x half_size ) ( sub y half_size ) ( sub z half_size ))
        ( Vector3.create ( add x half_size ) ( add y half_size ) ( add z half_size ))
;;

let enemy_clicked mouse enemies = 
    let ray = mouse.ray in
    List.find_opt
        ( 
            fun enemy -> 
            let box = box enemy in
            let collision = get_ray_collision_box ray box in
            RayCollision.hit collision
        )
        enemies
;;

let outline enemy = 
    draw_cube_wires
        enemy.position
        (add size 1.)
        (add size 1.)
        (add size 1.)
        Color.green
;;

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

let make_random world id =
    let min_x, max_x, min_z, max_z = find_min_max world in
    let position = 
        let x = of_int (Raylib.get_random_value (to_int min_x) (to_int max_x)) in
        let z = of_int (Raylib.get_random_value (to_int min_z) (to_int max_z)) in
        Vector3.create x ( div size 2. ) z in
    let size = Vector3.create size size size in
    let target = position in
    let vel = div (of_int (Raylib.get_random_value 1 18)) 9. in
    { id; position; size; target; vel; color; }
;;

let update player enemy =
    let target = player.position in
    Entity.move_entity_to_target { enemy with target }
;;
