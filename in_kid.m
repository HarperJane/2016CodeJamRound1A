function count = in_kid(F, chosen, current_kid)
if sum(chosen) == length(chosen)
    count = 0;
else
    fans = find(F == current_kid);
    if isempty(fans)
        count = 0;
    else
        tempcount = zeros(size(fans));
        for i = 1:length(fans)
            fan = fans(i);
            if chosen(fan) == 0
                tempchosen = chosen;
                tempchosen(fan) = 1;
                tempcount(i)    = 1 + in_kid(F, tempchosen, fan);
            end;
        end;
        count = max(tempcount);
    end;
end;
