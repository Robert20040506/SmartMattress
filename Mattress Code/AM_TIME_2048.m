function [interval_successrate_flag,T_interval_continuity_HR] = AM_TIME_2048 3(data,a,wavename)
%������ԭʼ����

    %coif5��sym5��db5��a(6)����
    [processed_data] = wavelet_process(data,a,lower(wavename));%���صõ������Ѿ�ȥ�����ߵ�BCG��a(6)Ϊ1���ñ�����Ϊ0������
   
    %-----------30���--------black------------------
    [findpeaks_time_domain_max] = findpeaks_1536_2048(processed_data,1,2017);%�ҵ�black���
    peaks_count_max=length(findpeaks_time_domain_max);%�ҵ��ķ�ֵ����
    %-----------���δ���------black-------------------
    %���ҵ��ķ����й��ˡ�black
    [new_findpeaks_time_domain_max] = second_filtration(processed_data ,findpeaks_time_domain_max, peaks_count_max);
    [statistics_array_black,flag_2D_black,a_max_flag(1),max_flag_value(1)] = HR_calculate2( new_findpeaks_time_domain_max );
    %==========================================================================================================
    %------------30���----------red------------------
    [findpeaks_time_domain_min] = findpeaks_1536_2048(processed_data,0,2017);%�ҵ�red���
    peaks_count_min=length(findpeaks_time_domain_min);%�ҵ��ķ�ֵ������ֵ����Ϊp-1
    %------------���δ���-----------red------------
    %���ҵ��ķ����й��ˡ�red
    [new_findpeaks_time_domain_min] = second_filtration(processed_data ,findpeaks_time_domain_min, peaks_count_min);
    [statistics_array_2D_red,flag_2D_red,a_max_flag(2),max_flag_value(2)] = HR_calculate2( new_findpeaks_time_domain_min );
    %=======================================arithmetic2======================================================
   
    
   
    
    %------����ɸѡ----��һ��----
    %-----����ƥ���-------
    matching_degree=[];
    %heartrate_level=0;                  %��ʼ��׼ȷ�ʵȼ�
    %heartrate_time_domain_interval=0;   %��ʼ��ʱ����
    %heartrate_level_0_flag=0;           %��ʼ������ҵ���־
    for i=1:2
        matching_degree(i)=a_max_flag(i)*max_flag_value(i);%��������ֵ
    end
    [a_matching_degree_max,b_matching_degree_max]=max(matching_degree);
    if (a_matching_degree_max>=1700)&&(a_matching_degree_max<=2048)      %------90%��-------
       interval_successrate_flag=1;                          %��ע׼ȷ�ʵȼ�
        heartrate_level_flag=1;         %�ҵ��ı�־
        heartrate_time_domain_interval=max_flag_value(b_matching_degree_max);
    elseif (a_matching_degree_max>=1466)&&(a_matching_degree_max<=2048)	%------80%��-------
        interval_successrate_flag=1;                         %��ע׼ȷ�ʵȼ�
        heartrate_level_flag=1;         %�ҵ��ı�־
        heartrate_time_domain_interval=max_flag_value(b_matching_degree_max);
    elseif (a_matching_degree_max>=1300)&&(a_matching_degree_max<=2048)  %------70%��-------
        interval_successrate_flag=1;                         %��ע׼ȷ�ʵȼ�
        heartrate_level_flag=1;         %�ҵ��ı�־
        heartrate_time_domain_interval=max_flag_value(b_matching_degree_max);
        %--------------60%�Ļ���׼ȷ��̫���ˣ����Ծ�����------��Ҫ�Եڶ��׶εķ�ʽ�Ƴ�
    else
        %û���ҵ�70%�ĵ�Ļ�
         interval_successrate_flag=0;                          
        heartrate_time_domain_interval=0;   
        heartrate_level_flag=0;             
    end


    %======================���һ������Ҫ�ǿ�����С���ĵ���(black��redd)
    %���ȷʵ��coif5��sym5��db5����һ���͵�ǰ����ƥ��Ƚϸ�90%���ϵ�ƥ��ȵĻ�,һ��Ҫ�������������ҪҪ��Ϊ��������20���ڣ��������������
    %��������70%���ϵİ�
    
    if heartrate_level_flag==1
        T_interval_continuity_HR=60/(heartrate_time_domain_interval*0.010);%�������������Ϊ0.�������ܻ�����Чֵ
    else
        T_interval_continuity_HR=0;
    end
    
    
end

