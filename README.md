# DSTDH
**Dual-level Semantic Transfer Deep Hashing for Efficient Social Image Retrieval**

Lei Zhu，Hui Cui，Zhiyong Cheng，Jingjing Li，Zheng Zhang.

The paper has been published by IEEE Transactions on Circuits and Systems for Video Technology.

url: https://doi.org/10.1109/TCSVT.2020.3001583


**Prerequisites**
1.	Requirements for Caffe, Pycaffe and Matcaffe.
2.	VGG-16 pre-trained model on ILSVC12 datasets, and save it in caffemodels directory.


**Installation**

Enter caffe directory and download the source codes.

    cd caffe/
    
Modify Makefile.config and build Caffe with following commands:

    make all -j8
    
    make pycaffe
    
    make matcaffe
    
    
    
**Usage**

We only supply the code to train 32-bit DSTDH on MIR Flickr dataset.

We integrate train step and test step in a bash file train32.sh, please run it as follows:

    sudo./train32.sh [ROOT_FOLDER] [GPU_ID]
    
    # ROOT_FOLDER is the root folder of image datasets,
    
    # GPU_ID is the GPU you want to train on,
    
    # e.g. sudo ./train32.sh ./flickr_25 1

**Citation**

If you find our approach useful in your research, please consider citing:

@article{'DSTDH',

    author   = {Lei Zhu，Hui Cui，Zhiyong Cheng，Jingjing Li，Zheng Zhang},
    
    journal  = {IEEE Transactions on Circuits and Systems for Video Technology (TCSVT)}, 
    
    title    = {Dual-level Semantic Transfer Deep Hashing for Efficient Social Image Retrieval},
    
    volume   = {31},
    
    number   = {4},
    
    pages    = {1478-1489},
    
    year     = {2021}
    
}
