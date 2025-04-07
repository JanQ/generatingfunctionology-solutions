% visualization of domain of summation for exercise 4.6
clearvars; close all; clc;
figure;
set(gcf, 'color', 'white');
hold on;
%grid on;
for m=0:20
    for r=m:20
        scatter(m, r, 'filled', 'k')
    end
end
set(gca, 'TickLabelInterpreter', 'latex', 'fontsize', 13)
xlabel('$m$', 'interpreter', 'latex', 'fontsize', 15);
ylabel('$r$', 'Interpreter', 'latex', 'fontsize', 15);
exportgraphics(gcf, 'ex4_6.pdf')