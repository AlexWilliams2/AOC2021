-module(day2).
-compile(export_all).

day2(1) ->
    Input = inputs:get_input("2"),
    AdjustedInput = lists:map(
        fun(Movement) -> {list_to_atom(lists:nth(1, string:split(Movement, " "))), list_to_integer(lists:nth(2, string:split(Movement, " ")))} end,
        Input),
    calculate_positions(AdjustedInput, 0, 0);
day2(2) ->
    Input = inputs:get_input("2"),
    AdjustedInput = lists:map(
        fun(Movement) -> {list_to_atom(lists:nth(1, string:split(Movement, " "))), list_to_integer(lists:nth(2, string:split(Movement, " ")))} end,
        Input),
    calculate_positions2(AdjustedInput, 0, 0, 0).


calculate_positions([{forward, Movement} | []], Horizontal, Vertical) ->
    (Horizontal + Movement) * Vertical;
calculate_positions([{down, Movement} | []], Horizontal, Vertical) ->
    (Vertical + Movement) * Horizontal;
calculate_positions([{up, Movement} | []], Horizontal, Vertical) ->
    (Vertical - Movement) * Horizontal;
calculate_positions([{forward, Movement} | FutureMovement], Horizontal, Vertical) ->
    calculate_positions(FutureMovement, Horizontal + Movement, Vertical);
calculate_positions([{down, Movement} | FutureMovement], Horizontal, Vertical) ->
    calculate_positions(FutureMovement, Horizontal, Vertical + Movement);
calculate_positions([{up, Movement} | FutureMovement], Horizontal, Vertical) ->
    calculate_positions(FutureMovement, Horizontal, Vertical - Movement).

calculate_positions2([{forward, Movement} | []], Horizontal, Vertical, Aim) ->
    (Horizontal + Movement) * (Vertical + Movement * Aim);
calculate_positions2([{down, _Movement} | []], Horizontal, Vertical, _Aim) ->
    Horizontal * Vertical;
calculate_positions2([{up, _Movement} | []], Horizontal, Vertical, _Aim) ->
    Horizontal * Vertical;
calculate_positions2([{forward, Movement} | FutureMovement], Horizontal, Vertical, Aim) ->
    calculate_positions2(FutureMovement, Horizontal + Movement, Vertical + Movement * Aim, Aim);
calculate_positions2([{down, Movement} | FutureMovement], Horizontal, Vertical, Aim) ->
    calculate_positions2(FutureMovement, Horizontal, Vertical, Aim + Movement);
calculate_positions2([{up, Movement} | FutureMovement], Horizontal, Vertical, Aim) ->
    calculate_positions2(FutureMovement, Horizontal, Vertical, Aim - Movement).