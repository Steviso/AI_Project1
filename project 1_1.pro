%root(a).
parent(a,b). parent(a,c). parent(a,d). 
parent(b,e). parent(b,f). parent(c,g). parent(c,h). parent(c,i). parent(d,j).
parent(e,k). parent(e,l). parent(f,m). parent(g,n). parent(h,o). parent(h,p). parent(i,q). parent(j,r). parent(j,s).
parent(n,t). parent(n,u). parent(o,v). parent(p,w). parent(p,x). 
parent(v,y). parent(v,z). 

% a.Define a predicate connect/2 to list the relation between two characters.

connect(X,Y):- parent(X,Y);parent(Y,X).

% b.Define a rule called path/1 to find the path from root to the destination.

path_node(a).
path_node(Node):-
	parent(Father,Node),
	path_node(Father),
	write(Father),
	write(' --> ').
path(Node):-
	path_node(Node),
	write(Node),
	nl.

% c.Define a rule called path/2 to find all paths from a node to another node that visit a specified number of nodes.

path(X,Step):-path(X,Step,X,'').
path(X,Step,Last,Str):- 
	Step>1 ->                          % if 
		connect(X,Y),
		Step2 is Step -1,
		Y\=Last,		
		atom_concat(X,' --> ',S),  % S=X -->
		atom_concat(Str,S,Str2),    % Str2=Str S		
		path(Y,Step2,X,Str2),
		fail
	;write(Str),write(X),nl.
