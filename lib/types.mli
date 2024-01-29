type menu = {
    width: int;
    height: int;
}

type player = {
    x: int;
    y: int;
}

type state = 
    | Menu of menu
    | Game of player
