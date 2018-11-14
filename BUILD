# The test just to make the generating repository rule work and inspect the results.
#
# Changing the version in package.json of the main project,
# or hacking the version in package.json of the simple-is
# (but then calling only bazel build //:test_generated-deps, without npm install)
# allows to verify the caching/invalidation properties.
#
# simple-is package was selected because it does not have any dependencies
load(":test_rule.bzl", "test_rule")

test_rule(
    name = "test_generated_deps",
    module_source = "@generated_node_modules//:simple-is",
)