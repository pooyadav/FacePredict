function [x] = normalize(x,nmin,nmax)

p = minmax(x);
[m n] = size(p);
less = p(1,1);
more = p(1,2);

for i = 1 : m
    if(less > p(i,1))
        less = p(i,1);
    end
    if(more < p(i,2))
        more = p(i,2);
    end
end

x = nmin + (nmax - nmin) * (x - less)/(more - less);