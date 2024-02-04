open Raylib

type entity = {
    position: Vector3.t;
    size: Vector3.t;
    target: Vector3.t;
    vel: float;
    color: Color.t;
}

type state = {
    camera: Raylib.Camera.t;
    world: Vector3.t * Vector3.t * Vector3.t * Vector3.t;
    player: entity; 
    enemies: entity list; 
}
