(* Studying compound data types:
* Tuples - already seen as function input
* Lists - coming soon...
*)

(* A Pair = 2-tuple *)
fun swap (pr : int * bool) =
    (#2 pr, #1 pr); (* returning swapped pair *)

(* ((int*int) * (int*int)) -> (int) *)
fun sum_two_pairs(pr1 : int * int, pr2 : int * int) =
    (#1 pr1) + (#2 pr1) + (#1 pr2) + (#2 pr2); (* returning sum of all elems *)

(* (int * int) -> (int * int) *)
fun div_mod(x : int, y : int) = ((x div y), (x mod y));
(* 
   Division of ints in SML is (x div y)
   Also -4 is invalid and must be written as ~4 to represent negative 4 integer.
   x/y will return an error for ints but is valid for floats.
  *)

fun sort_pair(pr : int * int) =
    if (#1 pr) < (#2 pr)
    then pr
    else
	(#2 pr, #1 pr);

(*------------------------------------------------*)
(* Nesting *)
val x1 = (7, (true, 9)); (* int * (bool * int) *)

val x2 = #1 (#2 x1); (* true : bool *)

val x3 = (#2 x1); (* (true, 9) : bool * int *)

val x4 = ((3,5), ((4,8), (0,0))); (* (int*int) * ((int*int) * (int*int))*)

(*------------------------------------------------*)
(* n-tuples *)
