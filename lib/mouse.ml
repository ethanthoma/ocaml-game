open Raylib
open Types

let init =
    let zero = Vector3.zero () in
    let ray = Ray.create zero zero in
    let world_collision = get_ray_collision_quad ray zero zero zero zero in
    let id = Option.None in
    { ray; world_collision; id }
;;

let update { world=(p1,p2,p3,p4); camera; mouse; enemies; _ } = 
    let pos = get_mouse_position () in
    let ray = get_mouse_ray pos camera in
    let world_collision = get_ray_collision_quad ray p1 p2 p3 p4 in
    let id = 
        if Raylib.is_mouse_button_pressed MouseButton.Left then
            match Enemy.enemy_clicked mouse enemies with
            | Some enemy -> Some enemy.id
            | None -> None
        else 
            mouse.id
    in { ray; world_collision; id }
;;

let add_y_offset pos offset = 
    Vector3.create
        ( Vector3.x pos )
        ( Float.add offset ( Vector3.y pos ))
        ( Vector3.z pos )
;;

let render mouse enemies = 
    (
        if RayCollision.hit mouse.world_collision then
            draw_circle_3d 
                ( add_y_offset ( RayCollision.point mouse.world_collision ) 1. )
                5. 
                ( Vector3.create 1. 0. 0. ) 
                90. 
                Color.green
        else
            ()
    );
    (
        match mouse.id with
        | Some id -> 
            let enemy = 
                List.find 
                    ( fun (enemy: entity) -> id == enemy.id) 
                    enemies 
            in Enemy.outline enemy
        | None -> ()
    );
;;
