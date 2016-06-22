function varargout = EndGUI(varargin)
% ENDGUI M-file for EndGUI.fig
%      ENDGUI, by itself, creates a new ENDGUI or raises the existing
%      singleton*.
%
%      H = ENDGUI returns the handle to a new ENDGUI or the handle to
%      the existing singleton*.
%
%      ENDGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ENDGUI.M with the given input arguments.
%
%      ENDGUI('Property','Value',...) creates a new ENDGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before EndGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to EndGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help EndGUI

% Last Modified by GUIDE v2.5 02-Dec-2009 11:26:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @EndGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @EndGUI_OutputFcn, ...
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


% --- Executes just before EndGUI is made visible.
function EndGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to EndGUI (see VARARGIN)

% Choose default command line output for EndGUI
handles.output = hObject;

correct_flag=varargin{2};
mine_count=varargin{3};
clicks=varargin{1};
score=varargin{4};

if correct_flag==mine_count
    state='You win';
else
    state='You lose';
end
set(handles.text1,'String',state);

clicks=num2str(clicks);
set(handles.text3,'String',clicks);

score=num2str(score);
set(handles.score,'String',score);

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes EndGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);




% --- Outputs from this function are returned to the command line.
function varargout = EndGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in yes_button.
function yes_button_Callback(hObject, eventdata, handles)
% hObject    handle to yes_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all
MinesweeperGUI

% --- Executes on button press in no_button.
function no_button_Callback(hObject, eventdata, handles)
% hObject    handle to no_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all
