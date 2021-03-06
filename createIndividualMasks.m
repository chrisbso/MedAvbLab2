%create masks for each vial with a threshold
function masks = createIndividualMasks(image,imageSize,threshold)
imageMask = image(:,:,1) > threshold;
cc = bwconncomp(imageMask);
masks = false([imageSize(1:2) cc.NumObjects]); 
for i = 1:cc.NumObjects
    currIdxList = int16(cc.PixelIdxList{i}');
    columnn = idivide(currIdxList,int16(imageSize(1)));
    roww = currIdxList - columnn*(imageSize(1));
    for j = 1:length(roww)
        masks(roww(j),columnn(j),i) = true;
    end
end

