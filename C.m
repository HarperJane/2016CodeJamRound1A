clc;
clear;
close all;
% 没有考虑多个闭链的情况
T = input('');
count_T = 0;
fid = fopen('out.txt', 'w');
while count_T < T
    count_T = count_T + 1;
    stat = strcat('Case #', num2str(count_T), ':');
    
    N = input('');
    F = input('','s');
    F = str2num(F);
    
    max_circle = 0;
    for first_kid = 1:N
        current_kid = first_kid;
        kid_before  = 0;
        
        circle_size = 1;
        chosen      = zeros(1,N);
        chosen(first_kid) = 1;
        while true
            next_kid = F(current_kid);
            
            if chosen(next_kid) == 0
                chosen(next_kid) = 1;
                kid_before  = current_kid;
                current_kid = next_kid;
                circle_size = circle_size + 1;
                continue;
            end;
            
            if next_kid == first_kid
                break;
            end;
            
            if next_kid == kid_before
                circle_size = circle_size + in_kid(F, chosen, current_kid);
                break;
            end;
            
            circle_size = 0;
            break;
        end;
        if circle_size > max_circle
            max_circle = circle_size;
        end;
    end;
    stat = strjoin({stat, num2str(max_circle)}, ' ');
    
    fprintf(fid, stat);
    fprintf(fid, '\n');
%     disp(stat);
end;
fclose(fid);
        