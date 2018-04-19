function [L,U,P] = luFactor(A)
%   [L, U, P] = luFactor(A): utlizes the Gauss Elimination method with
%   pivoting and incooperates other methods to create LU Factorization.
%   This method allows you to easily solve a system of equations.
% input:
%   A = the matrix that comes from your system of equations (coefficient
%   matrix)
% output:
%   L = the resulting lower triangular matrix
%   U = the resulting upper triangular matrix
%   P = the resulting pivot matrix
if nargin<1,error('One input argument is required'),end %this ensures the proper amount of input arguments are made
if nargin>1,error('Only one input argument required'),end %this ensures the proper amount of input arguments are made
[n,n]=size(A); %checking the size of matrix
L=eye(n); P=L; U=A; %assigning process, eye is the identity matrix
for k=1:n 
    [pivot m]=max(abs(U(k:n,k))); %this line codes for the process of pivoting and accounts for the absolute value
    m=m+k-1;
    if m~=k  % interchange rows m and k in U
        T=U(k,:); % assigning to temporary variable (T)
        U(k,:)=U(m,:);
        U(m,:)=T; % returnig the value from Temporary
        % interchange rows m and k in P
        T=P(k,:); % assigning to T 
        P(k,:)=P(m,:);
        P(m,:)=T; % returning the value from T
        if k >= 2
            T=L(k,1:k-1);
            L(k,1:k-1)=L(m,1:k-1);
            L(m,1:k-1)=T;
        end
    end
    for j=k+1:n %loop necessary to print the output  
        L(j,k)=U(j,k)/U(k,k);
        U(j,:)=U(j,:)-L(j,k)*U(k,:);
    end
end
end

