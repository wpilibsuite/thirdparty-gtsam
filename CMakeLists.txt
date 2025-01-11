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
fetchcontent_declare(
    Eigen3
    GIT_REPOSITORY    https://gitlab.com/libeigen/eigen.git
    GIT_TAG           0fb2ed140d4fc0108553ecfb25f2d7fc1a9319a1
    GIT_PROGRESS TRUE
)
FetchContent_GetProperties(Eigen3)

if(NOT Eigen3_POPULATED)
    FetchContent_Populate(Eigen3)

    # Create a build directory for Eigen
    set(eigen3_BUILD_DIR ${CMAKE_BINARY_DIR}/eigen3-build)
    message("Eigen source is ${eigen3_SOURCE_DIR}, build is ${eigen3_BUILD_DIR}")
    file(MAKE_DIRECTORY ${eigen3_BUILD_DIR})

    # Configure Eigen
    message("Hi configure - ${CMAKE_COMMAND} -S ${eigen3_SOURCE_DIR} -B ${eigen3_BUILD_DIR} -DCMAKE_INSTALL_PREFIX=${CMAKE_BINARY_DIR}/eigen-install")
    execute_process(COMMAND ${CMAKE_COMMAND} -S ${eigen3_SOURCE_DIR} -B ${eigen3_BUILD_DIR} -DCMAKE_INSTALL_PREFIX=${CMAKE_BINARY_DIR}/eigen-install)

    # Build and install Eigen
    execute_process(COMMAND ${CMAKE_COMMAND} --build ${EIGEN_BUILD_DIR} --target install)
endif()

# Set Eigen3_DIR to the installation location
set(Eigen3_DIR ${CMAKE_BINARY_DIR}/eigen-install/share/eigen3/cmake)

set(GTSAM_COMPILE_OPTIONS_PRIVATE_DEBUG CACHE INTERNAL FORCE)
set(GTSAM_COMPILE_OPTIONS_PRIVATE_RELWITHDEBINFO CACHE INTERNAL FORCE)
set(GTSAM_ENABLE_BOOST_SERIALIZATION OFF)
set(GTSAM_WITH_TBB OFF)
set(GTSAM_USE_BOOST_FEATURES OFF)
set(GTSAM_BUILD_PYTHON OFF)
set(GTSAM_BUILD_EXAMPLES_ALWAYS ON)
set(GTSAM_BUILD_TESTS ON)
set(BUILD_SHARED_LIBS OFF)
set(GTSAM_FORCE_SHARED_LIB OFF)
set(GTSAM_FORCE_STATIC_LIB ON)
set(GTSAM_USE_SYSTEM_EIGEN ON)

set(gtsam_patch git apply ${CMAKE_SOURCE_DIR}/patches/add-cassert.patch)
fetchcontent_declare(
    gtsam
    GIT_REPOSITORY    https://github.com/calcmogul/gtsam
    GIT_TAG           79960095b9d8e03dd9ee83d7e0c9cab810a05a72
    GIT_PROGRESS TRUE
    PATCH_COMMAND ${gtsam_patch}
    UPDATE_DISCONNECTED 1
)
fetchcontent_makeavailable(gtsam)
