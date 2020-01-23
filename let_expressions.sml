(* Let Expression, not a binding!
Let allows decleration of local bindings used only for the body of the let expression

let b1 b2 b3... bn
in e
end

Type of e is type of let expression

*)

fun silly1 (z : int) =
    let val x = if z > 0 then z else 34
	val y = x + z + 9
    in
	if x > y then x * 2 else y * y (* int *)
    end
(* int->int *)

fun silly2 () =
    let val x = 1
    in
	(let val x = 2 in x+1 end) (* inner x=2 and x+1 is 3 *) + (let val y = x+2 in y+1 end) (* y=outer x+2 = 1+2 = 3, y+1 = 4 *)
    end


