clear all ;  clc ;close all
load("G1_HCI");load("G2_HCI");load("G3_HCI")

%%
% ranksum( G2_age, G3_age )
% ranksum( G2_mmse, G3_mmse )
% 
% ranksum( G2_vis_p_error, G3_vis_p_error )
% ranksum( G2_inv_p_error, G3_inv_p_error )
% 
% ranksum( G2_vis_v_peak, G3_vis_v_peak )
% ranksum( G2_inv_v_peak, G3_inv_v_peak )

%%
% figure
% hold on
% plot( G1_vis_p_error, G1_vis_v_peak, 'o' )
% plot( G2_vis_p_error, G2_vis_v_peak, '+' )
% plot( G3_vis_p_error, G3_vis_v_peak, '*' )
% 
% figure
% hold on
% plot( G1_inv_p_error, G1_inv_v_peak, 'o' )
% plot( G2_inv_p_error, G2_inv_v_peak, '+' )
% plot( G3_inv_p_error, G3_inv_v_peak, '*' )


%% MMSE HCI
mmse = [ (G1.MMSE)' ; (G2.MMSE)' ; (G3.MMSE)' ] ;
group = [ linspace(1,1,14) linspace(2,2,14) linspace(3,3,9) ] ; 

[~,~,stats1] = anovan(mmse,{group},'varnames',{'G'}) ;
figure
multcompare(stats1) ;
title( 'ANOVA: MMSE score')
xlabel( 'MMSE score')
set( gca, 'fontsize', 18 )

%% long 2d
long_2d_p_error = [ (G1.PTP_2d_long_error *1000)' ; (G2.PTP_2d_long_error *1000)' ; (G3.PTP_2d_long_error *1000)' ] ;
group = [ linspace(1,1,14) linspace(2,2,14) linspace(3,3,9) ] ; 
[~,~,stats2] = anovan(long_2d_p_error,{group},'varnames',{'G'}) ;
figure
multcompare(stats2) ;
title( 'ANOVA: postion error during long 2D PTP')
xlabel( 'postion error (mm)')
xlim([-10 60])
set( gca, 'fontsize', 18 )
% 
% long_2d_v_peak = [(G1.PTP_2d_long_velpeak)' ; (G2.PTP_2d_long_velpeak)' ; (G3.PTP_2d_long_velpeak)' ] ;
% group = [ linspace(1,1,14) linspace(2,2,14) linspace(3,3,7) ] ; 
% [~,~,stats] = anovan(long_2d_v_peak,{group},'varnames',{'G'}) ;
% figure
% results = multcompare(stats) ;
% title( 'ANOVA: Vel peak long 2D PTP')
% xlabel( 'velocity peak (m/s)')
% xlim([0.1 1.1])
% set( gca, 'fontsize', 18 )
% 
% 
long_2d_corrcoef = [(G1.PTP_2d_long_corrcoef)' ; (G2.PTP_2d_long_corrcoef)' ; (G3.PTP_2d_long_corrcoef)' ] ;
group = [ linspace(1,1,14) linspace(2,2,14) linspace(3,3,9) ] ; 
[~,~,stats3] = anovan(long_2d_corrcoef,{group},'varnames',{'G'}) ;
figure
results = multcompare(stats3) ;
title( 'ANOVA: corrcoef long 2D PTP')
xlabel( 'correalation')
xlim([0.8 1.01])
set( gca, 'fontsize', 18 )

%% short 2d
short_2d_p_error = [ (G1.PTP_2d_short_error *1000)' ; (G2.PTP_2d_short_error *1000)' ; (G3.PTP_2d_short_error *1000)' ] ;
group = [ linspace(1,1,14) linspace(2,2,14) linspace(3,3,9) ] ; 

[~,~,stats2] = anovan(short_2d_p_error,{group},'varnames',{'G'}) ;
figure
multcompare(stats2) ;
title( 'ANOVA: postion error during short 2D PTP')
xlabel( 'postion error (mm)')
xlim([-10 60])
set( gca, 'fontsize', 18 )

short_2d_v_peak = [ (G1.PTP_2d_short_velpeak)' ; (G2.PTP_2d_short_velpeak)' ; (G3.PTP_2d_short_velpeak)' ] ;
group = [ linspace(1,1,14) linspace(2,2,14) linspace(3,3,9) ] ; 

[~,~,stats] = anovan(short_2d_v_peak,{group},'varnames',{'G'}) ;
figure
results = multcompare(stats) ;
title( 'ANOVA: Vel peak short 2D PTP')
xlabel( 'velocity peak (m/s)')
xlim([0.1 1.1])
set( gca, 'fontsize', 18 )
% 
short_2d_corrcoef = [ (G1.PTP_2d_short_corrcoef)' ; (G2.PTP_2d_short_corrcoef)' ; (G3.PTP_2d_short_corrcoef)' ] ;
group = [ linspace(1,1,14) linspace(2,2,14) linspace(3,3,9) ] ; 
[~,~,stats3] = anovan(short_2d_corrcoef,{group},'varnames',{'G'}) ;
figure
results = multcompare(stats3) ;
title( 'ANOVA: corrcoef short 2D PTP')
xlabel( 'correalation')
xlim([0.8 1.01])
set( gca, 'fontsize', 18 )


%% long 3d
long_3d_p_error = [ (G1.PTP_3d_long_error *1000)' ; (G2.PTP_3d_long_error *1000)' ; (G3.PTP_3d_long_error *1000)' ] ;
group = [ linspace(1,1,14) linspace(2,2,14) linspace(3,3,9) ] ; 
[~,~,stats2] = anovan(long_3d_p_error,{group},'varnames',{'G'}) ;
figure
multcompare(stats2) ;
title( 'ANOVA: postion error during long 3D PTP')
xlabel( 'postion error (mm)')
xlim([-10 60])
set( gca, 'fontsize', 18 )


% long_3d_v_peak = [ (G1.PTP_3d_long_velpeak)' ; (G2.PTP_3d_long_velpeak)' ; (G3.PTP_3d_long_velpeak)' ] ;
% group = [ linspace(1,1,14) linspace(2,2,14) linspace(3,3,7) ] ; 
% [~,~,stats] = anovan(long_3d_v_peak,{group},'varnames',{'G'}) ;
% figure
% results = multcompare(stats) ;
% xlabel( 'velocity peak (m/s)')
% xlim([0.1 1.1])
% title( 'ANOVA: Vel peak long 3D PTP')
% set( gca, 'fontsize', 18 )
% 
% 
long_3d_corrcoef = [ (G1.PTP_3d_long_corrcoef)' ; (G2.PTP_3d_long_corrcoef)' ; (G3.PTP_3d_long_corrcoef)' ] ;
group = [ linspace(1,1,14) linspace(2,2,14) linspace(3,3,9) ] ; 
[~,~,stats3] = anovan(long_3d_corrcoef,{group},'varnames',{'G'}) ;
figure
results = multcompare(stats3) ;
title( 'ANOVA: corrcoef long 3D PTP')
xlabel( 'correalation')
xlim([0.8 1.01])
set( gca, 'fontsize', 18 )

%% short 3d
short_3d_p_error = [(G1.PTP_3d_short_error *1000)' ; (G2.PTP_3d_short_error *1000)' ; (G3.PTP_3d_short_error *1000)'] ;
group = [ linspace(1,1,14) linspace(2,2,14) linspace(3,3,9) ] ; 

[~,~,stats2] = anovan(short_3d_p_error,{group},'varnames',{'G'}) ;
figure
multcompare(stats2) ;
title( 'ANOVA: postion error during short 3D PTP')
xlabel( 'postion error (mm)')
xlim([-10 60])
set( gca, 'fontsize', 18 )

% short_3d_v_peak = [ (G1.PTP_3d_short_velpeak)' ; (G2.PTP_3d_short_velpeak)' ; (G3.PTP_3d_short_velpeak)' ] ;
% group = [ linspace(1,1,14) linspace(2,2,14) linspace(3,3,7) ] ; 
% 
% [~,~,stats] = anovan(short_3d_v_peak,{group},'varnames',{'G'}) ;
% figure
% results = multcompare(stats) ;
% title( 'ANOVA: Vel peak short 3D PTP')
% xlabel( 'velocity peak (m/s)')
% xlim([0.1 1.1])
% set( gca, 'fontsize', 18 )

short_3d_corrcoef = [ (G1.PTP_3d_short_corrcoef)' ; (G2.PTP_3d_short_corrcoef)' ; (G3.PTP_3d_short_corrcoef)' ] ;
group = [ linspace(1,1,14) linspace(2,2,14) linspace(3,3,9) ] ; 

[~,~,stats3] = anovan(short_3d_corrcoef,{group},'varnames',{'G'}) ;
figure
results = multcompare(stats3) ;
title( 'ANOVA: corrcoef short 3D PTP')
xlabel( 'correalation')
xlim([0.8 1.01])
set( gca, 'fontsize', 18 )

% %% 2d vs 3d error
% diff_2d3d_long = [ (G1.PTP_diff_2d3d_long*1000)' ; (G2.PTP_diff_2d3d_long*1000)' ; (G3.PTP_diff_2d3d_long*1000)' ] ;
% group = [ linspace(1,1,14) linspace(2,2,14) linspace(3,3,7) ] ; 
% 
% [~,~,stats] = anovan(diff_2d3d_long,{group},'varnames',{'G'}) ;
% figure
% multcompare(stats) ;
% title( 'ANOVA: postion error differenc 2D and 3D long PTP');xlabel( 'postion error (mm)')
% set( gca, 'fontsize', 18 )
% 
% diff_2d3d_short = [ (G1.PTP_diff_2d3d_short*1000)' ; (G2.PTP_diff_2d3d_short*1000)' ; (G3.PTP_diff_2d3d_short*1000)' ] ;
% group = [ linspace(1,1,14) linspace(2,2,14) linspace(3,3,7) ] ; 
% 
% [~,~,stats] = anovan(diff_2d3d_short,{group},'varnames',{'G'}) ;
% figure
% multcompare(stats) ;
% title( 'ANOVA: postion error differenc 2D and 3D short PTP')
% xlabel( 'postion error (mm)')
% set( gca, 'fontsize', 18 )
% %------------------------------------------------------------------------------%
% PTP_2d_error = [ (G1.PTP_2d_error*1000)' ; (G2.PTP_2d_error*1000)' ; (G3.PTP_2d_error*1000)' ] ;
% group = [ linspace(1,1,14) linspace(2,2,14) linspace(3,3,7) ] ; 
% 
% [~,~,stats] = anovan(PTP_2d_error,{group},'varnames',{'G'}) ;
% figure
% multcompare(stats) ;
% title( 'ANOVA: postion error during 2D PTP')
% xlabel( 'postion error (mm)')
% set( gca, 'fontsize', 18 )
% 
% PTP_3d_error = [ (G1.PTP_3d_error*1000)' ; (G2.PTP_3d_error*1000)' ; (G3.PTP_3d_error*1000)' ] ;
% group = [ linspace(1,1,14) linspace(2,2,14) linspace(3,3,7) ] ; 
% 
% [~,~,stats] = anovan(PTP_3d_error,{group},'varnames',{'G'}) ;
% figure
% multcompare(stats) ;
% title( 'ANOVA: postion error during 3D PTP')
% xlabel( 'postion error (mm)')
% set( gca, 'fontsize', 18 )