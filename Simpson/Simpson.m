function I = Simpson(x,y)
%       uses the Simpson 1/3 rule when there is an even number of segments
%       and implements the trapezoidal rule when to the last segment if
%       there is an odd amount. 
% input:
%   func = name of function 
%   x,y = Where the function numerically evaluates the integral of the vector of function values ‘y’ with respect to ‘x
% output:
%   I = the final answer using the Simpson's rule or both the Simpson and
%   Trapezoidal rules
if nargin<2,error('At least 2 input arguments required'),end
if nargin>2,error('Cannot exceed 2 input arguements'),end
if size(x,1) ~= size(y,1),error ('The data in x and y must be equal to proceed'), end
dx=diff(x);%determines the spacing 
if all(dx ~= dx(1)),error ('The elements in vector x are not equally spaced'), end
n=length(x)-1; %This creates the number of intervals
if mod(n,2) == 1,warning ('The trapeziodal rule will be used on the last interval')
    Trap_x=x(end-1:end);
    Trap_y=y(end-1:end);
    Trap=(Trap_x(end)-Trap_x(end-1))*((Trap_y(end-1))-Trap_y(end))/2; %This is implementing the Trapezoidal rule for the last interval because it was odd
    Trap_n=length(x)-2;
    Simp=(Trap_x(1)-x(1))*(y(1)+4*sum(y(3:2:n))+2*sum(y(2:2:n))+Trap_y(1))/(3*Trap_n);
    I=Simp+Trap %The Simpson rule and Trapezoidal rule are combined here
else % This would be the case that the inervals were even to begin
    [b]=size(x,1); %This shows the size of x
    Simp=(x(b)-x(1))*(y(1)+4*sum(y(3:2:end-1))+2*sum(y(2:2:end-1))+y(end))/(3*n);
    I=Simp
end


    
    
    
    
