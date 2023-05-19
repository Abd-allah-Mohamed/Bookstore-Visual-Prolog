domains
    s = symbol.
    ss = symbol*.
    i = integer.

predicates
    book(s, s, s, i).
    min_price(i).
    max_price(i).
    books_same_subject(s, ss).
    books_same_publisher(s, ss).
    all_books(ss).
    book_prices(ss).
    min_value(ss, i).
    max_value(ss, i).

clauses
    book("Book1", "Subject1", "Publisher1", 20).
    book("Book2", "Subject2", "Publisher2", 25).
    book("Book3", "Subject1", "Publisher3", 15).
    book("Book4", "Subject3", "Publisher1", 30).
    book("Book5", "Subject2", "Publisher2", 18).

min_price(Price) :-
    findall(PriceTemp, book(_, _, _, PriceTemp), Prices),
    min_value(Prices, MinPrice),
    Price = MinPrice.

max_price(Price) :-
    findall(PriceTemp, book(_, _, _, PriceTemp), Prices),
    max_value(Prices, MaxPrice),
    Price = MaxPrice.

books_same_subject(Subject, Books) :-
    findall(Book, book(Book, Subject, _, _), Books).

books_same_publisher(Publisher, Books) :-
    findall(Book, book(Book, _, Publisher, _), Books).

all_books(Books) :-
    findall(Book, book(Book, _, _, _), Books).

book_prices(Prices) :-
    findall(Price, book(_, _, _, Price), Prices).

min_value([X], X).
min_value([X, Y | T], Min) :-
    X =< Y,
    min_value([X | T], Min).

min_value([X, Y | T], Min) :-
    X > Y,
    min_value([Y | T], Min).

max_value([X], X).
max_value([X, Y | T], Max) :-
    X >= Y,
    max_value([X | T], Max).

max_value([X, Y | T], Max) :-
    X < Y,
    max_value([Y | T], Max).

goal
    min_price(Price).