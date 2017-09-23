% Eingabe: -; Ausgabe: -
% Funktionsaufruf: rayleighRitz

function rayleighRitz

% Anpassung an Latexfont
set(0,'defaulttextinterpreter','latex');

% Beschriftung des Plots
figure; hold on;
xlabel('Dimension $N$ der untersuchten Matrix');
ylabel({'Ben\"{o}tigte Rechenzeit in Sekunden'; ...
  'f\"{u}r $N/5$-dimensionalen Suchraum'});

% Initialisierung der x,y-Achsenwerte
xDimension = 10:10:1500; yTime = 10:10:1500;

  % Beginn der Eigenpaarberechnung
  for i=1:3
    for N=10:10:1500  % zehnstufiger Dimensionszuwachs
      tMatrix = tic; tRitzpairs = tic; % Timerinitialisierung
      A = rand(N);
      S = rand(N, N/5); % Suchraum der Dimension N/5
      endMatrix = toc(tMatrix); % Dauer Matrixinitialisierung

      % Rayleigh-Ritz Verfahren
      S = orth(S);  % Orthogonalisierung der Basisvektoren
      A = S'*A*S; % Verringerung der Dimension
      [X, D] = eig(A); S*X; % Berechnung der Ritz-Paare
      endRitzpairs = toc(tRitzpairs);
      yTime(N/10) = endRitzpairs-endMatrix;  % Dauer Eigenpaarberechnung
    end%for
    plot(xDimension, yTime);  % Erstellung des Diagramms
  end%for
  print -depsc rayleighRitzLaufzeit2;  % Umwandlung in .eps Datei

end%function