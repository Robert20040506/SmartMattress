function [heart_value] = function_synthesize_arithmetic_2048_3( data )

    %figure(2);
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

        

    %[ ~,possible_interval_flag,F_interval_continuity_HR ,~,~,comparing_times,freq_HR_array] = AM_FREQ_1024( data2,'coif5',0); %a(6)��0
    [ black_and_red_array1] = AM_TIME_2048_3(data2,1,'coif5');%a(6)��1
    [ black_and_red_array2] = AM_TIME_2048_3(data2,0,'coif5');%a(6)��0
    [ black_and_red_array3] = AM_TIME_2048_3_2(data2,'coif5');

    %[ ~,possible_interval_flag2,F_interval_continuity_HR2 ,~,~,comparing_times2,freq_HR_array2] = AM_FREQ_1024( data2,'sym5',0); %a(6)��0
    [ black_and_red_array4] = AM_TIME_2048_3(data2,1,'sym5');%a(6)��1
    [ black_and_red_array5] = AM_TIME_2048_3(data2,0,'sym5');%a(6)��0
    [ black_and_red_array6] = AM_TIME_2048_3_2(data2,'sym5');

    %[ ~,possible_interval_flag3,F_interval_continuity_HR3 ,~,~,comparing_times3,freq_HR_array3] = AM_FREQ_1024( data2,'sym5',0); %a(6)��0
    [ black_and_red_array7] = AM_TIME_2048_3(data2,1,'db5');%a(6)��1
    [ black_and_red_array8] = AM_TIME_2048_3(data2,0,'db5');%a(6)��0
    [ black_and_red_array9] = AM_TIME_2048_3_2(data2,'db5');

    large_array=[];
    large_array=[black_and_red_array1,black_and_red_array2,black_and_red_array3,black_and_red_array4,black_and_red_array5,black_and_red_array6,black_and_red_array7,black_and_red_array8,black_and_red_array9];
    
    
    
    %{
    %�Լ�д��function hist����
    range_statistics_30_250=zeros(1,176);
     for i=1:length(large_array)
         for j=24:200
             if(j==large_array(i))
                 range_statistics_30_250(j-23)=range_statistics_30_250(j-23)+1;
             end
         end
     end
    
     range_statistics_30_250_double=zeros(1,176);
     for i=5:171
         for j=i-4:i+3
           range_statistics_30_250_double(i)=range_statistics_30_250_double(i)+range_statistics_30_250(j);
         end
     end
    %plot(range_statistics_30_250_double)
    %}
    
    %�Լ�д��function hist����  ��  
    range_statistics_30_250=zeros(1,179);
     for i=1:length(large_array)
         for j=22:200
             if(j==large_array(i))
                 range_statistics_30_250(j-21)=range_statistics_30_250(j-21)+1;
             end
         end
     end
    
    
    
    [a,b]=max(range_statistics_30_250);%a��ֵ��c������
    %disp(['����',num2str(round(6000/(b+23)))])
    heart_value=num2str(round(6000/(b+22)));
   
%     figure(2);
%     hist(large_array)
    
    
    
 end

