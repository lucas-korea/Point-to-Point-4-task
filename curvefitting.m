clear all
MMSE = [];
% ++TT_Position_error = [];
% ++TT_Velocity_error = [];
PTP_2d_long_velpeak = [];
PTP_2d_short_velpeak = [];
PTP_3d_long_velpeak = [];
PTP_3d_short_velpeak = [];


PTP_2d_long_error = [];
PTP_2d_short_error = [];
PTP_3d_long_error = [];
PTP_3d_short_error = [];
PTP_diff_2d3d_long = [];
PTP_diff_2d3d_short =[];

PTP_2d_long_corrcoef = [];
PTP_2d_short_corrcoef = [];
PTP_3d_long_corrcoef = [];
PTP_3d_short_corrcoef = [];



for i = 1 : 37 %% HCI용 피실험자 37인
    curve_data = load("HCI_"+ i +"th_afterprocessing");
    
    MMSE(i) = curve_data.MMSE;
% ++    TT_Position_error(i) = curve_data.avg_PositionError;
% ++   TT_Velocity_error(i) = curve_data.avg_VelocityError;

    PTP_2d_long_velpeak(i) = curve_data.avg_2d_long_velpeak;
    PTP_2d_short_velpeak(i) = curve_data.avg_2d_short_velpeak;
    PTP_3d_long_velpeak(i) = curve_data.avg_3d_long_velpeak;
    PTP_3d_short_velpeak(i) = curve_data.avg_3d_short_velpeak;

    PTP_2d_long_error(i) = curve_data.avg_2d_long_error;
    PTP_2d_short_error(i) = curve_data.avg_2d_short_error;
    PTP_3d_long_error(i) = curve_data.avg_3d_long_error;
    PTP_3d_short_error(i) = curve_data.avg_3d_short_error;
    PTP_2d_error(i) = sum(curve_data.error_2d);
    PTP_3d_error(i) = sum(curve_data.error_3d);
    PTP_diff_2d3d_long(i) = curve_data.error_error_between2d3d_long;
    PTP_diff_2d3d_short(i) = curve_data.error_error_between2d3d_short;
    
    PTP_2d_long_corrcoef(i) = curve_data.avg_2d_long_corrcoef;
    PTP_2d_short_corrcoef(i) = curve_data.avg_2d_short_corrcoef;
    PTP_3d_long_corrcoef(i) = curve_data.avg_3d_long_corrcoef;
    PTP_3d_short_corrcoef(i) = curve_data.avg_3d_short_corrcoef;

end

%% for anova
G1_num = 0;
G2_num = 0;
G3_num = 0;
for k = 1 : 37
   if k == 1 || (k >= 20 && k <= 32) 
       G1_num = G1_num +1;
       G1.MMSE(G1_num) = MMSE(k);
       G1.PTP_2d_long_corrcoef(G1_num) = PTP_2d_long_corrcoef(k);
       G1.PTP_2d_long_error(G1_num) = PTP_2d_long_error(k);
       G1.PTP_2d_long_velpeak(G1_num) = PTP_2d_long_velpeak(k);
       G1.PTP_2d_short_corrcoef(G1_num) = PTP_2d_short_corrcoef(k);
       G1.PTP_2d_short_error(G1_num) = PTP_2d_short_error(k);
       G1.PTP_2d_short_velpeak(G1_num) = PTP_2d_short_velpeak(k);
       G1.PTP_3d_long_corrcoef(G1_num) = PTP_3d_long_corrcoef(k);
       G1.PTP_3d_long_error(G1_num) = PTP_3d_long_error(k);
       G1.PTP_3d_long_velpeak(G1_num) = PTP_3d_long_velpeak(k);
       G1.PTP_3d_short_corrcoef(G1_num) = PTP_3d_short_corrcoef(k);
       G1.PTP_3d_short_error(G1_num) = PTP_3d_short_error(k);
       G1.PTP_3d_short_velpeak(G1_num) = PTP_3d_short_velpeak(k);
       G1.PTP_diff_2d3d_long(G1_num) = PTP_diff_2d3d_long(k);
       G1.PTP_diff_2d3d_short(G1_num) = PTP_diff_2d3d_short(k);
       G1.PTP_2d_error(G1_num) = PTP_2d_error(k);
       G1.PTP_3d_error(G1_num) = PTP_3d_error(k);
   elseif MMSE(k) > 24
       G2_num = G2_num +1;
       G2.MMSE(G2_num) = MMSE(k);
       G2.PTP_2d_long_corrcoef(G2_num) = PTP_2d_long_corrcoef(k);
       G2.PTP_2d_long_error(G2_num) = PTP_2d_long_error(k);
       G2.PTP_2d_long_velpeak(G2_num) = PTP_2d_long_velpeak(k);
       G2.PTP_2d_short_corrcoef(G2_num) = PTP_2d_short_corrcoef(k);
       G2.PTP_2d_short_error(G2_num) = PTP_2d_short_error(k);
       G2.PTP_2d_short_velpeak(G2_num) = PTP_2d_short_velpeak(k);
       G2.PTP_3d_long_corrcoef(G2_num) = PTP_3d_long_corrcoef(k);
       G2.PTP_3d_long_error(G2_num) = PTP_3d_long_error(k);
       G2.PTP_3d_long_velpeak(G2_num) = PTP_3d_long_velpeak(k);
       G2.PTP_3d_short_corrcoef(G2_num) = PTP_3d_short_corrcoef(k);
       G2.PTP_3d_short_error(G2_num) = PTP_3d_short_error(k);
       G2.PTP_3d_short_velpeak(G2_num) = PTP_3d_short_velpeak(k);
       G2.PTP_diff_2d3d_long(G2_num) = PTP_diff_2d3d_long(k);
       G2.PTP_diff_2d3d_short(G2_num) = PTP_diff_2d3d_short(k);
       G2.PTP_2d_error(G2_num) = PTP_2d_error(k);
       G2.PTP_3d_error(G2_num) = PTP_3d_error(k);
   else
       G3_num = G3_num +1;
       G3.MMSE(G3_num) = MMSE(k);
       G3.PTP_2d_long_corrcoef(G3_num) = PTP_2d_long_corrcoef(k);
       G3.PTP_2d_long_error(G3_num) = PTP_2d_long_error(k);
       G3.PTP_2d_long_velpeak(G3_num) = PTP_2d_long_velpeak(k);
       G3.PTP_2d_short_corrcoef(G3_num) = PTP_2d_short_corrcoef(k);
       G3.PTP_2d_short_error(G3_num) = PTP_2d_short_error(k);
       G3.PTP_2d_short_velpeak(G3_num) = PTP_2d_short_velpeak(k);
       G3.PTP_3d_long_corrcoef(G3_num) = PTP_3d_long_corrcoef(k);
       G3.PTP_3d_long_error(G3_num) = PTP_3d_long_error(k);
       G3.PTP_3d_long_velpeak(G3_num) = PTP_3d_long_velpeak(k);
       G3.PTP_3d_short_corrcoef(G3_num) = PTP_3d_short_corrcoef(k);
       G3.PTP_3d_short_error(G3_num) = PTP_3d_short_error(k);
       G3.PTP_3d_short_velpeak(G3_num) = PTP_3d_short_velpeak(k);
       G3.PTP_diff_2d3d_long(G3_num) = PTP_diff_2d3d_long(k);
       G3.PTP_diff_2d3d_short(G3_num) = PTP_diff_2d3d_short(k);  
       G3.PTP_2d_error(G3_num) = PTP_2d_error(k);
       G3.PTP_3d_error(G3_num) = PTP_3d_error(k);
   end
end
