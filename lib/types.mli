type menu = {
    width: int;
    height: int;
}

type player = {
    x: int;
    y: int;
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
