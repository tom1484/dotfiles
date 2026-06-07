return {
    mason = "clang-format",
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
    config = {
        prepend_args = {
            "--style",
            "{BasedOnStyle: Google, IndentWidth: 4, UseTab: Never}",
        },
    },
}
