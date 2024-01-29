open Types

let update current_state =
    match current_state with
    | Game player -> Game ( Player.update player )
    | _ -> current_state
;;

let render current_state =
    match current_state with
    | Game player -> Player.render player
    | _ -> ()
;;
