%----------------------------------------------
%openFDT
%This function opens an image volume in FDT file format.
%example: A=openFDT('DTI.fdt')
%A is of size 4 for a set of volume images.
%
%----------------------------------------------
%
%Downloaded from Angelos Barmpoutis' web-page.
%
%This program is freely distributable without 
%licensing fees and is provided without guarantee 
%or warrantee expressed or implied. This program 
%is NOT in the public domain. 
%
%Copyright (c) 2007 Angelos Barmpoutis. 
%
%VERSION : 20080319
%
%-----------------------------------------------

function data=openFDT(name)

fid=fopen(name,'r','b');

for i=1:4
  sz(i)=fread(fid,1,'int');
end

%sz

	data=zeros(sz(1),sz(2),sz(3),sz(4));
	for c=1:sz(4)
       for z=1:sz(3)
          for y=1:sz(2)
              data(:,y,z,c)=fread(fid,sz(1),'float');
          end
       end
	end

fclose(fid);