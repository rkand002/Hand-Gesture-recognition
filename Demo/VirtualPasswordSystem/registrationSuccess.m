function varargout = registrationSuccess(varargin)
% REGISTRATIONSUCCESS MATLAB code for registrationSuccess.fig
%      REGISTRATIONSUCCESS, by itself, creates a new REGISTRATIONSUCCESS or raises the existing
%      singleton*.
%
%      H = REGISTRATIONSUCCESS returns the handle to a new REGISTRATIONSUCCESS or the handle to
%      the existing singleton*.
%
%      REGISTRATIONSUCCESS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in REGISTRATIONSUCCESS.M with the given input arguments.
%
%      REGISTRATIONSUCCESS('Property','Value',...) creates a new REGISTRATIONSUCCESS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before registrationSuccess_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to registrationSuccess_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help registrationSuccess

% Last Modified by GUIDE v2.5 14-Dec-2017 15:26:40

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @registrationSuccess_OpeningFcn, ...
                   'gui_OutputFcn',  @registrationSuccess_OutputFcn, ...
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


% --- Executes just before registrationSuccess is made visible.
function registrationSuccess_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to registrationSuccess (see VARARGIN)

% Choose default command line output for registrationSuccess
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes registrationSuccess wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = registrationSuccess_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
set(handles.drawingNumberStaticTxt, 'String', ' 0');


% --- Executes on button press in returnBtn.
function returnBtn_Callback(hObject, eventdata, handles)
% hObject    handle to returnBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
