% Eingabe: -; Ausgabe: -
% Funktionsaufruf: ritzPairAngle

function ritzPairAngle

% Anpassung an Latexfont
set(0,'defaulttextinterpreter','latex');

% Beschriftung des Plots
figure; hold on;
xlabel('Dimension der untersuchten Matrix');
ylabel({'Winkel in Bogenma{\ss}'});

% Initialisierung der x-Achse
xDimension = 10:10:500;

  % Beginn der Eigenpaarberechnung
  for i = 1:3
    for N = 10:10:500  % zehnstufiger Dimensionszuwachs
      %clearvars -except i N xDimension yMaxDist 
      [i, N]
      A = rand(N); A = A'*A; % Erzeuge symmetrische Matrix
      [X,D] = eig(A);
      S = rand(N, 2); % Suchraum der Dimension 5
      
      % Rayleigh-Ritz Verfahren
      S = orth(S);  % Orthogonalisierung der Basisvektoren
      A2 = S'*A*S; % Verringerung der Dimension
      [X2, D2] = eig(A2); X2 = S*X2; % Berechnung der Ritz-Paare
      
      % Berechnung des minimalen Winkels
      p = 1:N; P = nchoosek(p,2);
      for k = 1:length(P) % = #Zeilen von P, wegen N >= 10
          Theta(k) = subspace(X2, X(:,P(k,:)));
      end
      yTheta(N/10) = min(Theta);
    end%for
    plot(xDimension, yTheta);  % Erstellung des Diagramms
  end%for
  print -depsc ritzPairAngle;  % Umwandlung in .eps Datei

end%function