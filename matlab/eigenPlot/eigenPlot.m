% Eingabe: -; Ausgabe: -
% Funktionsaufruf: eigenPlot

function eigenPlot

% Anpassung an Latexfont
set(0,'defaulttextinterpreter','latex');

% Beschriftung des Plots
figure; hold on;
xlabel('Dimension'); ylabel('Ben\"{o}tigte Rechenzeit in Sekunden');

% Initialisierung der x,y-Achsenwerte
xDimension = 1:500;

  % Beginn der Eigenpaarberechnung
  for i=1:3
    for N=1:500  % zehnstufiger Dimensionszuwachs
        [i,N]
      tMatrix = tic; tEigenpairs = tic; % Timerinitialisierung
      A = rand(N);
      endMatrix = toc(tMatrix); % Dauer Matrixinitialisierung
      [X, D] = eig(A);  % Berechnung der Eigenpaare
      endEigenpairs = toc(tEigenpairs);
      yTime(N) = endEigenpairs-endMatrix;  % Dauer Eigenpaarberechnung
    end%for
    plot(xDimension, yTime);  % Erstellung des Diagramms
  end%for
  print -depsc eigLaufzeit3;  % Umwandlung in .eps Datei

end%function
