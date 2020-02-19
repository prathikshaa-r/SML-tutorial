(*
DATATYPES:
Variable Bindings, Function Bindings, Datatype Bindings
*)


(* One of type:
Either int * int or string or empty?
TwoInts, Str, Pizza = constructors

TwoInts: int * int -> mytype function/constructor
Str: string -> mytype function/constructor
Pizza : mytype value of type mytype
 *)
datatype mytype = TwoInts of int * int
       | Str of string
       | Pizza;

val a = Str "hi";
val b = Str;
val c = Pizza;
val d = TwoInts(1+2, 3+4);
val e = a;

(* How to access the data of these one of types?
Lists: 	  Options:
null	  isSome
hd, tl	  valOf
*)

(* Case Expressions *)

(* mytype -> int *)
fun f (x : mytype) =
    case x of          (* Pattern Matching on left => built from the same constructor *)
	Pizza => 3
      | Str s => 8
      | TwoInts(i1, i2) => i1 + i2;

fun f2 x =
    case x of
	Pizza => 3
     |  TwoInts(i1, i2)  => i1 + i2
     |  Str s => String.size s;

datatype exp = Constant of int
	     | Negate of exp
	     | Add of exp * exp
	     | Multiply of exp * exp;
(* SML exp 
Add(Constant(10, 9), Negate(Constant 4))
           Add
         /    \
        /      \
       /        \
   Constant   Negate
      |          |
      19     Constant
                 |
                 4
*)

fun eval (Constant i) = i
  | eval(Negate e2) = ~(eval e2)
  | eval(Add(e1, e2)) = eval(e1) + eval(e2)
  | eval(Multiply(e1, e2)) = eval(e1) * eval(e2);


fun max_constant_1 (e : exp) =
    case e of
	Constant i => i
      | Negate e => max_constant_1 e
      | Add(a, b) =>
	let val max_a = max_constant_1 a
	    val max_b = max_constant_1 b
	in
	    if max_a > max_b then max_a else max_b
	end
      | Multiply(a, b) =>
	let val max_a = max_constant_1 a
	    val max_b = max_constant_1 b
	in
	    if max_a > max_b then max_a else max_b
	end;


fun max_constant_2 (e : exp) =
    case e of
	Constant i => i
      | Negate i => max_constant_2 i
      | Add(a, b) => Int.max(max_constant_2 a, max_constant_2 b)
      | Multiply(a, b) => Int.max(max_constant_2 a, max_constant_2 b);

fun max_constant (Constant x) = x
  | max_constant (Negate x) = max_constant x
  | max_constant (Add(a, b)) = Int.max(max_contant a, max_constant b)
  | max_constant (Multiply(a, b)) = Int.max(max_constant a, max_constant b);


val exp1 = Add(Constant 10, Negate(Constant 20)); (* =10-20 = -10 *)
val exp2 = Multiply(exp1, Constant 1);
val exp3 = Multiply(exp1, Constant 0);

val twenty = max_constant exp1;
