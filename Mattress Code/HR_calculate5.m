function [statistics_array_2D,statistics_array] = HR_calculate5( original_interval )

    %----------------------ԭʼ�������--------��ά����-----------
    original_interval2=original_interval;
    statistics_array=zeros(1,length(original_interval));%����
    statistics_array_2D=[];
    for i=1:length(original_interval)-1
        for j=1:length(original_interval)-1  %����ÿ����������һ����������ʵ�ʽ��Ҫ��1�����ǵ�����������Ļ���û��Ҫ��
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
    
    
  %{

    statistics_array_2D_num_average=[];
    statistics_array_2D_sum=sum(statistics_array_2D,2);%�Ծ�����Ԫ����ͣ��м��0Ҳ������������ֻ��ͳ����
    statistics_array_2D_num=sum(statistics_array_2D~=0,2);%����������������������з���Ԫ�صĸ���
    for i=1:row_n1
        statistics_array_2D_num_average(1,i)=statistics_array_2D_sum(i)/statistics_array_2D_num(i);
    end
    %���˾͵õ���statistics_array_2D��ÿ�е�ƽ��ֵ������ֱ���øü����������

    %----------------------ԭʼ���������--------��ά����-----------
    flag_2D=zeros(row_n1,column_n1);
    for i=1:row_n1
        t=1;
        for j=1:column_n1
             if (statistics_array_2D(i,j)>0) %����0�ſ�ʼ�ж�
                   flag_2D(i,t)=flag_2D(i,t)+1;%����������Ҫ��1
             end
             if (j>1)&&(statistics_array_2D(i,j-1)>0)&&(statistics_array_2D(i,j)==0)
                 t=t+1;
             end
        end
    end
    %all(flag_black==0,1);%����һ������������1��ʾ�Ƿ�Ϊȫ����
    flag2_2D=flag_2D;
    flag2_2D(:,all(flag2_2D==0,1))=[];%ɾ��ȫ����


    max_flag2=[];
    for i=1:row_n1
       max_flag2(i)=max(flag2_2D(i,:)); %�õ�ÿ���Լ������ֵ������2��2���������ֶַε������
    end
    %�Ƚ�ÿ�е����ֵ���õ����ֵ
    for i=1:length(max_flag2)
        [a_max_flag,b_max_flag]=max(max_flag2);
    end
    %Ȼ����ͨ�������ҵ���Ӧ�ļ����
    max_flag_value=statistics_array_2D_num_average(b_max_flag);

    
    %}
    
    
end

