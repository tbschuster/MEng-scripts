% for wm, modify for csf and gm
data = importdata("wm.txt", ' ', 2);

bvals = str2num(data.textdata{1}(11:end));
response = data.data;

bnew = 0:200:10000;

response2 = interp1(bvals,response,bnew,'pchip');

save -ascii wm_response.txt response2 

sprintf('%.0f,', bnew)
% Add "# Shells: bvals " to first line of file