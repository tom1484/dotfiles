return {
    mason = "clang-format",
    opts = {
        extra_args = {
            "--style",
            "{BasedOnStyle: Google, IndentWidth: 4, UseTab: Never}",
        },
    },
}
