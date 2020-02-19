(* Homework 1 
DATE: int * int * int | Y M D | Y > 0, M = [1, 12], D <= 31
DAY OF THE YEAR: int | =[1, 365]
*)

fun is_older (date1 : (int * int * int), date2 : (int * int * int)) =
    if #1 date1 > #1 date2 then false
    else if #1 date1 < #1 date2 then true
    else if #2 date1 > #2 date2 then false
    else if #2 date1 < #2 date2 then true
    else if #3 date1 >= #3 date2 then false
    else true;

fun number_in_month (dates : (int * int * int) list, month : int) =
    let fun count(dates : (int * int * int) list, num : int) =
	    case dates of
		[] => num
	      | date::tail => 
		if (#2 date) = month then count(tail, num+1) else count(tail, num)
    in
	count(dates, 0)
    end;

fun number_in_months (dates : (int * int * int) list, months : int list) =
    case months of
	[] => 0
      | a::l => number_in_month(dates, a) + number_in_months(dates, l);

fun dates_in_month (dates : (int * int * int) list, month : int) =
    case dates of
	[] => []
      | a::l => if #2 a = month then a::dates_in_month(l, month)
		else dates_in_month(l, month);

fun dates_in_months (dates : (int * int * int) list, months: int list) =
    case months of
	[] => []
      | a::l => dates_in_month(dates, a)@dates_in_months(dates, l);

fun get_nth (words : string list, n : int) =
    case n of
	1 => hd words
      | _ => get_nth (tl words, n-1);

fun date_to_string (date : (int * int * int)) =
    let
	val months = ["January",
		  "February",
		  "March",
		  "April",
		  "May",
		  "June",
		  "July",
		  "August",
		  "September",
		  "October",
		  "November",
		  "December"
		 ]
    in
	get_nth(months, #2 date) ^ " " ^ Int.toString (#3 date) ^ ", " ^ Int.toString (#1 date)
    end;

fun number_before_reaching_sum (sum : int, nums : int list) =
    let fun sum_index (sum : int, nums : int list, index : int) = 
	    if hd nums >= sum then index
	    else sum_index(sum-hd nums, tl nums, index+1);
    in
	sum_index (sum, nums, 0)
    end;

fun what_month (m : int) =
    let val days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    in
	number_before_reaching_sum(m, days) + 1
    end;


fun month_range (start_day : int, end_day : int) =
    if start_day > end_day then []
    else if start_day = end_day then [what_month end_day]
    else what_month start_day :: month_range(start_day+1, end_day);

fun oldest (dates : (int * int * int) list) =
    case dates of [] => NONE
		| a::l  =>
		  let
		      val tl_oldest = oldest l
		  in
		      if isSome tl_oldest
		      then
			  if is_older(a, valOf tl_oldest) then SOME a else tl_oldest
		      else SOME a
		  end;

(* Challenge Problems *)
(* Challenge Problem 12 *)
fun remove_duplicates[] = []
  | remove_duplicates (list as a::l) =
    let fun rem (r : int, [] : int list) = []
	  | rem (r, a::l) =
	    if a = r then rem(r, l)
	    else a::rem(r, l)
    in
	a::remove_duplicates(rem(a, l))
    end;

fun number_in_months_challenge (dates, months) =
    number_in_months (dates, remove_duplicates(months));

fun dates_in_months_challenge (dates, months) =
    dates_in_months (dates, remove_duplicates(months));

(* Challenge Problem 13 *)
fun reasonable_date (date : (int * int * int)) =
    if #1 date <= 0 then false
    else if #2 date < 1 orelse #2 date > 12 then false
    else if #3 date < 1 then false
    else
	let
	    val days = ["31", "28", "31", "30", "31", "30", "31", "31", "30", "31", "30", "31"]
	    val day_limit = get_nth (days, #2 date)
	    val year = #1 date
	    val month = #2 date
	    val day = #3 date
	    val is_leap = if year mod 400 = 0 then true
			  else if year mod 4 = 0 then true
			  else false
	in
	    if month = 2 andalso is_leap then (day <= 29)
	    else (day <= valOf(Int.fromString(day_limit)))
	end;

