# Third party gtsam

Gradle packaging for gtsam

## Updating thirdparty library version

Eigen and GTSAM are pulled in via CMake using FetchContent. To update either, change the SHA or tag in [CMakeLists.txt](CMakeLists.txt). The Eigen version must be kept in sync with [the monorepo](https://github.com/wpilibsuite/allwpilib/blob/main/upstream_utils/eigen.py#L157) to avoid conflicts with wpimath.
