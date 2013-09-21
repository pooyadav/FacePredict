 result = load('test.txt');

%result = result';
si = [ones(Q,1) result(:,:)];
for k = 1 : Q
        zh = si(k,:) * wih;
        sh = [1 1./(1 + exp(-zh))];
        yj = sh * whj;
        sy = 1./(1 + exp(-yj))
        s(k,:) = sy;
end
