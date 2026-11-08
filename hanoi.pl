% Tower of Hanoi visualizer - SWI-Prolog backend
% Run: swipl -q -s hanoi.pl
% Then open http://localhost:8000

:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_parameters)).
:- use_module(library(http/http_json)).
:- use_module(library(http/http_files)).

:- http_handler(root(.), serve_index, []).
:- http_handler(root(moves), moves_handler, []).

main :-
    http_server(http_dispatch, [port(8000)]),
    format('~nTower of Hanoi is running at http://localhost:8000~n'),
    format('Press Ctrl+C to stop the server.~n'),
    thread_get_message(_).

serve_index(_Request) :-
    http_reply_file(
        'C:/Users/user/Downloads/tower_of_hanoi_visual (1)/tower_of_hanoi_visual/index.html',
        [unsafe(true)],
        []
    ).

moves_handler(Request) :-
    http_parameters(Request, [n(N, [integer, between(1, 8)])]),
    hanoi_moves(N, a, c, b, Moves),
    length(Moves, Total),
    reply_json_dict(_{disks: N, total_moves: Total, moves: Moves}).

% hanoi_moves(+N, +Source, +Destination, +Auxiliary, -Moves)
hanoi_moves(1, Source, Destination, _Auxiliary,
            [_{disk: 1, from: Source, to: Destination}]) :- !.
hanoi_moves(N, Source, Destination, Auxiliary, Moves) :-
    N > 1,
    N1 is N - 1,
    hanoi_moves(N1, Source, Auxiliary, Destination, First),
    hanoi_moves(N1, Auxiliary, Destination, Source, Last),
    append(First,
           [_{disk: N, from: Source, to: Destination}|Last],
           Moves).

:- initialization(main, main).
