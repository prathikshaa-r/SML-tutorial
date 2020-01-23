(* We saw variable bindings in test.sml
   Now, function bindings
   Program: A series of variable bindings and program bindings
   Function:
      Take arguments, compute and return a result
*)


(* Powers or Exponents function: for power y>=1 *)
fun pow(x : int, y : int) =
    if y = 0
    then 1
    else x * pow(x, y-1);
