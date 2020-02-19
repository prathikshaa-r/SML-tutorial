(* After studying tuples and lists, now writing some functions using lists. *)

fun sum_list(xs : int list) =
    if null xs
    then 0
    else hd xs + sum_list(tl xs);


fun countdown(x : int) = (* [7, 6, 5, 4, 3, 2, 1] *)
    if x=0
    then []
    else x :: countdown(x-1);

fun append(xs : int list, ys : int list) = (* Append list of xs to list of ys *)
    if null xs
    then ys
    else (hd xs) :: append((tl xs), ys);

(* int list * int list -> int list *)

fun append2(xs : int list, ys : int list) =
    if null xs
    then ys
    else if null ys
    then xs
    else (hd xs):: append2((tl xs), ys);


(* Fails to generalize for type 'a list * 'a list  on ([], []) *)
fun append3(xs : 'a list, ys : 'a list) = (* Append lists of any type *)
    if null xs
    then ys
    else if null ys
    then xs
    else (hd xs)::append3((tl xs), ys);


(* Functions over pairs of lists *)
fun sum_pair_list(xs : (int * int) list) =
    if null xs
    then 0
    else (#1 (hd xs)) + (#2 (hd xs)) + sum_pair_list(tl xs);
(* sum_pair_list([(1,2), (3,4), (5,6)]) *)

fun firsts(xs : (int * int) list) = (* [(3,4), (5,6)] -> [3,5] *)
    if null xs
    then []
    else
	(#1 (hd xs))::firsts(tl xs);
(* firsts([(1,2), (3,4)]) *)

fun firsts(xs : (int * int) list) = (* [(3,4), (5,6)] -> [3,5] *)
    if null xs
    then []
    else
	(#1 (hd xs))::firsts(tl xs);
(* firsts([(1,2), (3,4)]) *)

fun seconds(xs : (int * int) list) = (* [(3,4), (5,6)] -> [3,5] *)
    if null xs
    then []
    else
	(#2 (hd xs))::seconds(tl xs);
(* seconds([(1,2), (3,4)]) *)

fun sum_pair_lists2(xs : (int * int) list) =
    sum_list(firsts(xs)) + sum_list(seconds(xs));
