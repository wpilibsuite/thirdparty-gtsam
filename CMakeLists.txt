if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE "RelWithDebInfo" CACHE STRING "" FORCE)
endif()

cmake_minimum_required(VERSION 3.25)
set(CMAKE_OSX_ARCHITECTURES arm64 x86_64)
set(CMAKE_MSVC_DEBUG_INFORMATION_FORMAT Embedded)
project(thirdparty-gtsam)

include(FetchContent)

# Fetch Eigen
set(EIGEN_BUILD_BLAS OFF)
set(EIGEN_BUILD_LAPACK OFF)
set(EIGEN_BUILD_CMAKE_PACKAGE ON)
fetchcontent_declare(
    Eigen3
    GIT_REPOSITORY    https://gitlab.com/libeigen/eigen.git
    GIT_TAG           0fb2ed140d4fc0108553ecfb25f2d7fc1a9319a1
    SYSTEM # Ignore warnings
    # Make gtsam pick up this Eigen as our system Eigen
    OVERRIDE_FIND_PACKAGE
)

# And build GTSAM
set(GTSAM_COMPILE_OPTIONS_PRIVATE_DEBUG CACHE INTERNAL FORCE)
set(GTSAM_COMPILE_OPTIONS_PRIVATE_RELWITHDEBINFO CACHE INTERNAL FORCE)
set(GTSAM_ENABLE_BOOST_SERIALIZATION OFF)
set(GTSAM_USE_BOOST_FEATURES OFF)
set(GTSAM_BUILD_PYTHON OFF)
set(GTSAM_BUILD_EXAMPLES_ALWAYS OFF)
set(GTSAM_BUILD_TESTS OFF)
set(BUILD_SHARED_LIBS OFF)
set(GTSAM_FORCE_SHARED_LIB OFF)
set(GTSAM_FORCE_STATIC_LIB ON)
set(GTSAM_USE_SYSTEM_EIGEN ON)

fetchcontent_declare(
    gtsam
    GIT_REPOSITORY    https://github.com/borglab/gtsam
    GIT_TAG           d5f304ef50d65b89257dddd471df22a9b10c9e23
)
fetchcontent_makeavailable(gtsam)
