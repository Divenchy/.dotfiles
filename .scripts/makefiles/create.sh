read -p "Enter language (Java, C, C++, Zig, Rust): " lang

if [[ $lang == "Java" ]]; then
    cp ~/buildTemplates/makefiles/makefile_Java $(pwd)/makefile
elif [[ $lang == "gradle" ]]; then
    cp -i ~/buildTemplates/gradle/build.gradle_javafx $(pwd)/build.gradle
fi

