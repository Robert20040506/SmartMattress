% function [statistics_array_2D_freq,flag_2D,a_max_flag,max_flag_value] = HR_calculate_freq( Mag )
% %UNTITLED �˴���ʾ�йش˺�����ժҪ
clc;clear all;clf;

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

start=1*512;
data2=datat(start:start+511);

figure(1)


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
                     plot(f(i),Mag(i),'ok');hold on             %���ҵ��ķ�ֵ��ȦȦ
                     p=p+1;
                end
    end
    peaks_count=length(findpeaks);%�ҵ��ķ�ֵ������ֵ����Ϊp-1


%------------------------------ȡ�õ�һ������λ��---------------------------
firstpeak_region=fix((findpeaks2(1,1)-1)*100/1024);%����ȡ��(��βȡ��)
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
flag_freq2=flag_freq;
flag_freq2(:,all(flag_freq2==0,1))=[];%ɾ��ȫ����


%----------���ʴ���1-----��flag_black2���д���--------------
max_flag_freq2=[];
for i=1:row
   max_flag_freq2(i)=max(flag_freq2(i,:)); %�õ�ÿ���Լ������ֵ������2��2���������ֶַε������
end
%�Ƚ�ÿ�е����ֵ���õ����ֵ��
for i=1:length(max_flag_freq2)
    [a_max_flag_freq,b_max_flag_freq]=max(max_flag_freq2);
end
%Ȼ����ͨ�������ҵ���Ӧ�ļ����
max_flag_value_freq=statistics_array_2D_freq_num_average(b_max_flag_freq);


% end

