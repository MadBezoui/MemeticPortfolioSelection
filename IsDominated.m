%
% Copyright (c) 2015, Yarpiz (www.yarpiz.com)
% All rights reserved. Please read the "license.txt" for license terms.
%
% Project Code: YPAP112
% Project Title:
%    Portfolio Optimization using Classic and Intelligent Methods in MATLAB
% 
% Publisher: Yarpiz (www.yarpiz.com)
% 
% Developer: S. Mostapha Kalami Heris (Member of Yarpiz Team)
% 
% Contact Info: sm.kalami@gmail.com, info@yarpiz.com
%

function f=IsDominated(rsk,ret)

    n=numel(rsk);

    f=false(n,1);
    
    for i=1:n
        for j=i+1:n
            if rsk(i)<rsk(j) && ret(i)>ret(j)
                f(j)=true;
            end
            if rsk(i)>rsk(j) && ret(i)<ret(j)
                f(i)=true;
            end
        end
    end

end