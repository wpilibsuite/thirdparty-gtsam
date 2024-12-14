rm gradleDir/ -rf
mkdir -p gradleDir/include/
find build/_deps/gtsam-src/ \( -name "*.h" -or -name "*.hpp" \) -exec cp {} gradleDir/include \;
