read -p "Enter language (Java, C, C++, Zig, Rust): " lang

if [[ $lang == "Java" ]]; then
    cp ~/makeTemplates/makefile_Java $(pwd)/makefile
fi

