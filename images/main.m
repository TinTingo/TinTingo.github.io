function varargout = main(varargin)
% MAIN MATLAB code for main.fig
%      MAIN, by itself, creates a new MAIN or raises the existing
%      singleton*.
%
%      H = MAIN returns the handle to a new MAIN or the handle to
%      the existing singleton*.
%
%      MAIN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAIN.M with the given input arguments.
%
%      MAIN('Property','Value',...) creates a new MAIN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before main_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to main_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help main

% Last Modified by GUIDE v2.5 28-Mar-2018 19:16:15

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @main_OpeningFcn, ...
    'gui_OutputFcn',  @main_OutputFcn, ...
    'gui_LayoutFcn',  [] , ...
    'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before main is made visible.
function main_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to main (see VARARGIN)

% Choose default command line output for main
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% �޸Ľ���ͼ��
h = handles.figure1; %��������
newIcon = javax.swing.ImageIcon('logo.jpg'); %Java��swingʹ��ImageIcon�����ͼƬ
figFrame = get(h,'JavaFrame'); %ȡ��Figure��JavaFrame��
figFrame.setFigureIcon(newIcon); %�޸�ͼ��
% ��ʾ��������
dayunm = calendar(year(now),month(now));
myday = num2cell(dayunm);
myW1 = {'��' 'һ' '��' '��' '��' '��' '��'};
myW2 = {'һ';'��';'��';'��';'��';'��'};
%��������д��uitable��
[a,b] = find(dayunm==day(now));
myday{a,b} = ['<html><FONT color=#ff0000">' num2str(myday{a,b}) '</Font></html>'];
[aa,bb] = find(dayunm==0);
for i=1:size(aa)
    myday{aa(i),bb(i)} = ['<html><FONT color=#000000">' num2str(myday{aa(i),bb(i)}) '</Font></html>'];
end
set(handles.uitable2,'data',myday);
set(handles.uitable3,'data',myW1);
set(handles.uitable4,'data',myW2);
% ��ʾ���¼ƻ�
filename = [num2str(year(now)),'_',datestr(date,'mm'),'.xls'];
if exist(filename,'file') == 0
    uitabledata = {'�޼ƻ�' '�޼ƻ�' '�޼ƻ�'};
    mytxt = xlswrite(filename,uitabledata);
    %��
    [~,~,rawdata] = xlsread(filename);
    str2 = [num2str(year(now)),' �� ',datestr(date,'mm'),' �¼ƻ���'] ;
    set(handles.edit3, 'String',str2);   % ��edit4��ʾ��ǰʱ���ַ�
    %��������д��uitable��
    set(handles.uitable1,'data',[]);
    set(handles.uitable1,'data',rawdata);
else
    %��
    [~,~,rawdata] = xlsread(filename);
    str2 = [num2str(year(now)),' �� ',datestr(date,'mm'),' �¼ƻ���'] ;
    set(handles.edit3, 'String',str2);   % ��edit4��ʾ��ǰʱ���ַ�
    %��������д��uitable��
    set(handles.uitable1,'data',[]);
    set(handles.uitable1,'data',rawdata);
end

% logo
axes(handles.axes5);
imshow('logo.jpg')

% ��ӱ���ͼƬ
Hd_axes = axes('units','normalized','position',[0 0 1 1],'tag','Hd_axes');
uistack(Hd_axes,'down')
II = imread('BG.png');
image(II)
colormap gray
set(Hd_axes,'handlevisibility','off','visible','off');

tintin = importdata('tintin.jpg');    % ��ȡtintinͼƬ
set(handles.pushbutton6,'CDATA',tintin);   % ���ð�ť12��ʾΪ��ȡtintinͼƬ
% axes3��ʾͼƬ
axes(handles.axes3);
imshow('TTCP.png')
% axes4��ʾͼƬ
axes(handles.axes4);
imshow('ZCDS.jpg')


t = timer('TimerFcn',{@timercallback,handles},'ExecutionMode',...
    'fixedRate', 'Period', 0.01);
start(t)
function timercallback(~, ~,handles)% ����ʱ����ʾ����
str = datestr(now, 'HH:MM:SS');     % ��ȡ��ǰʱ��ʱ���֣����ַ�

str1 = [num2str(year(date)),' ��',' ',datestr(date,'mm'),' ��',num2str(day(now)),' ��','  ʱ�䣺',str] ;
set(handles.edit2, 'String',str1);   % ��edit4��ʾ��ǰʱ���ַ�




% --- Outputs from this function are returned to the command line.
function varargout = main_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% ����������ҳ
% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
txt = get(handles.edit1,'string');
eval(['web',' ',txt])


% ��ʼ�����¼ƻ�
% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%
filename = [num2str(year(now)),'_',datestr(date,'mm'),'.xls'];
str2 = [num2str(year(now)),' �� ',datestr(date,'mm'),' �¼ƻ���'] ;
set(handles.edit3, 'String',str2);   % ��edit4��ʾ��ǰʱ���ַ�

set(handles.uitable1,'data',[]);

% ��Ӽƻ�
% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

content1 = get(handles.edit4,'string');
content2 = get(handles.edit5,'string');
content3 = get(handles.edit6,'string');

uitabledata = get(handles.uitable1,'data');
handles.uitabledata = uitabledata;
guidata(hObject,handles);

olddata = uitabledata;
newrow = {content1 content2 content3};
newdata = [olddata;newrow];

set(handles.uitable1,'data',newdata);

% ɾ���ƻ�
% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

uitabledata = get(handles.uitable1,'data');
handles.uitabledata = uitabledata;
guidata(hObject,handles);

olddata = uitabledata;
[a,~] = size(olddata);
olddata(a,:) = [];
newdata = olddata;

set(handles.uitable1,'data',newdata);

% ����tintin��վ
% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
web https://tintingo.github.io/ -browser        % ��վ���ӣ�������򿪣�

% ����ƻ�
% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
uitabledata = get(handles.uitable1,'data');
%д
txt = get(handles.edit3,'string');
filename = [txt(1:4),'_',txt(8:9),'.xls'];
delete(filename)
mytxt = xlswrite(filename,uitabledata);

% �鿴�����ƻ�
% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[pname,adrname] = uigetfile('*.xls');
%��
filename = [adrname pname];
[~,~,rawdata] = xlsread(filename);
str2 = [pname(1:4),' �� ',pname(6:7),' �¼ƻ���'] ;
set(handles.edit3, 'String',str2);   % ��edit4��ʾ��ǰʱ���ַ�

set(handles.uitable1,'data',rawdata);



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
