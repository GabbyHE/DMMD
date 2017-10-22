function [Tree] = CreateIndexTree(supNum, multiSegments)

% FUNCTION: create index tree

    layerNum = size(multiSegments,2);
    layer_1 = num2cell(1:supNum);
    Tree = cell(1, layerNum);
    Tree{1} = layer_1;
    for i = 1:layerNum
        segment_i = multiSegments(:,i);%第i块patch
        labels = unique(segment_i);%把segment_i中的元素按升序提出来，重复的只算一个
        layer_i = cell(1,length(labels));%构造空元胞数组
        for j = 1:length(labels)
            ind = find(segment_i==labels(j));
            layer_i(j) = {ind};
        end
        Tree{i+1} = layer_i;
        
    end
end