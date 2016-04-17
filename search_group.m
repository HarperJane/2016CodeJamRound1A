function [loop_size, chain_size] = search_group(kids, F)

N           = length(F);
loop_size   = 0;
chain_size  = 0;
in_size     = zeros(1,N);

for first_kid = 1:N
    if ~kids(first_kid)
        continue;
    end;
    
    flag        = zeros(1,N);
    current_kid = first_kid;
    kid_before  = current_kid;
    count       = 1;
    flag(current_kid) = 1;
    while true
        next_kid = F(current_kid);
        
        if flag(next_kid) == 0
            kid_before  = current_kid;
            current_kid = next_kid;
            count = count + 1;
            flag(next_kid) = 1;
            continue;
        end;
        
        if next_kid == first_kid && count > 2
            if count > loop_size
                loop_size = count;
            end;
            break;
        end;
        
        if next_kid == kid_before
            if in_size(current_kid) == 0
                in_size(current_kid) = in_kid(F, flag, current_kid);
            end;
            count = count + in_size(current_kid);
            if count > chain_size
                chain_size = count;
            end;
            break;
        end;
        
        break;
    end;
end;
        
        
        