

%------�������Ų�ͬС��������black��red��Ч��������ͬʱչʾ���ҵ���black��red�Ա�-------

clc;clf;clear all



%============================������=======================================================

% load('G:\ocamar\���ձȽ�\10������ǰ����\10_20_function_t_and_f_����(_�۰���+�������)�������.mat')
% datat=data(520:11543);
%datat=data(12920:21016);


% load('G:\ocamar\�з��ɼ�����12-15��\1-26������\��У��(1).mat')
% datat=data(1:10880);


%load('G:\ocamar\�з��ɼ�����12-15��\1-26������\������(1).mat')
%datat=data(937:14267);
%datat=data(16026:33028);
%datat=data(35246:39678);

%load('G:\ocamar\�з��ɼ�����12-15��\1-26������\���(1).mat')
%datat=data(21050:28117);
%datat=data(29061:39221);
%datat=data(39872:51145);

load('G:\ocamar\�з��ɼ�����12-15��\1-26������\����(1).mat')
datat=data(13320:23542);

%========================================================================================================


%load('G:\ocamar\ǰ�ڲ���\9_11_heart_rate8���۰�������(1).mat')%��������1
%datat=data(48120:71800);%����
%datat=data(10847:42338);%����

% load('G:\ocamar\�з��ɼ�����12-15��\2M+RADC12_16����+����(1).mat')
% datat=data(1750:16541);
%datat=data(17298:24200);

% load('G:\ocamar\�з��ɼ�����12-15��\2M+RADC12_17����+���(2).mat')
%datat=data(2163:18683);
% datat=data(33093:55280);

% load('G:\ocamar\�з��ɼ�����12-15��\5M+RADC12_19����(1).mat')
% datat=data(3899:13345);


%load('G:\ocamar\�з��ɼ�����12-15��\5M+RADC12_19����(2).mat')
%datat=data(1400:13842);
%datat=data(14942:21130);
%datat=data(22125:30992);

%load('G:\ocamar\�з��ɼ�����12-15��\�������ݶ�.mat')
%datat=data(1300:6437);
%datat=data(7843:17774);
%datat=data(19914:25535);
%datat=data(27000:35535);

% load('G:\ocamar\�з��ɼ�����12-15��\analog switch test\ͨ��4_10M_����+����_����_����2.mat')
% datat=data(1584:14766);
%datat=data(15963:23882);
%datat=data(24876:29660);


%�ɼ���ר��FFT
Fs=100;     %������
N=1024;     %��������
nt =0:N-1;   %��������
f=nt*Fs/N;   %��ʵ��Ƶ��
% figure(2);



a_max_flag=[];
max_flag_value=[];
result=[];
fig = figure(1);



% while ishandle(fig)
       for t=1:fix(length(datat)/512)
        t
        start=t*512;
        data_iteration=datat(start:start+511);
        
        
        %--------------------------------------------------------------
        %-----------------arithmetic1----�ó���ֻ�ֽ�һ��-------------
        %--------------------------------------------------------------
        %     nt=1;
        %     [ct,lt] = wavedec(data_iteration,nt,'db5');
        %     [cd1t]=detcoef(ct,lt,1);
        %     at=max(cd1t);
        %     thr2t=at(1);
        %     cxt = wthcoef('t',ct,lt,1:nt,thr2t,'s');
        %     lxt = lt;
        %     xt = waverec(cxt,lxt,'db5');
        %    
        %     new_data2=data_iteration-xt;
        %     subplot(2,1,1);
        %     plot(new_data2)
        %     hold on
        %------------------------------------------------------------
        %------------------------arithmetic1-------------------------
        %------------------------------------------------------------





        %==========================arithmetic2----coif5��sym5��db5��a(6)����==========================================
        [new_data2] = wavelet_process(data_iteration,0,'coif5');%���صõ������Ѿ�ȥ�����ߵ�BCG���Ҵ˴�a(6)������
        subplot(3,1,1);
        plot(new_data2)
        hold on
        %-----------30���--------black------------------
        [findpeaks_time_domain_max] = findpeaks(new_data2,1);%�ҵ�black���
        peaks_count_max=length(findpeaks_time_domain_max);%�ҵ��ķ�ֵ����
        for i=1:peaks_count_max
            subplot(3,1,1);
            plot(findpeaks_time_domain_max(i),new_data2(findpeaks_time_domain_max(i)),'ok');hold on             %���ҵ��ķ�ֵ��ȦȦ
        end
        %-----------���δ���------black-------------------
        %���ҵ��ķ����й��ˡ�black
        [new_findpeaks_time_domain_max] = second_filtration(new_data2 ,findpeaks_time_domain_max, peaks_count_max);
        for i=1:length(new_findpeaks_time_domain_max)
            plot(new_findpeaks_time_domain_max(i),new_data2(new_findpeaks_time_domain_max(i)),'*k');hold on             %���ҵ��ķ�ֵ��ȦȦ
        end
        [statistics_array_2D,flag_2D,a_max_flag(t,1),max_flag_value(t,1)] = HR_calculate( new_findpeaks_time_domain_max );
        %==========================================================================================================
        %------------30���----------red------------------
        [findpeaks_time_domain_min] = findpeaks(new_data2,0);%�ҵ�red���
        peaks_count_min=length(findpeaks_time_domain_min);%�ҵ��ķ�ֵ������ֵ����Ϊp-1
        for i=1:peaks_count_min
            subplot(3,1,1);
            plot(findpeaks_time_domain_min(i),new_data2(findpeaks_time_domain_min(i)),'or');hold on             %���ҵ��ķ�ֵ��ȦȦ
        end
        %------------���δ���-----------red------------
        %���ҵ��ķ����й��ˡ�red
        [new_findpeaks_time_domain_min] = second_filtration(new_data2 ,findpeaks_time_domain_min, peaks_count_min);
        for i=1:length(new_findpeaks_time_domain_min)
            plot(new_findpeaks_time_domain_min(i),new_data2(new_findpeaks_time_domain_min(i)),'*r');hold on             %���ҵ��ķ�ֵ��ȦȦ
        end
        [statistics_array_2D2,flag_2D2,a_max_flag(t,2),max_flag_value(t,2)] = HR_calculate( new_findpeaks_time_domain_min );
        hold off
        %=======================================arithmetic2======================================================
        %ֱ����չ 
        expend_data1=flip(new_data2);
        new_data1=[new_data2,expend_data1];%Ҫȫ��ת�ó�һά����
        y1=fft(new_data1,N);
        Mag1=abs(y1)*2/N;
        
%         stem(f(1:end),Mag(1:end));
%         plot(f(1:end),Mag(1:end));
%         axis([0 23 0 0.002]);
%         xticks(0:100);
%         title('��Ƶ��Ӧ');xlabel('Ƶ��/Hz');ylabel('����');
        
        
        
        
        
        
        
        
        
        
        
        
        
        


        %============================arithmetic2.1==========coif5��sym5��db5��a(6)����============================
%         [new_data2] = wavelet_process(data_iteration,1,'coif5');%���صõ������Ѿ�ȥ�����ߵ�BCG���Ҵ˴�a(6)����1
%         subplot(3,1,1);
%         plot(new_data2)
%         hold on
%         %-----------30���--------black-------
%         [findpeaks_time_domain_max] = findpeaks(new_data2,1);%�ҵ�black���
%         peaks_count_max=length(findpeaks_time_domain_max);%�ҵ��ķ�ֵ����
%         for i=1:peaks_count_max
%             subplot(3,1,1);
%             plot(findpeaks_time_domain_max(i),new_data2(findpeaks_time_domain_max(i)),'ok');hold on             %���ҵ��ķ�ֵ��ȦȦ
%         end
%          %-----------���δ���------black-------------------
%         %���ҵ��ķ����й��ˡ�black
%         [new_findpeaks_time_domain_max] = second_filtration(new_data2 ,findpeaks_time_domain_max, peaks_count_max);
%         for i=1:length(new_findpeaks_time_domain_max)
%             plot(new_findpeaks_time_domain_max(i),new_data2(new_findpeaks_time_domain_max(i)),'*k');hold on             %���ҵ��ķ�ֵ��ȦȦ
%         end
% 
%         %------------30���----------red------------------
%         [findpeaks_time_domain_min] = findpeaks(new_data2,0);%�ҵ�red���
%         peaks_count_min=length(findpeaks_time_domain_min);%�ҵ��ķ�ֵ������ֵ����Ϊp-1
%         for i=1:peaks_count_min
%             subplot(3,1,1);
%             plot(findpeaks_time_domain_min(i),new_data2(findpeaks_time_domain_min(i)),'or');hold on             %���ҵ��ķ�ֵ��ȦȦ
%         end
%         %------------���δ���-----------red------------
%         %���ҵ��ķ����й��ˡ�red
%         [new_findpeaks_time_domain_min] = second_filtration(new_data2 ,findpeaks_time_domain_min, peaks_count_min);
%         for i=1:length(new_findpeaks_time_domain_min)
%             plot(new_findpeaks_time_domain_min(i),new_data2(new_findpeaks_time_domain_min(i)),'*r');hold on             %���ҵ��ķ�ֵ��ȦȦ
%         end
%         hold off
    	%-------------------------------------------------------------------------------------------------------
        %----------------------arithmetic2.1--------------------------------------------------------------------
        %-------------------------------------------------------------------------------------------------------

        
        
        


















        %disp("===============interval================")




 




        %------------------------------------------------------
        %-------arithmetic3----coif5��sym5��db5��a(6)����-------
        %------------------------------------------------------
        [data_differenced] = wavelet_process(data_iteration,0,'sym5');%���صõ������Ѿ�ȥ�����ߵ�BCG���Ҵ˴�a(6)������
        subplot(3,1,2);
        plot(data_differenced)
        hold on

        %------------------------------------------------------
        %------------------arithmetic3-------------------------
        %------------------------------------------------------

        %     data_differenced=diff(new_data2,1);%һ�ײ��(ȥ���߲��)
        %     subplot(2,1,2);
        %     plot(data_differenced)

        %-----------30���--------black------------------
        [findpeaks_time_domain_max] = findpeaks(data_differenced,1);%�ҵ�black���
        peaks_count_max=length(findpeaks_time_domain_max);%�ҵ��ķ�ֵ����
        for i=1:peaks_count_max
            %subplot(3,1,2);
            plot(findpeaks_time_domain_max(i),data_differenced(findpeaks_time_domain_max(i)),'ok');hold on             %���ҵ��ķ�ֵ��ȦȦ
        end
        %-----------���δ���------black-------------------
        %���ҵ��ķ����й��ˡ�black
        [new_findpeaks_time_domain_max] = second_filtration(data_differenced ,findpeaks_time_domain_max, peaks_count_max);
        for i=1:length(new_findpeaks_time_domain_max)
            plot(new_findpeaks_time_domain_max(i),data_differenced(new_findpeaks_time_domain_max(i)),'*k');hold on             %���ҵ��ķ�ֵ��ȦȦ
        end
        [statistics_array_2D3,flag_2D3,a_max_flag(t,3),max_flag_value(t,3)] = HR_calculate( new_findpeaks_time_domain_max );
        %==========================================================================================================
        %------------30���----------red------------------
        [findpeaks_time_domain_min] = findpeaks(data_differenced,0);%�ҵ�red���
        peaks_count_min=length(findpeaks_time_domain_min);%�ҵ��ķ�ֵ������ֵ����Ϊp-1
        for i=1:peaks_count_min
            %subplot(3,1,2);
            plot(findpeaks_time_domain_min(i),data_differenced(findpeaks_time_domain_min(i)),'or');hold on             %���ҵ��ķ�ֵ��ȦȦ
        end
        %------------���δ���-----------red------------
        %���ҵ��ķ����й��ˡ�red
        [new_findpeaks_time_domain_min] = second_filtration(data_differenced ,findpeaks_time_domain_min, peaks_count_min);
        for i=1:length(new_findpeaks_time_domain_min)
            plot(new_findpeaks_time_domain_min(i),data_differenced(new_findpeaks_time_domain_min(i)),'*r');hold on             %���ҵ��ķ�ֵ��ȦȦ
        end
        [statistics_array_2D4,flag_2D4,a_max_flag(t,4),max_flag_value(t,4)] = HR_calculate( new_findpeaks_time_domain_min );
        hold off





       %disp("===============interval================")




        %----------------------------------------------------------------------------------------------------------------
        %-------arithmetic4----coif5��sym5��db5��a(6)����-----------------------------------------------------------------
        %----------------------------------------------------------------------------------------------------------------
        [data_differenced] = wavelet_process(data_iteration,0,'db5');%���صõ������Ѿ�ȥ�����ߵ�BCG���Ҵ˴�a(6)������
        subplot(3,1,3);
        plot(data_differenced)
        hold on
        %-----------30���--------black------------------
        [findpeaks_time_domain_max] = findpeaks(data_differenced,1);%�ҵ�black���
        peaks_count_max=length(findpeaks_time_domain_max);%�ҵ��ķ�ֵ����
        for i=1:peaks_count_max
            %subplot(3,1,3);
            plot(findpeaks_time_domain_max(i),data_differenced(findpeaks_time_domain_max(i)),'ok');hold on             %���ҵ��ķ�ֵ��ȦȦ
        end
        %-----------���δ���------black-------------------
        %���ҵ��ķ����й��ˡ�black
        [new_findpeaks_time_domain_max] = second_filtration(data_differenced ,findpeaks_time_domain_max, peaks_count_max);
        for i=1:length(new_findpeaks_time_domain_max)
            plot(new_findpeaks_time_domain_max(i),data_differenced(new_findpeaks_time_domain_max(i)),'*k');hold on             %���ҵ��ķ�ֵ��ȦȦ
        end
        [statistics_array_2D5,flag_2D5,a_max_flag(t,5),max_flag_value(t,5)] = HR_calculate( new_findpeaks_time_domain_max );
        %==========================================================================================================
        %------------30���----------red------------------
        [findpeaks_time_domain_min] = findpeaks(data_differenced,0);%�ҵ�red���
        peaks_count_min=length(findpeaks_time_domain_min);%�ҵ��ķ�ֵ������ֵ����Ϊp-1
        for i=1:peaks_count_min
            %subplot(3,1,3);
            plot(findpeaks_time_domain_min(i),data_differenced(findpeaks_time_domain_min(i)),'or');hold on             %���ҵ��ķ�ֵ��ȦȦ
        end
        %------------���δ���-----------red------------
        %���ҵ��ķ����й��ˡ�red
        [new_findpeaks_time_domain_min] = second_filtration(data_differenced ,findpeaks_time_domain_min, peaks_count_min);
        for i=1:length(new_findpeaks_time_domain_min)
            plot(new_findpeaks_time_domain_min(i),data_differenced(new_findpeaks_time_domain_min(i)),'*r');hold on             %���ҵ��ķ�ֵ��ȦȦ
        end
        [statistics_array_2D6,flag_2D6,a_max_flag(t,6),max_flag_value(t,6)] = HR_calculate( new_findpeaks_time_domain_min );
        hold off
        %------------------------------------------------------
        %------------------arithmetic4-------------------------
        %------------------------------------------------------
        
        
        
        %����������� max_flag_value��a_max_flag
        %�ر����1 ���������Ļ�(���ܸ����Ƕ���)
        min_adiff=max(max_flag_value(t,:))-min(max_flag_value(t,:));
        %�ر����2 ȥ��Ϊ1������ʣ�µ�ֵһ���Ļ������
        temp_array=[];
        p=1;
        for z=1:6
            if a_max_flag(t,z)>1
                temp_array(p)=max_flag_value(t,z);
                p=p+1;
            end
        end
        min_adiff2=max(temp_array)-min(temp_array);%ʣ�µĶ�һ���Ļ�
        
        
        %------����ɸѡ----��һ��----
        %-----����ƥ���-------
        matching_degree=[];
        %heartrate_level=0;                  %��ʼ��׼ȷ�ʵȼ�
        %heartrate_time_domain_interval=0;   %��ʼ��ʱ����
        %heartrate_level_0_flag=0;           %��ʼ������ҵ���־
        for i=1:6
            matching_degree(i)=a_max_flag(t,i)*max_flag_value(t,i);
        end
        [a_matching_degree_max,b_matching_degree_max]=max(matching_degree);
        if a_matching_degree_max>406.8 %------90%-------
            heartrate_level=1;              %��ע׼ȷ�ʵȼ�
            heartrate_level_flag=1;       %��ʼ�����
            heartrate_time_domain_interval=max_flag_value(t,b_matching_degree_max);
        elseif a_matching_degree_max>361.6 %------80%-------
            heartrate_level=2;              %��ע׼ȷ�ʵȼ�
            heartrate_level_flag=1;       %��ʼ�����
            heartrate_time_domain_interval=max_flag_value(t,b_matching_degree_max);
        elseif a_matching_degree_max>316.4 %------70%-------
            heartrate_level=3;              %��ע׼ȷ�ʵȼ�
            heartrate_level_flag=1;       %��ʼ�����
            heartrate_time_domain_interval=max_flag_value(t,b_matching_degree_max);
        elseif a_matching_degree_max>271.2 %------60%-------
            heartrate_level=4;              %��ע׼ȷ�ʵȼ�
            heartrate_level_flag=1;       %��ʼ�����
            heartrate_time_domain_interval=max_flag_value(t,b_matching_degree_max);
            %--------------60%�Ļ���׼ȷ��̫���ˣ����Ծ�����------��Ҫ�Եڶ��׶εķ�ʽ�Ƴ�
        elseif min_adiff<6          %˵������ֵ���
            heartrate_level=5;
            heartrate_level_flag=1;
            heartrate_time_domain_interval=mean(max_flag_value(t,:));
        elseif min_adiff2<6          %˵������ֵ���
            heartrate_level=6;
            heartrate_level_flag=1;
            heartrate_time_domain_interval=mean(temp_array);
        else
            heartrate_level=0;                  %��ʼ��׼ȷ�ʵȼ�
            heartrate_time_domain_interval=0;   %��ʼ��ʱ����
            heartrate_level_flag=0;           %��ʼ������ҵ���־
        end
        
        
        
        
        
        %======================���һ������Ҫ�ǿ�����С���ĵ���(black��redd)
        %���ȷʵ��coif5��sym5��db5����һ���͵�ǰ����ƥ��Ƚϸ�90%���ϵ�ƥ��ȵĻ�,һ��Ҫ�������������ҪҪ��Ϊ��������20���ڣ��������������
        %��������70%���ϵİ�
        heartrate_optimal=0;
        
        if heartrate_level_flag==1
            heartrate_optimal=60/(heartrate_time_domain_interval*0.010)
            result(t)=heartrate_optimal;
            heartrate_level
        else
            result(t)=0;
        end
        
        
        
        
        
        pause(2);

       end
    
 
% end

