
clc;clf;clear all

% load('G:\ocamar\���ձȽ�\10������ǰ����\10_20_function_t_and_f_����(_�۰���+�������)�������.mat')
% datat=data(520:11543);
%datat=data(12920:21016);



load('G:\ocamar\ǰ�ڲ���\9_11_heart_rate8���۰�������(1).mat')
%temp=130*512;
temp=118*512;

%data_iteration=data(temp-511:temp);

data_iteration=data(temp-1023:temp);


n=1;
[c,l] = wavedec(data_iteration,n,'db5');
[cd1]=detcoef(c,l,1);
a=max(cd1);
thr=a(1);
cx = wthcoef('t',c,l,1:n,thr,'s');
lx = l;
x = waverec(cx,lx,'db5');

processed_data=data_iteration-x;
plot(cd1)




%%









z=1;

n=9;%level 9
[c,l] = wavedec(data_iteration,n,'db5');
[cd1,cd2,cd3,cd4,cd5,cd6,cd7,cd8,cd9]=detcoef(c,l,[1 2 3 4 5 6 7 8 9]);


a=[max(cd1) max(cd2) max(cd3) max(cd4) max(cd5) max(cd6) max(cd7) max(cd8) max(cd9)];%�õ�ÿ��ϵ��������ֵ��Ҳ���ǲ�����Ϊ�����ֵ
if z==1
    thr2=[a(1) a(2) a(3) a(4) a(5) a(6) 0.000 0.000 0.00];%���嶯
else
    thr2=[a(1) a(2) a(3) a(4) a(5) 0.00 0.000 0.000 0.00];%���嶯
end
cxc = wthcoef('t',c,l,1:n,thr2,'s');%N and T must be the same length
lxc = l;
xc = waverec(cxc,lxc,'db5');% Wavelet reconstruction of xd.

new_data=data_iteration-xc;


%[processed_data] = wavelet_process(data,a,lower(wavename));%���صõ������Ѿ�ȥ�����ߵ�BCG��a(6)Ϊ1���ñ�����Ϊ0������
    
    
    %-----------30���--------black------------------
    [findpeaks_time_domain_max] = findpeaks_1024(new_data,1);%�ҵ�black���
    peaks_count_max=length(findpeaks_time_domain_max);%�ҵ��ķ�ֵ����
    %-----------���δ���------black-------------------
    %���ҵ��ķ����й��ˡ�black
    [new_findpeaks_time_domain_max] = second_filtration(new_data ,findpeaks_time_domain_max, peaks_count_max);
    [statistics_array_black,flag_2D_black,a_max_flag(1),max_flag_value(1)] = HR_calculate( new_findpeaks_time_domain_max );
     
    [findpeaks_time_domain_min] = findpeaks_1024(new_data,0);%�ҵ�red���
    peaks_count_min=length(findpeaks_time_domain_min);%�ҵ��ķ�ֵ������ֵ����Ϊp-1
    %------------���δ���-----------red------------
    %���ҵ��ķ����й��ˡ�red
    [new_findpeaks_time_domain_min] = second_filtration(new_data ,findpeaks_time_domain_min, peaks_count_min);
    [statistics_array_2D_red,flag_2D_red,a_max_flag(2),max_flag_value(2)] = HR_calculate( new_findpeaks_time_domain_min );
%%
new_data2=new_data;

[findpeaks_time_domain_max] = findpeaks_1024(new_data2,1);%�ҵ�black���
peaks_count_max=length(findpeaks_time_domain_max);%�ҵ��ķ�ֵ����
for i=1:peaks_count_max
    %subplot(3,1,1);
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
[findpeaks_time_domain_min] = findpeaks_1024(new_data2,0);%�ҵ�red���
peaks_count_min=length(findpeaks_time_domain_min);%�ҵ��ķ�ֵ������ֵ����Ϊp-1
for i=1:peaks_count_min
%     subplot(3,1,1);
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









