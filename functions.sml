(* We saw variable bindings in test.sml
   Now, function bindings
   Program: A series of variable bindings and program bindings
   Function:
      Take arguments, compute and return a result
*)

(* pow using recursion *)
(* Powers or Exponents function: for power y>=1 *)
fun pow(x : int, y : int) = (* Takes only one (int * int) tuple as input *)
    if y = 0
    then 1
    else x * pow(x, y-1);

(* Calculate the cube of a given number *)
fun cube(x : int) =
    pow(x, 3);
    (* x * x * x; *)

val sixtyfour = cube(4);
val fortytwo = pow(2, 2+2) + pow(4, 2) + cube(2) + 2;


(* Since forward reference not allowed, soon we'll see how to have two funcs that need to ref each other *)

(*
FUNCTION BINDINGS
* A function is already a value. => function binding = value that can be referred to by following bindings.
* A function is not evaluated until it is called.
* TYPE CHECKING
   fun x0 (x1 : t1, ... xn : tn) = e;
   
Adds binding:
   x0 : (t1 * ... tn) -> t
   iff 
      e -> type based on static environment from previous bindings
      types of the arguments used in the function (which only have a scope within the function)
      also based on final type t itself (this seems recursive)

FUNCTION CALLS
 Type Checking
 Evaluating --> Eager evaluation
*)

