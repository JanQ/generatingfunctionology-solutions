% visualization of domain of summation for exercise 17
clearvars; close all; clc;
n = 5;
figure;
set(gcf, 'color', 'white');
hold on;
%grid on;
for k = 0:20
    for l = max(0, k-n+1):k
        scatter(k, l, 'filled', 'k')
    end
end
set(gca, 'TickLabelInterpreter', 'latex', 'fontsize', 13)
xlabel('$k$', 'interpreter', 'latex', 'fontsize', 15);
ylabel('$l$', 'Interpreter', 'latex', 'fontsize', 15);
exportgraphics(gcf, 'ex1_17.pdf')