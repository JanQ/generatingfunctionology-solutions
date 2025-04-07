% visualization of domain of summation for exercise 2.17d
clearvars; close all; clc;
figure;
set(gcf, 'color', 'white');
hold on;
%grid on;
for k = 0:20
    for i = 0:k
        scatter(k, i, 'filled', 'k')
    end
end
set(gca, 'TickLabelInterpreter', 'latex', 'fontsize', 13)
xlabel('$k$', 'interpreter', 'latex', 'fontsize', 15);
ylabel('$i$', 'Interpreter', 'latex', 'fontsize', 15);
exportgraphics(gcf, 'ex2_17.pdf')