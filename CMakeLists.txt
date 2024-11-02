if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE "RelWithDebInfo" CACHE STRING "" FORCE)
endif()

cmake_minimum_required(VERSION 3.16)

project(thirdparty-gtsam)

if(MSVC)
    target_compile_options(
        gtsam
        PRIVATE
            /FS
    )
endif()

set(GTSAM_ENABLE_BOOST_SERIALIZATION OFF)
set(GTSAM_USE_BOOST_FEATURES OFF)

include(FetchContent)
fetchcontent_declare(
    gtsam
    GIT_REPOSITORY    https://github.com/spacey-sooty/gtsam
    GIT_TAG           91d1dd3a9c587a833b517c5708f7bf37b0b5739d
)
fetchcontent_makeavailable(gtsam)
