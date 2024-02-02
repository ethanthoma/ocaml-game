type menu = {
    width: int;
    height: int;
}

type player = {
    x: float;
    y: float;
    target: Raylib.Vector2.t;
    vel: float;
}

type enemy = {
    x: float;
    y: float;
    speed: float;
}

type config = { player: player; enemies: enemy list; }

type state = 
    | Menu of config
    | Game of config
