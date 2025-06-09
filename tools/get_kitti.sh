mkdir -p data/kitti/ImageSets

wget -c https://raw.githubusercontent.com/traveller59/second.pytorch/master/second/data/ImageSets/test.txt \
     --no-check-certificate --content-disposition \
     -O data/kitti/ImageSets/test.txt

wget -c https://raw.githubusercontent.com/traveller59/second.pytorch/master/second/data/ImageSets/train.txt \
     --no-check-certificate --content-disposition \
     -O data/kitti/ImageSets/train.txt

wget -c https://raw.githubusercontent.com/traveller59/second.pytorch/master/second/data/ImageSets/val.txt \
     --no-check-certificate --content-disposition \
     -O data/kitti/ImageSets/val.txt

wget -c https://raw.githubusercontent.com/traveller59/second.pytorch/master/second/data/ImageSets/trainval.txt \
     --no-check-certificate --content-disposition \
     -O data/kitti/ImageSets/trainval.txt

