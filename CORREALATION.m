clear all ; clc ;format compact
load("G1_HCI");load("G2_HCI");load("G3_HCI")
G2plusG3.MMSE = [ (G3.MMSE)  (G2.MMSE)  ]; 
G2plusG3.PTP_2d_long_corrcoef = [ (G3.PTP_2d_long_corrcoef)  (G2.PTP_2d_long_corrcoef)  ]; 
G2plusG3.PTP_2d_long_error = [ (G3.PTP_2d_long_error)  (G2.PTP_2d_long_error)  ]; 
G2plusG3.PTP_2d_long_velpeak = [ (G3.PTP_2d_long_velpeak)  (G2.PTP_2d_long_velpeak)  ]; 

G2plusG3.PTP_2d_short_corrcoef = [ (G3.PTP_2d_short_corrcoef)  (G2.PTP_2d_short_corrcoef)  ]; 
G2plusG3.PTP_2d_short_error = [ (G3.PTP_2d_short_error)  (G2.PTP_2d_short_error)  ]; 
G2plusG3.PTP_2d_short_velpeak = [ (G3.PTP_2d_short_velpeak)  (G2.PTP_2d_short_velpeak)  ]; 

G2plusG3.PTP_3d_long_corrcoef = [ (G3.PTP_3d_long_corrcoef)  (G2.PTP_3d_long_corrcoef)  ]; 
G2plusG3.PTP_3d_long_error = [ (G3.PTP_3d_long_error)  (G2.PTP_3d_long_error)  ]; 
G2plusG3.PTP_3d_long_velpeak = [ (G3.PTP_3d_long_velpeak)  (G2.PTP_3d_long_velpeak)  ]; 

G2plusG3.PTP_3d_short_corrcoef = [ (G3.PTP_3d_short_corrcoef)  (G2.PTP_3d_short_corrcoef)  ]; 
G2plusG3.PTP_3d_short_error = [ (G3.PTP_3d_short_error)  (G2.PTP_3d_short_error)  ]; 
G2plusG3.PTP_3d_short_velpeak = [ (G3.PTP_3d_short_velpeak)  (G2.PTP_3d_short_velpeak)  ]; 

G2plusG3.PTP_diff_2d3d_long = [ (G3.PTP_diff_2d3d_long)  (G2.PTP_diff_2d3d_long)  ]; 
G2plusG3.PTP_diff_2d3d_short = [ (G3.PTP_diff_2d3d_short)  (G2.PTP_diff_2d3d_short)  ]; 
G2plusG3.PTP_2d_error = [ (G3.PTP_2d_error)  (G2.PTP_2d_error)  ]; 
G2plusG3.PTP_3d_error = [ (G3.PTP_3d_error)  (G2.PTP_3d_error)  ]; 



PTP_2d_long_corrcoef = corrcoef(G2plusG3.MMSE, G2plusG3.PTP_2d_long_corrcoef);
PTP_2d_long_corrcoef = PTP_2d_long_corrcoef(1,2)
PTP_2d_long_error = corrcoef(G2plusG3.MMSE, G2plusG3.PTP_2d_long_error);
PTP_2d_long_error = PTP_2d_long_error(1,2)
PTP_2d_long_velpeak = corrcoef(G2plusG3.MMSE, G2plusG3.PTP_2d_long_velpeak);
PTP_2d_long_velpeak = PTP_2d_long_velpeak(1,2)

PTP_2d_short_corrcoef = corrcoef(G2plusG3.MMSE, G2plusG3.PTP_2d_short_corrcoef);
PTP_2d_short_corrcoef = PTP_2d_short_corrcoef(1,2)
PTP_2d_short_error = corrcoef(G2plusG3.MMSE, G2plusG3.PTP_2d_short_error);
PTP_2d_short_error = PTP_2d_short_error(1,2)
PTP_2d_short_velpeak = corrcoef(G2plusG3.MMSE, G2plusG3.PTP_2d_short_velpeak);
PTP_2d_short_velpeak = PTP_2d_short_velpeak(1,2)

PTP_3d_long_corrcoef = corrcoef(G2plusG3.MMSE, G2plusG3.PTP_3d_long_corrcoef);
PTP_3d_long_corrcoef = PTP_3d_long_corrcoef(1,2)
PTP_3d_long_error = corrcoef(G2plusG3.MMSE, G2plusG3.PTP_3d_long_error);
PTP_3d_long_error = PTP_3d_long_error(1,2)
PTP_3d_long_velpeak = corrcoef(G2plusG3.MMSE, G2plusG3.PTP_3d_long_velpeak);
PTP_3d_long_velpeak = PTP_3d_long_velpeak(1,2)

PTP_3d_short_corrcoef = corrcoef(G2plusG3.MMSE, G2plusG3.PTP_3d_short_corrcoef);
PTP_3d_short_corrcoef = PTP_3d_short_corrcoef(1,2)
PTP_3d_short_error= corrcoef(G2plusG3.MMSE, G2plusG3.PTP_3d_short_error);
PTP_3d_short_error = PTP_3d_short_error(1,2)
PTP_3d_short_velpeak = corrcoef(G2plusG3.MMSE, G2plusG3.PTP_3d_short_velpeak);
PTP_3d_short_velpeak = PTP_3d_short_velpeak(1,2)

PTP_diff_2d3d_long= corrcoef(G2plusG3.MMSE, G2plusG3.PTP_diff_2d3d_long);
PTP_diff_2d3d_long = PTP_diff_2d3d_long(1,2)
PTP_diff_2d3d_short = corrcoef(G2plusG3.MMSE, G2plusG3.PTP_diff_2d3d_short);
PTP_diff_2d3d_short = PTP_diff_2d3d_short(1,2)
PTP_2d_error= corrcoef(G2plusG3.MMSE, G2plusG3.PTP_2d_error);
PTP_2d_error = PTP_2d_error(1,2)
PTP_3d_error= corrcoef(G2plusG3.MMSE, G2plusG3.PTP_3d_error);
PTP_3d_error = PTP_3d_error(1,2)
