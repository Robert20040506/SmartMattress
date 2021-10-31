function [ new_findpeaks_time_domain_min ] = second_filtration( new_data ,findpeaks_time_domain_min, peaks_count_min )
%SECOND_FILTRATION
    p=1;
    for i=1:peaks_count_min
        if(i==1)                    %�жϵ�һ���Ƿ�Ӧ������
            diff_value_right=new_data(findpeaks_time_domain_min(1))/new_data(findpeaks_time_domain_min(2));
            %�����һ�������ڶ������ı�ֵ��С��0.7�Ļ���˵��(��һ�����)����Ӧ�ñ�ɾ���ĵ��ˣ����ͬʱ���ҲӦ��ҪС��60�Ŷ�
            if((abs(findpeaks_time_domain_min(2)-findpeaks_time_domain_min(1))<60)&&(diff_value_right<0.7))
                continue
            else
                new_findpeaks_time_domain_min(p)=findpeaks_time_domain_min(i);%�����������������������Ļ����ͱ���
                p=p+1;
            end
        elseif(i==peaks_count_min)  %�ж����һ���Ƿ�Ӧ������
            diff_value_left=new_data(findpeaks_time_domain_min(i))/new_data(findpeaks_time_domain_min(i-1));
            %������һ������뵹���ڶ������ı�ֵС��0.7�Ļ���˵��(���һ�����)��Ӧ���Ǳ�ɾ���ĵ��ˣ����ͬʱ���ҲӦ��ҪС��60�Ŷ�
            if((abs(findpeaks_time_domain_min(i)-findpeaks_time_domain_min(i-1))<60)&&(diff_value_left<0.7))
                continue
            else
                new_findpeaks_time_domain_min(p)=findpeaks_time_domain_min(i);%�����������������������Ļ����ͱ���
                p=p+1;
            end
        else                        %�������м��
            diff_value_left=new_data(findpeaks_time_domain_min(i))/new_data(findpeaks_time_domain_min(i-1));
            diff_value_right=new_data(findpeaks_time_domain_min(i))/new_data(findpeaks_time_domain_min(i+1 ));
            if((abs(findpeaks_time_domain_min(i)-findpeaks_time_domain_min(i-1))<60)&&(diff_value_left<0.7))||((abs(findpeaks_time_domain_min(i)-findpeaks_time_domain_min(i+1))<60)&&(diff_value_right<0.7))
                continue
            else
                new_findpeaks_time_domain_min(p)=findpeaks_time_domain_min(i);%�����������������������Ļ����ͱ���
                p=p+1;
            end
        end
    end


end

