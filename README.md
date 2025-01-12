# Third party gtsam
Third party gradle packaging for gtsam

## Updating thirdparty library version

Eigen and GTSAM are pulled in via Cmake using fetch content. To update either, change the SHA or tag in [CMakeLists.txt](CMakeLists.txt).