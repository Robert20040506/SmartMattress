
clc;
close all;
clear all;
%ɾ�������Ѿ��򿪵Ĵ��ڣ���������Ҫ����ֹ֮ǰ����û�йرմ���
delete(instrfindall);

s=serial('com5');
%s=serial('com12');
set(s,'BaudRate',115200,'DataBits',8,'StopBits',1,'Parity','none','FlowControl','none');
s.ReadAsyncMode = 'continuous';
s.InputBufferSize =1000;%Byte  550022Byte
% s.BytesAvailableFcnMode='byte';%�жϴ����¼�Ϊ��bytes-available Event��g
% s.BytesAvailableFcnCount=66;%���ջ�����ÿ�յ�33���ֽ�ʱ�������ص�����
% s.BytesAvailableFcn={@instrcallback};%�õ��ص��������

%s.BytesAvailableFcn={@EveBytesAvailableFcn,handles};%�ص�������ָ��
fopen(s);
fig = figure(1);


AxisMax =  1.8;    %���������ֵ
AxisMin = -1.8;    %��������Сֵ


% AxisMax =  2;    %���������ֵ
% AxisMin = -1;    %��������Сֵ
window_width = 8000;  %���ڿ��

data_512 = 0;        %512��������   ��512���ȶ�����������
%data_1024 = 0;       %1024��������  ��1024�ȶ������������
data_512_status = 0; %data_512����״̬ 0Ϊ�� 1Ϊһ�� 2Ϊ��  �����������ʵļ���
%data_1024_status = 0; %���ں����ʵ�����
heart_value =0;      %����ʵ��ֵ
breath_value=0;      %������ʵ��ֵ
aftermath=0;        %��һ��Ϊ�嶯��־

g_Count =0;          %���յ������ݼ���
SOF = 0;             %ͬ��֡��־

AxisValue = 1;       %����ֵ
RecDataDisp = zeros(1,100000,'double'); %����100000�����ݵ�Ԫ�����ڴ洢���յ������ݡ�
RecData = zeros(1,100,'double');        %����100�����ݵ�Ԫ���������ݴ���
Axis = zeros(1,100000);                 %����100000�����ݵ�Ԫ������X�ᡣ
heartrate_meter=zeros(1,1000,'double'); %���ڴ洢�������plot(RecDataDisp(1:52000))
heartrate_count = 1;                    %������¼��������
count_512_flag=0;
                                                              

count_256 = 0;%������¼256/512���ݵĸ���

window = window_width * (-0.9); %����X����ʼ����
axis([window, window + window_width, AxisMin, AxisMax]); %���ô������귶Χ

%float��4���ֽڣ�Windowsϵͳ���棬ÿ�н�β�ǡ�<�س�><����>�������� \r\n��
while ishandle(fig)
    %����ͬ���źű�־�� = 1��ʾ���յ���λ�����͵�ͬ��֡
    SOF = 0; 

    if(s.BytesAvailable>=176)
        for i=1:16
            RecData(1,i)=str2double(fscanf(s));
        end
    %RecData=fscanf(s,'%f',[1,66]);%���豸����s�ж���10*100��������䵽����A[10,100]�У������������ݸ�ʽ��š���������û�õģ�������
    %RecData=fread(s,6,'double');%���������ʵ������Եģ�����ǰ�ڵ�һ�λᱨ������ת���õ������ݲ�����ȷ��Ҫ���� if(s.BytesAvailable>=66)ʹ��
        SOF =1;
    end
    
    %���½��յ������ݲ���
if(SOF == 1)
    %��������
    RecDataDisp(AxisValue) =  RecData(1);
    RecDataDisp(AxisValue + 1) =  RecData(2);
    RecDataDisp(AxisValue + 2) =  RecData(3);
    RecDataDisp(AxisValue + 3) =  RecData(4);
    RecDataDisp(AxisValue + 4) =  RecData(5);
    RecDataDisp(AxisValue + 5) =  RecData(6);
    RecDataDisp(AxisValue + 6) =  RecData(7);
    RecDataDisp(AxisValue + 7) =  RecData(8);
    RecDataDisp(AxisValue + 8) =  RecData(9);
    RecDataDisp(AxisValue + 9) =  RecData(10);
    RecDataDisp(AxisValue + 10) =  RecData(11);
    RecDataDisp(AxisValue + 11) =  RecData(12);
    RecDataDisp(AxisValue + 12) =  RecData(13);
    RecDataDisp(AxisValue + 13) =  RecData(14);
    RecDataDisp(AxisValue + 14) =  RecData(15);
    RecDataDisp(AxisValue + 15) =  RecData(16);


    %����X��
    Axis(AxisValue) = AxisValue;
    Axis(AxisValue + 1) = AxisValue + 1;
    Axis(AxisValue + 2) = AxisValue + 2;
    Axis(AxisValue + 3) = AxisValue + 3;
    Axis(AxisValue + 4) = AxisValue + 4;
    Axis(AxisValue + 5) = AxisValue + 5;
    Axis(AxisValue + 6) = AxisValue + 6;
    Axis(AxisValue + 7) = AxisValue + 7;
    Axis(AxisValue + 8) = AxisValue + 8;
    Axis(AxisValue + 9) = AxisValue + 9;
    Axis(AxisValue + 10) = AxisValue + 10;
    Axis(AxisValue + 11) = AxisValue + 11;
    Axis(AxisValue + 12) = AxisValue + 12;
    Axis(AxisValue + 13) = AxisValue + 13;
    Axis(AxisValue + 14) = AxisValue + 14;
    Axis(AxisValue + 15) = AxisValue + 15;

    %���±���
    AxisValue = AxisValue + 16;
    g_Count = g_Count + 16;

    %���Ʋ���

    plot(Axis(1:AxisValue-1),  RecDataDisp(1:AxisValue-1), 'r');
    window = window + 16;
    axis([window, window + window_width, AxisMin, AxisMax]);
    grid on;
    drawnow
    %disp([num2str(AxisValue),'.',num2str(g_Count),'.',num2str(length(nonzeros(RecDataDisp)))]);
    %disp(s.InputBufferSize);
end

%-----------------------------------------------------------------------
%------------------------------------����-------------------------------
%-----------------------------------------------------------------------
%˵����һ�����������֣��嶯/�봲/���ݷ�����ֻ�������Ĵν���else���Ż���һ�κ����ʼ���
%Ҳ�����������ǽ���if����elseif�������жκ������ݵļ�¼
if(g_Count==256)
    %data=[];
    data=RecDataDisp(AxisValue-256:AxisValue-1);%�õ�data_256����
    %-------------------�봲�ж�--------------------%
    average_data = mean(data);%��������ƽ��ֵ
    max_differencee = max(data)-min(data);%������������ֵ
    if(average_data>=1.5)
        disp('�봲');
        if(data_512_status == 1)%data_512ǰ��������ݣ�����δ��ĺ������봲
            data_512(1:256)=[];
            data_512_status = 0;%��ôdata_512��Ҫ���ǰ��Σ�����״̬����
        end
    elseif(max_differencee>0.2000)%�����ѹ����ֵ����~�Ļ������ж�Ϊ�嶯
        disp('�嶯');
        if(data_512_status == 1)%data_512ǰ��������ݣ�����δ��ĺ������嶯
            data_512(1:256)=[];
            data_512_status = 0;%��ôdata_512��Ҫ���ǰ��Σ�����״̬����
        end
    else
        %�Ȳ����嶯�ֲ����봲�Ļ�
        switch data_512_status
            case 0
                data_512(1:256)=data;%Ϊ0�Ļ����ʹ���data_512����ǰ���
                data_512_status=1;
            case 1
                data_512(257:512)=data;%����data_512�������
                [ flag,heartrate_value ] = function_synthesize_arithmetic_B( data_512 );
                %data_512_status = 0;%����1����Ҫ�����buffer���������2����Ҫ�浽data_1024����
                if flag~=0
                        disp(['���� ',num2str(heartrate_value),'      ',num2str(flag)])
                else
                    disp('NG ');
                end
                
                %�ѱ��ε�(257:512)����������Ϊ��һ��5s��ǰ�벿�����ݱ�������
                data_512(1:256)=data;
                data_512_status=1;
            otherwise
                disp('other value');
        end
    end
    g_Count=0;
end
end


fclose(s);%�رմ����豸����                                                        
delete(s);%ɾ���ڴ��д����豸����
clear s;%��������ռ��д����豸����


