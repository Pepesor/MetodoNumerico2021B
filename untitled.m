function varargout = untitled(varargin)
% UNTITLED M-file for untitled.fig
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

% Last Modified by GUIDE v2.5 27-Apr-2014 02:35:00

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


% --- Executes on button press in calcular.
function calcular_Callback(hObject, eventdata, handles)
% hObject    handle to calcular (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

g=get(handles.dimension,'Value');
t=(get(handles.tabla,'data'));
t=str2double(t);
%w=isnan(t(1:g,1:g));
    xt=t(:,1);
    fx=t(:,2);
    x=xt;
    d=zeros(length(fx));
    d(:,1)=fx;
    for k=2:length(x)
        for j=1:length(x)+1-k
            d(j,k)=(d(j+1,k-1)-d(j,k-1))/(x(j+k-1)-x(j));
        end
    end
    % Formacion del solucion
    for w=1:length(x)
        ds=num2str(abs(d(1,w)));
        if w>1
            if x(w-1)<0
                sg1='+';
            else
                sg1='-';
            end
        end
        if d(1,w)<0
            sg2='-';
        else
            sg2='+';
        end
        if w==1
            acum=num2str(d(1,1));
        elseif w==2
            polact=['(x' sg1 num2str(abs(x(w-1))) ')' ];
            actual=[ds '*' polact];
            acum=[acum sg2 actual];
        else
            polact=[polact '*' '(x' sg1 num2str(abs(x(w-1))) ')' ];
            actual=[ds '*' polact];
            acum=[acum sg2 actual];
        end
    end
    
    set(handles.resultado,'string',acum);
    pol=inline(acum);
    fplot(handles.cuadro,pol,[min(x) max(x)]);
    grid on;
    zoom on;
    hold on;
 
    
 
vx=(get(handles.valor,'string'));
vx=str2double(vx);
if vx<min(xt)
    set(handles.error,'string','Ingrese un valor de x dentro del intervalo de valores de x de la tabla, asi sera posible visualizar el punto');
end
if vx>max(xt)
    set(handles.error,'string','Ingrese un valor de x dentro del intervalo de valores de x de la tabla,asi sera posible visualizar el punto');
end
p=(get(handles.resultado,'string'));
p=inline(p);
s=(feval(p,vx));
s=num2str(s);
set(handles.solucion,'string',s);
s=str2double(s);
plot(vx,s,'ko');
hold off

% --- Executes on button press in borrar.
function borrar_Callback(hObject, eventdata, handles)
% hObject    handle to borrar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.resultado,'string',' ');
set(handles.valor,'string',' ');
set(handles.solucion,'string',' ');
set(handles.error,'string',' ');


function valor_Callback(hObject, eventdata, handles)
% hObject    handle to valor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of valor as text
%        str2double(get(hObject,'String')) returns contents of valor as a double


% --- Executes during object creation, after setting all properties.
function valor_CreateFcn(hObject, eventdata, handles)
% hObject    handle to valor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in dimension.
function dimension_Callback(hObject, eventdata, handles)
% hObject    handle to dimension (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns dimension contents as cell array
%        contents{get(hObject,'Value')} returns selected item from dimension

g=get(handles.dimension,'Value');

switch g
    
    case 1
        set(handles.tabla,'Visible','off');
        set(handles.error,'string','Seleccione la dimensión del polinomio');
    case 2
        set(handles.tabla,'Visible','on');
        num_elem=cell(3,2);
        num_elem(:,:)={''};
        set(handles.tabla,'data',num_elem);
        set(handles.tabla,'ColumnEditable',true(1,1));
    case 3
        set(handles.tabla,'Visible','on');
        num_elem=cell(4,2);
        num_elem(:,:)={''};
        set(handles.tabla,'data',num_elem);
        set(handles.tabla,'ColumnEditable',true(1,1));
    case 4
        set(handles.tabla,'Visible','on');
        num_elem=cell(5,2);
        num_elem(:,:)={''};
        set(handles.tabla,'data',num_elem);
        set(handles.tabla,'ColumnEditable',true(1,1));
     case 5
        set(handles.tabla,'Visible','on');
        num_elem=cell(6,2);
        num_elem(:,:)={''};
        set(handles.tabla,'data',num_elem);
        set(handles.tabla,'ColumnEditable',true(1,1)); 
end

% --- Executes during object creation, after setting all properties.
function dimension_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dimension (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function Salir_Callback(hObject, eventdata, handles)
% hObject    handle to Salir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Close all

% --------------------------------------------------------------------
function Acercade_Callback(hObject, eventdata, handles)
% hObject    handle to Acercade (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

Untitled1
% --------------------------------------------------------------------
function Ayuda_Callback(hObject, eventdata, handles)
% hObject    handle to Ayuda (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Untitled2
