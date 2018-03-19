projekt :-
    wstep,
    zresetuj_odp,
    znajdz_trunek(Trunek),
    opisz(Trunek),nl.

wstep :-
write('Jaki masz nastroj ?'), nl,
  write('Aby odpowiedziec wybierz liczbe'), nl, nl.

znajdz_trunek(Trunek):-
    trunek(Trunek),!.

:-dynamic(progress/2).

zresetuj_odp :- retract(progress(_,_)),
    fail.
zresetuj_odp.

trunek(wodka) :-
    dlaczego(zly_nastroj),
    z_kim(kolegami).
trunek(wino):-
    dlaczego(zly_nastroj),
    z_kim(dziewczyna).
trunek(bimber) :-
    dlaczego(zly_nastroj),

z_kim(rodzina).
trunek(whisky) :-
    dlaczego(sredni_nastroj),
    gdzie(bar).
trunek(piwo) :-
    dlaczego(sredni_nastroj),
    gdzie(plener).
trunek(whisky) :-
    dlaczego(sredni_nastroj),
    gdzie(dom).
trunek(piwo) :-
    dlaczego(dobry_nastroj),
    gdzie(plener),
z_kim(kolegami).

trunek(wino):-
    dlaczego(dobry_nastroj),
    gdzie(dom),
    z_kim(dziewczyna).
trunek(wino):-
    dlaczego(dobry_nastroj),
    gdzie(plener),
    z_kim(dziewczyna).
trunek(whisky) :-
    dlaczego(dobry_nastroj),
    gdzie(bar).
trunek(wodka):-
    dlaczego(dobry_nastroj),
       gdzie(dom),
       z_kim(kolegami).
trunek(bimber):-
    dlaczego(dobry_nastroj),
    gdzie(dom),
    z_kim(rodzina).
trunek(soczek):-
   dlaczego(dobry_nastroj),
   gdzie(plener),
   z_kim(rodzina).
pytania(dlaczego):-
    write('Jaki masz nastroj?'),nl.
pytania(gdzie):-
    write('Gdzie chcesz sie napic?'),nl.
pytania(z_kim):-
    write('Z kim chcesz sie napic'),nl.

odpowiedz(zly_nastroj):-
    write('mam zly nastroj').
odpowiedz(sredni_nastroj) :-
    write('mam sredni nastroj').
odpowiedz(dobry_nastroj):-
    write('mam dobry nastroj').
odpowiedz(plener):-
    write('w plenerze').
odpowiedz(dom):-
    write('w domu').
odpowiedz(bar):-
    write('w barze').
odpowiedz(dziewczyna):-
    write('z dziewczyna').
odpowiedz(kolegami):-
    write('z kolegami').
odpowiedz(rodzina):-
    write('z rodzina').
opisz(wodka):-
    write('Wodka'),nl,
    write('Wysoko procentowa, czysta substancja, POLSKA NAJLEPSZA'),nl.
opisz(bimber) :-
    write('Bimber'),nl,
    write('Najmocniejszy alkohol,uuuu bedzie kac'),nl.

opisz(soczek) :-
    write('Soczek'),nl,
    write('Napoj bezalkoholowy'),nl.
opisz(whisky) :-
    write('Whisky'),nl,
    write('Wysoko procentowowy alkohol z dobrym aromatem'),nl.
opisz(piwo) :-
    write('Piwo'),nl,
    write('Nisko procentowa substancja'),nl,
    write('Idealna na sloneczne dni'),nl.

opisz(wino):-
    write('Wino'),nl,
    write('Delikatny alkohol'),nl,
    write('Najlepiej pic  z dziewczyna'),nl.

opisz(plener):-
    write('Na podworku'),nl.
opisz(dom):-
    write('W zaciszu domowym'),nl.

opisz(dziewczyna):-
    write('z dziewczyna'),nl.
opisz(rodzina):-
    write('z rodzina'),nl.
opisz(kolegami):-
    write('z kolegami'),nl.
dlaczego(Odpowiedz) :-
    progress(dlaczego,Odpowiedz).
dlaczego(Odpowiedz):-
    \+ progress(dlaczego,_),
    pytaj(dlaczego,Odpowiedz,[zly_nastroj,sredni_nastroj,dobry_nastroj]).
gdzie(Odpowiedz):-
    progress(gdzie,Odpowiedz).
gdzie(Odpowiedz):-
    \+ progress(gdzie,_),
    pytaj(gdzie,Odpowiedz,[plener,bar,dom]).
z_kim(Odpowiedz):-
    progress(z_kim,Odpowiedz).
z_kim(Odpowiedz) :-
      \+ progress(z_kim,_),
      pytaj(z_kim,Odpowiedz,[kolegami,dziewczyna,rodzina]).

odpowiedz([],_).
odpowiedz([Head|Tail],Index) :-
    write(Index),write(' '),odpowiedz(Head),nl,
    NextIndex is Index + 1,
    odpowiedz(Tail,NextIndex).

parse(0,[Head|_],Head).
parse(Index,[Head|Tail],Response) :-
    Index > 0,
    NextIndex is Index - 1,
    parse(NextIndex,Tail,Response).

pytaj(Pytanie,Odpowiedz,Wybor):-
    pytania(Pytanie),
    odpowiedz(Wybor,0),
    read(Index),
    parse(Index,Wybor,Response),
    asserta(progress(Pytanie,Response)),
    Response = Odpowiedz.












