function x = Logistic1(x0, N)
    % Logistic 映射生成混沌序列
    r = 3.999;  % Logistic 映射参数
    x = zeros(1, N);  % 初始化序列
    x(1) = x0;  % 初始值
    for i = 2:N
        x(i) = r * x(i-1) * (1 - x(i-1));  % 迭代生成混沌序列
    end
end