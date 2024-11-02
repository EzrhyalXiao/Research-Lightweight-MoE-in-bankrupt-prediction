syms y(x) c
eqn=(2*x*y+(x^2-c^2)*diff(y,x)-2*x^2==0);
f=dsolve(eqn,'y(c)=c')
%% 

f=simplify(f,1000)
%% 

simplify(subs(f,x,c))
syms x A B C %%define bid from another side
f=A+B*x^2/(x+C);
bidv=finverse(f,x);%%solve v by d,calculate win prob with distribution
%% 

syms v b v2
u=(v-b)*(subs(bidv,b)^2-v2^2)%%%utility
%% 

eqqq=(diff(u,b)==0)%%%%FOC
%% 

solve(eqqq,b)%%%solve bid from this side