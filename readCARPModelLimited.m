function [elem,elemID,pts]=readCARPModelLimited(filename)
%function [elem,elemID,pts,sheet,lon,tris]=readCARPModel(filename)

elemfile=[filename '.elem'];
fid=fopen(elemfile);
tic;
elemCell=textscan(fid,'%s%n%n%n%n%n','HeaderLines',1);
toc;
tic;
elem=[elemCell{1,2} elemCell{1,3} elemCell{1,4} elemCell{1,5}];
toc;
tic;
elemID=elemCell{1,6};
toc;

tic;
pts=dlmread([filename '.pts']);
pts=pts(2:end,:);
toc;
%sheet=load([filename '.sheet']);
%lon=load([filename '.lon']);
% tic;
% tris=dlmread([filename '.tris']);
% tris=tris(2:end,:);
% toc;

% tris=tris+1;
elem=elem+1;