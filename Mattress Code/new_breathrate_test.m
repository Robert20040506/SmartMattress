
%׼������
clf;clc;clear all;
%load('G:\ocamar\�з��ɼ�����12-15��\analog switch test\ͨ��4_10M_����+����_����_����2.mat')
%datat=data(1584:14766);
%datat=data(15963:23882);
%datat=data(24876:29660);

% load('G:\ocamar\�з��ɼ�����12-15��\1-26������\������(1).mat')
% %datat=data(937:14267);
% datat=data(16026:33028);
% %datat=data(35246:39678);

load('G:\ocamar\�з��ɼ�����12-15��\1-26������\composite_t_and_f_2s5s10s_������_��.mat')
datat=data(1083:7771);
% datat=data(8456:18826);
% datat=data(20828:28169);


start=1;
% data2=datat(start:start+1023);%10s
data2=datat(start:start+1535);%15s
% data2=datat(start:start+2047);%20s
% data2=datat(start:start+2559);%20s
% data2=datat(start:start+3071);%20s

%ֻ�趨10s���ݣ�15s���ݣ�20s���ݣ�30s����

l=data2(2:2:end);%ȡ���� 10s����ѹ����512����(50Hz,20ms)
m=l(2:2:end);%ȡż��  512����ѹ����256����(25Hz,40ms)
n=m(2:2:end);

o=data2(8:8:end);

[b,a]=butter(4,1/12.5,'low');
new_data=filter(b,a,o);
plot(n)
hold on
plot(new_data)%ǰ45�����ȥ��
hold on
%removebase=median_value-data_filted;%ȥ����һ��ͨ��lowfilter���źţ��õ�ȥ����Ư�Ƶ��ź�


%������������ 12~20��/�֣���Ӧ�ֱ���20ms�ļ��250~150
%����������С�����80���ҷ�㣬�������80�ļ���ĺ�����Ļ�������˵ĺ�����37.5��/��

%������������ 12~20��/�֣���Ӧ�ֱ���40ms�ļ��125~75
%����������С�����40���ҷ�㣬�������40�ļ���ĺ�����Ļ�������˵ĺ�����37.5��/��

%������������ 12~20��/�֣���Ӧ�ֱ���80ms(��������12.5Hz)�ļ��62.5~37.5
%����������С�����20���ҷ�㣬�������20�ļ���ĺ�����Ļ�������˵ĺ�����37.5��/��

% for i=41:215
%     if(((new_data(i)>new_data(i-1))&&(new_data(i)>new_data(i-2))&&(new_data(i)>new_data(i-3))&&(new_data(i)>new_data(i-4))&&(new_data(i)>new_data(i-5))&&(new_data(i)>new_data(i-6))&&(new_data(i)>new_data(i-7))&&(new_data(i)>new_data(i-8))&&(new_data(i)>new_data(i-9))&&(new_data(i)>new_data(i-10))&&(new_data(i)>new_data(i-11))&&(new_data(i)>new_data(i-12))&&(new_data(i)>new_data(i-13))&&(new_data(i)>new_data(i-14))&&(new_data(i)>new_data(i-15))&&(new_data(i)>new_data(i-16))&&(new_data(i)>new_data(i-17))&&(new_data(i)>new_data(i-18))&&(new_data(i)>new_data(i-19))&&(new_data(i)>new_data(i-20))&&(new_data(i)>new_data(i-21))&&(new_data(i)>new_data(i-22))&&(new_data(i)>new_data(i-23))&&(new_data(i)>new_data(i-24))&&(new_data(i)>new_data(i-25))&&(new_data(i)>new_data(i-26))&&(new_data(i)>new_data(i-27))&&(new_data(i)>new_data(i-28))&&(new_data(i)>new_data(i-29))&&(new_data(i)>new_data(i-30))&&(new_data(i)>new_data(i-31))&&(new_data(i)>new_data(i-32))&&(new_data(i)>new_data(i-33))&&(new_data(i)>new_data(i-34))&&(new_data(i)>new_data(i-35))&&(new_data(i)>new_data(i-36))&&(new_data(i)>new_data(i-37))&&(new_data(i)>new_data(i-38))&&(new_data(i)>new_data(i-39))&&(new_data(i)>new_data(i-40)))&&...
%         ((new_data(i)>new_data(i+1))&&(new_data(i)>new_data(i+2))&&(new_data(i)>new_data(i+3))&&(new_data(i)>new_data(i+4))&&(new_data(i)>new_data(i+5))&&(new_data(i)>new_data(i+6))&&(new_data(i)>new_data(i+7))&&(new_data(i)>new_data(i+8))&&(new_data(i)>new_data(i+9))&&(new_data(i)>new_data(i+10))&&(new_data(i)>new_data(i+11))&&(new_data(i)>new_data(i+12))&&(new_data(i)>new_data(i+13))&&(new_data(i)>new_data(i+14))&&(new_data(i)>new_data(i+15))&&(new_data(i)>new_data(i+16))&&(new_data(i)>new_data(i+17))&&(new_data(i)>new_data(i+18))&&(new_data(i)>new_data(i+19))&&(new_data(i)>new_data(i+20))&&(new_data(i)>new_data(i+21))&&(new_data(i)>new_data(i+22))&&(new_data(i)>new_data(i+23))&&(new_data(i)>new_data(i+24))&&(new_data(i)>new_data(i+25))&&(new_data(i)>new_data(i+26))&&(new_data(i)>new_data(i+27))&&(new_data(i)>new_data(i+28))&&(new_data(i)>new_data(i+29))&&(new_data(i)>new_data(i+30))&&(new_data(i)>new_data(i+31))&&(new_data(i)>new_data(i+32))&&(new_data(i)>new_data(i+33))&&(new_data(i)>new_data(i+34))&&(new_data(i)>new_data(i+35))&&(new_data(i)>new_data(i+36))&&(new_data(i)>new_data(i+37))&&(new_data(i)>new_data(i+38))&&(new_data(i)>new_data(i+39))&&(new_data(i)>new_data(i+40))))
% for i=31:235 
%       if(((new_data(i)>new_data(i-1))&&(new_data(i)>new_data(i-2))&&(new_data(i)>new_data(i-3))&&(new_data(i)>new_data(i-4))&&(new_data(i)>new_data(i-5))&&(new_data(i)>new_data(i-6))&&(new_data(i)>new_data(i-7))&&(new_data(i)>new_data(i-8))&&(new_data(i)>new_data(i-9))&&(new_data(i)>new_data(i-10))&&(new_data(i)>new_data(i-11))&&(new_data(i)>new_data(i-12))&&(new_data(i)>new_data(i-13))&&(new_data(i)>new_data(i-14))&&(new_data(i)>new_data(i-15))&&(new_data(i)>new_data(i-16))&&(new_data(i)>new_data(i-17))&&(new_data(i)>new_data(i-18))&&(new_data(i)>new_data(i-19))&&(new_data(i)>new_data(i-20))&&(new_data(i)>new_data(i-21))&&(new_data(i)>new_data(i-22))&&(new_data(i)>new_data(i-23))&&(new_data(i)>new_data(i-24))&&(new_data(i)>new_data(i-25))&&(new_data(i)>new_data(i-26))&&(new_data(i)>new_data(i-27))&&(new_data(i)>new_data(i-28))&&(new_data(i)>new_data(i-29))&&(new_data(i)>new_data(i-30)))&&...
%           ((new_data(i)>new_data(i+1))&&(new_data(i)>new_data(i+2))&&(new_data(i)>new_data(i+3))&&(new_data(i)>new_data(i+4))&&(new_data(i)>new_data(i+5))&&(new_data(i)>new_data(i+6))&&(new_data(i)>new_data(i+7))&&(new_data(i)>new_data(i+8))&&(new_data(i)>new_data(i+9))&&(new_data(i)>new_data(i+10))&&(new_data(i)>new_data(i+11))&&(new_data(i)>new_data(i+12))&&(new_data(i)>new_data(i+13))&&(new_data(i)>new_data(i+14))&&(new_data(i)>new_data(i+15))&&(new_data(i)>new_data(i+16))&&(new_data(i)>new_data(i+17))&&(new_data(i)>new_data(i+18))&&(new_data(i)>new_data(i+19))&&(new_data(i)>new_data(i+20))&&(new_data(i)>new_data(i+21))&&(new_data(i)>new_data(i+22))&&(new_data(i)>new_data(i+23))&&(new_data(i)>new_data(i+24))&&(new_data(i)>new_data(i+25))&&(new_data(i)>new_data(i+26))&&(new_data(i)>new_data(i+27))&&(new_data(i)>new_data(i+28))&&(new_data(i)>new_data(i+29))&&(new_data(i)>new_data(i+30))))

% enddata=107;
% enddata=172;
enddata=236;
p=1;
for i=21:enddata      
      if(((new_data(i)>new_data(i-1))&&(new_data(i)>new_data(i-2))&&(new_data(i)>new_data(i-3))&&(new_data(i)>new_data(i-4))&&(new_data(i)>new_data(i-5))&&(new_data(i)>new_data(i-6))&&(new_data(i)>new_data(i-7))&&(new_data(i)>new_data(i-8))&&(new_data(i)>new_data(i-9))&&(new_data(i)>new_data(i-10))&&(new_data(i)>new_data(i-11))&&(new_data(i)>new_data(i-12))&&(new_data(i)>new_data(i-13))&&(new_data(i)>new_data(i-14))&&(new_data(i)>new_data(i-15))&&(new_data(i)>new_data(i-16))&&(new_data(i)>new_data(i-17))&&(new_data(i)>new_data(i-18))&&(new_data(i)>new_data(i-19))&&(new_data(i)>new_data(i-20)))&&...
          ((new_data(i)>new_data(i+1))&&(new_data(i)>new_data(i+2))&&(new_data(i)>new_data(i+3))&&(new_data(i)>new_data(i+4))&&(new_data(i)>new_data(i+5))&&(new_data(i)>new_data(i+6))&&(new_data(i)>new_data(i+7))&&(new_data(i)>new_data(i+8))&&(new_data(i)>new_data(i+9))&&(new_data(i)>new_data(i+10))&&(new_data(i)>new_data(i+11))&&(new_data(i)>new_data(i+12))&&(new_data(i)>new_data(i+13))&&(new_data(i)>new_data(i+14))&&(new_data(i)>new_data(i+15))&&(new_data(i)>new_data(i+16))&&(new_data(i)>new_data(i+17))&&(new_data(i)>new_data(i+18))&&(new_data(i)>new_data(i+19))&&(new_data(i)>new_data(i+20))))
         findpeaks_time_domain_max_min(1,p)=i;
         plot(i,new_data(i),'ok');hold on %���ҵ��ķ�ֵ��ȦȦ
         p=p+1;
      end
end


%-------------------------�����һ������ǰһ�����ԭʼ���--------------------
    peaks_count=length(findpeaks_time_domain_max_min);
    original_interval=[];
    for i=1:(peaks_count-1) %n����ֵ�Ļ���ֻҪ��n-1�μ�����Ϳ�����
        original_interval(1,i)=(findpeaks_time_domain_max_min(1,i+1)-findpeaks_time_domain_max_min(1,i))-1;%�����1��Ϊ�˵õ���֮��ļ��
    end
    %----------------------ԭʼ�������--------��ά����-----------
    original_interval2=original_interval;
    statistics_array=zeros(1,peaks_count);%����
    statistics_array_2D=[];
    for i=1:peaks_count-1
        for j=1:peaks_count-1  %����ÿ����������һ����������ʵ�ʽ��Ҫ��1�����ǵ�����������Ļ���û��Ҫ��
            if(original_interval2(1,j)==0)%����Ѿ�����Ϊ0�Ļ�����˵���Ѿ����ȽϹ��ұ�ȡ����
               continue 
            elseif(abs(original_interval2(1,i)-original_interval2(1,j))<12)
                statistics_array(1,i)=statistics_array(1,i)+1;%�����ͳ��ֵ��1
                statistics_array_2D(i,j)=original_interval2(1,j);
                %������Ҫ��һ����ά���飬���Ȼ���adiff_count,�е�Ԫ�������Ϊ10�ڵ�����
                if(i~=j)
                    original_interval2(1,j)=0;%��עԭ����adiff���Ѿ���ͳ�ƹ�(��С�ڱ���10)��ֵ
                end
            else
                %disp('no elements')
            end
        end
    end
    [row_n1,column_n1]=size(statistics_array_2D);
    

    statistics_array_2D_num_average=[];
    statistics_array_2D_sum=sum(statistics_array_2D,2);%�Ծ�����Ԫ����ͣ��м��0Ҳ������������ֻ��ͳ����
    statistics_array_2D_num=sum(statistics_array_2D~=0,2);%����������������������з���Ԫ�صĸ���
    for i=1:row_n1
        statistics_array_2D_num_average(1,i)=statistics_array_2D_sum(i)/statistics_array_2D_num(i);
    end
    %���˾͵õ���statistics_array_2D��ÿ�е�ƽ��ֵ������ֱ���øü����������


    
    [a_max_flag,b_max_flag]=max(statistics_array);
    %Ȼ����ͨ�������ҵ���Ӧ�ļ����
    max_flag_value=statistics_array_2D_num_average(b_max_flag);
    
    breath_value=750/max_flag_value
    
    

%%

%׼������
clf;clc;clear all;
%load('G:\ocamar\�з��ɼ�����12-15��\analog switch test\ͨ��4_10M_����+����_����_����2.mat')
%datat=data(1584:14766);
%datat=data(15963:23882);
%datat=data(24876:29660);

load('G:\ocamar\�з��ɼ�����12-15��\1-26������\������(1).mat')
%datat=data(937:14267);
datat=data(16026:33028);
%datat=data(35246:39678);

start=1*512;
data2=datat(start:start+1023);

%ֻ�趨10s���ݣ�15s���ݣ�20s���ݣ�30s����

% l=data2(2:2:end);%ȡ���� 10s����ѹ����512����(50Hz,20ms)
% m=l(2:2:end);%ȡż��  512����ѹ����256����(25Hz,40ms)
% n=m(2:2:end);
% 
% o=data2(8:8:end);

%[b,a]=butter(1,1/12.5,'low');
[b,a]=butter(1,1/100,'low');
new_data=filter(b,a,data2);
plot(data2)
hold on
plot(new_data)%ǰ45�����ȥ��
hold on









%%

%15s
%׼������
clf;clc;clear all;
%load('G:\ocamar\�з��ɼ�����12-15��\analog switch test\ͨ��4_10M_����+����_����_����2.mat')
%datat=data(1584:14766);
%datat=data(15963:23882);
%datat=data(24876:29660);

load('G:\ocamar\�з��ɼ�����12-15��\1-26������\������(1).mat')
%datat=data(937:14267);
datat=data(16026:33028);
%datat=data(35246:39678);

start=1*512;

data4=datat(start:start+1536);

n=data4(8:8:end);

[b,a]=butter(1,1/12.5,'low');
new_data=filter(b,a,n);
plot(n)
hold on
plot(new_data)%ǰ45�����ȥ��
hold on



p=1;
for i=21:171      
      if(((new_data(i)>new_data(i-1))&&(new_data(i)>new_data(i-2))&&(new_data(i)>new_data(i-3))&&(new_data(i)>new_data(i-4))&&(new_data(i)>new_data(i-5))&&(new_data(i)>new_data(i-6))&&(new_data(i)>new_data(i-7))&&(new_data(i)>new_data(i-8))&&(new_data(i)>new_data(i-9))&&(new_data(i)>new_data(i-10))&&(new_data(i)>new_data(i-11))&&(new_data(i)>new_data(i-12))&&(new_data(i)>new_data(i-13))&&(new_data(i)>new_data(i-14))&&(new_data(i)>new_data(i-15))&&(new_data(i)>new_data(i-16))&&(new_data(i)>new_data(i-17))&&(new_data(i)>new_data(i-18))&&(new_data(i)>new_data(i-19))&&(new_data(i)>new_data(i-20)))&&...
          ((new_data(i)>new_data(i+1))&&(new_data(i)>new_data(i+2))&&(new_data(i)>new_data(i+3))&&(new_data(i)>new_data(i+4))&&(new_data(i)>new_data(i+5))&&(new_data(i)>new_data(i+6))&&(new_data(i)>new_data(i+7))&&(new_data(i)>new_data(i+8))&&(new_data(i)>new_data(i+9))&&(new_data(i)>new_data(i+10))&&(new_data(i)>new_data(i+11))&&(new_data(i)>new_data(i+12))&&(new_data(i)>new_data(i+13))&&(new_data(i)>new_data(i+14))&&(new_data(i)>new_data(i+15))&&(new_data(i)>new_data(i+16))&&(new_data(i)>new_data(i+17))&&(new_data(i)>new_data(i+18))&&(new_data(i)>new_data(i+19))&&(new_data(i)>new_data(i+20))))
         findpeaks_time_domain_max_min(1,p)=i;
         plot(i,new_data(i),'ok');hold on %���ҵ��ķ�ֵ��ȦȦ
         p=p+1;
      end%%

%20s
%׼������
clf;clc;clear all;
%load('G:\ocamar\�з��ɼ�����12-15��\analog switch test\ͨ��4_10M_����+����_����_����2.mat')
%datat=data(1584:14766);
%datat=data(15963:23882);
%datat=data(24876:29660);

load('G:\ocamar\�з��ɼ�����12-15��\1-26������\������(1).mat')
%datat=data(937:14267);
datat=data(16026:33028);
%datat=data(35246:39678);

start=1*512;

data3=datat(start:start+2048);

n=data3(8:8:end);

[b,a]=butter(1,1/12.5,'low');
new_data=filter(b,a,n);
plot(n)
hold on
plot(new_data)%ǰ45�����ȥ��
hold on



p=1;
for i=21:235      
      if(((new_data(i)>new_data(i-1))&&(new_data(i)>new_data(i-2))&&(new_data(i)>new_data(i-3))&&(new_data(i)>new_data(i-4))&&(new_data(i)>new_data(i-5))&&(new_data(i)>new_data(i-6))&&(new_data(i)>new_data(i-7))&&(new_data(i)>new_data(i-8))&&(new_data(i)>new_data(i-9))&&(new_data(i)>new_data(i-10))&&(new_data(i)>new_data(i-11))&&(new_data(i)>new_data(i-12))&&(new_data(i)>new_data(i-13))&&(new_data(i)>new_data(i-14))&&(new_data(i)>new_data(i-15))&&(new_data(i)>new_data(i-16))&&(new_data(i)>new_data(i-17))&&(new_data(i)>new_data(i-18))&&(new_data(i)>new_data(i-19))&&(new_data(i)>new_data(i-20)))&&...
          ((new_data(i)>new_data(i+1))&&(new_data(i)>new_data(i+2))&&(new_data(i)>new_data(i+3))&&(new_data(i)>new_data(i+4))&&(new_data(i)>new_data(i+5))&&(new_data(i)>new_data(i+6))&&(new_data(i)>new_data(i+7))&&(new_data(i)>new_data(i+8))&&(new_data(i)>new_data(i+9))&&(new_data(i)>new_data(i+10))&&(new_data(i)>new_data(i+11))&&(new_data(i)>new_data(i+12))&&(new_data(i)>new_data(i+13))&&(new_data(i)>new_data(i+14))&&(new_data(i)>new_data(i+15))&&(new_data(i)>new_data(i+16))&&(new_data(i)>new_data(i+17))&&(new_data(i)>new_data(i+18))&&(new_data(i)>new_data(i+19))&&(new_data(i)>new_data(i+20))))
         findpeaks_time_domain_max_min(1,p)=i;
         plot(i,new_data(i),'ok');hold on %���ҵ��ķ�ֵ��ȦȦ
         p=p+1;
      end
end
end

%%

%20s
%׼������
clf;clc;clear all;
%load('G:\ocamar\�з��ɼ�����12-15��\analog switch test\ͨ��4_10M_����+����_����_����2.mat')
%datat=data(1584:14766);
%datat=data(15963:23882);
%datat=data(24876:29660);

load('G:\ocamar\�з��ɼ�����12-15��\1-26������\������(1).mat')
%datat=data(937:14267);
datat=data(16026:33028);
%datat=data(35246:39678);

start=1*512;

data3=datat(start:start+2048);

n=data3(8:8:end);

[b,a]=butter(1,1/12.5,'low');
new_data=filter(b,a,n);
plot(n)
hold on
plot(new_data)%ǰ45�����ȥ��
hold on



p=1;
for i=21:235      
      if(((new_data(i)>new_data(i-1))&&(new_data(i)>new_data(i-2))&&(new_data(i)>new_data(i-3))&&(new_data(i)>new_data(i-4))&&(new_data(i)>new_data(i-5))&&(new_data(i)>new_data(i-6))&&(new_data(i)>new_data(i-7))&&(new_data(i)>new_data(i-8))&&(new_data(i)>new_data(i-9))&&(new_data(i)>new_data(i-10))&&(new_data(i)>new_data(i-11))&&(new_data(i)>new_data(i-12))&&(new_data(i)>new_data(i-13))&&(new_data(i)>new_data(i-14))&&(new_data(i)>new_data(i-15))&&(new_data(i)>new_data(i-16))&&(new_data(i)>new_data(i-17))&&(new_data(i)>new_data(i-18))&&(new_data(i)>new_data(i-19))&&(new_data(i)>new_data(i-20)))&&...
          ((new_data(i)>new_data(i+1))&&(new_data(i)>new_data(i+2))&&(new_data(i)>new_data(i+3))&&(new_data(i)>new_data(i+4))&&(new_data(i)>new_data(i+5))&&(new_data(i)>new_data(i+6))&&(new_data(i)>new_data(i+7))&&(new_data(i)>new_data(i+8))&&(new_data(i)>new_data(i+9))&&(new_data(i)>new_data(i+10))&&(new_data(i)>new_data(i+11))&&(new_data(i)>new_data(i+12))&&(new_data(i)>new_data(i+13))&&(new_data(i)>new_data(i+14))&&(new_data(i)>new_data(i+15))&&(new_data(i)>new_data(i+16))&&(new_data(i)>new_data(i+17))&&(new_data(i)>new_data(i+18))&&(new_data(i)>new_data(i+19))&&(new_data(i)>new_data(i+20))))
         findpeaks_time_domain_max_min(1,p)=i;
         plot(i,new_data(i),'ok');hold on %���ҵ��ķ�ֵ��ȦȦ
         p=p+1;
      end
end