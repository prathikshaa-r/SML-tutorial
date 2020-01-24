(* Let expressions to avoid repeated computation *)

fun bad_max(xs : int list) =
    if null xs
    then 0 (* Horrible style, fix later? *)
    else if null (tl xs)
    then hd xs
    else if hd xs > bad_max(tl xs)
    then hd xs
    else bad_max(tl xs);



(* [from, from+1, from+2, ..., to] *)
fun countup(from : int, to : int) =
    if from=to
    then from::[]
    else
	from::countup(from+1, to);

(* [from, from-1, from-2, from-3, ..., to] *)
fun countdown(from : int, to : int) =
    if from=to
    then from::[]
    else
	from::countdown(from-1, to);

fun good_max(xs : int list) =
    if null xs
    then 0
    else if null(tl xs)
    then hd xs
    else
	let
	    val max_tl = good_max(tl xs)
	    val lhs = hd xs
	in
	    if lhs > max_tl
	    then lhs
	    else max_tl
	end;

(*---------------------------------------------*)

