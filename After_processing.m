clear all;format compact
%% exact outliar
for p = 1 : 37
    subject(p).outliar_trial = ones(5,4);
end
subject(1).outliar_trial = [ 0 1 1 1; 1 1 1 1; 1 1 1 1; 1 1 1 1; 1 1 0 1];
subject(2).outliar_trial = [ 1 1 0 1; 1 1 1 1; 1 1 1 1; 1 1 1 1; 1 1 1 1];
subject(3).outliar_trial = [ 0 1 0 0; 1 1 1 1; 1 1 1 1; 1 1 1 1; 1 1 1 1];
subject(4).outliar_trial = [ 0 1 0 1; 1 1 0 1; 1 1 1 1; 0 0 1 1; 1 1 1 1];
subject(5).outliar_trial = [ 1 0 1 1; 1 1 1 1; 1 1 1 1; 1 1 1 1; 1 1 1 1];
subject(6).outliar_trial = [ 0 1 0 1; 1 1 1 1; 1 1 1 1; 1 1 1 1; 1 1 1 1];
subject(7).outliar_trial = [ 1 0 0 1; 1 1 1 0; 0 1 1 1; 1 1 1 1; 1 1 1 1];
subject(8).outliar_trial = [ 1 1 0 1; 1 1 1 1; 1 1 1 1; 1 1 1 1; 1 1 1 1];
subject(9).outliar_trial = [ 0 1 0 1; 1 1 1 0; 1 1 1 1; 1 1 0 1; 0 1 1 1];
subject(10).outliar_trial = [ 1 1 0 1; 0 1 0 1; 1 0 1 1; 1 1 1 1; 1 1 1 1];
subject(11).outliar_trial = [ 1 1 0 0; 1 1 1 1; 0 1 1 1; 1 1 1 0; 1 1 1 1];
subject(12).outliar_trial = [ 1 1 0 1; 1 0 1 1; 1 1 1 1; 1 1 1 1; 1 1 1 1];
subject(13).outliar_trial = [ 1 1 1 1; 1 1 1 1; 1 1 1 1; 1 1 1 1; 1 1 1 1];
subject(14).outliar_trial = [ 1 1 0 1; 1 1 1 1; 0 1 1 1; 1 1 1 1; 1 1 1 1];
subject(15).outliar_trial = [ 1 1 1 1; 1 1 1 1; 1 1 1 1; 1 1 1 1; 1 1 1 1];
subject(16).outliar_trial = [ 0 0 0 1; 0 1 1 1; 0 1 1 1; 1 1 1 1; 1 1 1 1];
subject(17).outliar_trial = [ 0 1 1 1; 1 1 0 1; 1 1 1 1; 1 1 1 1; 1 1 1 1];
subject(18).outliar_trial = [ 1 1 1 1; 1 1 1 1; 1 1 1 1; 1 1 1 1; 1 1 1 1];
subject(19).outliar_trial = [ 1 1 1 1; 0 1 1 1; 1 1 1 1; 1 1 1 1; 1 1 1 1];
subject(20).outliar_trial = [ 1 1 1 1; 1 1 1 1; 1 1 1 0; 1 1 1 1; 1 1 1 1];
subject(21).outliar_trial = [ 1 1 0 1; 1 1 1 1; 1 1 1 1; 1 1 1 1; 1 1 1 0];
subject(22).outliar_trial = [ 1 1 0 1; 1 1 1 1; 1 1 1 1; 1 1 1 1; 1 1 1 1];
subject(23).outliar_trial = [ 1 1 1 1; 1 1 1 1; 1 0 1 1; 1 1 1 1; 1 1 1 1];
subject(24).outliar_trial = [ 1 1 1 1; 1 1 1 1; 0 1 1 1; 1 1 1 1; 1 1 1 1];
subject(25).outliar_trial = [ 1 1 1 1; 1 1 1 1; 1 1 1 1; 1 1 1 1; 1 1 1 1];
subject(26).outliar_trial = [ 1 1 1 1; 1 1 1 1; 1 1 1 1; 1 1 1 1; 1 1 1 1];
subject(27).outliar_trial = [ 1 1 1 1; 1 1 1 1; 1 1 1 1; 1 1 1 1; 1 1 1 1];
subject(28).outliar_trial = [ 1 1 1 1; 1 1 1 1; 1 1 1 1; 1 1 1 1; 1 1 1 1];
subject(29).outliar_trial = [ 1 1 0 1; 1 1 1 1; 1 1 1 1; 1 1 1 1; 1 1 1 1];
subject(30).outliar_trial = [ 1 1 1 1; 1 1 1 1; 1 1 1 1; 1 1 1 1; 1 1 1 1];
subject(31).outliar_trial = [ 0 1 0 1; 1 1 1 1; 1 1 1 1; 1 1 1 1; 1 1 1 1];
subject(32).outliar_trial = [ 1 1 1 1; 1 1 1 1; 1 1 1 1; 1 1 1 1; 1 1 1 1];
subject(33).outliar_trial = [ 0 0 1 0; 1 1 1 1; 1 1 1 1; 1 1 1 1; 1 1 0 1];
subject(34).outliar_trial = [ 1 1 0 1; 1 1 1 1; 1 1 1 1; 1 1 1 1; 1 1 1 1];
subject(35).outliar_trial = [ 1 1 0 1; 1 1 1 1; 1 1 1 1; 1 1 1 1; 1 1 1 1];
subject(36).outliar_trial = [ 0 1 1 1; 1 1 1 1; 1 1 1 1; 1 1 1 1; 0 1 1 1];
subject(37).outliar_trial = [ 0 1 1 1; 1 1 1 1; 1 1 1 1; 0 1 1 1; 1 1 1 1];

%%
load("MMSE검사결과2020")
%--------exp_2d, exp_3d, Two tracking structure 가져와서 MMSE 넣고 에러 계산해서 --%
% --------structure에 추가해주는것.---------------------------------------%
MMSElist = MMSE11version1(114 : 114+37-1, 7);
for j = 1 : 37 %% HCI용 피실험자 35인
    setData = load("HCI_"+ j+"th.mat");
    %--------------------------------------------------------------------------%
    %--------------------input the MMSE score--------------------------%
    MMSE =MMSElist(j) ;
    %--------------------------------------------------------------------------%
    %--------------------------------------------------------------------------%
    % ++PositionErr_all = 0;
    % ++VelocityErr_all = 0;
    sum_2d_long_velpeak =0 ;
    sum_2d_short_velpeak=0;
    sum_3d_long_velpeak =0 ;
    sum_3d_short_velpeak=0;
    sum_2d_long_error =0 ;
    sum_2d_short_error=0;
    sum_3d_long_error =0 ;
    sum_3d_short_error=0;
    sum_2d_long_corrcoef=0;
    sum_2d_short_corrcoef=0;
    sum_3d_long_corrcoef=0;
    sum_3d_short_corrcoef=0;
    analysised_trial_num = 3;
    trial_num = analysised_trial_num;
 %-------------------2d long에서 2 trial 밖에 안나오는 녀석을 위해 괴상한 코드를짰다-----%
    riculusAflag=0;
    A = 5;S = 5;D = 5;F = 5;
    for i = 5 : -1 :5 - trial_num +1  
        for u = 5 :-1 :1
            if subject(j).outliar_trial(A,1) == 0
                A = A-1;
                if A == 0
                    riculusAflag = 1;
                    break
                end
                if subject(j).outliar_trial(A,1) == 1
                    break
                end
            end
            if subject(j).outliar_trial(S,2) == 0
                S=S-1;
                if subject(j).outliar_trial(S,2) == 1
                    break
                end
            end
            if subject(j).outliar_trial(D,3) == 0
                D=D-1;
                if subject(j).outliar_trial(D,3) == 1
                    break
                end
            end
            if subject(j).outliar_trial(F,4) == 0
                F=F-1;
                if subject(j).outliar_trial(F,4) == 1
                    break
                end
            end
        end
 %-------------------2d long에서 2 trial 밖에 안나오는 녀석을 위해 괴상한 코드를짰다-----%
        if A == 0
        else
        sum_2d_long_velpeak =sum_2d_long_velpeak + max(setData.exp_2d(A).long_xsens_vel_cutted_reviceOffset);
        end
        sum_2d_short_velpeak=sum_2d_short_velpeak+ max(setData.exp_2d(S).short_xsens_vel_cutted_reviceOffset);
        sum_3d_long_velpeak =sum_3d_long_velpeak+ max(setData.exp_3d(D).long_xsens_vel_cutted_reviceOffset);
        sum_3d_short_velpeak=sum_3d_short_velpeak+max(setData.exp_3d(F).short_xsens_vel_cutted_reviceOffset);
        
        if A == 0
        else
        sum_2d_long_error = sum_2d_long_error+ setData.exp_2d(A).long_abs_error;
        end
        sum_2d_short_error = sum_2d_short_error + setData.exp_2d(S).short_abs_error;
        sum_3d_long_error = sum_3d_long_error+ setData.exp_3d(D).long_abs_error;
        sum_3d_short_error = sum_3d_short_error + setData.exp_3d(F).short_abs_error;

    %     VelocityErr_all = VelocityErr_all + Absolute_xz_vel;
        if A == 0
        else
        sum_2d_long_corrcoef = sum_2d_long_corrcoef + setData.exp_2d(A).long_corrcoef(1,2);
        end
        sum_2d_short_corrcoef = sum_2d_short_corrcoef +setData.exp_2d(S).short_corrcoef(1,2);
        sum_3d_long_corrcoef = sum_3d_long_corrcoef + setData.exp_3d(D).long_corrcoef(1,2);
        sum_3d_short_corrcoef = sum_3d_short_corrcoef + setData.exp_3d(F).short_corrcoef(1,2);
        A=A-1;S = S-1;D=D-1;F=F-1;
    end

    % ++avg_PositionError = PositionErr_all/trial_num;
    % ++avg_VelocityError =  VelocityErr_all/trial_num;
    for2dlongonly2trialman = 1;
    if riculusAflag == 1
        for2dlongonly2trialman = 3/2;
    end
    avg_2d_long_velpeak=sum_2d_long_velpeak/trial_num*for2dlongonly2trialman;
    avg_2d_short_velpeak=sum_2d_short_velpeak/trial_num;
    avg_3d_long_velpeak=sum_3d_long_velpeak/trial_num;
    avg_3d_short_velpeak=sum_3d_short_velpeak/trial_num;
    
    avg_2d_long_error = sum_2d_long_error/trial_num*for2dlongonly2trialman;
    avg_2d_short_error=sum_2d_short_error/trial_num;
    avg_3d_long_error=sum_3d_long_error/trial_num;
    avg_3d_short_error=sum_3d_short_error/trial_num;
    
    avg_2d_long_corrcoef=sum_2d_long_corrcoef/trial_num*for2dlongonly2trialman
    avg_2d_short_corrcoef=sum_2d_short_corrcoef/trial_num;
    avg_3d_long_corrcoef=sum_3d_long_corrcoef/trial_num;
    avg_3d_short_corrcoef=sum_3d_short_corrcoef/trial_num;


    
    setData.avg_2d_long_velpeak = avg_2d_long_velpeak;
    setData.avg_2d_short_velpeak = avg_2d_short_velpeak;
    setData.avg_3d_long_velpeak = avg_3d_long_velpeak;
    setData.avg_3d_short_velpeak = avg_3d_short_velpeak;
    
    setData.avg_2d_long_error = avg_2d_long_error;
    setData.avg_2d_short_error = avg_2d_short_error;
    setData.avg_3d_long_error = avg_3d_long_error;
    setData.avg_3d_short_error = avg_3d_short_error;
    % ++ setData.avg_PositionError = avg_PositionError;
    % ++ setData.avg_VelocityError=avg_VelocityError;
    setData.avg_2d_long_corrcoef = avg_2d_long_corrcoef;
    setData.avg_2d_short_corrcoef = avg_2d_short_corrcoef;
    setData.avg_3d_long_corrcoef = avg_3d_long_corrcoef;
    setData.avg_3d_short_corrcoef = avg_3d_short_corrcoef;
    setData.MMSE = MMSE;

    error_2d = [avg_2d_long_error avg_2d_short_error];
    setData.error_2d = error_2d;
    error_3d = [avg_3d_long_error avg_3d_short_error];
    setData.error_3d = error_3d;

    error_error_between2d3d_long = avg_2d_long_error - avg_3d_long_error;
    setData.error_error_between2d3d_long = error_error_between2d3d_long;

    error_error_between2d3d_short = avg_2d_short_error - avg_3d_short_error;
    setData.error_error_between2d3d_short = error_error_between2d3d_short;

    save ("HCI_"+ j+"th_afterprocessing.mat")
end
