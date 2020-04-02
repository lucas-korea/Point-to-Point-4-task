clear all ;  clc ;format compact ;close all
load("MMSE�˻���2020.mat")
%% 2 tracking data load vive
% ++vive_track_data =load( "Track_1st_1.148.csv" ) ;
vive_PTP_data=load( "LINE0120_2th.csv" ) ;
xsens_data = load( "MT_0120_2th.csv" ) ;
xsens_PTP_start = [];
people_number = 37
xsens_PTP_start(1) = MMSE11version1(114 -1 + people_number,22) % �̺κ��� ���� �׷����� ���� ������ ��ŸƮ���� selec
MMSE_score = MMSE11version1(114 -1 + people_number,7)
% ++TT_trial = 5 % ��� trial �ߴ��� Ȯ��
PTP_trial_num = 20 % �� ��� trial�ߴ���.
PTP_task_num = 4 % ��� task�� �ִ���.
% ++TT_Hoffset = 1.1959 - 0.35; % Hoffset���߱�. -0.35�� ���ΰ�.
sensor_reverse = 0 %�������� �߸������ϸ� �Ųٷ� ���Ͱ�����.. �Ųٷ� ���°�� set % �̻��ϰ� ���κ���ȸ�� ������(1107 ,1121)�� �ȵ������� â�� ������(1028, 1122)�� ������..
freeACC = 1;
%%%�̺κ��� start���� ��°� ù�κи� ������ �������� ��


%% PTP data load

vive_PTP_interval = 90 * 4 + 1;%90hz * 4sec
%% PTP task ��, trial���� ������, end point error ���
vive_PTP_start = 0;
T = 1;
for i = 1 : PTP_trial_num/4 % 4 task
    exp_2d(i).long = vive_PTP_data(vive_PTP_start +1 : vive_PTP_start + vive_PTP_interval,:);
    timing(T).hour = vive_PTP_data(vive_PTP_start + 1,25);
    timing(T).minute = vive_PTP_data(vive_PTP_start +1 , 26);
    timing(T).sec = vive_PTP_data(vive_PTP_start +1 , 27);
    T = T + 1;
    vive_PTP_start = vive_PTP_start + vive_PTP_interval;
    exp_2d(i).long_abs_error = sqrt((exp_2d(i).long(end,8) - 0 )^2 + (exp_2d(i).long(end,10) - 0.4)^2 ); %% end point ��ǥ : x = 0, z = 0.4
end
for i = 1 : PTP_trial_num/4 % 4 task
    exp_2d(i).short = vive_PTP_data(vive_PTP_start +1 : vive_PTP_start + vive_PTP_interval,:);
    timing(T).hour = vive_PTP_data(vive_PTP_start + 1,25);    
    timing(T).minute = vive_PTP_data(vive_PTP_start +1 , 26);
    timing(T).sec = vive_PTP_data(vive_PTP_start +1 , 27);
    T = T + 1;
    vive_PTP_start = vive_PTP_start + vive_PTP_interval;
    exp_2d(i).short_abs_error = sqrt((exp_2d(i).short(end,8) - 0 )^2 + (exp_2d(i).short(end,10) - 0.3)^2 ); %% end point ��ǥ : x = 0, z = 0.4
end
for i = 1 : PTP_trial_num/4 % 4 task
    exp_3d(i).long = vive_PTP_data(vive_PTP_start +1 : vive_PTP_start + vive_PTP_interval,:);
    timing(T).hour = vive_PTP_data(vive_PTP_start + 1,25);
    timing(T).minute = vive_PTP_data(vive_PTP_start +1 , 26);
    timing(T).sec = vive_PTP_data(vive_PTP_start +1 , 27);
    T = T + 1;
    vive_PTP_start = vive_PTP_start + vive_PTP_interval;
    exp_3d(i).long_abs_error = sqrt((exp_3d(i).long(end,8) - 0 )^2 + (exp_3d(i).long(end,10) - 0.4)^2 ); %% end point ��ǥ : x = 0, z = 0.4
end
for i = 1 : PTP_trial_num/4 % 4 task
    exp_3d(i).short = vive_PTP_data(vive_PTP_start +1 : vive_PTP_start + vive_PTP_interval,:);
    timing(T).hour = vive_PTP_data(vive_PTP_start + 1,25);
    timing(T).minute = vive_PTP_data(vive_PTP_start +1 , 26);
    timing(T).sec = vive_PTP_data(vive_PTP_start +1 , 27);
    T = T + 1;
    vive_PTP_start = vive_PTP_start + vive_PTP_interval;
    exp_3d(i).short_abs_error = sqrt((exp_3d(i).short(end,8) - 0 )^2 + (exp_3d(i).short(end,10) - 0.3)^2 ); %% end point ��ǥ : x = 0, z = 0.4
end
%% �̺����� �ӵ����
for i = 1 : PTP_trial_num/4 %  task1
    for row_index=1:vive_PTP_interval
       if row_index==1
         exp_2d(i).longdot(row_index,1) = 0 ;
      elseif row_index==2
         exp_2d(i).longdot(row_index,1) = (  exp_2d(i).long(row_index,10) -  exp_2d(i).long(row_index-1,10) ) / (1 / 90) ;
      elseif row_index== vive_PTP_interval-1 || row_index==vive_PTP_interval
         exp_2d(i).longdot(row_index,1) = 0 ;
       else
            exp_2d(i).longdot(row_index,1) = ( exp_2d(i).long(row_index-2,10) - 8 * exp_2d(i).long(row_index-1,10) + 8 * exp_2d(i).long(row_index + 1,10) - exp_2d(i).long(row_index + 2,10)) / (12 * 1 / 90)  ;
       end
    end
end

for i = 1 : PTP_trial_num/4 %  task2
    for row_index=1:vive_PTP_interval
       if row_index==1
         exp_2d(i).shortdot(row_index,1) = 0 ;
      elseif row_index==2
         exp_2d(i).shortdot(row_index,1) = (  exp_2d(i).short(row_index,10) -  exp_2d(i).short(row_index-1,10) ) / (1 / 90) ;
      elseif row_index== vive_PTP_interval-1 || row_index==vive_PTP_interval
         exp_2d(i).shortdot(row_index,1) = 0 ;
       else
            exp_2d(i).shortdot(row_index,1) = ( exp_2d(i).short(row_index-2,10) - 8 * exp_2d(i).short(row_index-1,10) + 8 * exp_2d(i).short(row_index + 1,10) - exp_2d(i).short(row_index + 2,10)) / (12 * 1 / 90)  ;
       end
    end
end

for i = 1 : PTP_trial_num/4 %  task3
    for row_index=1:vive_PTP_interval
       if row_index==1
         exp_3d(i).longdot(row_index,1) = 0 ;
      elseif row_index==2
         exp_3d(i).longdot(row_index,1) = (  exp_3d(i).long(row_index,10) -  exp_3d(i).long(row_index-1,10) ) / (1 / 90) ;
      elseif row_index== vive_PTP_interval-1 || row_index==vive_PTP_interval
         exp_3d(i).longdot(row_index,1) = 0 ;
       else
            exp_3d(i).longdot(row_index,1) = ( exp_3d(i).long(row_index-2,10) - 8 * exp_3d(i).long(row_index-1,10) + 8 * exp_3d(i).long(row_index + 1,10) - exp_3d(i).long(row_index + 2,10)) / (12 * 1 / 90)  ;
       end

    end
   
end
for i = 1 : PTP_trial_num/4 %  task4
    for row_index=1:vive_PTP_interval
       if row_index==1
         exp_3d(i).shortdot(row_index,1) = 0 ;
      elseif row_index==2
         exp_3d(i).shortdot(row_index,1) = (  exp_3d(i).short(row_index,10) -  exp_3d(i).short(row_index-1,10) ) / (1 / 90) ;
      elseif row_index== vive_PTP_interval-1 || row_index == vive_PTP_interval
         exp_3d(i).shortdot(row_index,1) = 0 ;
       else
            exp_3d(i).shortdot(row_index,1) = ( exp_3d(i).short(row_index-2,10) - 8 * exp_3d(i).short(row_index-1,10) + 8 * exp_3d(i).short(row_index + 1,10) - exp_3d(i).short(row_index + 2,10)) / (12 * 1 / 90)  ;
       end
    end
end
%% �ӵ� ���͸�
cutoff = 20 ;
order  =  5 ;
sample_rate = 90;
[B,A] = butter( order, cutoff/(sample_rate/2) ) ;
for i = 1 : PTP_trial_num/PTP_task_num
    exp_2d(i).longdot_filtered = filtfilt( B, A, exp_2d(i).longdot ) ;
    exp_2d(i).shortdot_filtered = filtfilt( B, A, exp_2d(i).shortdot ) ;
    exp_3d(i).longdot_filtered = filtfilt( B, A, exp_3d(i).longdot ) ;
    exp_3d(i).shortdot_filtered = filtfilt( B, A, exp_3d(i).shortdot ) ;
end
%% PTP xsens analysis
% PTP trial���� ������ ������

freq = 100;
x = 0 : 0.01 : (length(xsens_data)-1)/freq;
x = x';
if freeACC == 0
    y =xsens_data(:,2); %data(:,2)�� �ַ� ����  x����. 3�� z����
    y_side = xsens_data(:,3);
else
    y =xsens_data(:,5); %data(:,2)�� �ַ� ����  x����. 3�� z����
    y_side = xsens_data(:,6);
end

% ptp ��ü �����͸� �׷����� ���� �۾�. ���͸��� �����ʹ� �м��� ������� �ʴ´�.
figure;title("raw data of full xsens")
newy = y +y_side;
if sensor_reverse ==1
    newy = -newy;
end
cutoff =2;
order  =  5 ;
sample_rate = 100;
[B,A] = butter( order, cutoff/(sample_rate/2) ) ;
y_filtered = filtfilt( B, A, newy ) ;
plot(x,y_filtered,'k',"linewidth",2)
newx = x;
%%
xsens_PTP_interval = freq * 4; % senx 100hz * 4sec
offset = 0.0; %% ������ offset error�� �����Ƿ� �����ϰ� ������ ����.

% xsens PTP timing ���߱�
for i = 2 : PTP_trial_num
    if (timing(i-1).hour ~= timing(i).hour)
        xsens_PTP_start(i) = ((timing(i).minute + 60 - timing(i-1).minute) * 60+...
        (timing(i).sec - timing(i-1).sec)) * 100 + xsens_PTP_start(i-1);
    end
    xsens_PTP_start(i) = ((timing(i).minute - timing(i-1).minute) * 60+...
    (timing(i).sec - timing(i-1).sec)) * 100 + xsens_PTP_start(i-1);
end

%% PTP trial�� xsens acc, vel, pos
[C, D] = butter(6,0.5/(100/2), 'high');

for i = 1 : PTP_trial_num
    xsens_trial(i).acc = newy(xsens_PTP_start(i) : xsens_PTP_start(i) + xsens_PTP_interval)+offset;
    
    xsens_trial(i).vel(1) = xsens_trial(i).acc(1); %������ �ʱ�ȭ
    
    xsens_trial(i).pos(1) = xsens_trial(i).acc(1);
end

for i = 1 : PTP_trial_num
    for j =  2 : xsens_PTP_interval+1
         xsens_trial(i).vel(j) = trapz(newx(1 : j) , xsens_trial(i).acc(1 : j));
    end
end

for i = 1 : PTP_trial_num
    for j =  2 : xsens_PTP_interval+1
         xsens_trial(i).pos(j) = trapz(newx(1 : j) , xsens_trial(i).vel(1 : j));
    end
end

exp_2d(1).xsens_time = newx(1: xsens_PTP_interval + 1);
for i = 1 : PTP_trial_num / PTP_task_num
    exp_2d(i).long_xsens_acc = xsens_trial(i).acc;
    exp_2d(i).long_xsens_vel = xsens_trial(i).vel; 
    exp_2d(i).long_xsens_pos = xsens_trial(i).pos;
    exp_2d(i).short_xsens_acc = xsens_trial(i+PTP_trial_num / PTP_task_num).acc;
    exp_2d(i).short_xsens_vel = xsens_trial(i+PTP_trial_num / PTP_task_num).vel; 
    exp_2d(i).short_xsens_pos = xsens_trial(i+PTP_trial_num / PTP_task_num).pos;
    exp_3d(i).long_xsens_acc = xsens_trial(i+PTP_trial_num / PTP_task_num *2).acc;
    exp_3d(i).long_xsens_vel = xsens_trial(i+PTP_trial_num / PTP_task_num *2).vel; 
    exp_3d(i).long_xsens_pos = xsens_trial(i+PTP_trial_num / PTP_task_num *2).pos;
    exp_3d(i).short_xsens_acc = xsens_trial(i+PTP_trial_num / PTP_task_num *3).acc;
    exp_3d(i).short_xsens_vel = xsens_trial(i+PTP_trial_num / PTP_task_num *3).vel; 
    exp_3d(i).short_xsens_pos = xsens_trial(i+PTP_trial_num / PTP_task_num *3).pos;
end
    


%% XSENS ���� ���߱�. + vive ������ ������ get
%%% vive�� �ӵ� ������ ������ ���� �̳��� (0+- 0.05?) xsens���� ����  get, �� ���� ��ü 4s ���� ����
%%% �븻������ �ؼ� �� ��������
Start_point_flag = 0;
end_point_flag = 0; %% 5 = high flag 0~4 low flag
global c
k=1;
for i = 1 : PTP_trial_num/4
    exp_2d(i).long_xsens_vel_reviceOffset = [ ] ;
    exp_2d(i).short_xsens_vel_reviceOffset = [ ] ;
    exp_3d(i).long_xsens_vel_reviceOffset = [ ] ;
    exp_3d(i).short_xsens_vel_reviceOffset = [ ] ;
    %%%2d long----------------------------------------
    % �������߱�
    if (abs(exp_2d(i).longdot_filtered(end))< 0.01 )
        xsens_vel_final_offset_error = exp_2d(i).long_xsens_vel(end);
        for j = 1 : length(exp_2d(i).long_xsens_vel)
            exp_2d(i).long_xsens_vel_reviceOffset(j) = exp_2d(i).long_xsens_vel(j)-(xsens_vel_final_offset_error * j / length(exp_2d(i).long_xsens_vel));
        end
    end
    %vel start end point detect
    exp_2d(i).long_xsens_vel_start = 1;
    exp_2d(i).long_xsens_vel_end = 0;
    for j = 1 : length(exp_2d(i).long_xsens_vel)
        if (exp_2d(i).long_xsens_vel_reviceOffset(j) > 0.01 && Start_point_flag <15)
            Start_point_flag = Start_point_flag +1;    
            if Start_point_flag ==15
                exp_2d(i).long_xsens_vel_start = j-25;
                 if  j-25 <=0
                    exp_2d(i).long_xsens_vel_start = 1;
                end
            end
        end
        
        if ( exp_2d(i).long_xsens_vel_reviceOffset(j) < 0.01 && Start_point_flag == 15 )
            end_point_flag = end_point_flag + 1;
            if end_point_flag ==5
                exp_2d(i).long_xsens_vel_end = j+15;
                if (j+15>400 || exp_2d(i).long_xsens_vel_end == 0)
                   exp_2d(i).long_xsens_vel_end = 400;
                end
            end  
        end
    end
    if (exp_2d(i).long_xsens_vel_end == 0)
        exp_2d(i).long_xsens_vel_end = 400;
    end
    Start_point_flag = 0;
    end_point_flag = 0 ;
    %cutting
    exp_2d(i).long_xsens_vel_cutted_reviceOffset = exp_2d(i).long_xsens_vel_reviceOffset(exp_2d(i).long_xsens_vel_start :exp_2d(i).long_xsens_vel_end );



    %gaussian fitting
    t = exp_2d(1).xsens_time(exp_2d(i).long_xsens_vel_start : exp_2d(i).long_xsens_vel_end) - mean(exp_2d(1).xsens_time(exp_2d(i).long_xsens_vel_start : exp_2d(i).long_xsens_vel_end)) ;
    y = exp_2d(i).long_xsens_vel_cutted_reviceOffset;
    start=[length(t)/2 length(t)/2]; % generic initial guesses for peak position and width
    parameter=fminsearch(@(lambda)(fitgauss2(lambda,t,y)),start);
    exp_2d(i).long_gaussianFitting=(c.*gaussian(t,parameter(1),parameter(2)))';
    exp_2d(i).long_corrcoef = corrcoef(exp_2d(i).long_gaussianFitting,exp_2d(i).long_xsens_vel_cutted_reviceOffset );
    
    
    %%%2d short-------------------------------------------
    % �������߱�
    if (abs(exp_2d(i).shortdot_filtered(end))< 0.01 )
        xsens_vel_final_offset_error = exp_2d(i).short_xsens_vel(end);
        for j = 1 : length(exp_2d(i).short_xsens_vel)
            exp_2d(i).short_xsens_vel_reviceOffset(j) = exp_2d(i).short_xsens_vel(j)-(xsens_vel_final_offset_error * j / length(exp_2d(i).short_xsens_vel));
        end
    end
    %vel start end point detect
    exp_2d(i).short_xsens_vel_start = 1;
    exp_2d(i).short_xsens_vel_end = 0;
    for j = 1 : length(exp_2d(i).short_xsens_vel)
        if (exp_2d(i).short_xsens_vel_reviceOffset(j) > 0.01 && Start_point_flag <15)
            Start_point_flag = Start_point_flag +1;    
            if Start_point_flag ==15
                exp_2d(i).short_xsens_vel_start = j-25;
                if  j-25 <=0
                    exp_2d(i).short_xsens_vel_start = 1;
                end
            end
        end
        
        if ( exp_2d(i).short_xsens_vel_reviceOffset(j) < 0.01 && Start_point_flag == 15 )
            end_point_flag = end_point_flag + 1;
            if end_point_flag ==5
                exp_2d(i).short_xsens_vel_end = j+15;
                if (j+15>400 || exp_2d(i).short_xsens_vel_end == 0)
                    exp_2d(i).short_xsens_vel_end = 400;
                end
            end  
        end
    end
    if (exp_2d(i).short_xsens_vel_end == 0)
        exp_2d(i).short_xsens_vel_end = 400;
    end
    Start_point_flag = 0;
    end_point_flag = 0 ;   
    
    %cutting
    exp_2d(i).short_xsens_vel_cutted_reviceOffset = exp_2d(i).short_xsens_vel_reviceOffset(exp_2d(i).short_xsens_vel_start : exp_2d(i).short_xsens_vel_end);
 

    
   %gaussian fitting
    t = exp_2d(1).xsens_time(exp_2d(i).short_xsens_vel_start : exp_2d(i).short_xsens_vel_end) - mean(exp_2d(1).xsens_time(exp_2d(i).short_xsens_vel_start : exp_2d(i).short_xsens_vel_end)) ;
    y = exp_2d(i).short_xsens_vel_cutted_reviceOffset;
    start=[length(t)/2 length(t)/2]; % generic initial guesses for peak position and width
    parameter=fminsearch(@(lambda)(fitgauss2(lambda,t,y)),start);
    exp_2d(i).short_gaussianFitting=(c.*gaussian(t,parameter(1),parameter(2)))';
    exp_2d(i).short_corrcoef = corrcoef(exp_2d(i).short_gaussianFitting,exp_2d(i).short_xsens_vel_cutted_reviceOffset );
    %%%3d long-------------------------------------------
    %���� ���߱�
    if (abs(exp_3d(i).longdot_filtered(end))< 0.01 )
        xsens_vel_final_offset_error = exp_3d(i).long_xsens_vel(end);
        for j = 1 : length(exp_3d(i).long_xsens_vel)
            exp_3d(i).long_xsens_vel_reviceOffset(j) = exp_3d(i).long_xsens_vel(j)-(xsens_vel_final_offset_error * j / length(exp_3d(i).long_xsens_vel));
        end
    end
    %vel start end point detect
    exp_3d(i).long_xsens_vel_start = 1;
    exp_3d(i).long_xsens_vel_end = 0;
    for j = 1 : length(exp_3d(i).long_xsens_vel)
        if (exp_3d(i).long_xsens_vel_reviceOffset(j) > 0.01 && Start_point_flag <15)
            Start_point_flag = Start_point_flag +1;    
            if Start_point_flag ==15
                exp_3d(i).long_xsens_vel_start =  j-25;
                if  j-25 <=0
                    exp_3d(i).long_xsens_vel_start = 1;
                end
            end
        end
        
        if ( exp_3d(i).long_xsens_vel_reviceOffset(j) < 0.01 && Start_point_flag == 15 )
            end_point_flag = end_point_flag + 1;
            if end_point_flag ==5
                exp_3d(i).long_xsens_vel_end = j+15;
                if (j+15>400 || exp_3d(i).long_xsens_vel_end == 0)
                 exp_3d(i).long_xsens_vel_end = 400;
                end
            end  
        end
    end
    if (exp_3d(i).long_xsens_vel_end == 0)
        exp_3d(i).long_xsens_vel_end = 400;
    end 
    Start_point_flag = 0;
    end_point_flag = 0 ;
    
    %cutting
    exp_3d(i).long_xsens_vel_cutted_reviceOffset = exp_3d(i).long_xsens_vel_reviceOffset(exp_3d(i).long_xsens_vel_start :exp_3d(i).long_xsens_vel_end );
    %gaussian fitting
    t = exp_2d(1).xsens_time(exp_3d(i).long_xsens_vel_start : exp_3d(i).long_xsens_vel_end) - mean(exp_2d(1).xsens_time(exp_3d(i).long_xsens_vel_start : exp_3d(i).long_xsens_vel_end)) ;
    y = exp_3d(i).long_xsens_vel_cutted_reviceOffset;
    start=[length(t)/2 length(t)/2]; % generic initial guesses for peak position and width
    parameter=fminsearch(@(lambda)(fitgauss2(lambda,t,y)),start);
    exp_3d(i).long_gaussianFitting=(c.*gaussian(t,parameter(1),parameter(2)))';
    exp_3d(i).long_corrcoef = corrcoef(exp_3d(i).long_gaussianFitting,exp_3d(i).long_xsens_vel_cutted_reviceOffset );
    
    %%%3d short-------------------------------------------
    %���� ���߱�
    if (abs(exp_3d(i).shortdot_filtered(end))< 0.01 )
        xsens_vel_final_offset_error = exp_3d(i).short_xsens_vel(end);
        for j = 1 : length(exp_3d(i).short_xsens_vel)
            exp_3d(i).short_xsens_vel_reviceOffset(j) = exp_3d(i).short_xsens_vel(j)-(xsens_vel_final_offset_error * j / length(exp_3d(i).short_xsens_vel));
        end
    end
    %vel start end point detect
    exp_3d(i).short_xsens_vel_start = 1;
    exp_3d(i).short_xsens_vel_end = 0;
    for j = 1 : length(exp_2d(i).short_xsens_vel)
        if (exp_3d(i).short_xsens_vel_reviceOffset(j) > 0.01 && Start_point_flag <15)
            Start_point_flag = Start_point_flag +1;    
            if Start_point_flag ==15
                exp_3d(i).short_xsens_vel_start = j-25;
                if  j-25 <=0
                    exp_3d(i).short_xsens_vel_start = 1;
                end
            end
        end
        
        if ( exp_3d(i).short_xsens_vel_reviceOffset(j) < 0.01 && Start_point_flag == 15 )
            end_point_flag = end_point_flag + 1;
            if end_point_flag ==5
                exp_3d(i).short_xsens_vel_end = j+15;
                if (j+15>400 || exp_3d(i).short_xsens_vel_end == 0)
                    exp_3d(i).short_xsens_vel_end = 400;
                end
            end  
        end
    end
    if (exp_3d(i).short_xsens_vel_end == 0)
        exp_3d(i).short_xsens_vel_end = 400;
    end 
    Start_point_flag = 0;
    end_point_flag = 0;
    %cutting
    cutted_length = exp_3d(i).short_xsens_vel_end - exp_3d(i).short_xsens_vel_start;
    exp_3d(i).short_xsens_vel_cutted_reviceOffset = exp_3d(i).short_xsens_vel_reviceOffset(exp_3d(i).short_xsens_vel_start : exp_3d(i).short_xsens_vel_end);

    %gaussian fitting
    t = exp_2d(1).xsens_time(exp_3d(i).short_xsens_vel_start : exp_3d(i).short_xsens_vel_end) - mean(exp_2d(1).xsens_time(exp_3d(i).short_xsens_vel_start : exp_3d(i).short_xsens_vel_end)) ;
    y = exp_3d(i).short_xsens_vel_cutted_reviceOffset;
    start=[length(t)/2 length(t)/2]; % generic initial guesses for peak position and width
    parameter=fminsearch(@(lambda)(fitgauss2(lambda,t,y)),start);
    exp_3d(i).short_gaussianFitting=(c.*gaussian(t,parameter(1),parameter(2)))';
    exp_3d(i).short_corrcoef = corrcoef(exp_3d(i).short_gaussianFitting,exp_3d(i).short_xsens_vel_cutted_reviceOffset );
end


%% ploting graph for PTP
font_size = 15;
%% 2d long ploting vive
fig_2d_long = figure;
sgtitle(people_number + "��° �ǽ�����   2d long  MMSE scroe : " +MMSE_score, 'fontsize', font_size+6)
subplot(231)
hold on
plot( 0.005*cos(linspace(0,2*pi,100)), 0.005*sin(linspace(0,2*pi,100)), 'k--', 'linewidth', 1.5 ) ;
plot( 0.025*cos(linspace(0,2*pi,100)), 0.025*sin(linspace(0,2*pi,100))+0.2    , 'k:', 'linewidth', 1.5 ) ;
for i = 1 : PTP_trial_num/4
   plot( exp_2d(i).long(:,8), exp_2d(i).long(:,10)-0.2, 'linewidth', 2 ) ;
end
title( 'Trajectory (2D long)' );xlabel( 'z position [m]' ); ylabel( 'x position [m]' ) 
% legend( 'start', 'stop (vis)' ,'1st trial','2nd trial','3rd trial','4th trial', '5th trial');
set( gca, 'fontsize', font_size )
axis equal;axis( [-0.06 0.06 -0.05 0.3] );grid on;hold off

subplot(232)
hold on;title(" vive whole velocity")
for i = 1 : PTP_trial_num/PTP_task_num
    plot(exp_2d(i).long(:,1), exp_2d(i).longdot_filtered , 'linewidth', 2);
end
xlabel( 'x velocity [m/s]' );ylabel( 'x position [m]' );legend( '1st trial','2nd trial','3rd trial','4th trial', '5th trial');set( gca, 'fontsize', font_size )
 axis( [-0.5 4 -0.05 1] );grid on;hold off
hold off

subplot(233)
hold on;title(" xsens whole velocity")
for i = 1 : PTP_trial_num/PTP_task_num
    plot(exp_2d(1).xsens_time(:,1), exp_2d(i).long_xsens_vel , 'linewidth', 2);
end
xlabel( 'x velocity [m/s]' );ylabel( 'x position [m]' );legend( '1st trial','2nd trial','3rd trial','4th trial', '5th trial');set( gca, 'fontsize', font_size )
 axis( [-0.5 4 -0.05 1] );grid on;hold off

subplot(234)
hold on;title("velocity cutting")
for i = 1 : PTP_trial_num/PTP_task_num
    plot(exp_2d(1).xsens_time(exp_2d(i).long_xsens_vel_start:exp_2d(i).long_xsens_vel_end,1), exp_2d(i).long_xsens_vel_cutted_reviceOffset , 'linewidth', 2);
end
xlabel( 'x velocity [m/s]' );ylabel( 'x position [m]' );legend( '1st trial','2nd trial','3rd trial','4th trial', '5th trial');set( gca, 'fontsize', font_size )
 axis( [-0.5 4 -0.05 1] );grid on;hold off

subplot(235)
hold on;title("gaussian fitting")
for i = 1 : PTP_trial_num/PTP_task_num
    plot(exp_2d(1).xsens_time(exp_2d(i).long_xsens_vel_start:exp_2d(i).long_xsens_vel_end,1), exp_2d(i).long_gaussianFitting , 'linewidth', 2);
end
xlabel( 'x velocity [m/s]' );ylabel( 'x position [m]' );legend( '1st trial','2nd trial','3rd trial','4th trial', '5th trial');set( gca, 'fontsize', font_size )
 axis( [-0.5 4 -0.05 1] );grid on;hold off

%% 2d short vive   
fig_2d_short = figure;
sgtitle(people_number + "��° �ǽ�����   2d short      MMSE scroe : " +MMSE_score, 'fontsize', font_size+6)
subplot(231)
hold on;
plot( 0.005*cos(linspace(0,2*pi,100)), 0.005*sin(linspace(0,2*pi,100)), 'k--', 'linewidth', 1.5 ) ;
plot( 0.025*cos(linspace(0,2*pi,100)), 0.025*sin(linspace(0,2*pi,100))+0.1    , 'k:', 'linewidth', 1.5 ) ;
for i = 1 : PTP_trial_num/4
   plot( exp_2d(i).short(:,8), exp_2d(i).short(:,10)-0.2, 'linewidth', 2 ) ;
end
title( 'Trajectory (2D short)' );xlabel( 'z position [m]' );ylabel( 'x position [m]' );%legend( 'start', 'stop (vis)' ,'1st trial','2nd trial','3rd trial','4th trial', '5th trial')
set( gca, 'fontsize', font_size );axis equal; axis( [-0.06 0.06 -0.05 0.3] );grid on;hold off


subplot(232)
hold on;title(" vive whole velocity")
for i = 1 : PTP_trial_num/PTP_task_num
    plot(exp_2d(i).short(:,1), exp_2d(i).shortdot_filtered , 'linewidth', 2);
end
xlabel( 'x velocity [m/s]' );ylabel( 'x position [m]' );legend( '1st trial','2nd trial','3rd trial','4th trial', '5th trial');set( gca, 'fontsize', font_size )
 axis( [-0.5 4 -0.05 1] );grid on;hold off

subplot(233)
hold on;title(" xsens whole velocity")
for i = 1 : PTP_trial_num/PTP_task_num
    plot(exp_2d(1).xsens_time(:,1), exp_2d(i).short_xsens_vel , 'linewidth', 2);
end
xlabel( 'x velocity [m/s]' );ylabel( 'x position [m]' );legend( '1st trial','2nd trial','3rd trial','4th trial', '5th trial');set( gca, 'fontsize', font_size )
 axis( [-0.5 4 -0.05 1] );grid on;hold off

subplot(234)
hold on;title("velocity cutting")
for i = 1 : PTP_trial_num/PTP_task_num
    plot(exp_2d(1).xsens_time(exp_2d(i).short_xsens_vel_start:exp_2d(i).short_xsens_vel_end,1), exp_2d(i).short_xsens_vel_cutted_reviceOffset , 'linewidth', 2);
end
xlabel( 'x velocity [m/s]' );ylabel( 'x position [m]' );legend( '1st trial','2nd trial','3rd trial','4th trial', '5th trial');set( gca, 'fontsize', font_size )
 axis( [-0.5 4 -0.05 1] );grid on;hold off

subplot(235)
hold on;title("gaussian fitting")
for i = 1 : PTP_trial_num/PTP_task_num
    plot(exp_2d(1).xsens_time(exp_2d(i).short_xsens_vel_start:exp_2d(i).short_xsens_vel_end,1), exp_2d(i).short_gaussianFitting , 'linewidth', 2);
end
xlabel( 'x velocity [m/s]' );ylabel( 'x position [m]' );legend( '1st trial','2nd trial','3rd trial','4th trial', '5th trial');set( gca, 'fontsize', font_size )
 axis( [-0.5 4 -0.05 1] );grid on;hold off
%% 3d long vive
fig_3d_long = figure;
sgtitle(people_number + "��° �ǽ�����   3d long    MMSE scroe : " +MMSE_score, 'fontsize', font_size+6)
subplot(231)
hold on
plot( 0.005*cos(linspace(0,2*pi,100)), 0.005*sin(linspace(0,2*pi,100)), 'k--', 'linewidth', 1.5 ) ;
plot( 0.025*cos(linspace(0,2*pi,100)), 0.025*sin(linspace(0,2*pi,100))+0.2    , 'k:', 'linewidth', 1.5 ) ;
for i = 1 : PTP_trial_num/4
   plot( exp_3d(i).long(:,8), exp_3d(i).long(:,10) - 0.2, 'linewidth', 2 ) ;
end

title( 'Trajectory (3D long)' );xlabel( 'z position [m]' );ylabel( 'x position [m]' )
%legend( 'start', 'stop (vis)' ,'1st trial','2nd trial','3rd trial','4th trial', '5th trial');
set( gca, 'fontsize', font_size )
axis equal; axis( [-0.06 0.06 -0.05 0.3] );grid on;hold off    

subplot(232)
hold on;title(" vive whole velocity")
for i = 1 : PTP_trial_num/PTP_task_num
    plot(exp_3d(i).long(:,1), exp_3d(i).longdot_filtered , 'linewidth', 2);
end
xlabel( 'x velocity [m/s]' );ylabel( 'x position [m]' );legend( '1st trial','2nd trial','3rd trial','4th trial', '5th trial');set( gca, 'fontsize', font_size )
 axis( [-0.5 4 -0.05 1] );grid on;hold off

subplot(233)
hold on;title(" xsens whole velocity")
for i = 1 : PTP_trial_num/PTP_task_num
    plot(exp_2d(1).xsens_time(:,1), exp_3d(i).long_xsens_vel , 'linewidth', 2);
end
xlabel( 'x velocity [m/s]' );ylabel( 'x position [m]' );legend( '1st trial','2nd trial','3rd trial','4th trial', '5th trial');set( gca, 'fontsize', font_size )
 axis( [-0.5 4 -0.05 1] );grid on;hold off

subplot(234)
hold on;title("velocity cutting")
for i = 1 : PTP_trial_num/PTP_task_num
    plot(exp_2d(1).xsens_time(exp_3d(i).long_xsens_vel_start:exp_3d(i).long_xsens_vel_end,1), exp_3d(i).long_xsens_vel_cutted_reviceOffset , 'linewidth', 2);
end
xlabel( 'x velocity [m/s]' );ylabel( 'x position [m]' );legend( '1st trial','2nd trial','3rd trial','4th trial', '5th trial');set( gca, 'fontsize', font_size )
 axis( [-0.5 4 -0.05 1] );grid on;hold off
 
subplot(235)
hold on;title("gaussian fitting")
for i = 1 : PTP_trial_num/PTP_task_num
    plot(exp_2d(1).xsens_time(exp_3d(i).long_xsens_vel_start:exp_3d(i).long_xsens_vel_end,1), exp_3d(i).long_gaussianFitting , 'linewidth', 2);
end
xlabel( 'x velocity [m/s]' );ylabel( 'x position [m]' );legend( '1st trial','2nd trial','3rd trial','4th trial', '5th trial');set( gca, 'fontsize', font_size )
 axis( [-0.5 4 -0.05 1] );grid on;hold off
 

%% 3d short vive
fig_3d_short =figure;
sgtitle(people_number + "��° �ǽ�����   3d short    MMSE scroe : " +MMSE_score, 'fontsize', font_size+6)
subplot(231)
hold on
plot( 0.005*cos(linspace(0,2*pi,100)), 0.005*sin(linspace(0,2*pi,100)), 'k--', 'linewidth', 1.5 ) ;
plot( 0.025*cos(linspace(0,2*pi,100)), 0.025*sin(linspace(0,2*pi,100))+0.1    , 'k:', 'linewidth', 1.5 ) ;
for i = 1 : PTP_trial_num/4
   plot( exp_3d(i).short(:,8), exp_3d(i).short(:,10) - 0.2, 'linewidth', 2 ) ;
end

title( 'Trajectory (3D short)' );xlabel( 'z position [m]' );ylabel( 'x position [m]' )
% legend( 'start', 'stop (vis)' ,'1st trial','2nd trial','3rd trial','4th trial', '5th trial');
set( gca, 'fontsize', font_size )
axis equal; axis( [-0.06 0.06 -0.05 0.3] );grid on;hold off

subplot(232)
hold on;title(" vive whole velocity")
for i = 1 : PTP_trial_num/PTP_task_num
    plot(exp_3d(i).short(:,1), exp_3d(i).shortdot_filtered , 'linewidth', 2);
end
xlabel( 'x velocity [m/s]' );ylabel( 'x position [m]' );legend( '1st trial','2nd trial','3rd trial','4th trial', '5th trial');set( gca, 'fontsize', font_size )
 axis( [-0.5 4 -0.05 1] );grid on;hold off

subplot(233)
hold on;title(" xsens whole velocity")
for i = 1 : PTP_trial_num/PTP_task_num
    plot(exp_2d(1).xsens_time(:,1), exp_3d(i).short_xsens_vel , 'linewidth', 2);
end
xlabel( 'x velocity [m/s]' );ylabel( 'x position [m]' );legend( '1st trial','2nd trial','3rd trial','4th trial', '5th trial');set( gca, 'fontsize', font_size )
 axis( [-0.5 4 -0.05 1] );grid on;hold off

subplot(234)
hold on;title("velocity cutting")
for i = 1 : PTP_trial_num/PTP_task_num
    plot(exp_2d(1).xsens_time(exp_3d(i).short_xsens_vel_start:exp_3d(i).short_xsens_vel_end,1), exp_3d(i).short_xsens_vel_cutted_reviceOffset, 'linewidth', 2);
end
xlabel( 'x velocity [m/s]' );ylabel( 'x position [m]' );legend( '1st trial','2nd trial','3rd trial','4th trial', '5th trial');set( gca, 'fontsize', font_size )
 axis( [-0.5 4 -0.05 1] );grid on;hold off

subplot(235)
hold on;title("gaussian fitting")
for i = 1 : PTP_trial_num/PTP_task_num
    plot(exp_2d(1).xsens_time(exp_3d(i).short_xsens_vel_start:exp_3d(i).short_xsens_vel_end,1), exp_3d(i).short_gaussianFitting , 'linewidth', 2);
end
xlabel( 'x velocity [m/s]' );ylabel( 'x position [m]' );legend( '1st trial','2nd trial','3rd trial','4th trial', '5th trial');set( gca, 'fontsize', font_size )
 axis( [-0.5 4 -0.05 1] );grid on;hold off

 
 %%
 xsens_PTP_start(1)