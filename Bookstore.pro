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
    nondeterm maximum_book_price(i)
    nondeterm minimum_book_price(i)
    nondeterm listy(sl,sl,sl,il)
    nondeterm listyprices(sl,il)
    nondeterm list_of_books
    nondeterm list_prices_of_the_books

clauses
    bname([book1,book2,book3,book4,book5]).
    bsubject([subject1,subject2,subject1,subject3,subject2]).
    bpublisher([publisher1,publisher2,publisher2,publisher3,publisher1]).
    bprice([10,30,20,50,40]).

    minimum_book_price(Min):-
        bprice(X),minlist(X, Min).
    min(X,Y,Y):-Y<=X.
    min(X,Y,X):-Y>X.
    minlist([X],X).
    minlist([H|T],MIN):-
        minlist(T,TMIN),min(H,TMIN,MIN).

    maximum_book_price(Max):-
        bprice(X),maxlist(X, Max).
    max(X,Y,Y):-Y>=X.
    max(X,Y,X):-Y<X.
    maxlist([X],X).
    maxlist([H|T],MAX):-
        maxlist(T,TMAX),max(H,TMAX,MAX).

    list_of_books:-bname(X),bsubject(X1),bpublisher(X2),bprice(X3),listy(X,X1,X2,X3).
    listy([],[],[],[]).
    listy([H|T],[H1|T1],[H2|T2],[H3|T3]):-
        write("Book : "),write(H),nl,write("Subject : "),write(H1),nl
        ,write("Publisher : "),write(H2),nl,write("Price : "),write(H3),nl
        ,nl,listy(T,T1,T2,T3).

    list_prices_of_the_books:-
        bname(X),bprice(X1),listyprices(X,X1).
    listyprices([],[]).
    listyprices([H|T],[H1|T1]):-
        write("Book : "),write(H),nl,write("Prices : "),write(H1),nl
        ,nl,listyprices(T,T1).

goal
    %minimum_book_price(MIN).
    %maximum_book_price(MAX).
    list_of_books.
    %list_prices_of_the_books.
