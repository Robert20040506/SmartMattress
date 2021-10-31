function [ T_interval_continuity_HR ] = function_heartrate_30( data4,datalength)
%�˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵
%����������������30-60֮��ϵ͵����ʵ�(����BCGģ����)
    threshold=0.04; %�ж���ֵ%0.2�Ļ�������ЩС��ģ����Ըĵ�0.1������Ч����������0.04��0.02
     data2=data4;
    %3��Ԫ�صĴ���
    for i=2:(length(data2)-1)%�ڶ�����������ڶ���
        a=abs(data2(i)-data2(i-1));
        b=abs(data2(i)-data2(i+1));
         if((a>=threshold)&&(b>=threshold))
             data2(i)=mean(data2(i-1)+data2(i+1))/2;
         end
    end
%data2���쳣��ȥ����������


    if(datalength==1536)
        max_limit=1435;
    elseif(datalength==2048)
        max_limit=1947;
    else
        error(message('Input parameter wrong'));
    end
    
    %AM_TIME_1024(data2,1,'coif5');%a(6)��1
    
    [processed_data] = wavelet_process(data2,1,'coif5');%���صõ������Ѿ�ȥ�����ߵ�BCG��a(6)Ϊ1���ñ�����Ϊ0������
    %/////////////////////
%     stem(processed_data)
%     hold on
    %/////////////////////
    %-----------30���--------black------------------
    [findpeaks_time_domain_max] = findpeaks_100(processed_data,1,max_limit);%�ҵ�black���  1435��1536�����ݳ��� 1947��2048�����ݳ���
    peaks_count_max=length(findpeaks_time_domain_max);%�ҵ��ķ�ֵ����
    %/////////////////////
%     for i=1:peaks_count_max
%         %subplot(3,1,2);
%         plot(findpeaks_time_domain_max(i),processed_data(findpeaks_time_domain_max(i)),'ok');hold on             %���ҵ��ķ�ֵ��ȦȦ
%     end
    %/////////////////////
    %-----------���δ���------black-------------------
    %���ҵ��ķ����й��ˡ�black
    [new_findpeaks_time_domain_max] = second_filtration(processed_data ,findpeaks_time_domain_max, peaks_count_max);
    %////////////////////
%     for i=1:length(new_findpeaks_time_domain_max)
%         plot(new_findpeaks_time_domain_max(i),processed_data(new_findpeaks_time_domain_max(i)),'*k');hold on             %���ҵ��ķ�ֵ��ȦȦ
%     end
    %////////////////////
    [original_interval_black , statistics_array_2D_black , statistics_array_black  , max_statistics_red , flag_2D_black , a_max_flag(1) , max_flag_value(1) , row_n11 , column_n11] = HR_calculate( new_findpeaks_time_domain_max );
    
    %==========================================================================================================
    %------------30���----------red------------------
    [findpeaks_time_domain_min] = findpeaks_100(processed_data,0,max_limit);%�ҵ�red���
    peaks_count_min=length(findpeaks_time_domain_min);%�ҵ��ķ�ֵ������ֵ����Ϊp-1
    %//////////////////////
%     for i=1:peaks_count_min
%         %subplot(3,1,3);
%         plot(findpeaks_time_domain_min(i),processed_data(findpeaks_time_domain_min(i)),'or');hold on             %���ҵ��ķ�ֵ��ȦȦ
%     end
    %//////////////////////
    %------------���δ���-----------red------------
    %���ҵ��ķ����й��ˡ�red
    [new_findpeaks_time_domain_min] = second_filtration(processed_data ,findpeaks_time_domain_min, peaks_count_min);
%     for i=1:length(new_findpeaks_time_domain_min)
%         plot(new_findpeaks_time_domain_min(i),processed_data(new_findpeaks_time_domain_min(i)),'*r');hold on             %���ҵ��ķ�ֵ��ȦȦ
%     end
    [original_interval_red , statistics_array_2D_red , statistics_array_red  , max_statistics_black , flag_2D_red , a_max_flag(2) , max_flag_value(2) , row_n12 , column_n12] = HR_calculate( new_findpeaks_time_domain_min );
    %=======================================arithmetic2======================================================
   
    
    
    
    %------����ɸѡ----��һ��----
    %-----����ƥ���-------

    %=====================���30����=================
    
%     if(a_max_flag(1)>=5)
%        
%         heartrate_level_flag=1;
%         heartrate_time_domain_interval=round(max_flag_value(1));
%     elseif(a_max_flag(2)>=5)
%         
%         heartrate_level_flag=1;
%         heartrate_time_domain_interval=round(max_flag_value(2));
    middelvalue=abs(max_flag_value(1)-max_flag_value(2));
    if(a_max_flag(1)>=5)&&(a_max_flag(2)>=5)&&(middelvalue<=10)
        heartrate_level_flag=1;
        heartrate_time_domain_interval=round(max_flag_value(1));     
    else
        %û���ҵ��Ļ�               
        heartrate_time_domain_interval=0;   
        heartrate_level_flag=0;             
    end

    %======================���һ������Ҫ�ǿ�����С���ĵ���(black��redd)

    
    if heartrate_level_flag==1
        %T_interval_continuity_HR=roundn(60/(heartrate_time_domain_interval*0.010),-2);%�������������Ϊ0.�������ܻ�����Чֵ
        %T_interval_continuity_HR=60/(heartrate_time_domain_interval*0.010);%�������������Ϊ0.�������ܻ�����Чֵ
        T_interval_continuity_HR=round(60/(heartrate_time_domain_interval*0.010));%�������������Ϊ0.�������ܻ�����Чֵ

    else
        T_interval_continuity_HR=0;
    end

end

