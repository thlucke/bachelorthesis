% Eingabe: -; % Ausgabe: -
% Funktionsaufruf: feast

function feast

% Initialisierungen
n = 500; iter = 10; lmin = 1; lmax = 2.5;

% Initialisierung des Plots
set(0,'defaulttextinterpreter','latex');
figure; hold on;
xlabel('Durchgef\"{u}hrte Iterationen');
ylabel('Winkel $\theta_{\min}(\mathcal{X},\mathcal{R})$');

% Erzeuge und transformiere die Filterfunktionen r auf
% das Intervall [lmin,lmax].
x = rkfun(); t = 2/(lmax-lmin)*x - (lmin+lmax)/(lmax-lmin);
s = rkfun('step', 5); r = s(t);

for j=1:3
    % Erzeuge HPD-Eigenwertproblem und skaliere die Matrizen
    A = 10*rand(n); A=A'*A - 1;
    B = 20*rand(n); B=B'*B;
    
    % Berechne Eigenpaare auf ]lmin,lmax[ mit eig(A,B) als Referenz
    [X, D] = eig(A,B);
    
    for i=1:n
        if lmin < D(i,i) < lmax 
           eigVecInterval(:,i) = X(:,i);
           eigValInterval(i) = D(i,i);
        end%if
    end%for

    Yk = rand(n, length(eigValInterval));
    xAxis = 1:iter; M = B\A;

    for k=1:iter
        % Beschleunnigtes Rayleigh-Ritz Verfahren
        Pk = r(M, Yk); % Approximierung des Projektors
        Ak = Pk'*A*Pk; Bk = Pk'*B*Pk;
        [Xk, Dk] = eig(Ak, Bk);
        Yk = Pk*Xk;
        % Berechnung des Unterraumwinkels
        theta(k) = subspace(Yk, eigVecInterval);
    end%for
    semilogy(xAxis, theta);
end%for
end%function