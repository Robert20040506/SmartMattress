function [ flag,heartrate_value ] = function_synthesize_arithmetic_1024( data )


    threshold=0.04; %�ж���ֵ%0.2�Ļ�������ЩС��ģ����Ըĵ�0.1������Ч����������0.04��0.02
     data2=data;
    %3��Ԫ�صĴ���
    for i=2:(length(data)-1)%�ڶ�����������ڶ���
        a=abs(data2(i)-data2(i-1));
        b=abs(data2(i)-data2(i+1));
         if((a>=threshold)&&(b>=threshold))
             data2(i)=mean(data2(i-1)+data2(i+1))/2;
         end
    end
    %data2���쳣��ȥ����������

        



    [ ~,possible_interval_flag,F_interval_continuity_HR ,~,~,comparing_times,freq_HR_array] = AM_FREQ_1024( data2,'coif5',0); %a(6)��0
    [ interval_successrate_flag_a,T_interval_continuity_HR_a] = AM_TIME_1024(data2,1,'coif5');%a(6)��1
    [ interval_successrate_flag,T_interval_continuity_HR] = AM_TIME_1024(data2,0,'coif5');%a(6)��0
    [ interval_successrate_flag_cd1,T_interval_continuity_HR_cd1] = AM_TIME_1024_2(data2,'coif5');

    [ ~,possible_interval_flag2,F_interval_continuity_HR2 ,~,~,comparing_times2,freq_HR_array2] = AM_FREQ_1024( data2,'sym5',0); %a(6)��0
    [ interval_successrate_flag_b,T_interval_continuity_HR_b] = AM_TIME_1024(data2,1,'sym5');%a(6)��1
    [ interval_successrate_flag2,T_interval_continuity_HR2] = AM_TIME_1024(data2,0,'sym5');%a(6)��0
    [ interval_successrate_flag_cd1_2,T_interval_continuity_HR_cd1_2] = AM_TIME_1024_2(data2,'sym5');

    [ ~,possible_interval_flag3,F_interval_continuity_HR3 ,~,~,comparing_times3,freq_HR_array3] = AM_FREQ_1024( data2,'sym5',0); %a(6)��0
    [ interval_successrate_flag_c,T_interval_continuity_HR_c] = AM_TIME_1024(data2,1,'db5');%a(6)��1
    [ interval_successrate_flag3,T_interval_continuity_HR3] = AM_TIME_1024(data2,0,'db5');%a(6)��0
    [ interval_successrate_flag_cd1_3,T_interval_continuity_HR_cd1_3] = AM_TIME_1024_2(data2,'db5');


    flag=0;
    heartrate_value=0;
    T_F_adiff=[];

    if possible_interval_flag==1    %��ѡһ������Ƶ���ֵ
%         for i=1:comparing_times
%             T_F_adiff(i)=abs(F_interval_continuity_HR-freq_HR_array(i));
%         end
%         [a_min_indicate,~]=min(T_F_adiff); %����С�Ĳ�ֵ
%         if a_min_indicate<10
            flag=1;
            heartrate_value=F_interval_continuity_HR;
%         end
    elseif possible_interval_flag2==1
%         for i=1:comparing_times
%             T_F_adiff(i)=abs(F_interval_continuity_HR-freq_HR_array(i));
%         end
%         [a_min_indicate,~]=min(T_F_adiff); %����С�Ĳ�ֵ
%         if a_min_indicate<10
            flag=1;
            heartrate_value=F_interval_continuity_HR2;
%         end
    elseif possible_interval_flag3==1
%         for i=1:comparing_times
%             T_F_adiff(i)=abs(F_interval_continuity_HR-freq_HR_array(i));
%         end
%         [a_min_indicate,~]=min(T_F_adiff); %����С�Ĳ�ֵ
%         if a_min_indicate<10
            flag=1;
            heartrate_value=F_interval_continuity_HR3;
%         end



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
        %���Ϊ1��2��3��ֻҪ��Ϊ0�Ļ�
    %     for i=1:comparing_times
    %         T_F_adiff(i)=abs(T_interval_continuity_HR-freq_HR_array(i));
    %     end
    %     [a_min_indicate,~]=min(T_F_adiff); %����С�Ĳ�ֵ
    %     %ʱ���Ƶ���ֵ�Ƚ�С�Ļ�
    %     if a_min_indicate<10
             flag=3;
             heartrate_value=T_interval_continuity_HR;
    %     end
    elseif interval_successrate_flag2>=1
    %     for i=1:comparing_times2
    %         T_F_adiff(i)=abs(T_interval_continuity_HR2-freq_HR_array2(i));
    %     end
    %     [a_min_indicate,~]=min(T_F_adiff); %����С�Ĳ�ֵ
    %     if a_min_indicate<10
             flag=3;
             heartrate_value=T_interval_continuity_HR2;
    %     end
    elseif interval_successrate_flag3>=1
    %     for i=1:comparing_times3
    %         T_F_adiff(i)=abs(T_interval_continuity_HR3-freq_HR_array3(i));
    %     end
    %     [a_min_indicate,~]=min(T_F_adiff); %����С�Ĳ�ֵ
    %     if a_min_indicate<10
            flag=3;
            heartrate_value=T_interval_continuity_HR3;
    %     end






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

