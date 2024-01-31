open Types

let update current_state =
    match current_state with
    | Game { player=player; enemies=enemies; } -> 
        let player = Player.update player in
        let enemies = List.map (Enemy.update player) enemies in
        Game { player; enemies; }
    | _ -> current_state
;;

let render current_state =
    match current_state with
    | Game { player; enemies; } -> 
        let _ = List.map Enemy.render enemies in
        Player.render player
    | _ -> ()
;;
