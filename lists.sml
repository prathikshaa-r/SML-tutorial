(*
LISTS
	All list elements must be of the same type.
	[]
	[v1, v2, v3...vn]

*)

[];

[1, 3, 3];

[true, false, true];

[1, 3+10];

(* Invalid list: [5, true] *)

(* Another way of constructing a list: using :: or "cons" = short for constructing a list *)
val x = [7, 8, 9];
5::x; (* Produces list [5, 7, 8, 9] *)

6::5::x;

(* Invalid: [1, 2]::x; 
Cannot add a list to the beginning of another list using the "cons" operator unless elements of your list are themselves lists of the same type.
*)

(*
ACCESSING LIST ELEMENTS
* Accessing something from empty list returns an error
* null(list) - returns bool whether list is empty or not
* Head of list: first element of list      hd(list)
* Tail of list: Remaning list except head  tl(list)
*)

null(x);
null [];
null([1, 2, 3]);

hd x;
tl x;
tl(tl x);
hd(tl x);

