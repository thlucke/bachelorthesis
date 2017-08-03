% Algorithmus 1: Rayleigh
function[X,lambda] = rayleighRitz(A,B,U);

% ONB von U
U = orth(U);

% transform problem
A = U'*A*U; B = U'*B*U;

% solve reduced problem
[L,Y] = eig(A,B);

% compute ritz pairs
X = U*Y;
lambda = diag(L);