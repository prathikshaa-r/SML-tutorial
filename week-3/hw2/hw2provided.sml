(* Dan Grossman, Coursera PL, HW2 Provided Code *)

(* if you use this function to compare two strings (returns true if the same
   string), then you avoid several of the functions in problem 1 having
   polymorphic types that may be confusing *)
fun same_string(s1 : string, s2 : string) =
    s1 = s2;

(* put your solutions for problem 1 here *)
fun all_except_option (word, []) = NONE
  | all_except_option (word, a::l) =
    if same_string(word, a) then SOME l
    else case all_except_option (word, l) of
	     NONE => NONE
	   | SOME y => SOME(a::y);

fun get_substitutions1 ([], s) = []
  | get_substitutions1 (a::l, s) =
    case all_except_option(s, a) of
	NONE => get_substitutions1 (l, s)
      | SOME y => y @ get_substitutions1 (l, s);

fun get_substitutions2 ([], s) = []
  | get_substitutions2 (a::l, s) = (* a::l string list list *)
    let fun helper (l, cur_list) = (* l - string list *)
	    case a of [] => helper (l, []) (* l - string list *)
		    | x::xt => if same_string(x, s) then helper (l, xt)
			       else helper (l, xt@[x]); (* Seems incorrect - infinite loop *)
    in helper(l, [])
    end;
(* you may assume that Num is always used with values 2, 3, ..., 10
   though it will not really come up *)
datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int 
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw 

exception IllegalMove;

(* put your solutions for problem 2 here *)



