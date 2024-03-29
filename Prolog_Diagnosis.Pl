% Medical Diagnosis Expert System in PROLOG
% To run, type go.

go:- hypothesize(Disease),
write('I think the patient has: '),
write(Disease),
nl,
undo.
% Medical Diagnosis Expert System in PROLOG
% To run, type go.

go:- hypothesize(Disease),
write('I think the patient has: '),
write(Disease),
nl,
undo.

/* Hypothesis to be tested */
hypothesize(covid):- covid, !.
hypothesize(cold):- cold, !.
hypothesize(malaria):- malaria, !.
hypothesize(unknown).
/* Disease identification rules */
malaria :-
	verify(fever),
	verify(sweating),
	verify(headache),
	verify(nausea),
	verify(vomiting),
	verify(diarrhea),
	write('Advices and Sugestions:'),
	nl,
	write('Take one of the following medicines: '),
	nl,
	write('Chloroquin, Mefloquin or Atovaquon'),
	nl,
	write('Stay hydrated'),
	nl,
	write('Please do not sleep in open air and cover your full skin.'),
	nl.
cold :-
	verify(headache),
	verify(runny_nose),
	verify(sneezing), 
	verify(sore_throat),
	write('Advices and Sugestions: '),
	nl,
	write('Nasal spray'),
	nl,
	write('Warm herbal tea'),
	nl,    
	write('Rest'),
	nl,
	write('Stay hydrated'),
	nl,
	write('Over-the-counter cold and cought medications'),
	nl.
covid :-
	verify(fever),
	verify(dry_cough),
	verify(shortness_of_breath),
	write('Advices and Sugestions: '),
	nl,
	write('Quarantine for two weeks'),
	nl,	
	write('Prevent dehydrations'),
	nl,	
	write('Monitor your Symptoms'),
	nl,
	write('Treat weak symptoms with over-the-counter cold and cought medications'),
	nl,	
	write('If the symptoms get worse, call your doctor right away'),
	nl.	
ask(Question) :-
	write('Does the patient have the following symptom:'),
	write(Question),
	write('?'),
	read(Response),
	nl,
	(   (   Response == yes ; Response == y)
	-> assert(yes(Question));
	assert(no(Question)), fail).	
:- dynamic yes/1, no/1.
/* How to verify something */
verify(S) :- (yes(S) -> true ; (no(S) -> fail; ask(S))). 
/* Undo all yes/no assertations */
undo :- retract(yes(_)),fail.
undo :- retract(no(_)),fail.
undo. 