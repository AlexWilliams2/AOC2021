-module(inputs).
-compile(export_all).

get_input(Day) ->
    InputFile = "input" ++ Day ++ ".txt",
    {ok, Binary} = file:read_file(InputFile),
    string:tokens(erlang:binary_to_list(Binary), "\n").