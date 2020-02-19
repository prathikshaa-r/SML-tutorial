(* This is a comment. This is my first SML program *)

(* Variable Bindings *)
val x = 34; (* int *)
(* Static Environment: x : int *)
(* Dynamic Environment: x-->34 *)

val y = 17; (* int *)
(* Static Environment: x: int, y : int *)
(* Dynamic Environment: x-->34, y-->17 *)

val z = (x + y) + (y + 2); (* Can only use the earlier bindings. *)
(* Static Environment: x: int, y : int, z : int *)
(* Dynamic Environment: x-->34, y-->34, z-->70 *)

val q = z+1;
(* Static Environment: x: int, y : int, z : int, q : int *)
(* Dynamic Environment: x-->34, y-->34, z-->70, q-->71 *)

val abs_of_z = if z < 0 then 0-z else z;
(* Static Environment: abs_of_z : int *)
(* Dynamic Environment: ..., abs_of_z-->70 *)

val abs_of_z_simpler = abs z;
(* Static Environment: abs_of_z : int *)
(* Dynamic Environment: ..., abs_of_z-->70 *)
