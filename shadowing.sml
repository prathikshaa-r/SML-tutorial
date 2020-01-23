(* Programming Languages, Dan Grossman, Jan-Mar 2013 : SML COllection *)
(* Section 1: Examples to demonstrate shadowing *)
val a = 10;
(* a : int
   a->10 *)

val b = a * 2;
(* a->10, b->20 *)

val a = 5; (* Not an assignment statement *)
(* a->5, b->20 *)

val c = b;
(* a->5, b->20, c->20 *)

val d = a;
(* a->5, b->20, c->20, d->5 *)

val a = a+1; (* Again not an assignment| Old dynmic env -> New dynamic env where old value(s) of a is(/are) shadowed *)
(* a->6 b->20, c->20, d->5 *)


val f = a * 2;
(* Also cannot make forward refs to something not present in current dyn env *)
