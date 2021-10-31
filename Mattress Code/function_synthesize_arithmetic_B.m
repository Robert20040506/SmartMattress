function [ flag,heartrate_value ] = function_synthesize_arithmetic_B( data2 )

%flag=1 �ȵ���Ƶ���Һͷ��Ƚ�
%flag=2 ������С��ȥ��ʱ���������㣬���ͷ��Ƚ�a(6)��1
%flag=3 ������С��ȥ��ʱ���������㣬���ͷ��Ƚ�a(6)��0
%flag=4 ������С��cd1ʱ���������㣬�Һͷ��Ƚ�
%


%Ƶ������ֵ���͹̶��ķ�㱻����
[ statistics_array_2D_freq,possible_interval_flag,F_interval_continuity_HR ,F_interval_continuity_value,peak_valid_flag,comparing_times,freq_HR_array] = AM_FREQ_512( data2,'coif5',0); %a(6)��0
[ interval_successrate_flag_a,T_interval_continuity_HR_a] = AM_TIME_512(data2,1,'coif5');%a(6)��1
[ interval_successrate_flag,T_interval_continuity_HR] = AM_TIME_512(data2,0,'coif5');%a(6)��0
[ interval_successrate_flag_cd1,T_interval_continuity_HR_cd1] = AM_TIME_512_2(data2,'coif5');

[ ~,possible_interval_flag2,F_interval_continuity_HR2 ,~,~,comparing_times2,freq_HR_array2] = AM_FREQ_512( data2,'sym5',0); %a(6)��0
[ interval_successrate_flag_b,T_interval_continuity_HR_b] = AM_TIME_512(data2,1,'sym5');%a(6)��1
[ interval_successrate_flag2,T_interval_continuity_HR2] = AM_TIME_512(data2,0,'sym5');%a(6)��0
[ interval_successrate_flag_cd1_2,T_interval_continuity_HR_cd1_2] = AM_TIME_512_2(data2,'sym5');

[ ~,possible_interval_flag3,F_interval_continuity_HR3 ,~,~,comparing_times3,freq_HR_array3] = AM_FREQ_512( data2,'sym5',0); %a(6)��0
[ interval_successrate_flag_c,T_interval_continuity_HR_c] = AM_TIME_512(data2,1,'db5');%a(6)��1
[ interval_successrate_flag3,T_interval_continuity_HR3] = AM_TIME_512(data2,0,'db5');%a(6)��0
[ interval_successrate_flag_cd1_3,T_interval_continuity_HR_cd1_3] = AM_TIME_512_2(data2,'db5');
 
%[ interval_successrate_flag_B,T_interval_continuity_HR_B] = AM_TIME_512_B(data2);

flag=0;
heartrate_value=0;
T_F_adiff=[];

if possible_interval_flag==1    %��ѡһ������Ƶ���ֵ
    for i=1:comparing_times
        T_F_adiff(i)=abs(F_interval_continuity_HR-freq_HR_array(i));
    end
    [a_min_indicate,~]=min(T_F_adiff); %����С�Ĳ�ֵ
    if a_min_indicate<10
        flag=1;
        heartrate_value=F_interval_continuity_HR;
    end
elseif possible_interval_flag2==1
    for i=1:comparing_times2
        T_F_adiff(i)=abs(F_interval_continuity_HR-freq_HR_array2(i));
    end
    [a_min_indicate,~]=min(T_F_adiff); %����С�Ĳ�ֵ
    if a_min_indicate<10
        flag=1;
        heartrate_value=F_interval_continuity_HR2;
    end
elseif possible_interval_flag3==1
    for i=1:comparing_times3
        T_F_adiff(i)=abs(F_interval_continuity_HR-freq_HR_array3(i));
    end
    [a_min_indicate,~]=min(T_F_adiff); %����С�Ĳ�ֵ
    if a_min_indicate<10
        flag=1;
        heartrate_value=F_interval_continuity_HR3;
    end
    

    
elseif interval_successrate_flag_a>=1
        flag=2;
        heartrate_value=T_interval_continuity_HR_a;
elseif interval_successrate_flag_b>=1
        flag=2;
        heartrate_value=T_interval_continuity_HR_b;
elseif interval_successrate_flag_c>=1
        flag=2;
        heartrate_value=T_interval_continuity_HR_c;


elseif interval_successrate_flag>=1     %��ѡ����ʱ�����͵ļ����Ƶ������Ƚ�
        flag=3;
        heartrate_value=T_interval_continuity_HR;
elseif interval_successrate_flag2>=1
        flag=3;
        heartrate_value=T_interval_continuity_HR2;
elseif interval_successrate_flag3>=1
        flag=3;
        heartrate_value=T_interval_continuity_HR3;

    
    
    
    
    
    
elseif interval_successrate_flag_cd1>=1
    for i=1:comparing_times
        T_F_adiff(i)=abs(T_interval_continuity_HR_cd1-freq_HR_array(i));
    end
    [a_min_indicate,~]=min(T_F_adiff); %����С�Ĳ�ֵ
    if a_min_indicate<10 
        flag=4;
        heartrate_value=T_interval_continuity_HR_cd1;
     end
elseif interval_successrate_flag_cd1_2>=1
    for i=1:comparing_times2
        T_F_adiff(i)=abs(T_interval_continuity_HR_cd1_2-freq_HR_array2(i));
    end
    [a_min_indicate,~]=min(T_F_adiff); %����С�Ĳ�ֵ
    if a_min_indicate<10
        flag=4;
        heartrate_value=T_interval_continuity_HR_cd1_2;
    end
elseif interval_successrate_flag_cd1_3>=1
    for i=1:comparing_times3
        T_F_adiff(i)=abs(T_interval_continuity_HR_cd1_3-freq_HR_array3(i));
    end
    [a_min_indicate,~]=min(T_F_adiff); %����С�Ĳ�ֵ
    if a_min_indicate<10
        flag=4;
        heartrate_value=T_interval_continuity_HR_cd1_3;
    end
    
    
% elseif interval_successrate_flag_B>=1
%      for i=1:comparing_times3
%         T_F_adiff(i)=abs(T_interval_continuity_HR_B-freq_HR_array3(i));
%      end
%      [a_min_indicate,~]=min(T_F_adiff); %����С�Ĳ�ֵ
%      if a_min_indicate<10
%         flag=4;
%         heartrate_value=T_interval_continuity_HR_B;
%      end
    
    
else
    flag=0;
    heartrate_value=0;
end



end

