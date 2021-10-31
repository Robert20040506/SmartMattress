function [ statistics_array_2D_freq,flag,F_interval_continuity_HR ,F_interval_continuity_value,peak_valid,comparing_times,freq_value] = AM_FREQ_1024( data ,wavename,a6)
%AM_FREQ_512
%   ������512��ԭʼ����
%   ����Ǳ�־λ���Լ�ʵ�ʵĽ��



%=========================================���========================================


%��������2
F=100;          %������
N=2048;         %��������
n =0:N-1;       %��������
f=n*F/N;        %��ʵ��Ƶ��

%�Ƚ���С������
o=lower(wavename);
[processed_data] = wavelet_process(data,a6,o);%���صõ������Ѿ�ȥ�����ߵ�BCG����0�Ļ�a(6)�����㣬1�Ļ�a(6)����1

%��չ                                                                         
expend_data=flip(processed_data);         %512��չΪ1024��
new_data=[processed_data,expend_data];    %Ҫȫ��ת�ó�һά����

%�õ�fft����
y=fft(new_data,N);
Mag=abs(y)*2/N;

%��ͼ
% stem(f(1:end),Mag(1:end));
% axis([0 23 0 0.002]);
% xticks(0:100);
% title('��Ƶ��Ӧ');xlabel('Ƶ��/Hz');ylabel('����');
% hold on

findpeaks=[];
p=1;
for i=32:500
    if(((Mag(i)>Mag(i-1))&&(Mag(i)>Mag(i-2))&&(Mag(i)>Mag(i-3))&&(Mag(i)>Mag(i-4))&&(Mag(i)>Mag(i-5))&&(Mag(i)>Mag(i-6))&&(Mag(i)>Mag(i-7))&&(Mag(i)>Mag(i-8))&&(Mag(i)>Mag(i-9))&&(Mag(i)>Mag(i-10))&&(Mag(i)>Mag(i-11))&&(Mag(i)>Mag(i-12))&&(Mag(i)>Mag(i-13))&&(Mag(i)>Mag(i-14))&&(Mag(i)>Mag(i-15))&&(Mag(i)>Mag(i-16)))&&...
        ((Mag(i)>Mag(i+1))&&(Mag(i)>Mag(i+2))&&(Mag(i)>Mag(i+3))&&(Mag(i)>Mag(i+4))&&(Mag(i)>Mag(i+5))&&(Mag(i)>Mag(i+6))&&(Mag(i)>Mag(i+7))&&(Mag(i)>Mag(i+8))&&(Mag(i)>Mag(i+9))&&(Mag(i)>Mag(i+10))&&(Mag(i)>Mag(i+11))&&(Mag(i)>Mag(i+12))&&(Mag(i)>Mag(i+13))&&(Mag(i)>Mag(i+14))&&(Mag(i)>Mag(i+15))&&(Mag(i)>Mag(i+16))))
         findpeaks(1,p)=i;                          %findpeaks������ŷ�ֵ��λ��
         %plot(f(i),Mag(i),'ok');hold on             %���ҵ��ķ�ֵ��ȦȦ
         findpeaks_true_Mag(1,p)=Mag(i);
         p=p+1;
    end
end
peaks_count=length(findpeaks);%�ҵ��ķ�ֵ������ֵ����Ϊp-1



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


%�ⲿ����Ϊ�˵õ�ƽ��ֵ
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
F_interval_continuity_value=statistics_array_2D_freq_num_average(b_max_flag_freq);




if a_max_flag_freq>=6       %�����ĳɹ���Ϊ90%
    %�õ������������������������������ȡ��ͳ�Ʊ������е�����
    second_process_array=statistics_array_2D_freq(b_max_flag_freq,:);
    %Ȼ����������½��м������
    [freq_interval_result,statistics_array_2D_freq_2 ] = AM_FREQ_1024_2( second_process_array );
    %ֱ����ƽ���ļ��ֵ�������ʣ�����ӳ�䵽�����ȥ
    F_interval_continuity_HR=freq_interval_result*(100/2048)*60;
    flag=1;
elseif a_max_flag_freq>=4   %�����ɹ��ʽ�Ϊ60%
    F_interval_continuity_HR=F_interval_continuity_value*(100/2048)*60;
    flag=2;
else %���û���������ĸ���������û���ҵ�
    F_interval_continuity_HR=0;
    flag=0;
    F_interval_continuity_value=0;
end


%=============================================���======================================

%�ҷ�ֵ���ĵ㣬����ʱƵ�Ƚ��õ�
[~,b_peaks_max]=max(findpeaks_true_Mag);%�ҵ���ֵ���ķ�㣬�˿����С���е�a(6)������ģ�����϶������嶯����
freq_max=(findpeaks(b_peaks_max)-1)*100/2048;
evaluated=freq_max*60;%���������
%------------------------------ȡ�������ȵ������λ��---------------------------
firstpeak_region=fix(freq_max);%����ȡ��(��βȡ��)
firstpeak_region_first=findpeaks(b_peaks_max);%findpeaks��һ������indicate
%ȷ�����ܵĳ������ϣ���������ǰ��ͬ���ǣ��Ҳ���Ҫ��׼�������ֻ��Ҫ����ֵ
freq_value=[];
peak_valid=0;   %��ʼ����ֻ���׵�Ϊ1Hz��2Hz��3Hz��4Hz��5Hz��6Hz����Ч
comparing_times=0;
switch firstpeak_region
    case 1	%1Hz����10���㣬��Ϊ1����2��Ƶ(ʵ�ʵ�12~21)
        peak_valid=1;
        comparing_times=2;
        freq_value=[evaluated,evaluated/2];%div=1:2;
    case 2  %2Hz����10���㣬(ʵ�ʵ�22~31)��Ϊ1����2����3��Ƶ
        peak_valid=1;
        comparing_times=3;
        freq_value=[evaluated,evaluated/2,evaluated/3];%div=1:3;
    case 3  %3Hz����10���㣬(ʵ�ʵ�32~41)��Ϊ2����3����4��Ƶ
        peak_valid=1;
        comparing_times=3;
        freq_value=[evaluated/2,evaluated/3,evaluated/4];% div=2:4;
    case 4  %4Hz����11���㣬(ʵ�ʵ�42~52)��Ϊ2����3����4����5��Ƶ
        peak_valid=1;
        comparing_times=4;
        freq_value=[evaluated/2,evaluated/3,evaluated/4,evaluated/5];%div=2:5;
    case 5  %5Hz����10���㣬(ʵ�ʵ�53~62)��Ϊ2����3����4����5����6��Ƶ
        peak_valid=1;
        comparing_times=5;
        freq_value=[evaluated/2,evaluated/3,evaluated/4,evaluated/5,evaluated/6];%div=2:6;%�����������2-3-4-5-6
    case 6  %6Hz����10���㣬(ʵ�ʵ�63~72)��Ϊ3����4����5����6��Ƶ
        peak_valid=1;
        comparing_times=4;
        freq_value=[evaluated/3,evaluated/4,evaluated/5,evaluated/6];%div=3:6;
    case 7
        peak_valid=0;
        div=3:6;
    case 8
        peak_valid=0;
        div=3:6;
    case 9
        peak_valid=0;
        div=4:6;     
    case 10
        peak_valid=0;
        div=4:6; 
    case 11
        peak_valid=0;
        div=4:6;
    case 12
        peak_valid=0;
        div=5:6;
end







end



