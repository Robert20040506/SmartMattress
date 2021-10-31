function [ interval_successrate_flag_cd1,T_interval_continuity_HR_cd1] = AM_TIME_1024_2(data,wavename)
%������ԭʼ����

    %coif5��sym5��db5��a(6)����
    %[processed_data] = wavelet_process(data,0,lower(wavename));%���صõ������Ѿ�ȥ�����ߵ�BCG���Ҵ˴�a(6)������
    
        %--------------------------------------------------------------
        %-----------------arithmetic1----�ó���ֻ�ֽ�һ��-------------
        %--------------------------------------------------------------
        nt=1;
        [ct,lt] = wavedec(data,nt,wavename);
        [cd1t]=detcoef(ct,lt,1);
        at=max(cd1t);
        thr2t=at(1);
        cxt = wthcoef('t',ct,lt,1:nt,thr2t,'s');
        lxt = lt;
        xt = waverec(cxt,lxt,wavename);

        processed_data=data-xt;

        %------------------------------------------------------------
        %------------------------arithmetic1-------------------------
        %------------------------------------------------------------
    
    
    
    
    %-----------30���--------black------------------
    [findpeaks_time_domain_max] = findpeaks_1024(processed_data,1);%�ҵ�black���
    peaks_count_max=length(findpeaks_time_domain_max);%�ҵ��ķ�ֵ����
    %-----------���δ���------black-------------------
    %���ҵ��ķ����й��ˡ�black
    [new_findpeaks_time_domain_max] = second_filtration(processed_data ,findpeaks_time_domain_max, peaks_count_max);
    [statistics_array_black,flag_2D_black,a_max_flag(1),max_flag_value(1)] = HR_calculate( new_findpeaks_time_domain_max );
    %==========================================================================================================
    %------------30���----------red------------------
    [findpeaks_time_domain_min] = findpeaks_1024(processed_data,0);%�ҵ�red���
    peaks_count_min=length(findpeaks_time_domain_min);%�ҵ��ķ�ֵ������ֵ����Ϊp-1
    %------------���δ���-----------red------------
    %���ҵ��ķ����й��ˡ�red
    [new_findpeaks_time_domain_min] = second_filtration(processed_data ,findpeaks_time_domain_min, peaks_count_min);
    [statistics_array_2D_red,flag_2D_red,a_max_flag(2),max_flag_value(2)] = HR_calculate( new_findpeaks_time_domain_min );
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
    if (a_matching_degree_max>=867.6)&&(a_matching_degree_max<1024)      %------90%��-------
        interval_successrate_flag_cd1=1;                         %��ע׼ȷ�ʵȼ�
        heartrate_level_flag=1;         %�ҵ��ı�־
        heartrate_time_domain_interval=max_flag_value(b_matching_degree_max);
    elseif (a_matching_degree_max>=771.2)&&(a_matching_degree_max<1024)	%------80%��-------
        interval_successrate_flag_cd1=2;                         %��ע׼ȷ�ʵȼ�
        heartrate_level_flag=1;         %�ҵ��ı�־
        heartrate_time_domain_interval=max_flag_value(b_matching_degree_max);
    elseif (a_matching_degree_max>=674.8)&&(a_matching_degree_max<1024)  %------70%��-------
        interval_successrate_flag_cd1=3;                         %��ע׼ȷ�ʵȼ�
        heartrate_level_flag=1;         %�ҵ��ı�־
        heartrate_time_domain_interval=max_flag_value(b_matching_degree_max);
        %--------------60%�Ļ���׼ȷ��̫���ˣ����Ծ�����------��Ҫ�Եڶ��׶εķ�ʽ�Ƴ�
    else
        %û���ҵ�70%�ĵ�Ļ�
        interval_successrate_flag_cd1=0;                             
        heartrate_time_domain_interval=0;   
        heartrate_level_flag=0;             
    end


    %======================���һ������Ҫ�ǿ�����С���ĵ���(black��redd)
    %���ȷʵ��coif5��sym5��db5����һ���͵�ǰ����ƥ��Ƚϸ�90%���ϵ�ƥ��ȵĻ�,һ��Ҫ�������������ҪҪ��Ϊ��������20���ڣ��������������
    %��������70%���ϵİ�
    
    if heartrate_level_flag==1
        T_interval_continuity_HR_cd1=60/(heartrate_time_domain_interval*0.010);
    else
        T_interval_continuity_HR_cd1=0;
    end
    
    
end

