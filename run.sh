# todo 安装MinkowskiEngine
# todo 参考DZP师兄的
cd MinkowskiEngine
python setup.py install --blas=openblas --blas_include_dirs=$CONDA_PREFIX/include --blas_library_dirs=$CONDA_PREFIX/lib

# todo 推理/评估
python -m src.main +experiment=re10k \
    mode=test \
    data_loader.train.batch_size=1 \
    'dataset.roots'='["/home/lianghao/wangyushen/data/wangyushen/Datasets/re10k/re10k_subset"]' \
    dataset.test_chunk_interval=10 \
    dataset/view_sampler=evaluation \
    dataset.view_sampler.num_context_views=6 \
    dataset.view_sampler.index_path=/home/lianghao/wangyushen/Projects/VolSplat/assets/re10k_evaluation/evaluation_index_re10k.json \
    trainer.max_steps=150000 \
    model.encoder.num_scales=2 \
    model.encoder.upsample_factor=2 \
    model.encoder.lowest_feature_resolution=4 \
    model.encoder.monodepth_vit_type=vitb \
    test.save_video=false \
    test.save_depth_concat_img=true \
    test.save_image=true \
    test.save_gt_image=true \
    test.save_input_images=true \
    test.save_video=false \
    test.save_gaussian=false \
    checkpointing.pretrained_model=/home/lianghao/wangyushen/data/wangyushen/Weights/volsplat/volsplat-re10k-256x256.ckpt \
    output_dir=/home/lianghao/wangyushen/data/wangyushen/Output/volsplat/outputs/volsplat-re10k-256x256-test