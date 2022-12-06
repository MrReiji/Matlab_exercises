h = pi/4;

x0 = 0;
y0 = sin(x0);

x1 = pi/4;
y1 = sin(x1);

x2 = pi/2;
y2 = sin(x2);

% Pochodna sin to cos

p_x0_prim = (1/2*h)*(-3*y0+4*y1-y2),
f_x0_prim = cos(x0),
disp(abs(p_x0_prim-f_x0_prim));
p_x1_prim = (1/2*h)*(y2-y0),
f_x1_prim = cos(x1),
disp(abs(p_x1_prim-f_x1_prim));
p_x2_prim = (1/2*h)*(y0-4*y1+3*y2),
f_x2_prim = cos(x2),
disp(abs(p_x2_prim-f_x2_prim));

func = @(x) 0.5 + x + 2*x^2;
funcv2 = @(x) 0.5 + x + 2*x^2 + 3*x^3;

func1 = func(1),
func2 = func(2),
func3 = func(3),

func1v2 = funcv2(1),
func2v2 = funcv2(2),
func3v2 = funcv2(3),

