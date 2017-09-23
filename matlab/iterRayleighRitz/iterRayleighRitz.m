% Eingabe: -; Ausgabe: -
% Funktionsaufruf: iterRayleighRitz

function iterRayleighRitz

% Anpassung an Latexfont
set(0,'defaulttextinterpreter','latex');

% Beschriftung des Plots
figure; hold on; xIteration = 1:50;
xlabel('Iteration'); ylabel('Winkel in Bogenma{\ss}');

%for i=1:3
A = rand(500); A=A'*A; [X, D] = eig(A);
Y1 = rand(500,2); 
k1 = 1;
    
for j=1:100
    
    % Rayleigh-Ritz Prozedur
    S1 = A^k1*Y1; S1 = orth(S1);
    A1 = S1'*A*S1;
    [X1, D1] = eig(A1); Y1 = S1*X1;
        
    % Berechnung des Winkels
    p = 1:500; P = nchoosek(p,2);
    for k = 1:length(P) % = #Zeilen von P
        Theta(k) = subspace(Y1, X(:,P(k,:)));
    end
    yTheta(j) = min(Theta);
end%for
plot(xIteration, yTheta);

%print -depsc iterRitzAngle;

end%function