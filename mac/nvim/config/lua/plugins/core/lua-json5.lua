-- Put the following in $CARGO_HOME/config.toml
-- [target.x86_64-apple-darwin]
-- rustflags = [
--     "-C", "link-arg=-undefined",
--     "-C", "link-arg=dynamic_lookup",
-- ]

-- [target.aarch64-apple-darwin]
-- rustflags = [
--     "-C", "link-arg=-undefined",
--     "-C", "link-arg=dynamic_lookup",
-- ]

return {
    "Joakker/lua-json5",
    lazy = false,
    build = "./install.sh",
}
