 
[elem, elemID, pts] = readCARPModelLimited('VSlabTt'); 

mean_elems = (pts(elem(:,1), :) + pts(elem(:,2), :) + pts(elem(:,3), :) + pts(elem(:,4), :)) / 4; %get avg x,y,z for each element
center_vertex = 7849;
center_x = pts(center_vertex + 1, 1);
center_y = pts(center_vertex + 1, 2);
center_z = pts(center_vertex + 1, 3);

[Idx, D] = knnsearch(mean_elems, [center_x center_y center_z], 'k', 50000); %get 50,000 nearest elements 
radius = 5000;
in_radius = D <= radius; %get whether index is in the circle 
find_in_radius = find(D <= radius); %get index values of Idx values in circle
idx_in_radius = Idx(1,find_in_radius(1,:)); %get all Idx values in circle 
elemID(idx_in_radius(1,:),1) = 1; %change elemID for all Idx values 

%check if the sum is the same as the number of elements 
elemresults = elemID(idx_in_radius(1,:)); 
sum(elemresults(:) == 1)
sum(elemID(:) == 1)
sum(in_radius(:) == 1)

writeelemwID('VSlab2regs.elem', elem, elemID); 

