function [processed_data,black_and_red,black_and_red_low] = AM_TIME_2048_3(data,a,wavename)
%������ԭʼ����

    %coif5��sym5��db5��a(6)����
    [processed_data] = wavelet_process(data,a,lower(wavename));%���صõ������Ѿ�ȥ�����ߵ�BCG��a(6)Ϊ1���ñ�����Ϊ0������
    
    %-----------30���--------black------------------
    [findpeaks_time_domain_max] = findpeaks_1536_2048(processed_data,1,2025);%�ҵ�black���  2017��2025
    peaks_count_max=length(findpeaks_time_domain_max);%�ҵ��ķ�ֵ����
    %-----------���δ���------black-------------------
    %���ҵ��ķ����й��ˡ�black
    [new_findpeaks_time_domain_max] = second_filtration(processed_data ,findpeaks_time_domain_max, peaks_count_max);
    [original_interval_black] = HR_calculate3( new_findpeaks_time_domain_max );
    %==========================================================================================================
    %------------30���----------red------------------
    [findpeaks_time_domain_min] = findpeaks_1536_2048(processed_data,0,2025);%�ҵ�red���  2017��2025
    peaks_count_min=length(findpeaks_time_domain_min);%�ҵ��ķ�ֵ������ֵ����Ϊp-1
    %------------���δ���-----------red------------
    %���ҵ��ķ����й��ˡ�red
    [new_findpeaks_time_domain_min] = second_filtration(processed_data ,findpeaks_time_domain_min, peaks_count_min);
    [original_interval_red] = HR_calculate3( new_findpeaks_time_domain_min );
    %=======================================arithmetic2======================================================
   
    black_and_red=[];
    black_and_red=[original_interval_black,original_interval_red];
    
    
    
    %100�ļ��
    [findpeaks_time_domain_max] = findpeaks_100(processed_data,1,1947);%�ҵ�black���  2017��2025
    peaks_count_max=length(findpeaks_time_domain_max);%�ҵ��ķ�ֵ����
    %-----------���δ���------black-------------------
    %���ҵ��ķ����й��ˡ�black
    [new_findpeaks_time_domain_max] = second_filtration(processed_data ,findpeaks_time_domain_max, peaks_count_max);
    [original_interval_black_low] = HR_calculate3( new_findpeaks_time_domain_max );
    %===========================================================================
    [findpeaks_time_domain_min] = findpeaks_100(processed_data,0,1947);%�ҵ�red���  2017��2025
    peaks_count_min=length(findpeaks_time_domain_min);%�ҵ��ķ�ֵ������ֵ����Ϊp-1
    %------------���δ���-----------red------------
    %���ҵ��ķ����й��ˡ�red
    [new_findpeaks_time_domain_min] = second_filtration(processed_data ,findpeaks_time_domain_min, peaks_count_min);
    [original_interval_red_low] = HR_calculate3( new_findpeaks_time_domain_min );
    
    black_and_red_low=[];
    black_and_red_low=[original_interval_black_low,original_interval_red_low];
    
    
end

