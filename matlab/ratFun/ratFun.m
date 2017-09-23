set(0,'defaulttextinterpreter','latex');

% erzeuge Filterfunktionen
r4 = rkfun('step',4);
r5 = rkfun('step',5);
r6 = rkfun('step',6);

% erzeuge Plot
figure; hold on;
ezplot(r4); ezplot(r5); ezplot(r6);
plot([-1, 1], [1,1], 'k--');
legend('r4','r5','r6');