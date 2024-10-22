cmake_minimum_required(VERSION 3.16)

project(thirdparty-gtsam)

set(GTSAM_ENABLE_BOOST_SERIALIZATION OFF)
set(GTSAM_USE_BOOST_FEATURES OFF)

include(FetchContent)
fetchcontent_declare(
    gtsam
    GIT_REPOSITORY    https://github.com/spacey-sooty/gtsam
    GIT_TAG           298476c087d3ed0721ee69d8c01b990d93467a22
)
fetchcontent_makeavailable(gtsam)
