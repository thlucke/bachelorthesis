A = rand(5); S = rand(5,3);

[X,D] = eig(A);
S = orth(S);
A2=S'*A*S;
[X2,D2] = eig(A2);
X2=S*X2;
dist=1:5;
minDist=1:3;

for i=1:3
    for j=1:5
        dist(j) = acos(abs(X2(:,i)'*X(:,j)) / (norm(X2(:,i))*norm(X(:,j))))
    end
    tmpMinDist(i) = min(dist);
end

minDist=min(tmpMinDist)
x = [5];
plot(x, minDist);