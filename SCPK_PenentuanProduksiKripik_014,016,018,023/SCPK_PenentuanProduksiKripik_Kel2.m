function varargout = SCPK_PenentuanProduksiKripik_Kel2(varargin)
% SCPK_PENENTUANPRODUKSIKRIPIK_KEL2 MATLAB code for SCPK_PenentuanProduksiKripik_Kel2.fig
%      SCPK_PENENTUANPRODUKSIKRIPIK_KEL2, by itself, creates a new SCPK_PENENTUANPRODUKSIKRIPIK_KEL2 or raises the existing
%      singleton*.
%
%      H = SCPK_PENENTUANPRODUKSIKRIPIK_KEL2 returns the handle to a new SCPK_PENENTUANPRODUKSIKRIPIK_KEL2 or the handle to
%      the existing singleton*.
%
%      SCPK_PENENTUANPRODUKSIKRIPIK_KEL2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SCPK_PENENTUANPRODUKSIKRIPIK_KEL2.M with the given input arguments.
%
%      SCPK_PENENTUANPRODUKSIKRIPIK_KEL2('Property','Value',...) creates a new SCPK_PENENTUANPRODUKSIKRIPIK_KEL2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SCPK_PenentuanProduksiKripik_Kel2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SCPK_PenentuanProduksiKripik_Kel2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SCPK_PenentuanProduksiKripik_Kel2

% Last Modified by GUIDE v2.5 05-Jun-2023 05:25:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SCPK_PenentuanProduksiKripik_Kel2_OpeningFcn, ...
                   'gui_OutputFcn',  @SCPK_PenentuanProduksiKripik_Kel2_OutputFcn, ...
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


% --- Executes just before SCPK_PenentuanProduksiKripik_Kel2 is made visible.
function SCPK_PenentuanProduksiKripik_Kel2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SCPK_PenentuanProduksiKripik_Kel2 (see VARARGIN)

% Choose default command line output for SCPK_PenentuanProduksiKripik_Kel2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes SCPK_PenentuanProduksiKripik_Kel2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);
set(handles.dataTable, 'Data', cell(0, 5));


% --- Outputs from this function are returned to the command line.
function varargout = SCPK_PenentuanProduksiKripik_Kel2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in hasil.
function hasil_Callback(hObject, eventdata, handles)
% hObject    handle to hasil (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fis=readfis('SCPK_PenentuanProduksiKripik_Kel2.fis');
input=[handles.perm handles.penj handles.pers];
out=evalfis(input,fis);
set(handles.produksi,'string',out);

bulan = get(handles.bulan,'string');
permintaan = get(handles.permintaan,'string');
penjualan = get(handles.penjualan,'string');
persediaan = get(handles.persediaan,'string');

newData = {bulan, permintaan, penjualan, persediaan, out};
existingData = get(handles.dataTable, 'data');
addedData = [existingData; newData];
disp(addedData);
set(handles.dataTable, 'Data', addedData);




function bulan_Callback(hObject, eventdata, handles)
% hObject    handle to bulan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bulan as text
%        str2double(get(hObject,'String')) returns contents of bulan as a double


% --- Executes during object creation, after setting all properties.
function bulan_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bulan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function permintaan_Callback(hObject, eventdata, handles)
% hObject    handle to permintaan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
perm=str2double(get(hObject,'string'));
handles.perm=perm;
guidata (hObject,handles);
% Hints: get(hObject,'String') returns contents of permintaan as text
%        str2double(get(hObject,'String')) returns contents of permintaan as a double


% --- Executes during object creation, after setting all properties.
function permintaan_CreateFcn(hObject, eventdata, handles)
% hObject    handle to permintaan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function penjualan_Callback(hObject, eventdata, handles)
% hObject    handle to penjualan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
penj=str2double(get(hObject,'string'));
handles.penj=penj;
guidata (hObject,handles);
% Hints: get(hObject,'String') returns contents of penjualan as text
%        str2double(get(hObject,'String')) returns contents of penjualan as a double


% --- Executes during object creation, after setting all properties.
function penjualan_CreateFcn(hObject, eventdata, handles)
% hObject    handle to penjualan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function persediaan_Callback(hObject, eventdata, handles)
% hObject    handle to persediaan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pers=str2double(get(hObject,'string'));
handles.pers=pers;
guidata (hObject,handles);
% Hints: get(hObject,'String') returns contents of persediaan as text
%        str2double(get(hObject,'String')) returns contents of persediaan as a double


% --- Executes during object creation, after setting all properties.
function persediaan_CreateFcn(hObject, eventdata, handles)
% hObject    handle to persediaan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in reset.
function reset_Callback(hObject, eventdata, handles)
% hObject    handle to reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.bulan, 'String', '');
set(handles.permintaan, 'String', '');
set(handles.penjualan, 'String', '');
set(handles.persediaan, 'String', '');
set(handles.produksi, 'String', '');



function produksi_Callback(hObject, eventdata, handles)
% hObject    handle to produksi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of produksi as text
%        str2double(get(hObject,'String')) returns contents of produksi as a double


% --- Executes during object creation, after setting all properties.
function produksi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to produksi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
