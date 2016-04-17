clc;
clear;
close all;


T = input('');
count_T = 0;
fid = fopen('out.txt', 'w');

while count_T < T
    count_T = count_T + 1;
    stat    = strcat('Case #', num2str(count_T), ':');
    
    N = input('');
    F = input('','s');
    F = str2num(F);
    
    len_chain   = zeros(1,N);
    num_subs    = 0; % Ð¡È¦×Ó
    connectivity    = zeros(1,N); % denote which subs each kid belongs
    
    for first_kid = 1:N
        if connectivity(first_kid) == 0
            num_subs = num_subs + 1;
            connectivity(first_kid) = num_subs;
        else
            continue;
        end;
        
        next_kid    = F(first_kid);
        while connectivity(next_kid) == 0
            connectivity(next_kid) = num_subs;
            next_kid = F(next_kid);
        end;
        if connectivity(next_kid) < num_subs
            connectivity(connectivity == num_subs) = connectivity(next_kid);
            num_subs = num_subs - 1;
        end;
    end;
    
    loop_size   = zeros(num_subs, 1);
    chain_size  = zeros(num_subs, 1);
    for subid = 1:num_subs
        kid_group = (connectivity == subid);
        [loop_size(subid), chain_size(subid)] = search_group(kid_group, F);
    end;
    
    max_circle = max([max(loop_size), sum(chain_size)]);
    
    stat = strjoin({stat, num2str(max_circle)}, ' ');
%     disp(stat);
    fprintf(fid, stat);
    fprintf(fid, '\n');
    
end;
fclose(fid);
