open Raylib

let print_vector vec =
    print_float (Vector3.x vec);
    print_char ' ';
    print_float (Vector3.y vec);
    print_char ' ';
    print_float (Vector3.z vec);
    print_endline "";
