workspace(name = "fine_grained_user_modules")

# refresh declaration should come in "header" of workspace file, before any loads
refresh(
    roots = ["node_modules"],
    repository = "generated_node_modules"
)

load(":use_node_modules.bzl", "use_node_modules")

use_node_modules("//:package.json")