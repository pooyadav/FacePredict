
result = load('data_train_input.txt');
target = load('data_train_dest.txt');
eta = 0.5;
alpha = 0.7;
tol = 0.000000000000000000000000001;

%result = result';
%target = target';

[m n]  = size(result);



[a b]  = size(target);
Q = m;
n = n; q = 10; p = 1;

result = normalize(result,0.1,0.9);
target = normalize(target,0.1,0.9);

wih = 2 * rand(n+1,q) -1;
whj = 2 * rand(q+1,p) -1;
deltawih = zeros(n+1,q);
deltawhj = zeros(q+1,p);
deltawihold = zeros(n+1,q);
deltawhjold = zeros(q+1,p);
si = [ones(Q,1) result(:,:)];
d = target;
sh = [1 zeros(1,q)];
sy = zeros(1,p);
delta0 = zeros(1,p);
deltah = zeros(1,q+1);
sumerror = 2 * tol;
epocs = 1;
while(sumerror > tol)
    sumerror(1,epocs) = 0;
    for k = 1 : Q
        zh = si(k,:) * wih;
        sh = [1 1./(1 + exp(-zh))];
        yj = sh * whj;
        sy = 1./(1 + exp(-yj));
        ek = d(k) - sy;
        delta0 = ek .* sy .*(1 - sy);
        for h = 1 : q+1
            deltawhj(h,:) = delta0 * sh(h);
        end
        for h = 2 : q+1
            deltah(h)= (delta0*whj(h,:)')*sh(h)*(1-sh(h));
        end
        for i = 1 : n+1
            deltawih(i,:) = deltah(2:q+1)*si(k,i);
        end
        wih = wih + eta * deltawih + alpha * deltawihold;       
        whj = whj + eta * deltawhj + alpha * deltawhjold;
        deltawihold = deltawih;
        deltawhjold = deltawhj;
        sumerror(1,epocs) = sumerror(1,epocs) + sum(ek.^2);
    end
    sumerror(1,epocs)
    epocs = epocs + 1
    save 'w2ih.mat' wih -tabs;
    save 'w2hj.mat'  whj -tabs;
%     P2(epocs) = sumerror;
%     save 'newout2.mat' P2 -tabs
   figure(1), plot(epocs-1 ,sumerror(1,epocs-1),'+r'), hold on ;
   figure(2)
end
