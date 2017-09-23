% open Lena image and convert from uint8 to double
cat = double(imread('Ccat.jpg'));

% perform SVD on Lena
[U,S,V] = svd(cat);

% extract singular values
singvals = diag(S);


% find out where to truncate the U, S, V matrices
%indices = find(singvals >= singvals(300));
indices = [1 5 10];


% reduce SVD matrices
U_red = U(:,indices);
S_red = S(indices,indices);
V_red = V(:,indices);

% construct low-rank approximation of Lena
Cat_red = U_red * S_red * V_red';

% print results to command window
r = num2str(length(indices));
m = num2str(length(singvals));
disp(['Low-rank approximation used ',r,' of ',m,' singular values']);

% save reduced Lena
imwrite(uint8(Cat_red),'Cat1-5-10.jpg');