%F=x数值解
dc=0.05;
cs=0:dc:1-dc;
n=size(cs,2);
v1=zeros(n,n);
v2=zeros(n,n);
for i=1:n
    for j=i:n
        c1=cs(i);
        c2=cs(j);
        f=@(x) [2*(x(1)-x(2))^2-9*(1-x(1))*(c2-c1); x(1)*x(2)-c1];
        x0 = [0, 1]; % 初始猜测值
%options = optimoptions('fsolve','Display','iter'); % 设置选项以显示迭代过程
        [x, fval] = fsolve(f, x0);
        v1(i,j)=x(1);
        v2(i,j)=min(x(2),1);
    end
end
% 创建网格
[X, Y] = meshgrid(cs, cs);



% 绘制曲面图
surf(X, Y, v1)
hold on
surf(X,Y,v2)
xlabel('c1')
ylabel('c2')
zlabel('v1*,v2*')
title('3D Surface Plot')
colormap('parula')
hold off