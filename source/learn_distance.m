
% Machine learning approaches
function mdl = learn_distance(X, y, mode)
%     X = randn(100,5);
%     y = X*[1;0;3;0;-1]+randn(100,1);
    if mode == 1
        mdl = train1(X, y);
    else
        mdl = train2(X, y);
    end
end

% we should do {feature scaling; cross valuation}

% approach 1: learn directly CSF
function model = train1(X, y)
    % regularizer: lasson to sparsify
    model = fitlm(X, y);
end


% approach 2: learn CSF pair similarity
function model = train2(X, y)
    % generate difference dataset
    m = size(y, 1); 
    Xnew = [];
    ynew = [];
    for i = 1:m-1
        for j = i+1:m 
            Xnew(end + 1, :) = abs(X(i, :) - X(j, :));
            ynew(end + 1) = norm(y(i) - y(j), 2);
        end
    end
    model = fitlm(Xnew, ynew);
end
