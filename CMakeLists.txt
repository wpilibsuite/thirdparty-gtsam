cmake_minimum_required(VERSION 3.16)

project(thirdparty-gtsam)

include(FetchContent)
fetchcontent_declare(
    gtsam
    GIT_REPOSITORY    https://github.com/spacey-sooty/gtsam
    GIT_TAG           340399f87a1874723e5ea87e0f1ad60345383bbb
)
fetchcontent_makeavailable(gtsam)
