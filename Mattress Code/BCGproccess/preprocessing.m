clc;clear all;
load('G:\ocamar\BCGģ����\BCGģ����MATLAB����\data1.mat')
subplot(2,1,1)
plot(data)
ylim([-1.65 1.65])
data2=data;
threshold=0.04; %�ж���ֵ%0.2�Ļ�������ЩС��ģ����Ըĵ�0.1

%3��Ԫ�صĴ���
for i=2:(length(data)-1)%�ڶ�����������ڶ���
    a=abs(data2(i)-data2(i-1));
    b=abs(data2(i)-data2(i+1));
     if((a>=threshold)&&(b>=threshold))
         data2(i)=mean(data2(i-1)+data2(i+1))/2;
     end
end

subplot(2,1,2)
plot(data2)
ylim([-1.65 1.65])

