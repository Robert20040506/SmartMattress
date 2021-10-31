
clc;clf;clear all

% load('G:\ocamar\���ձȽ�\10������ǰ����\10_20_function_t_and_f_����(_�۰���+�������)�������.mat')
% datat=data(520:11543);
%datat=data(12920:21016);



% load('G:\ocamar\ǰ�ڲ���\9_11_heart_rate8���۰�������(1).mat')
% temp=118*512;
% data_iteration=data(temp-511:temp);



load('G:\ocamar\BCGģ��������\2.5-40-200����60-20.mat')


temp=1*1;
data_iteration=data(temp:temp+2047);


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
clc;clear all

% load('G:\ocamar\���ձȽ�\10������ǰ����\10_20_function_t_and_f_����(_�۰���+�������)�������.mat')
% datat=data(520:11543);
%datat=data(12920:21016);



% load('G:\ocamar\ǰ�ڲ���\9_11_heart_rate8���۰�������(1).mat')
%temp=130*512;
%temp=118*512;
% 
% data1=data(temp:temp+2047);

%data_iteration=data(temp-1023:temp);
%load('G:\ocamar\BCGģ��������\2.5-40-200����25-20.mat')
%load('G:\ocamar\BCGģ��������\2.5-40-200����27-20.mat')
%load('G:\ocamar\BCGģ��������\2.5-40-200����30-20.mat')    %a_allΪ17��� a_middleΪ8���  a_lowΪ3���
%load('G:\ocamar\BCGģ��������\2.5-40-200���ɰ׺���30-20(3).mat')

%load('G:\ocamar\BCGģ��������\2.5-40-200����40-20.mat')    %a_allΪ14��� a_middleΪ9���  a_low�����
%load('G:\ocamar\BCGģ��������\2.5-40-200����45-20.mat')   %a_allΪ27��� a_middleΪ27���  a_low�����
%���濪ʼa_all������20
%load('G:\ocamar\BCGģ��������\2.5-40-200����50-20.mat')
%load('G:\ocamar\BCGģ��������\2.5-40-200����55-20.mat')
%load('G:\ocamar\BCGģ��������\2.5-40-200����60-20.mat')
%load('G:\ocamar\BCGģ��������\2.5-40-200����80-20.mat')
%load('G:\ocamar\BCGģ��������\2.5-40-200����100-20.mat')
%load('G:\ocamar\BCGģ��������\2.5-40-200����120-20.mat')
%load('G:\ocamar\BCGģ��������\2.5-40-200����180-20.mat')
%load('G:\ocamar\BCGģ��������\2.5-40-200����230-20.mat')
%load('G:\ocamar\BCGģ��������\2.5-40-200����250-20.mat')
%load('G:\ocamar\BCGģ��������\�ӿ���\2.5-40-200����+����30-20.mat')
%load('G:\ocamar\BCGģ��������\��note power\2.5-40-200����30-20.mat')

%load('G:\ocamar\��Ʒ�ɼ�����\�� ���ݲɼ�2.mat')

%load('G:\ocamar\�з��ɼ�����12-15��\1-26������\composite_t_and_f_2s5s10s_������_��.mat')
%load('G:\ocamar\�з��ɼ�����12-15��\1-26������\composite_t_and_f_2s5s10s_����.mat')
%load('G:\ocamar\�з��ɼ�����12-15��\1-26������\composite_t_and_f_2s5s10s_������.mat')
%load('G:\ocamar\�з��ɼ�����12-15��\1-26������\���(1).mat')
%load('G:\ocamar\�з��ɼ�����12-15��\1-26������\��У��(1).mat')
%load('G:\ocamar\�з��ɼ�����12-15��\1-26������\������(1).mat')
% data=data(6688:end);


%load('G:\ocamar\��Ʒ�ɼ�����\�� ���ݲɼ�7-21.mat')
load('G:\ocamar\��Ʒ�ɼ�����\�� ���ݲɼ�7-22(1).mat')


for f=1:length(data)/512
% for f=26:26
clf;
% disp(f);
temp=f*512;
data1=data(temp:temp+2047);

%{
figure(1)
%��������2
F=100;          %������
N=2048;         %��������
n =0:N-1;       %��������
f=n*F/N;        %��ʵ��Ƶ��

%�õ�fft����
y=fft(data1,N);
Mag=abs(y)*2/N;

stem(f(1:end),Mag(1:end));
axis([0 23 0 0.002]);
xticks(0:100);
title('��Ƶ��Ӧ');xlabel('Ƶ��/Hz');ylabel('����');
hold on
%}


figure(1);
set(gcf,'Position',[100,200,500,500]);
plot(data1)

figure(2);
set(gcf,'Position',[700,200,500,500]);




threshold=0.04; %�ж���ֵ%0.2�Ļ�������ЩС��ģ����Ըĵ�0.1������Ч����������0.04��0.02
 data2=data1;
%3��Ԫ�صĴ���
for i=2:(length(data2)-1)%�ڶ�����������ڶ���
    a=abs(data2(i)-data2(i-1));
    b=abs(data2(i)-data2(i+1));
     if((a>=threshold)&&(b>=threshold))
         data2(i)=mean(data2(i-1)+data2(i+1))/2;
     end
end
%data2���쳣��ȥ����������
flag_process=0;
%     for i=1:4
%        data_process=data2(i*512-511:i*512);
       average_data = mean(data2);%��������ƽ��ֵ
       max_differencee = max(data2)-min(data2);%������������ֵ
       if(average_data>=1.5)
            flag_process=1;
       elseif(max_differencee>=0.6)
            flag_process=2;
       end
%     end

    if flag_process==1
        disp('�봲');continue;
    elseif flag_process==2
        disp('�嶯');continue;
    end
%[ ~,possible_interval_flag,F_interval_continuity_HR ,~,~,comparing_times,freq_HR_array] = AM_FREQ_1024( data2,'coif5',0); %a(6)��0
[ processed_data1,black_and_red_array1,black_and_red_array1_low] = AM_TIME_2048_3(data2,1,'coif5');%a(6)��1
[ processed_data2,black_and_red_array2,black_and_red_array2_low] = AM_TIME_2048_3(data2,0,'coif5');%a(6)��0
%[ black_and_red_array3,black_and_red_array3_low] = AM_TIME_2048_3_2(data2,'coif5');
black_and_red_array3=[];
black_and_red_array3_low=[];

%[ ~,possible_interval_flag2,F_interval_continuity_HR2 ,~,~,comparing_times2,freq_HR_array2] = AM_FREQ_1024( data2,'sym5',0); %a(6)��0
[ processed_data3,black_and_red_array4,black_and_red_array4_low] = AM_TIME_2048_3(data2,1,'sym5');%a(6)��1
[ processed_data4,black_and_red_array5,black_and_red_array5_low] = AM_TIME_2048_3(data2,0,'sym5');%a(6)��0
%[ black_and_red_array6,black_and_red_array6_low] = AM_TIME_2048_3_2(data2,'sym5');
black_and_red_array6=[];
black_and_red_array6_low=[];

%[ ~,possible_interval_flag3,F_interval_continuity_HR3 ,~,~,comparing_times3,freq_HR_array3] = AM_FREQ_1024( data2,'sym5',0); %a(6)��0
[ processed_data5,black_and_red_array7,black_and_red_array7_low] = AM_TIME_2048_3(data2,1,'db5');%a(6)��1
[ processed_data6,black_and_red_array8,black_and_red_array8_low] = AM_TIME_2048_3(data2,0,'db5');%a(6)��0
%[ black_and_red_array9,black_and_red_array9_low] = AM_TIME_2048_3_2(data2,'db5');
black_and_red_array9=[];
black_and_red_array9_low=[];

large_array=[];
large_array=[black_and_red_array1,black_and_red_array2,black_and_red_array3,black_and_red_array4,black_and_red_array5,black_and_red_array6,black_and_red_array7,black_and_red_array8,black_and_red_array9];

large_array_low=[];
large_array_low=[black_and_red_array1_low,black_and_red_array2_low,black_and_red_array3_low,black_and_red_array4_low,black_and_red_array5_low,black_and_red_array6_low,black_and_red_array7_low,black_and_red_array8_low,black_and_red_array9_low];






range_statistics_30=zeros(1,209);
 for i=1:length(large_array_low)
     for j=22:230
         if(j==large_array_low(i))
             range_statistics_30(j-21)=range_statistics_30(j-21)+1;
         end
     end
 end
 

 range_statistics_30_double=zeros(1,209);%22~230�����272~26����
 for i=1:209
     if i<5
        range_statistics_30_double(i)=sum(range_statistics_30(1:4));
     elseif i>205
        range_statistics_30_double(i)=sum(range_statistics_30(206:209));
     else
         for j=i-4:i+4
           range_statistics_30_double(i)=range_statistics_30_double(i)+range_statistics_30(j);
         end
     end
 end
subplot(2,1,1)
stem(range_statistics_30_double)




%�Լ�д��function hist����  ��  
range_statistics_30_250=zeros(1,209);
 for i=1:length(large_array)
     for j=22:230
         if(j==large_array(i))
             range_statistics_30_250(j-21)=range_statistics_30_250(j-21)+1;
         end
     end
 end
 
 range_statistics_30_250_double=zeros(1,209);%22~230�����272~26����
 for i=1:209
     if i<5
        range_statistics_30_250_double(i)=sum(range_statistics_30_250(1:4));
     elseif i>205
        range_statistics_30_250_double(i)=sum(range_statistics_30_250(206:209));
     else
         for j=i-4:i+4
           range_statistics_30_250_double(i)=range_statistics_30_250_double(i)+range_statistics_30_250(j);
         end
     end
 end
subplot(2,1,2)
stem(range_statistics_30_250_double);hold on

[a_low,b_low]=max(range_statistics_30_double);%a��ֵ��c������  ��40���ʵ�30��������
[a_all,b_all]=max(range_statistics_30_250_double);
[a_all_detial,b_all_detial]=max(range_statistics_30_250);

plot(b_all,a_all,'*r');


[max1_a,max1_b]=max(range_statistics_30_250_double(30:100));%a�������� b������
[max2_a,max2_b]=max(range_statistics_30_250_double(50:100));%a�������� b������
plot(max1_b+29,max1_a,'ok');
plot(max2_b+49,max2_a,'or');
% [ findpeaks_time_domain_max_min ] = findpeaks_6( range_statistics_30_250_double);
% for i=1:length(findpeaks_time_domain_max_min)
%     plot(findpeaks_time_domain_max_min(i),range_statistics_30_250_double(findpeaks_time_domain_max_min(i)),'or');hold on
% end
%findpeaks_time_domain_max_min=diff(range_statistics_30_250_double,1);

% if(a_low<25)&&(a_all<90)
%     value=1;disp('0');

%{
if(a_low>=30)&&(a_all<120)
    heart_value=round(6000/(b_low+22));method=1;
elseif(a_all>100)&&(a_all<=400)
    heart_value=round(6000/(b_all+22));method=2;
elseif(a_all>400)
    heart_value=round(6000/(b_all_detial+22));method=3;
else
    heart_value=0;method=0;
end
%}

%{
if((b_all<50)&&(a_all<200)&&(max2_a>40))%50~100�д���40�Ĵ��ڵĻ�
    value=round(6000/(max2_b+49+22));method=1;
elseif((b_all<50)&&(a_all<200)&&(max1_a>40))%30~100�д���40�Ĵ��ڵĻ�
    value=round(6000/(max1_b+29+22));method=2;
elseif(a_low<30)&&(a_all>40)
    value=round(6000/(b_all+22));method=3;
elseif(a_all>100)&&(a_all<=400)
    value=round(6000/(b_all+22));method=4;
elseif(a_all>400)
    value=round(6000/(b_all_detial+22));method=5;
else
    value=0;
end
%}

if(((b_all<=10)&&(a_all>200))||((b_all>10)&&(b_all<=20)&&(a_all>150))||((b_all>20)&&(b_all<30)&&(a_all>110))||((b_all>=30)&&(b_all<40)&&(a_all>100))||((b_all>=40)&&(b_all<50)&&(a_all>90))||((b_all>=50)&&(b_all<60)&&(a_all>80))||((b_all>=60)&&(b_all<70)&&(a_all>70)))
    value=round(6000/(b_all+22));method=1;
elseif((b_all<50)&&(a_all<200)&&(max2_a>40))%50~100�д���40�Ĵ��ڵĻ�
    value=round(6000/(max2_b+49+22));method=1;
elseif((b_all<50)&&(a_all<200)&&(max1_a>40))%30~100�д���40�Ĵ��ڵĻ�
    value=round(6000/(max1_b+29+22));method=2;
elseif(a_low<30)&&(a_all>40)
    value=round(6000/(b_all+22));method=3;
else
    value=0;method=0;
end

%disp([num2str(f),'    ���� ',num2str(heart_value),'    a_low  ',num2str(a_low),'    a_all  ',num2str(a_all),'       ',num2str(method)])
disp([num2str(f),'    ���� ',num2str(value),'    a_low  ',num2str(a_low),'    a_all  ',num2str(a_all),'       ',num2str(method)])

% figure(3)
% plot(findpeaks_time_domain_max_min)
pause(2);

end


%%
figure(4)
subplot(2,1,1)
plot(range_statistics_30_250_double)

[b,a]=butter(2,2/100,'high');
data_filted=filter(b,a,range_statistics_30_250_double);
subplot(2,1,2)
plot(data_filted)














%%
%���ں����Ľ���
clc;clf;clear all;

load('G:\ocamar\BCGģ��������\2.5-40-200���ɺ���60-40.mat')
temp=1*2048;
data1=data(temp:temp+2047);


threshold=0.04; %�ж���ֵ%0.2�Ļ�������ЩС��ģ����Ըĵ�0.1������Ч����������0.04��0.02
data2=data1;
%3��Ԫ�صĴ���
for i=2:(length(data2)-1)%�ڶ�����������ڶ���
    a=abs(data2(i)-data2(i-1));
    b=abs(data2(i)-data2(i+1));
     if((a>=threshold)&&(b>=threshold))
         data2(i)=mean(data2(i-1)+data2(i+1))/2;
     end
end
%data2���쳣��ȥ����������
data_iteration=data2;

%==========================��ʼ��������

%---------------------------��ֵ�˲�---------------------------
% figure(1);
median_value=medfilt1(data_iteration,100);%noise suppression,keep useful information,150��ʱ��������Ͼ��Ѿ�û��������
subplot(4,1,1)
plot(data_iteration);xlabel("original");
subplot(4,1,2)
plot(median_value);xlabel("median filter");

%------------------------------��ȡ����Ư��---------------------------
[b,a]=butter(1,0.25/100,'low');
data_filted=filter(b,a,data_iteration);
% removebase=median_value-data_filted;%ȥ����һ��ͨ��lowfilter���źţ��õ�ȥ����Ư�Ƶ��ź�

subplot(4,1,3)
plot(data_filted);xlabel("removebase");

%%------------------------------��ƽ��ֵ����ֵ��---------------------------
n=length(data_iteration);
data_compare=zeros(1,n);
data_meaned=mean(data_filted(300:end));%��ƽ��ֵ
for i=1:n
    if(data_filted(i)>data_meaned)
        data_compare(i)=1;
    else
        data_compare(i)=0;
    end
end
subplot(4,1,4)
plot(data_compare);xlabel("binaryzation");    
% ylim([-2 2])
%---------------------------���������---------------------------
global k;
k=0;%��¼�����ظ���
indicate_for_k=[];
t=1;
for j=1:n-1 %����ֻ���������أ���Ҫ����Ϊ�½��ػ�����˲���ʱ��
   if(data_compare(j)==0)&&(data_compare(j+1)==1)
        k=k+1;
        indicate_for_k(t)=j;t=t+1;
   end
end
%����kֵ���ܻ�Ҫ��1
%disp(k)
%fprintf('The respiratory rate value is %d per minute.\n',k)
% toc


%==============����׼ȷ�Ķ��δ���=======2021��4��27��=========
if(k>=2)
    distance=indicate_for_k(end)-indicate_for_k(1);
    breath_value=60/((distance/(k-1))*0.010);
    %disp(['The breath rate value is ',num2str(breath_value)]);
else
    breath_value=0;
end
