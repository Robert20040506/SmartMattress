function [original_interval] = HR_calculate3( new_findpeaks_time_domain_max_min )
%HR_calculate �˴���ʾ�йش˺�����ժҪ
    %-------------------------�����һ������ǰһ�����ԭʼ���--------------------
    peaks_count=length(new_findpeaks_time_domain_max_min);
    original_interval=[];
    for i=1:(peaks_count-1) %n����ֵ�Ļ���ֻҪ��n-1�μ�����Ϳ�����
        original_interval(1,i)=(new_findpeaks_time_domain_max_min(1,i+1)-new_findpeaks_time_domain_max_min(1,i))-1;%�����1��Ϊ�˵õ���֮��ļ��
    end
end

