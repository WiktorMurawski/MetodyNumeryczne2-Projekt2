function y = mylogspace(d1,d2,n)
%LOGSPACE Logarithmically spaced vector.
%   LOGSPACE(X1, X2) generates a row vector of 50 logarithmically
%   equally spaced points between decades 10^X1 and 10^X2.  If X2
%   is pi, then the points are between 10^X1 and pi.
%
%   LOGSPACE(X1, X2, N) generates N points.
%   For N = 1, LOGSPACE returns 10^X2.
%
%   Class support for inputs X1,X2:
%      float: double, single
%
%   See also LINSPACE, COLON.

%   Copyright FUCKING NONE, ITS LITERALLY JUST LETTERS IN A FILE

if nargin == 2
    n = 10;
end

% who the fuck thought this was a good idea???
% if d2 == pi || d2 == single(pi) 
%     d2 = log10(d2); % if you're doing it for a constant, why not do log10(pi)???
% end

d1 = log10(d1);
d2 = log10(d2);

y = 10 .^ linspace(d1, d2, n);

end