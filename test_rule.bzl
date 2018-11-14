def _test_rule(ctx):
    out = ctx.actions.declare_file("out.txt")
    files = ctx.attr.module_source.files
    for file_ in files:
        if file_.basename == "package.json":
            get_version(ctx.actions, file_, out)
            break
    return [DefaultInfo(files = depset([out]))]

test_rule = rule(
    implementation = _test_rule,
    attrs = {
        "module_source": attr.label(),
    },
)

def get_version(action_factory, file_, out):
    action_factory.run_shell(
        mnemonic = "getVersion",
        inputs = [file_],
        outputs = [out],
        command = """cat ./{file} | grep '"version":' > ./{out}""".format(file = file_.path, out = out.path),
    )
