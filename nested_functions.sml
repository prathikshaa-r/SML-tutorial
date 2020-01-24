(* Nest functions inside a function using a let expression
Let allows local bindings which may be variable bindings or function bindings
*)

(* (from, to) = (3,5) --> [3,4,5] *)
fun count_1 (from : int, to : int) =
    if from > to
    then []
    else if from = to
    then from::[]
    else from::count_1(from+1, to)

fun countup_from1_1 (x : int) =
    count_1(1,x)

fun countup_from1 (x : int) =
    let fun count(from : int) =
	    if from=x
	    then from::[]
	    else
		from::count(from + 1)
    in
	count(1)
    end;

