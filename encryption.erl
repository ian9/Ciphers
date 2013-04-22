-module(encryption).
-export([encrypt/2, decrypt/2, solve/2]).

encrypt(Str, Shift) ->
	lists:map(fun(C) ->
		Ch = string:to_upper(C),
		if
			Ch >= $A, Ch =< $Z -> ((Ch - $A + Shift) rem 26) + $A;
			true -> Ch
		end
	end, Str).

decrypt(Str, Shift) ->
	lists:map(fun(C) ->
		Ch = string:to_upper(C),
		if
			Ch >= $A, Ch =< $Z -> ((Ch - $A - Shift) rem 26) + $A;
			true -> Ch
		end
	end, Str).

solve(_, -1) -> done;
solve(Str, Max_shift) -> 
	io:format("Ceaser ~w: ~s~n", [Max_shift, encrypt(Str, Max_shift)]),
	solve(Str, Max_shift-1).

