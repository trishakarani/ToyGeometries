function writeelemwID(filename,elem,elemID)

fileID=fopen(filename,'w');
%dlmwrite(filename,num2str(size(elem,1)));

elemAll=[elem elemID];

fprintf(fileID,[num2str(size(elemAll,1)) '\n']);
formatSpec='Tt %10.0f %10.0f %10.0f %10.0f %d\n';
fprintf(fileID,formatSpec,elemAll');
fclose(fileID);

