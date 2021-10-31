function [ breath_value ] = function_breathprocess( data )
%UNTITLED3 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��


threshold=0.04; %�ж���ֵ%0.2�Ļ�������ЩС��ģ����Ըĵ�0.1������Ч����������0.04��0.02
data2=data;
%3��Ԫ�صĴ���
for i=2:(length(data)-1)%�ڶ�����������ڶ���
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
% subplot(4,1,1)
% plot(data_iteration);xlabel("original");
% subplot(4,1,2)
% plot(median_value);xlabel("median filter");

%------------------------------��ȡ����Ư��---------------------------
[b,a]=butter(1,0.5/100,'low');
data_filted=filter(b,a,data_iteration);
% removebase=median_value-data_filted;%ȥ����һ��ͨ��lowfilter���źţ��õ�ȥ����Ư�Ƶ��ź�

% subplot(4,1,3)
% plot(data_filted);xlabel("removebase");

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
% subplot(4,1,4)
% plot(data_compare);xlabel("binaryzation");    
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

%===========================================================



end

