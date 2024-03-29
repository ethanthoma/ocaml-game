open Raylib

type entity = {
    id: int;
    position: Vector3.t;
    size: Vector3.t;
    target: Vector3.t;
    vel: float;
    color: Color.t;
}

type mouse = {
    ray: Ray.t;
    world_collision: RayCollision.t;
    id: int Option.t;
}

type state = {
    camera: Raylib.Camera.t;
    mouse: mouse;
    world: Vector3.t * Vector3.t * Vector3.t * Vector3.t;
    player: entity; 
    enemies: entity list; 
}
