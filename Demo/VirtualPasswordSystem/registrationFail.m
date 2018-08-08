function varargout = registrationFail(varargin)
% REGISTRATIONFAIL MATLAB code for registrationFail.fig
%      REGISTRATIONFAIL, by itself, creates a new REGISTRATIONFAIL or raises the existing
%      singleton*.
%
%      H = REGISTRATIONFAIL returns the handle to a new REGISTRATIONFAIL or the handle to
%      the existing singleton*.
%
%      REGISTRATIONFAIL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in REGISTRATIONFAIL.M with the given input arguments.
%
%      REGISTRATIONFAIL('Property','Value',...) creates a new REGISTRATIONFAIL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before registrationFail_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to registrationFail_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help registrationFail

% Last Modified by GUIDE v2.5 14-Dec-2017 15:25:00

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @registrationFail_OpeningFcn, ...
                   'gui_OutputFcn',  @registrationFail_OutputFcn, ...
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


% --- Executes just before registrationFail is made visible.
function registrationFail_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to registrationFail (see VARARGIN)

% Choose default command line output for registrationFail
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes registrationFail wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = registrationFail_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in restartBtn.
function restartBtn_Callback(hObject, eventdata, handles)
% hObject    handle to restartBtn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
