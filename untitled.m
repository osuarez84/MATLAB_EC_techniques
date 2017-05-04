function varargout = untitled(varargin)
% UNTITLED MATLAB code for untitled.fig
%      UNTITLED, by itself, creates a new UNTITLED or raises the existing
%      singleton*.
%
%      H = UNTITLED returns the handle to a new UNTITLED or the handle to
%      the existing singleton*.
%
%      UNTITLED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED.M with the given input arguments.
%
%      UNTITLED('Property','Value',...) creates a new UNTITLED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled

% Last Modified by GUIDE v2.5 10-Apr-2017 15:04:05

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled_OutputFcn, ...
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


% --- Executes just before untitled is made visible.
function untitled_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled (see VARARGIN)

% Choose default command line output for untitled
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% ===========
% Init values
% ===========
set(handles.text1, 'String', 'Estart');
set(handles.text2, 'String', 'Evtx1');
set(handles.text3, 'String', 'Evtx2');
set(handles.text4, 'String', 'Estep');
set(handles.text5, 'String', 'Scan rate');
set(handles.text6, 'String', 'No. scans');
set(handles.text7, 'Visible', 'off');
set(handles.edit8, 'Visible', 'off');

set(handles.edit2, 'String', '0');
set(handles.edit3, 'String', '0');
set(handles.edit4, 'String', '0');
set(handles.edit5, 'String', '0');
set(handles.edit6, 'String', '0');
set(handles.edit7, 'String', '0');
set(handles.edit8, 'String', '0');

% UIWAIT makes untitled wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = untitled_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str = get(hObject, 'String');
val = get(hObject, 'Value');

 switch str{val};
     % VOLTAMETRIAS
     case 'CV'
        % Seteamos parámetros
        set(handles.text1, 'String', 'Estart');
        set(handles.text2, 'String', 'Evtx1');
        set(handles.text3, 'String', 'Evtx2');
        set(handles.text4, 'String', 'Estep');
        set(handles.text5, 'String', 'Scan rate');
        set(handles.text6, 'String', 'No. scans');
        
        % Los hacemos visibles o no...
        set(handles.text1, 'Visible', 'on');
        set(handles.text2, 'Visible', 'on');
        set(handles.text3, 'Visible', 'on');
        set(handles.text4, 'Visible', 'on');
        set(handles.text5, 'Visible', 'on');
        set(handles.text6, 'Visible', 'on');
        set(handles.text7, 'Visible', 'off');
        
        set(handles.edit2, 'Visible', 'on');
        set(handles.edit3, 'Visible', 'on');
        set(handles.edit4, 'Visible', 'on');
        set(handles.edit5, 'Visible', 'on');
        set(handles.edit6, 'Visible', 'on');
        set(handles.edit7, 'Visible', 'on');
        set(handles.edit8, 'Visible', 'off');        
        
     case 'LSV'
        set(handles.text1, 'String', 'Estart');
        set(handles.text2, 'String', 'Estop');
        set(handles.text3, 'String', 'Estep');                
        set(handles.text4, 'String', 'Scan rate');
        
        set(handles.text1, 'Visible', 'on');
        set(handles.text2, 'Visible', 'on');
        set(handles.text3, 'Visible', 'on');
        set(handles.text4, 'Visible', 'on');
        set(handles.text5, 'Visible', 'off');
        set(handles.text6, 'Visible', 'off');
        set(handles.text7, 'Visible', 'off');
        
        set(handles.edit2, 'Visible', 'on');
        set(handles.edit3, 'Visible', 'on');
        set(handles.edit4, 'Visible', 'on');
        set(handles.edit5, 'Visible', 'on');
        set(handles.edit6, 'Visible', 'off');
        set(handles.edit7, 'Visible', 'off');
        set(handles.edit8, 'Visible', 'off');
     case 'SCV'
        set(handles.text1, 'String', 'Ebegin');
        set(handles.text2, 'String', 'Eend');
        set(handles.text3, 'String', 'Estep');
        set(handles.text4, 'String', 'Scan rate');
        set(handles.text5, 'String', 'Segments / scans'); 
        
        set(handles.text1, 'Visible', 'on');
        set(handles.text2, 'Visible', 'on');
        set(handles.text3, 'Visible', 'on');
        set(handles.text4, 'Visible', 'on');
        set(handles.text5, 'Visible', 'on');
        set(handles.text6, 'Visible', 'off');
        set(handles.text7, 'Visible', 'off');
        
        set(handles.edit2, 'Visible', 'on');
        set(handles.edit3, 'Visible', 'on');
        set(handles.edit4, 'Visible', 'on');
        set(handles.edit5, 'Visible', 'on');
        set(handles.edit6, 'Visible', 'on');
        set(handles.edit7, 'Visible', 'off');
        set(handles.edit8, 'Visible', 'off');
     case 'DPV'
        set(handles.text1, 'String', 'Estart');
        set(handles.text2, 'String', 'Eend');
        set(handles.text3, 'String', 'Estep');
        set(handles.text4, 'String', 'Epulse');
        set(handles.text5, 'String', 'tPulse');
        set(handles.text6, 'String', 'Scan rate');
        
        set(handles.text1, 'Visible', 'on');
        set(handles.text2, 'Visible', 'on');
        set(handles.text3, 'Visible', 'on');
        set(handles.text4, 'Visible', 'on');
        set(handles.text5, 'Visible', 'on');
        set(handles.text6, 'Visible', 'on');
        set(handles.text7, 'Visible', 'off');
        
        set(handles.edit2, 'Visible', 'on');
        set(handles.edit3, 'Visible', 'on');
        set(handles.edit4, 'Visible', 'on');
        set(handles.edit5, 'Visible', 'on');
        set(handles.edit6, 'Visible', 'on');
        set(handles.edit7, 'Visible', 'on');
        set(handles.edit8, 'Visible', 'off');
     case 'NPV'
        set(handles.text1, 'String', 'Estart');
        set(handles.text2, 'String', 'Eend');
        set(handles.text3, 'String', 'Estep');
        set(handles.text4, 'String', 'tPulse');
        set(handles.text5, 'String', 'Scan rate');
        
        set(handles.text1, 'Visible', 'on');
        set(handles.text2, 'Visible', 'on');
        set(handles.text3, 'Visible', 'on');
        set(handles.text4, 'Visible', 'on');
        set(handles.text5, 'Visible', 'on');
        set(handles.text6, 'Visible', 'off');
        set(handles.text7, 'Visible', 'off');
        
        set(handles.edit2, 'Visible', 'on');
        set(handles.edit3, 'Visible', 'on');
        set(handles.edit4, 'Visible', 'on');
        set(handles.edit5, 'Visible', 'on');
        set(handles.edit6, 'Visible', 'on');
        set(handles.edit7, 'Visible', 'off');
        set(handles.edit8, 'Visible', 'off');
     case 'DNPV'
        set(handles.text1, 'String', 'Estart');
        set(handles.text2, 'String', 'Eend');
        set(handles.text3, 'String', 'Estep');
        set(handles.text4, 'String', 'Epulse');
        set(handles.text5, 'String', 'tPulse1');
        set(handles.text6, 'String', 'tPulse2');        
        set(handles.text7, 'String', 'tInt');        
        
        set(handles.text1, 'Visible', 'on');
        set(handles.text2, 'Visible', 'on');
        set(handles.text3, 'Visible', 'on');
        set(handles.text4, 'Visible', 'on');
        set(handles.text5, 'Visible', 'on');
        set(handles.text6, 'Visible', 'on');
        set(handles.text7, 'Visible', 'on');
        
        set(handles.edit2, 'Visible', 'on');
        set(handles.edit3, 'Visible', 'on');
        set(handles.edit4, 'Visible', 'on');
        set(handles.edit5, 'Visible', 'on');
        set(handles.edit6, 'Visible', 'on');
        set(handles.edit7, 'Visible', 'on');
        set(handles.edit8, 'Visible', 'on');
     case 'SWV'
        set(handles.text1, 'String', 'Ebegin');
        set(handles.text2, 'String', 'Eend');
        set(handles.text3, 'String', 'Estep');
        set(handles.text4, 'String', 'Amplitude');
        set(handles.text5, 'String', 'Frequency');
        
        set(handles.text1, 'Visible', 'on');
        set(handles.text2, 'Visible', 'on');
        set(handles.text3, 'Visible', 'on');
        set(handles.text4, 'Visible', 'on');
        set(handles.text5, 'Visible', 'on');
        set(handles.text6, 'Visible', 'off');
        set(handles.text7, 'Visible', 'off');
        
        set(handles.edit2, 'Visible', 'on');
        set(handles.edit3, 'Visible', 'on');
        set(handles.edit4, 'Visible', 'on');
        set(handles.edit5, 'Visible', 'on');
        set(handles.edit6, 'Visible', 'on');
        set(handles.edit7, 'Visible', 'off');
        set(handles.edit8, 'Visible', 'off');
     case 'ACV'
        set(handles.text1, 'String', 'Estart');
        set(handles.text2, 'String', 'Eend');
        set(handles.text3, 'String', 'Estep');
        set(handles.text4, 'String', 'AC amplitude');
        set(handles.text5, 'String', 'Scan rate'); 
        set(handles.text6, 'String', 'Frequency'); 
        
        set(handles.text1, 'Visible', 'on');
        set(handles.text2, 'Visible', 'on');
        set(handles.text3, 'Visible', 'on');
        set(handles.text4, 'Visible', 'on');
        set(handles.text5, 'Visible', 'on');
        set(handles.text6, 'Visible', 'on');
        set(handles.text7, 'Visible', 'off');
        
        set(handles.edit2, 'Visible', 'on');
        set(handles.edit3, 'Visible', 'on');
        set(handles.edit4, 'Visible', 'on');
        set(handles.edit5, 'Visible', 'on');
        set(handles.edit6, 'Visible', 'on');
        set(handles.edit7, 'Visible', 'on');
        set(handles.edit8, 'Visible', 'off');
     case 'SHACV'
         % TODO
     case 'FTACV'
         % TODO
         
     % AMPEROMETRIAS
     case 'AD'
        set(handles.text1, 'String', 'Edc');
        set(handles.text2, 'String', 'tInt');
        set(handles.text3, 'String', 'tRun');
        
        set(handles.text1, 'Visible', 'on');
        set(handles.text2, 'Visible', 'on');
        set(handles.text3, 'Visible', 'on');
        set(handles.text4, 'Visible', 'off');
        set(handles.text5, 'Visible', 'off');
        set(handles.text6, 'Visible', 'off');
        set(handles.text7, 'Visible', 'off');
        
        set(handles.edit2, 'Visible', 'on');
        set(handles.edit3, 'Visible', 'on');
        set(handles.edit4, 'Visible', 'on');
        set(handles.edit5, 'Visible', 'off');
        set(handles.edit6, 'Visible', 'off');
        set(handles.edit7, 'Visible', 'off');
        set(handles.edit8, 'Visible', 'off');
     case 'FA'
        set(handles.text1, 'String', 'Edc');
        set(handles.text2, 'String', 'tInt (<0.1ms)');
        set(handles.text3, 'String', 'tRun');
        
        set(handles.text1, 'Visible', 'on');
        set(handles.text2, 'Visible', 'on');
        set(handles.text3, 'Visible', 'on');
        set(handles.text4, 'Visible', 'off');
        set(handles.text5, 'Visible', 'off');
        set(handles.text6, 'Visible', 'off');
        set(handles.text7, 'Visible', 'off');
        
        set(handles.edit2, 'Visible', 'on');
        set(handles.edit3, 'Visible', 'on');
        set(handles.edit4, 'Visible', 'on');
        set(handles.edit5, 'Visible', 'off');
        set(handles.edit6, 'Visible', 'off');
        set(handles.edit7, 'Visible', 'off');
        set(handles.edit8, 'Visible', 'off');
     case 'PAD'
        set(handles.text1, 'String', 'Edc');
        set(handles.text2, 'String', 'Epulse1');
        set(handles.text3, 'String', 'tPulse1');
        set(handles.text4, 'String', 'Epulse2');
        set(handles.text5, 'String', 'tPulse2');
        set(handles.text6, 'String', 'tInt');  
        set(handles.text7, 'String', 'tRun');
        
        set(handles.text1, 'Visible', 'on');
        set(handles.text2, 'Visible', 'on');
        set(handles.text3, 'Visible', 'on');
        set(handles.text4, 'Visible', 'on');
        set(handles.text5, 'Visible', 'on');
        set(handles.text6, 'Visible', 'on');
        set(handles.text7, 'Visible', 'on');
        
        set(handles.edit2, 'Visible', 'on');
        set(handles.edit3, 'Visible', 'on');
        set(handles.edit4, 'Visible', 'on');
        set(handles.edit5, 'Visible', 'on');
        set(handles.edit6, 'Visible', 'on');
        set(handles.edit7, 'Visible', 'on');
        set(handles.edit8, 'Visible', 'on');
     case 'DPA'
        set(handles.text1, 'String', 'Edc');
        set(handles.text2, 'String', 'Epulse');
        set(handles.text3, 'String', 'tPulse');
        set(handles.text4, 'String', 'tInt');
        set(handles.text5, 'String', 'tRun');
        
        set(handles.text1, 'Visible', 'on');
        set(handles.text2, 'Visible', 'on');
        set(handles.text3, 'Visible', 'on');
        set(handles.text4, 'Visible', 'on');
        set(handles.text5, 'Visible', 'on');
        set(handles.text6, 'Visible', 'off');
        set(handles.text7, 'Visible', 'off');
        
        set(handles.edit2, 'Visible', 'on');
        set(handles.edit3, 'Visible', 'on');
        set(handles.edit4, 'Visible', 'on');
        set(handles.edit5, 'Visible', 'on');
        set(handles.edit6, 'Visible', 'on');
        set(handles.edit7, 'Visible', 'off');
        set(handles.edit8, 'Visible', 'off');
     case 'MSA'
         % TODO
     case 'ZRA'
         % TODO
     case 'HFP'
         % TODO
      
     % POTENCIOMETRIAS
     case 'PD'
         % TODO
     case 'CA/CC'
         % TODO => DSCP??
 end


% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function uipanel1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uipanel1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called




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



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

str = get(handles.popupmenu1, 'String');
val = get(handles.popupmenu1, 'Value');

var1 = get(handles.edit2, 'String');
var2 = get(handles.edit3, 'String');
var3 = get(handles.edit4, 'String');
var4 = get(handles.edit5, 'String');
var5 = get(handles.edit6, 'String');
var6 = get(handles.edit7, 'String');
var7 = get(handles.edit8, 'String');

 switch str{val};
     case 'CV'
        lut = OSgenerateCV(str2num(var1), str2num(var2), str2num(var3)...
                , str2num(var4), str2num(var6));
        plot(lut);
     case 'LSV'
        lut, lutS = OSgenerateLSV(str2num(var1), str2num(var2), str2num(var3));
        plot(lut);
     case 'SCV'
        % TODO
     case 'DPV'
        lut = OSgenerateDPV(str2num(var1), str2num(var2), str2num(var3),...
        str2num(var4), str2num(var5), str2num(var6));
        plot(lut);
     case 'NPV'
        lut = OSgenerateNPV(str2num(var1), str2num(var2),  str2num(var3),...
             str2num(var4),  str2num(var5));
        plot(lut);
     case 'DNPV'
        lut = OSgenerateDNPV(str2num(var1), str2num(var2), str2num(var3),...
            str2num(var4), str2num(var5), str2num(var6), str2num(var7));
        plot(lut);
     case 'SWV'
        lut = OSgenerateSWV(str2num(var1), str2num(var2), str2num(var3),...
            str2num(var4), str2num(var5));
        plot(lut);
     case 'ACV'
        lut = OSgenerateACV(str2num(var1), str2num(var2), str2num(var3),...
            str2num(var4), str2num(var5), str2num(var6));
        plot(lut);
     case 'SHACV'
         % TODO
     case 'FTACV'
         % TODO
 end


% --- Executes during object creation, after setting all properties.
function text1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function text2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function text3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function text4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
