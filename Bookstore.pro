domains
s = symbol
sl = symbol*
i = integer
il = integer*

predicates
nondeterm bname(sl)
nondeterm bsubject(sl)
nondeterm bpublisher(sl)
nondeterm bprice(il)
nondeterm max(i,i,i)
nondeterm min(i,i,i)
nondeterm maxlist(il,i)
nondeterm minlist(il,i)
nondeterm findmax(i)
nondeterm findmin(i)

clauses
bname([book1,book2,book3,book4,book5]).
bsubject([subject1,subject2,subject1,subject3,subject2]).
bpublisher([publisher1,publisher2,publisher2,publisher3,publisher1]).
bprice([10,30,20,50,40]).

findmax(Max):-bprice(X),maxlist(X, Max).
max(X,Y,Y):-Y>=X.
max(X,Y,X):-Y<X.
maxlist([X],X).
maxlist([H|T],MAX):-maxlist(T,TMAX),max(H,TMAX,MAX).

findmin(Min):-bprice(X),minlist(X, Min).
min(X,Y,Y):-Y<=X.
min(X,Y,X):-Y>X.
minlist([X],X).
minlist([H|T],MIN):-minlist(T,TMIN),min(H,TMIN,MIN).

goal
findmin(MIN).
