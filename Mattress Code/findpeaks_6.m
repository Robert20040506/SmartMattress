function [ findpeaks_time_domain_max_min ] = findpeaks_6( new_data)
%FINDPEAKS6 �˴���ʾ�йش˺�����ժҪ

p=1;
for i=7:203%����ȡ31����ͨ��ȡ66    
    if(((new_data(i)>new_data(i-1))&&(new_data(i)>new_data(i-2))&&(new_data(i)>new_data(i-3))&&(new_data(i)>new_data(i-4))&&(new_data(i)>new_data(i-5))&&(new_data(i)>new_data(i-6)))&&...
        ((new_data(i)>new_data(i+1))&&(new_data(i)>new_data(i+2))&&(new_data(i)>new_data(i+3))&&(new_data(i)>new_data(i+4))&&(new_data(i)>new_data(i+5))&&(new_data(i)>new_data(i+6))))
%     if(new_data(i)>30)
        %plot(f(i),Mag(i),'ok');hold on             %���ҵ��ķ�ֵ��ȦȦ 
        findpeaks_time_domain_max_min(1,p)=i;
         p=p+1;
    end
end
if p==1
    findpeaks_time_domain_max_min(1,1)=1;
end
end

