-module(day1).
-compile(export_all).

day1(1) ->
    Input = inputs:get_input("1"),
    count_increases(Input, 0);
day1(2) ->
    Input = inputs:get_input("1"),
    sliding_window(Input, 1, none, 0).

sliding_window(Depths, Index, _PrevDepthsSum, Sum) when length(Depths) - Index < 2 ->
    Sum;
sliding_window(Depths, Index, none, Sum) ->
    sliding_window(Depths, Index + 1, sum_depths(Depths, Index), Sum);
sliding_window(Depths, Index, PrevDepthsSum, Sum) ->
    DepthsSum = sum_depths(Depths, Index),
    NewSum = case DepthsSum > PrevDepthsSum of
        true -> Sum + 1;
        false -> Sum
    end,
    sliding_window(Depths, Index + 1, DepthsSum, NewSum).
    
sum_depths(Depths, Index) ->
    list_to_integer(lists:nth(Index, Depths)) + 
    list_to_integer(lists:nth(Index + 1, Depths)) + 
    list_to_integer(lists:nth(Index + 2, Depths)).

count_increases([_Depth | []], Sum) ->
    Sum + 1;
count_increases([Depth | Depths], Sum) ->
    [NextDepth | _NextDepths] = Depths,
    case Depth < NextDepth of
        true -> 
            count_increases(Depths, Sum + 1);
        false -> 
            count_increases(Depths, Sum)
    end.