function varargout = registration(varargin)
% REGISTRATION MATLAB code for registration.fig
%      REGISTRATION, by itself, creates a new REGISTRATION or raises the existing
%      singleton*.
%
%      H = REGISTRATION returns the handle to a new REGISTRATION or the handle to
%      the existing singleton*.
%
%      REGISTRATION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in REGISTRATION.M with the given input arguments.
%
%      REGISTRATION('Property','Value',...) creates a new REGISTRATION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before registration_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to registration_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help registration

% Last Modified by GUIDE v2.5 14-Dec-2017 15:43:44

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @registration_OpeningFcn, ...
                   'gui_OutputFcn',  @registration_OutputFcn, ...
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


% --- Executes just before registration is made visible.
function registration_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to registration (see VARARGIN)

% Choose default command line output for registration
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes registration wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = registration_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function userNameEditTxt_Callback(hObject, eventdata, handles)
% hObject    handle to userNameEditTxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of userNameEditTxt as text
%        str2double(get(hObject,'String')) returns contents of userNameEditTxt as a double


% --- Executes during object creation, after setting all properties.
function userNameEditTxt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to userNameEditTxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in startBtn.
function startBtn_Callback(hObject, eventdata, handles)
% hObject    handle to startBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

userName = get(handles.userNameEditTxt, 'String');
predictNum = register_start(userName);


AlfaResult=covert2Alfa(predictNum)

%aa= predictNum(1)
%a = num2str(predictNum(1));
%b = num2str(predictNum(2));
%c = num2str(predictNum(3));
%s= strcat(a      ,b    ,c );
s=AlfaResult

set(handles.drawStaticTxt, 'Visible', 'Off');
set(handles.userNameStaticTxt, 'Visible', 'Off');
set(handles.userNameEditTxt, 'Visible', 'Off');
set(handles.startBtn, 'Visible', 'Off');
set(handles.registrationSuccessStaticTxt, 'Visible', 'On');
set(handles.drawingStaticTxt, 'Visible', 'On');
set(handles.returnBtn, 'Visible', 'On');
set(handles.drawingNumberStaticTxt, 'Visible', 'On');
set(handles.drawingNumberStaticTxt, 'String', s);
setNumber(userName, predictNum);

%set(handles.userEditTxt, 'String', ' ');


% --- Executes on button press in returnBtn.
function returnBtn_Callback(hObject, eventdata, handles)
% hObject    handle to returnBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%[uss, num] = getNumber();
%set(handles.drawingNumberStaticTxt, 'String', uss);
main();
closereq;
