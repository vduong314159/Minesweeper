function varargout = MinesweeperGUI(varargin)
% MINESWEEPERGUI M-file for MinesweeperGUI.fig
%      MINESWEEPERGUI, by itself, creates a new MINESWEEPERGUI or raises the existing
%      singleton*.
%
%      H = MINESWEEPERGUI returns the handle to a new MINESWEEPERGUI or the handle to
%      the existing singleton*.
%
%      MINESWEEPERGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MINESWEEPERGUI.M with the given input arguments.
%
%      MINESWEEPERGUI('Property','Value',...) creates a new MINESWEEPERGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before MinesweeperGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to MinesweeperGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help MinesweeperGUI

% Last Modified by GUIDE v2.5 01-Dec-2009 11:13:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MinesweeperGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @MinesweeperGUI_OutputFcn, ...
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


% --- Executes just before MinesweeperGUI is made visible.
function MinesweeperGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to MinesweeperGUI (see VARARGIN)

% Choose default command line output for MinesweeperGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes MinesweeperGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = MinesweeperGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes during object creation, after setting all properties.
function Minenesweeper_Board_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Minenesweeper_Board (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: place code in OpeningFcn to populate Minenesweeper_Board



function size_Callback(hObject, eventdata, handles)
% hObject    handle to size (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of size as text
%        str2double(get(hObject,'String')) returns contents of size as a double
user_entry = str2double(get(hObject,'string'));
if isnan(user_entry) | user_entry<1 | user_entry>30 | ceil(user_entry)~=user_entry
  errordlg('You must enter a positive intiger value less than 30 and greater than zero','Bad Input','modal')
  set(hObject,'String','1')
  uicontrol(hObject)
	return
end
input = str2num(get(hObject,'String'));

%checks to see if input is empty. if so, default to one
if (isempty(input))
     set(hObject,'String','1')
end
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function size_CreateFcn(hObject, eventdata, handles)
% hObject    handle to size (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function mines_Callback(hObject, eventdata, handles)
% hObject    handle to mines (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of mines as text
%        str2double(get(hObject,'String')) returns contents of mines as a double
user_entry = str2double(get(hObject,'string'));
size_input = str2double(get(handles.size,'string'))
if isnan(user_entry) | user_entry<1 | user_entry>size_input^2 | ceil(user_entry)~=user_entry
  errordlg('You must enter a positive intiger value less than size^2 and greater than zero','Bad Input','modal')
  set(hObject,'String','1')
  uicontrol(hObject)
	return
end

input = str2num(get(hObject,'String'));

%checks to see if input is empty. if so, default to one
if (isempty(input))
     set(hObject,'String','1')
end
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function mines_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mines (see GCBO)
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
mine_count = get(handles.mines,'String');
size = get(handles.size,'String');
size=str2num(size);
mine_count=str2num(mine_count);
[clicks,correct_flag]=Minesweeper(size,mine_count);
score=round((mine_count/size)*clicks*10);
EndGUI(clicks, correct_flag, mine_count, score);


