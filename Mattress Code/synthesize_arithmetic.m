%�ۺϳ����ж���Ƶ��ʱ��+Ƶ��
%�ⲿ��ֻ�ǵ���Ƶ���ʱ���㷨��������Ҫ��plot��
%


%׼������
clf;clc;clear all;
load('G:\ocamar\�з��ɼ�����12-15��\analog switch test\ͨ��4_10M_����+����_����_����2.mat')
datat=data(1584:14766);
%datat=data(15963:23882);
%datat=data(24876:29660);

figure(1)
start=1*512;
data2=datat(start:start+511);



%��һ����ʹ��AM_FREQ_512�Ӻ���
%�������ԭʼ���ݣ�512��point
%��������һ����־���������Ƿ��к��ʵĽ�����Լ�ʵ�ʽ��

%[������ܵı�־��Ƶ������ֵ��ԭ����������Ч��־��ʱ��ֵ��Ƶ��ֵ�ıȽϴ��������Ƚ�����]=AM_FREQ_512(ԭʼ���ݣ�С�����ƣ�a(6)��������־)
[ statistics_array_2D_freq,possible_interval_flag,F_interval_continuity_HR ,F_interval_continuity_value,peak_valid_flag,comparing_times,freq_HR_array] = AM_FREQ_512( data2,'coif5',0); %a(6)��0
%[ flag2,heartrate_freq2,max_flag_value_freq2,findpeaks2] = AM_FREQ_512( data2,'sym5',0); %a(6)��0
%[ flag3,heartrate_freq3,max_flag_value_freq3,findpeaks3] = AM_FREQ_512( data2,'db5',0); %a(6)��0

%�����possible_interval_flag=Ϊ0����1�Ļ������б�Ҫִ��������ˣ�������������Ϊ4�ļ������max_flag_value_freq

%�ڶ�����ʹ��AM_TIME_512�Ӻ���
%�������ԭʼ���ݣ�512��point
%��������һ����־�������Ƿ��к��ʵĽ�����ȼ��Ƕ��ģ��Լ�ʵ�ʵĽ��
%������Ҫ��freq�����ֵ���жԱ�

%[��־��ʱ������ֵ]
[ interval_successrate_flag,T_interval_continuity_HR] = AM_TIME_512(data2,'coif5');
% [ flag_time2,heartrate_optimal2] = AM_TIME_512(data2,'sym5')
% [ flag_time3,heartrate_optimal3] = AM_TIME_512(data2,'db5')



%������
%ʱ���к��ʵĵ�Ļ�
if interval_successrate_flag>=1 %���Ϊ1��2��3��ֻҪ��Ϊ0�Ļ�
    T_F_adiff=[];
    for i=1:comparing_times
        T_F_adiff(i)=abs(T_interval_continuity_HR-freq_HR_array(i));
    end
    [a_min_indicate,b_min_indicate]=min(T_F_adiff); %����С�Ĳ�ֵ
    
    %ͨ��ʱ���Ƴ��ļ�� �� Ƶ���Ƴ��ķ������ֵ
    if a_min_indicate<10
        T_F_success_rate=1;
        T_interval_continuity_HR
    else
        T_F_success_rate=0;
    end
end

T_F_success_rate











