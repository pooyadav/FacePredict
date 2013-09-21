function [outCellArray] = structToArray ( inStruct )
	colnames = fieldnames ( inStruct );
	for colctr = 1:size(colnames,1)
		outCellArray(1,colctr) = {char(colnames(colctr))};
	end
	for rowctr = 1:size(inStruct,2)
		for colctr = 1:size(colnames,1)
			outCellArray(rowctr+1,colctr)={inStruct(rowctr).(char(colnames(colctr)))};
		end
	end
end