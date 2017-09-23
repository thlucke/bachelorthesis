% Eingabe: -; Ausgabe: -
% Funktionsaufruf: rayleighRitz

function rayleighRitz

% Anpassung an Latexfont
set(0,'defaulttextinterpreter','latex');

% Beschriftung des Plots
figure; hold on;
xlabel('Dimension');
ylabel({'Winkel in Bogenma{\ss}'});

% Initialisierung der x-Achse
xDimension = 10:10:500;

  % Beginn der Eigenpaarberechnung
  for i=1:3
    for N=10:10:500  % zehnstufiger Dimensionszuwachs
      clearvars -except i N xDimension yMaxDist 
      [i, N]
      A = rand(N); [X,D] = eig(A);
      S = rand(N, N/5); % Suchraum der Dimension N/5
      
      % Rayleigh-Ritz Verfahren
      S = orth(S);  % Orthogonalisierung der Basisvektoren
      A2 = S'*A*S; % Verringerung der Dimension
      [X2, D2] = eig(A2); X2 = S*X2; % Berechnung der Ritz-Paare
      
      % Berechnung des Winkels
      for k=1:(N/5)
          for j=1:N
              dist(j) = acos(abs(X2(:,k)'*X(:,j)) / ...
                  (norm(X2(:,k))*norm(X(:,j))));
          end%for
          tmpMaxDist(k) = max(dist);
      end%for
      yMaxDist(N/10) = min(tmpMaxDist);      
    end%for
    plot(xDimension, yMaxDist);  % Erstellung des Diagramms
  end%for
  print -depsc ritzPairDistance;  % Umwandlung in .eps Datei

end%function