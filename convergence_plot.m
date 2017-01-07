function convergence_plot()

load('f_sd.mat');
load('f_cg.mat')
load('f_dfp.mat')
load('f_bfgs.mat')

figure
plot(f_k_sd,'-r*'); hold on;
plot(f_k_cg,'--ko'); hold on;
plot(f_k_dfp,'-bs'); hold on;
plot(f_k_bfgs,'--gd'); hold on;
hold off;
xlabel('Iterations');
ylabel('Cost')
legend('Steepest Descent','Conjugate Gradient', 'DFP', 'BFGS');

saveas(gcf,'convergence_plot.png')
end