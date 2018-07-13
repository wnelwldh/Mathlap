clear
function y=sinc_(x)
i=find(x==0);
x(i)= nan;
y = sin(pi*x)./(pi*x);
y(i) = 1;
end