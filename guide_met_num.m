function varargout = guide_met_num(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @guide_met_num_OpeningFcn, ...
                   'gui_OutputFcn',  @guide_met_num_OutputFcn, ...
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

function guide_met_num_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;

guidata(hObject, handles);
        set(handles.textX1,'Visible','on');
        set(handles.editX1,'Visible','on');
        set(handles.textX1,'String','B:');
        set(handles.textX0,'String','A:');

if strcmp(get(hObject,'Visible'),'off')
    ezplot('x');
    title('');
    cla
end

function varargout = guide_met_num_OutputFcn(hObject, eventdata, handles)

varargout{1} = handles.output;

function btn1_Callback(hObject, ~, handles)

global f df An Bn Cn err Xn 
popup_sel_index = get(handles.popupmenu1, 'Value');
f = get(handles.editEcn,'String');
tol = get(handles.editTol,'String');
if isempty(tol)
    tol ='0.0001';
end
tol = str2double(tol);
x0 =  get(handles.editX0,'String');
x1 =  get(handles.editX1,'String');
if ~isempty(x0)
x0 = str2double(x0);
else
   x0 = 0.1; 
end
if ~isempty(x1)
x1 = str2double(x1);
else
   x1 = 0; 
end
if isempty(f)
f = '(600*x^4)-(550*x^3)+(200*x^2)-(20*x)-1';
set(handles.editEcn,'String',f);
end
raiz = 0;
err = [];
switch popup_sel_index
    case 1
       [raiz,err,time,f,An,Bn,Cn] = metodo_biseccion(f,x0,x1,tol);
    case 2
        [raiz,err,time,f,Xn] = metodo_secante(f,x0,x1,tol);
    case 3
        [raiz,err,time,f,df,Xn] = metodo_newton(f,x0,tol);

end

a = get(handles.editMinX,'String');
b =  get(handles.editMaxX,'String');
if ~strcmp(a,'default') && ~strcmp(b,'default')
a = str2double(a);
b = str2double(b);
else
    a = 0;
    b= 0;
end
%%Crea la grafica 
axes(handles.axes1);
cla;
plotCustom(f,raiz,a,b);
%%Muestra los resultados
format shortEng 
t = strtrim(evalc('disp(time)')); %%Obtiene el tiempo en formato ingenieria y elimina espacios en blanco
str = sprintf('Raiz: %.5f\nt: %s s',raiz,t);
format %%Vuelve al formato normal
set(handles.result,'String',str);

function FileMenu_Callback(hObject, eventdata, handles)

function OpenMenuItem_Callback(hObject, eventdata, handles)

file = uigetfile('*.fig');
if ~isequal(file, 0)
    open(file);
end

function PrintMenuItem_Callback(hObject, eventdata, handles)

printdlg(handles.figure1)

function CloseMenuItem_Callback(hObject, eventdata, handles)

selection = questdlg(['Close ' get(handles.figure1,'Name') '?'],...
                     ['Close ' get(handles.figure1,'Name') '...'],...
                     'Yes','No','Yes');
if strcmp(selection,'No')
    return;
end

delete(handles.figure1)

function popupmenu1_Callback(hObject, eventdata, handles)

items = get(hObject,'String');
index_selected = get(hObject,'Value');
switch index_selected
    case 1
        set(handles.textX1,'Visible','on');
        set(handles.editX1,'Visible','on');
        set(handles.textX1,'String','B:');
        set(handles.textX0,'String','A:');
    case 2
        set(handles.textX1,'Visible','on');
        set(handles.editX1,'Visible','on');
        set(handles.textX1,'String','X1:');
        set(handles.textX0,'String','X0:');
    case 3
        set(handles.textX1,'Visible','off');
        set(handles.editX1,'Visible','off');
        set(handles.textX0,'String','X0:');
        
end

function popupmenu1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
     set(hObject,'BackgroundColor','white');
end

set(hObject, 'String', {'Metodo de Bisección', 'Metodo de la Secante', 'Metodo de Newton Rapshon'});



function editEcn_Callback(hObject, eventdata, handles)


function editEcn_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function editEcn_ButtonDownFcn(hObject, eventdata, handles)

function btn2_Callback(hObject, eventdata, handles)

cla
set(handles.editEcn,'String','');
set(handles.editTol,'String','');
set(handles.editX0,'String','');
set(handles.editX1,'String','');
set(handles.result,'String','');
legend(handles.axes1,'hide');
set(handles.editMinX,'String','default');
set(handles.editMaxX,'String','default');

function pushbutton4_Callback(hObject, eventdata, handles)

global f df An Bn Cn err Xn 
index_selected = get(handles.popupmenu1, 'Value');
h = figure;
u = uitable(h,'Position',[20 20 500 70]);
switch index_selected
    case 1
        h.Name = 'Metodo de Bisección';
        u.ColumnName = {'a','b','c','f(a)','f(b)','f(c)','error'};
        d = [An',Bn',Cn',f(An)',f(Bn)',f(Cn)',err'];
    case 2
        h.Name = 'Metodo de la Secante';
        u.ColumnName = {'Xn','f(Xn)','error'};
        d = [Xn',f(Xn)',err'];
        disp(err)
    case 3
        h.Name = 'Metodo de Newton Rapshon';
        u.ColumnName = {'Xn','f(Xn)','df(Xn)','error'};
        d = [Xn',f(Xn)',df(Xn)',err'];
end
u.Data = d; %%Asigna los datos a la tabla
%Ajusta el tamaño de la tabla y la figura

table_extent = get(u,'Extent');
set(u,'Position',[1 1 table_extent(3) table_extent(4)])
figure_size = get(h,'outerposition');
desired_fig_size = [figure_size(1) figure_size(2) table_extent(3)+15 table_extent(4)+90];
set(h,'outerposition', desired_fig_size);

function editEcn_KeyPressFcn(hObject, eventdata, handles)

function editMinX_Callback(hObject, eventdata, handles)

function editMinX_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editMaxX_Callback(hObject, eventdata, handles)

function editMaxX_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editTol_Callback(hObject, eventdata, handles)

function editTol_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editX0_Callback(hObject, eventdata, handles)

function editX0_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function popupmenu1_KeyPressFcn(hObject, eventdata, handles)

function editX1_Callback(hObject, eventdata, handles)

function editX1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
