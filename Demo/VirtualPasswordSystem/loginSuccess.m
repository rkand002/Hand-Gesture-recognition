function varargout = loginSuccess(varargin)
% LOGINSUCCESS MATLAB code for loginSuccess.fig
%      LOGINSUCCESS, by itself, creates a new LOGINSUCCESS or raises the existing
%      singleton*.
%
%      H = LOGINSUCCESS returns the handle to a new LOGINSUCCESS or the handle to
%      the existing singleton*.
%
%      LOGINSUCCESS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LOGINSUCCESS.M with the given input arguments.
%
%      LOGINSUCCESS('Property','Value',...) creates a new LOGINSUCCESS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before loginSuccess_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to loginSuccess_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help loginSuccess

% Last Modified by GUIDE v2.5 14-Dec-2017 16:50:12

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @loginSuccess_OpeningFcn, ...
                   'gui_OutputFcn',  @loginSuccess_OutputFcn, ...
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


% --- Executes just before loginSuccess is made visible.
function loginSuccess_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to loginSuccess (see VARARGIN)

% Choose default command line output for loginSuccess
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes loginSuccess wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = loginSuccess_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
main();
closereq;
