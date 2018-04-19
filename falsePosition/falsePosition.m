function [root,fx,ea,iter] = falsePosition(func,xl,xu,es,maxit,varargin)
% falsePosition: Locates the root of the zeros
%   [root,fx,ea,iter] = bisect(func,xl,xu,es,maxit,p1,p2,…):
%       uses falsePosition method to find the root of function by bisection
% input:
%   func = name of function 
%   xl, xu = lower and upper guesses
%   es = desired relative error (default = 0.0001%)
%   maxit = maximum allowable iterations (default = 50)
%   p1,p2,… = additional parameters used by func
% output:
%   root = real root
%   fx = function value at root
%   ea = approximate relative error (%)
%   iter = number of iterations

if nargin<3,error('at least 3 input arguments required'),end %this is important to ensure they have the required amount of input variables
test = func(xl,varargin{:}) * func(xu,varargin{:});
if test>0,error('no sign change'),end
if nargin<4|isempty(es), es = 0.0001;end
if nargin<5|isempty(maxit), maxit = 200;end
iter = 0; xr = xl; ea = 100;
while (1)
  xrold = xr;
  xr1 = double(func(xu))*(xl-xu); %The numerator of the xr equation
  xr2 = double(func(xl))-double(func(xu)); %The denominator of the xr equation
  xr = xu-(xr1/xr2); %This is how the falsePosition differs from the bisection method
  iter = iter + 1;
  if xr ~= 0,ea = abs((xr - xrold)/xr) * 100;end 
  test = func(xl,varargin{:}) * func(xr,varargin{:});
  if test < 0 %This decides which bounds to use next
    xu = xr;
  elseif test > 0 %This decides which bounds to use next
    xl = xr;
  else
    ea = 0;
  end
  if ea <= es | iter >= maxit,break,end %#ok<OR2>
end
root = xr; fx = func(xr, varargin{:});

