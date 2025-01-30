read -p "`echo $'Enter language or build tool:\n () Java\n () C\n () C++\n () Zig\n () Rust\n () gradle\nAnswer: '`" lang

if [[ $lang == "Java" ]]; then
    cp ~/buildTemplates/makefiles/makefile_Java $(pwd)/makefile
elif [[ $lang == "gradle" ]]; then
    cp -i ~/buildTemplates/gradle/build.gradle_javafx $(pwd)/build.gradle
fi

