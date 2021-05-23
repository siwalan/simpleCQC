function results = cqc(frequency, damping, component)

% Input = Frequency, Damping, Component
% Component Matrix
% The component that wants to be calculated ....
% Row = DOF component; Columns = Mode
% Frequency Matrix
% Can either be column or row oriented, the first mode ...
% frequency should can be accessed using frequency(1), the second mode ..
% should can be accessed using frequency(2)
% Damping
% Same concept applies from Frequency Matrix

results =[];

for k=1:size(component,1)
    % Mode Shape
    result = 0;
    for i=1:size(component,2)
        for j=1:size(component,2)
           r = frequency(j)/frequency(i);
           corr_ij = (8*sqrt(damping(i)*damping(j))*(damping(i)+r*damping(j)*r^(3/2))/...
                        ((1-r^2)^2 + 4 * damping(i) * damping(j) * r *(1+r^2) + 4*(damping(i)^2 + damping(j)^2) * r^2));
           result = result + component(k,i) * corr_ij * component(k,j);
        end 
    end
    results = [results; sqrt(result)];
end

end
