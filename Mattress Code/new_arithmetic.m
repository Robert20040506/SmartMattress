                                                                                  
clc;clf;clear all


%------------------------------------------------------------------------------
%----------------------------------��1---��׼���-------------------------------
%------------------------------------------------------------------------------

%1Hz����10���㣬(ʵ�ʵ�12~21)��Ϊ1����2��Ƶ
freq_1Hz=[11 12 13 14 15 16 17 18 19 20;5.5 6 6.5 7 7.5 8 8.5 9 9.5 10];
%2Hz����10���㣬(ʵ�ʵ�22~31)��Ϊ1����2����3��Ƶ
freq_2Hz=[21 22 23 24 25 26 27 28 29 30;10.5 11 11.5 12 12.5 13 13.5 14 14.5 15;7 7.3 7.7 8 8.3 8.7 9 9.3 9.7 10];
%3Hz����10���㣬(ʵ�ʵ�32~41)��Ϊ2����3����4��Ƶ
freq_3Hz=[15.5 16 16.5 17 17.5 18 18.5 19 19.5 20;10.3 10.7 11 11.3 11.7 12 12.3 12.7 13 13.3;7.75 8 8.25 8.5 8.75 9 9.25 9.5 9.75 10];
%4Hz����11���㣬(ʵ�ʵ�42~52)��Ϊ2����3����4����5��Ƶ
freq_4Hz=[20.5 21 21.5 22 22.5 23 23.5 24 24.5 25 25.5;13.7 14 14.3 14.7 15 15.3 15.7 16 16.3 16.7 17;10.25 10.5 10.75 11 11.25 11.5 11.75 12 12.25 12.5 12.75;8.2 8.4 8.6 8.8 9 9.2 9.4 9.6 9.8 10 10.2];
%5Hz����10���㣬(ʵ�ʵ�53~62)��Ϊ2����3����4����5����6��Ƶ
freq_5Hz=[26 26.5 27 27.5 28 28.5 29 29.5 30 30.5;17.3 17.7 18 18.3 18.7 19 19.3 19.7 20 20.3;13 13.25 13.5 13.75 14 14.25 14.5 14.75 15 15.25;10.4 10.6 10.8 11 11.2 11.4 11.6 11.8 12 12.2;8.7 8.8 9.0 9.2 9.3 9.5 9.7 9.8 10 10.2];
%6Hz����10���㣬(ʵ�ʵ�63~72)��Ϊ3����4����5����6��Ƶ
freq_6Hz=[20.7 21 21.3 21.7 22 22.3 22.7 23 23.3 23.7;15.5 15.8 16 16.3 16.5 16.8 17 17.3 17.5 17.8;12.4 12.6 12.8 13 13.2 13.4 13.6 13.8 14 14.2;10.3 10.5 10.7 10.8 11 11.2 11.3 11.5 11.7 11.8];






load('G:\ocamar\�з��ɼ�����12-15��\analog switch test\ͨ��4_10M_����+����_����_����2.mat')
datat=data(1584:14766);
%datat=data(15963:23882);
%datat=data(24876:29660);

figure(1)
start=1*512;
data2=datat(start:start+511);

a_max_flag=[];
max_flag_value=[];
t=1;




% expend_data=flip(data2);
% o_data=[data2,expend_data];%Ҫȫ��ת�ó�һά����

%==========================arithmetic2----coif5��sym5��db5��a(6)����==========================================
[new_data2] = wavelet_process(data2,0,'coif5');%���صõ������Ѿ�ȥ�����ߵ�BCG���Ҵ˴�a(6)������
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





figure(2)
%-------------����Ҷ�任----------------
%�ɼ���ר��FFT
Fs=100;         %������
N=1024;         %��������
nt =0:N-1;      %��������
f=nt*Fs/N;      %��ʵ��Ƶ��




expend_data1=flip(new_data2);
new_data1=[new_data2,expend_data1];     %Ҫȫ��ת�ó�һά����
y1=fft(new_data1,N);
Mag=abs(y1)*2/N;



stem(f(1:end),Mag(1:end));
axis([0 23 0 0.002]);
xticks(0:100);
title('��Ƶ��Ӧ');xlabel('Ƶ��/Hz');ylabel('����');
hold on


findpeaks=[];
    p=1;
    for i=22:250
                if(((Mag(i)>Mag(i-1))&&(Mag(i)>Mag(i-2))&&(Mag(i)>Mag(i-3))&&(Mag(i)>Mag(i-4))&&(Mag(i)>Mag(i-5))&&(Mag(i)>Mag(i-6))&&(Mag(i)>Mag(i-7))&&(Mag(i)>Mag(i-8)))&&...
                    ((Mag(i)>Mag(i+1))&&(Mag(i)>Mag(i+2))&&(Mag(i)>Mag(i+3))&&(Mag(i)>Mag(i+4))&&(Mag(i)>Mag(i+5))&&(Mag(i)>Mag(i+6))&&(Mag(i)>Mag(i+7))&&(Mag(i)>Mag(i+8))))
                     findpeaks(1,p)=i;                          %findpeaks������ŷ�ֵ��λ��
                     findpeaks_true_Mag(1,p)=Mag(i);
                     plot(f(i),Mag(i),'ok');hold on             %���ҵ��ķ�ֵ��ȦȦ
                     p=p+1;
                end
    end
    peaks_count=length(findpeaks);%�ҵ��ķ�ֵ������ֵ����Ϊp-1

%�ҷ�ֵ���ĵ㣬����ʱƵ�Ƚ���
[a_peaks_max,b_peaks_max]=max(findpeaks_true_Mag);%�ҵ���ֵ���ķ�㣬�˿����С���е�a(6)������ģ�����϶������嶯����
freq_max=(findpeaks(b_peaks_max)-1)*100/1024;

%-------------------------�����һ������ǰһ�����ԭʼ���----------------------
original_interval=[];
p=1;
for i=1:(peaks_count-1) %n����ֵ�Ļ���ֻҪ��n-1�μ�����Ϳ�����
    original_interval(1,p)=(findpeaks(1,i+1)-findpeaks(1,i))-1;%�����1��Ϊ�˵õ���֮��ļ��
    p=p+1;%����Ϊn-1��
end
original_interval2=original_interval;%���Ƴ���������Ԫ�ر�0�滻���޷�����ʹ��ԭ����
freq_count=length(original_interval);
statistics_array_freq=zeros(1,freq_count);%������adiff_count
statistics_array_2D_freq=[];
for t_freq=1:freq_count
    for h_freq=1:freq_count  %����ÿ����������һ����������ʵ�ʽ��Ҫ��1�����ǵ�����������Ļ���û��Ҫ��
        if(original_interval2(1,h_freq)==0)%����Ѿ�����Ϊ0�Ļ�����˵���Ѿ����ȽϹ��ұ�ȡ����
           continue 
        elseif(abs(original_interval2(1,t_freq)-original_interval2(1,h_freq))<5)
            statistics_array_freq(1,t_freq)=statistics_array_freq(1,t_freq)+1;%�����ͳ��ֵ��1
            statistics_array_2D_freq(t_freq,h_freq)=original_interval2(1,h_freq);
            %������Ҫ��һ����ά���飬���Ȼ���adiff_count,�е�Ԫ�������Ϊ10�ڵ�����
            if(t_freq~=h_freq)
                original_interval2(1,h_freq)=0;%��עԭ����adiff���Ѿ���ͳ�ƹ�(��С�ڱ���10)��ֵ
            end
        else
            %disp('no elements')
        end
    end
end
[row,column]=size(statistics_array_2D_freq);


statistics_array_2D_freq_sum=sum(statistics_array_2D_freq,2);%�Ծ�����Ԫ����ͣ��м��0Ҳ������������ֻ��ͳ����
statistics_array_2D_freq_num=sum(statistics_array_2D_freq~=0,2);%����������������������з���Ԫ�صĸ���
for i=1:row
    statistics_array_2D_freq_num_average(1,i)=statistics_array_2D_freq_sum(i)/statistics_array_2D_freq_num(i);
end




flag_freq=zeros(row,column);
for i=1:row
    t=1;
    for j=1:column
         if (statistics_array_2D_freq(i,j)>0) %����0�ſ�ʼ�ж�
               flag_freq(i,t)=flag_freq(i,t)+1;%����������Ҫ��1
         end
         if (j>1)&&(statistics_array_2D_freq(i,j-1)>0)&&(statistics_array_2D_freq(i,j)==0)
             t=t+1;
         end
    end
end





%all(flag_black==0,1);%����һ������������1��ʾ�Ƿ�Ϊȫ����
%flag_freq2=flag_freq;

flag_freq(:,all(flag_freq==0,1))=[];%ɾ��ȫ����


max_flag_freq=[];
for i=1:row
    max_flag_freq(i)=max(flag_freq(i,:)); %�õ�ÿ���Լ������ֵ������2��2���������ֶַε������
end
%�Ƚ�ÿ�е����ֵ���õ����ֵ��
for i=1:length(max_flag_freq)
    [a_max_flag_freq,b_max_flag_freq]=max(max_flag_freq);
end
%Ȼ����ͨ�������ҵ���Ӧ�ļ����
max_flag_value_freq=statistics_array_2D_freq_num_average(b_max_flag_freq);










%------------------------------ȡ�õ�һ������λ��---------------------------
firstpeak_region=fix((findpeaks(1,1)-1)*100/1024);%����ȡ��(��βȡ��)
firstpeak_region_first=findpeaks(1,1);%findpeaks��һ������indicate
%ȷ�����ܵĳ�������
switch firstpeak_region
    case 1	%1Hz����10���㣬��Ϊ1����2��Ƶ(ʵ�ʵ�12~21)
        div=1:2;
        freq_xHz=[freq_1Hz(1,firstpeak_region_first-11),freq_1Hz(2,firstpeak_region_first-11)];
    case 2  %2Hz����10���㣬(ʵ�ʵ�22~31)��Ϊ1����2����3��Ƶ
        div=1:3;
        freq_xHz=[freq_2Hz(1,firstpeak_region_first-21),freq_2Hz(2,firstpeak_region_first-21),freq_2Hz(3,firstpeak_region_first-21)];
    case 3  %3Hz����10���㣬(ʵ�ʵ�32~41)��Ϊ2����3����4��Ƶ
        div=2:4;
        freq_xHz=[freq_3Hz(1,firstpeak_region_first-31),freq_3Hz(2,firstpeak_region_first-31),freq_3Hz(3,firstpeak_region_first-31)];
    case 4  %4Hz����11���㣬(ʵ�ʵ�42~52)��Ϊ2����3����4����5��Ƶ
        div=2:5;
        freq_xHz=[freq_4Hz(1,firstpeak_region_first-41),freq_4Hz(2,firstpeak_region_first-41),freq_4Hz(3,firstpeak_region_first-41),freq_4Hz(4,firstpeak_region_first-41)];
    case 5  %5Hz����10���㣬(ʵ�ʵ�53~62)��Ϊ2����3����4����5����6��Ƶ
        div=2:6;%�����������2-3-4-5-6
        freq_xHz=[freq_5Hz(1,firstpeak_region_first-52),freq_5Hz(2,firstpeak_region_first-52),freq_5Hz(3,firstpeak_region_first-52),freq_5Hz(4,firstpeak_region_first-52),freq_5Hz(5,firstpeak_region_first-52)];
    case 6  %6Hz����10���㣬(ʵ�ʵ�63~72)��Ϊ3����4����5����6��Ƶ
        div=3:6;
        freq_xHz=[freq_6Hz(1,firstpeak_region_first-62),freq_6Hz(2,firstpeak_region_first-62),freq_6Hz(3,firstpeak_region_first-62),freq_6Hz(4,firstpeak_region_first-62)];
    case 7
        div=3:6;
    case 8
        div=3:6;
    case 9
        div=4:6;     
    case 10
        div=4:6; 
    case 11
        div=4:6;
    case 12
        div=5:6;
end




if a_max_flag_freq>6
    %�õ������������������������������ȡ��ͳ�Ʊ������е�����
    second_process_array=statistics_array_2D_freq(b_max_flag_freq,:);
    %Ȼ����������½��м�����࣬�������Լ���
    
    [freq_interval_result,statistics_array_2D_freq_2 ] = AM_FREQ_512_2( second_process_array );
   
elseif a_max_flag_freq>=4   %���������������ĸ����Ǿ���ΪƵ���ҵ��˿���������֤�ļ��
    for i=1:length(div)
        freq_xHz_diff(i)=abs(max_flag_value_freq-freq_xHz(i));%ȷ���Ǳ�Ƶ�����һ��
    end
    [a_min_freq_xHz_diff,b_min_freq_xHz_diff]=min(freq_xHz_diff);%��Ҫ��Ϊ��ȷ����Ƶ�������Ǳ�Ƶ��Ӧ�ļ��
    firstpoint_freq_multi=div(b_min_freq_xHz_diff);%��һ����ı�Ƶ
    heartrate_optimal_freq=(((findpeaks(1,1)-1)*100/2048)*60)/firstpoint_freq_multi;
else %���û���������ĸ������Ǿ�ɶ����������
    heartrate_optimal_freq=0;
end








%%
%�ɼ���ר��FFT
Fs=100;     %������
N=1024;     %��������
nt =0:N-1;   %��������
f=nt*Fs/N;   %��ʵ��Ƶ��
figure(2)

%ֱ����չ 
expend_data2=flip(new_data2);
new_data=[new_data2,expend_data2];%Ҫȫ��ת�ó�һά����
%------------��������Ҷ�任----

y=fft(new_data,N);
Mag=abs(y)*2/N;

% stem(f(1:end),Mag(1:end));
plot(f(1:end),Mag(1:end));
axis([0 23 0 0.002]);
xticks(0:100);
title('��Ƶ��Ӧ');xlabel('Ƶ��/Hz');ylabel('����');
hold on








%-------------30��������------black----------------
original_interval_black=[];
for i=1:(peaks_count_max-1) %n����ֵ�Ļ���ֻҪ��n-1�μ�����Ϳ�����
    original_interval_black(1,i)=(findpeaks_time_domain_max(1,i+1)-findpeaks_time_domain_max(1,i))-1;%�����1��Ϊ�˵õ���֮��ļ��
end


%-----------------------------ԭʼ������������--------------------
original_interval_black2=original_interval_black;
statistics_array_black=zeros(1,peaks_count_max);%����
statistics_array_2D_black=[];
for t_black=1:peaks_count_max-1
    for h_black=1:peaks_count_max-1  %����ÿ����������һ����������ʵ�ʽ��Ҫ��1�����ǵ�����������Ļ���û��Ҫ��
        if(original_interval_black2(1,h_black)==0)%����Ѿ�����Ϊ0�Ļ�����˵���Ѿ����ȽϹ��ұ�ȡ����
           continue 
        elseif(abs(original_interval_black2(1,t_black)-original_interval_black2(1,h_black))<10)
            statistics_array_black(1,t_black)=statistics_array_black(1,t_black)+1;%�����ͳ��ֵ��1
            statistics_array_2D_black(t_black,h_black)=original_interval_black2(1,h_black);
            %������Ҫ��һ����ά���飬���Ȼ���adiff_count,�е�Ԫ�������Ϊ10�ڵ�����
            if(t_black~=h_black)
                original_interval_black2(1,h_black)=0;%��עԭ����adiff���Ѿ���ͳ�ƹ�(��С�ڱ���10)��ֵ
            end
        else
            %disp('no elements')
        end
    end
end
[row_n1,column_n1]=size(statistics_array_2D_black);



statistics_array_2D_black_sum=sum(statistics_array_2D_black,2);%�Ծ�����Ԫ����ͣ��м��0Ҳ������������ֻ��ͳ����
statistics_array_2D_black_num=sum(statistics_array_2D_black~=0,2);%����������������������з���Ԫ�صĸ���
for i=1:row_n1
    statistics_array_2D_black_num_average(1,i)=statistics_array_2D_black_sum(i)/statistics_array_2D_black_num(i);
end
%���˾͵õ���statistics_array_2D_black��ÿ�е�ƽ��ֵ������ֱ���øü����������




flag_black=zeros(row_n1,column_n1);
for i=1:row_n1
    t=1;
    for j=1:column_n1
         if (statistics_array_2D_black(i,j)>0) %����0�ſ�ʼ�ж�
               flag_black(i,t)=flag_black(i,t)+1;%����������Ҫ��1
         end
         if (j>1)&&(statistics_array_2D_black(i,j-1)>0)&&(statistics_array_2D_black(i,j)==0)
             t=t+1;
         end
    end
end
%all(flag_black==0,1);%����һ������������1��ʾ�Ƿ�Ϊȫ����
flag_black2=flag_black;
flag_black2(:,all(flag_black2==0,1))=[];%ɾ��ȫ����

dd=1;
%----------���ʴ���1-----��flag_black2���д���--------------
max_flag_black2=[];
for i=1:row_n1
   max_flag_black2(i)=max(flag_black2(i,:)); %�õ�ÿ���Լ������ֵ������2��2���������ֶַε������
end
%�Ƚ�ÿ�е����ֵ���õ����ֵ��
for i=1:length(max_flag_black2)
    [a_max_flag_black,b_max_flag_black]=max(max_flag_black2);
end
%Ȼ����ͨ�������ҵ���Ӧ�ļ����
max_flag_value_black=statistics_array_2D_black_num_average(b_max_flag_black);


%----------���ʴ���2-----��statistics_array_2D_black_num��statistics_array_2D_black_num_average���д���--------------
%statistics_array_2D_black_num_average��û����������˼������
%flag_black2������������˼�ڵ�
finally_interval_black=0;
finally_interval_black_flag=0;
for i=1:row_n1
    %��ѡ�����������Σ����������ϵ�60�����С��60�Ŀ��ܾ�û���������۵�������
    if (statistics_array_2D_black_num_average(i)>=60)
        for j=1:length(flag_black2(i,:))%�Ƚϴ���
            if flag_black2(i,j)>=2  %��2��2����2��3���ּ���Ե�Ҳû�����⣬����ƽ��ֵ����һ����
                %��¼�������������ƽ��ֵ
                finally_interval_black=statistics_array_2D_black_num_average(i);
                finally_interval_black_flag=1;%˵��Ԥ�����ҵ���
            end
        end
    end
end







%////////////////////////////////////////////////////////////////////////////////////////////
%------------------------------------red��Ĳ���-------��ʼ-------------------------------
findpeaks_time_domain_min=[];
p3=1;
for j=31:480%%����ȡ31����ͨ��ȡ66
            if(((data_differenced(j)<data_differenced(j-1))&&(data_differenced(j)<data_differenced(j-2))&&(data_differenced(j)<data_differenced(j-3))&&(data_differenced(j)<data_differenced(j-4))&&(data_differenced(j)<data_differenced(j-5))&&(data_differenced(j)<data_differenced(j-6))&&(data_differenced(j)<data_differenced(j-7))&&(data_differenced(j)<data_differenced(j-8))&&(data_differenced(j)<data_differenced(j-9))&&(data_differenced(j)<data_differenced(j-10))&&(data_differenced(j)<data_differenced(j-11))&&(data_differenced(j)<data_differenced(j-12))&&(data_differenced(j)<data_differenced(j-13))&&(data_differenced(j)<data_differenced(j-14))&&(data_differenced(j)<data_differenced(j-15))&&(data_differenced(j)<data_differenced(j-16))&&(data_differenced(j)<data_differenced(j-17))&&(data_differenced(j)<data_differenced(j-18))&&(data_differenced(j)<data_differenced(j-19))&&(data_differenced(j)<data_differenced(j-20))&&(data_differenced(j)<data_differenced(j-21))&&(data_differenced(j)<data_differenced(j-22))&&(data_differenced(j)<data_differenced(j-23))&&(data_differenced(j)<data_differenced(j-24))&&(data_differenced(j)<data_differenced(j-25))&&(data_differenced(j)<data_differenced(j-26))&&(data_differenced(j)<data_differenced(j-27))&&(data_differenced(j)<data_differenced(j-28))&&(data_differenced(j)<data_differenced(j-29))&&(data_differenced(j)<data_differenced(j-30)))&&...
                ((data_differenced(j)<data_differenced(j+1))&&(data_differenced(j)<data_differenced(j+2))&&(data_differenced(j)<data_differenced(j+3))&&(data_differenced(j)<data_differenced(j+4))&&(data_differenced(j)<data_differenced(j+5))&&(data_differenced(j)<data_differenced(j+6))&&(data_differenced(j)<data_differenced(j+7))&&(data_differenced(j)<data_differenced(j+8))&&(data_differenced(j)<data_differenced(j+9))&&(data_differenced(j)<data_differenced(j+10))&&(data_differenced(j)<data_differenced(j+11))&&(data_differenced(j)<data_differenced(j+12))&&(data_differenced(j)<data_differenced(j+13))&&(data_differenced(j)<data_differenced(j+14))&&(data_differenced(j)<data_differenced(j+15))&&(data_differenced(j)<data_differenced(j+16))&&(data_differenced(j)<data_differenced(j+17))&&(data_differenced(j)<data_differenced(j+18))&&(data_differenced(j)<data_differenced(j+19))&&(data_differenced(j)<data_differenced(j+20))&&(data_differenced(j)<data_differenced(j+21))&&(data_differenced(j)<data_differenced(j+22))&&(data_differenced(j)<data_differenced(j+23))&&(data_differenced(j)<data_differenced(j+24))&&(data_differenced(j)<data_differenced(j+25))&&(data_differenced(j)<data_differenced(j+26))&&(data_differenced(j)<data_differenced(j+27))&&(data_differenced(j)<data_differenced(j+28))&&(data_differenced(j)<data_differenced(j+29))&&(data_differenced(j)<data_differenced(j+30))))
                 findpeaks_time_domain_min(1,p3)=j;                  
                 %findpeaks������ŷ�ֵ��λ��
                 plot(j,data_differenced(j),'or');hold on             %���ҵ��ķ�ֵ��ȦȦ
                 p3=p3+1;
            end
end
peaks_count_min=length(findpeaks_time_domain_min);%�ҵ��ķ�ֵ������ֵ����Ϊp-1

%-------------------------�����һ������ǰһ�����ԭʼ���------black----------------
original_interval_red=[];
for i=1:(peaks_count_min-1) %n����ֵ�Ļ���ֻҪ��n-1�μ�����Ϳ�����
    original_interval_red(1,i)=(findpeaks_time_domain_min(1,i+1)-findpeaks_time_domain_min(1,i))-1;%�����1��Ϊ�˵õ���֮��ļ��
end

%-----------------------------ԭʼ������������--------------------
original_interval_red2=original_interval_red;
statistics_array_red=zeros(1,peaks_count);%����
statistics_array_2D_red=[];
for t_black=1:peaks_count_min-1
    for h_black=1:peaks_count_min-1  %����ÿ����������һ����������ʵ�ʽ��Ҫ��1�����ǵ�����������Ļ���û��Ҫ��
        if(original_interval_red2(1,h_black)==0)%����Ѿ�����Ϊ0�Ļ�����˵���Ѿ����ȽϹ��ұ�ȡ����
           continue 
        elseif(abs(original_interval_red2(1,t_black)-original_interval_red2(1,h_black))<10)
            statistics_array_red(1,t_black)=statistics_array_red(1,t_black)+1;%�����ͳ��ֵ��1
            statistics_array_2D_red(t_black,h_black)=original_interval_red2(1,h_black);
            %������Ҫ��һ����ά���飬���Ȼ���adiff_count,�е�Ԫ�������Ϊ10�ڵ�����
            if(t_black~=h_black)
                original_interval_red2(1,h_black)=0;%��עԭ����adiff���Ѿ���ͳ�ƹ�(��С�ڱ���10)��ֵ
            end
        else
            %disp('no elements')
        end
    end
end
[row_n2,column_n2]=size(statistics_array_2D_red);

statistics_array_2D_red_sum=sum(statistics_array_2D_red,2);%�Ծ�����Ԫ����ͣ��м��0Ҳ������������ֻ��ͳ����
statistics_array_2D_red_num=sum(statistics_array_2D_red~=0,2);%����������������������з���Ԫ�صĸ���
for i=1:row_n2
    statistics_array_2D_red_num_average(1,i)=statistics_array_2D_red_sum(i)/statistics_array_2D_red_num(i);
end
%���˾͵õ���statistics_array_2D_black��ÿ�е�ƽ��ֵ������ֱ���øü����������




flag_red=zeros(row_n2,column_n2);
for i=1:row_n2
    t=1;
    for j=1:column_n2
         if (statistics_array_2D_red(i,j)>0) %����0�ſ�ʼ�ж�
               flag_red(i,t)=flag_red(i,t)+1;%����������Ҫ��1
         end
         if (j>1)&&(statistics_array_2D_red(i,j-1)>0)&&(statistics_array_2D_red(i,j)==0)
             t=t+1;
         end
    end
end
%all(flag_red==0,1);%����һ������������1��ʾ�Ƿ�Ϊȫ����
flag_red2=flag_red;
flag_red2(:,all(flag_red2==0,1))=[];%ɾ��ȫ����
dd=2;
%----------���ʴ���-----��flag_black2���д���--------------
max_flag_red2=[];
for i=1:row_n2
   max_flag_red2(i)=max(flag_red2(i,:)); %�õ�ÿ���Լ������ֵ������2��2���������ֶַε������
end
%�Ƚ�ÿ�е����ֵ���õ����ֵ��
for i=1:length(max_flag_red2)
    [a_max_flag_red,b_max_flag_red]=max(max_flag_red2);
end
%Ȼ����ͨ�������ҵ���Ӧ�ļ����
max_flag_value_red=statistics_array_2D_red_num_average(b_max_flag_red);


%----------���ʴ���2-----��statistics_array_2D_red_num��statistics_array_2D_red_num_average���д���--------------
%statistics_array_2D_black_num_average��û����������˼������
%flag_black2������������˼�ڵ�
finally_interval_red=0;
finally_interval_red_flag=0;
for i=1:row_n2
    %��ѡ�����������Σ����������ϵ�60�����С��60�Ŀ��ܾ�û���������۵�������
    if (statistics_array_2D_red_num_average(i)>=60)
        for j=1:length(flag_red2(i,:))%�Ƚϴ���
            if flag_red2(i,j)>=2  %��2��2����2��3���ּ���Ե�Ҳû�����⣬����ƽ��ֵ����һ����
                %��¼�������������ƽ��ֵ
                finally_interval_red=statistics_array_2D_red_num_average(i);
                finally_interval_red_flag=1;%˵��Ԥ�����ҵ���
            end
        end
    end
end



%//////////////////////////////
%flag_black2  ,  a_max_flag_black  ,  b_max_flag_black  ,  max_flag_value_black
%//////////////////////////////
%flag_red2   ,  a_max_flag_red  ,   b_max_flag_red   ,   max_flag_value_red
%��һ����� ���ڵ�򵥺���ж�
heartrate_optimal=0;finally_interval=0;optimal_flag=0;%������Ϊ0����˵��û����ѡ
%�Ƚ��е����ж�
if ((max_flag_value_black<=40)&&(a_max_flag_black>=7))||... %С��50�Ļ����Ǿ���ָ30�ļ��  %Ӧ�ò�������
   ((max_flag_value_black>40)&&(max_flag_value_black<=50)&&(a_max_flag_black>=7))||... %С��50�Ļ����Ǿ���ָ40�ļ��
   ((max_flag_value_black>50)&&(max_flag_value_black<=60)&&(a_max_flag_black>=5))||... %С��60�Ļ�������ָ50�ļ��
   ((max_flag_value_black>60)&&(max_flag_value_black<70)&&(a_max_flag_black>=4))||... %С��70�Ļ�������ָ60�ļ��
   ((max_flag_value_black>=70)&&(a_max_flag_black>=3))      %Ȼ��70���ϵĻ��������Ͷ����ˣ������Ϳ��ܲ��Ͻ���

    finally_interval=max_flag_value_black;optimal_flag=1;
%�����ж�
elseif ((max_flag_value_red<=40)&&(a_max_flag_red>=7))||... %ͬ��
       ((max_flag_value_red>40)&&(max_flag_value_red<=50)&&(a_max_flag_red>=6))||... %ͬ��
       ((max_flag_value_red>50)&&(max_flag_value_red<=60)&&(a_max_flag_red>=5))||... %ͬ��
       ((max_flag_value_red>60)&&(max_flag_value_red<70)&&(a_max_flag_red>=4))||...  %ͬ��
       ((max_flag_value_red>=70)&&(a_max_flag_red>=3))      %ͬ��

    finally_interval=max_flag_value_red;optimal_flag=2;

%˫���ж�
elseif (finally_interval_black_flag==1)&&(finally_interval_red_flag==1)%˵���ڵ��㶼�м��60��2�������ϵ�
        if abs(finally_interval_black-finally_interval_red)<10 %˵���ڵ�ͺ��ļ����һ����
            finally_interval=(finally_interval_black+finally_interval_red)/2;
            optimal_flag=3;
        end
end

finally_interval
heartrate_optimal=60/(finally_interval*0.010)
optimal_flag

flag_black2
flag_red2




