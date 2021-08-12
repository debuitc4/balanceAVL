% the empty binary tree
bt(nil, nil, nil).

/*  bt(N,T1,T2) that is true if N is the root of a binary tree with left subtree 
    T1 and right subtree T2, where all the items in T1 are less than or equal to N 
    and all the items in T2 are greater than N.
*/

bt(N,T1,T2) :-  T1 =< N, T2 > N, bt(T1, _, _), bt(T2, _,_). 



addnode(nil, X, bst(nil, X, nil)).
addnode(bst(L, Y, R), X, bst(L1, Y, R)) :- X =< Y, addnode(L,X,L1).
addnode(bst(L, Y, R),X, bst(L, Y, R1)) :- addnode(R, X, R1).

% insert(I,T1,T2) is true if T2 is the AVL tree 
% resulting from I being inserted into an AVL tree T1.
insert(I,T1,T2) :- addnode(T1,I,_), T1 is T2.

% printElem
printElem(K, D):-D>0, !, D1 is D-1, write('\t'), printElem(K, D1).
printElem(K, _):-write(K), nl.

% printTree
printTree(nil, _).
printTree(bt(Root,L,R), X) :- Xs is X+1, printTree(L, D1), printElem(Root, X),
    printTree(R, D1).

% display(T) is always true prints the AVL tree to the display.
display(T) :- printTree(T,_).