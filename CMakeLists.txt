cmake_minimum_required(VERSION 3.16)

project(thirdparty-gtsam)

set(GTSAM_ENABLE_BOOST_SERIALIZATION OFF)
set(GTSAM_USE_BOOST_FEATURES OFF)

include(ExternalProject)
ExternalProject_Add(gtsam
  GIT_REPOSITORY    https://github.com/mcm001/gtsam
  GIT_TAG           6d4d019f00d35739b23ebc673298d2c36d068a78
  SOURCE_DIR        "${CMAKE_CURRENT_BINARY_DIR}/gtsam-src"
  BINARY_DIR        "${CMAKE_CURRENT_BINARY_DIR}/gtsam-build"
)
