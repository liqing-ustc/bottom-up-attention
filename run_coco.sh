#Conceptual_Captions_Root=/data/VL-BERT/data/conceptual-captions/
Conceptual_Captions_Root=/data2/datasets/conceptual-captions/
find ${Conceptual_Captions_Root}/val_frcnn -type f -size -1c -exec rm {} \;
python ./tools/generate_tsv_v2.py --gpu 0,1,2,3,4,5,6,7 --cfg experiments/cfgs/faster_rcnn_end2end_resnet.yml --def models/vg/ResNet-101/faster_rcnn_end2end_final/test.prototxt --net data/faster_rcnn_models/resnet101_faster_rcnn_final.caffemodel --split conceptual_captions_val --data_root ${Conceptual_Captions_Root} --out ${Conceptual_Captions_Root}/val_frcnn/
find ${Conceptual_Captions_Root}/train_frcnn -type f -size -1c -exec rm {} \;
python ./tools/generate_tsv_v2.py --gpu 0,1,2,3,4,5,6,7 --cfg experiments/cfgs/faster_rcnn_end2end_resnet.yml --def models/vg/ResNet-101/faster_rcnn_end2end_final/test.prototxt --net data/faster_rcnn_models/resnet101_faster_rcnn_final.caffemodel --split conceptual_captions_train --data_root ${Conceptual_Captions_Root} --out ${Conceptual_Captions_Root}/train_frcnn/
