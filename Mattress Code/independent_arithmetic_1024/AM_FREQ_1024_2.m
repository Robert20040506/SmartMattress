function [freq_interval_result,statistics_array_2D_freq_2 ] = AM_FREQ_1024_2( data )

%�������ͽ�����ֵ�����Ѿ�������һ�εļ������ͼ�������ԱȽϵģ����Կ϶��ǲ����ٽ��������ԱȽϵģ�ֻ��Ҫֱ�ӷ���Ϳ����ˣ�

data2=data;%���Ƴ���������Ԫ�ر�0�滻���޷�����ʹ��ԭ����
freq_count=length(data);
statistics_array_freq=zeros(1,freq_count);%������adiff_count
statistics_array_2D_freq_2=[];
for t_freq=1:freq_count
    for h_freq=1:freq_count  %����ÿ����������һ����������ʵ�ʽ��Ҫ��1�����ǵ�����������Ļ���û��Ҫ��
        if(data2(1,h_freq)==0)%����Ѿ�����Ϊ0�Ļ�����˵���Ѿ����ȽϹ��ұ�ȡ����
           continue 
        elseif(abs(data2(1,t_freq)-data2(1,h_freq))<2)
            statistics_array_freq(1,t_freq)=statistics_array_freq(1,t_freq)+1;%�����ͳ��ֵ��1
            statistics_array_2D_freq_2(t_freq,h_freq)=data2(1,h_freq);
            %������Ҫ��һ����ά���飬���Ȼ���adiff_count,�е�Ԫ�������Ϊ10�ڵ�����
            if(t_freq~=h_freq)
                data2(1,h_freq)=0;%��עԭ����adiff���Ѿ���ͳ�ƹ�(��С�ڱ���10)��ֵ
            end
        else
            %disp('no elements')
        end
    end
end
[row,column]=size(statistics_array_2D_freq_2);





%�ⲿ����Ϊ�˵õ������ÿ�е�ƽ��ֵ
statistics_array_2D_freq_sum=sum(statistics_array_2D_freq_2,2);%�Ծ�����Ԫ����ͣ��м��0Ҳ������������ֻ��ͳ����
statistics_array_2D_freq_num=sum(statistics_array_2D_freq_2~=0,2);%����������������������з���Ԫ�صĸ���
for i=1:row
    statistics_array_2D_freq_num_average(1,i)=statistics_array_2D_freq_sum(i)/statistics_array_2D_freq_num(i);
end

 
[~,b]=max(statistics_array_freq); %�õ�������������
freq_interval_result=statistics_array_2D_freq_num_average(b);


end



