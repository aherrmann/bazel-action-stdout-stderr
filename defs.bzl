def _custom_impl(ctx):
    run_out = ctx.actions.declare_file("{}.run".format(ctx.label.name))
    ctx.actions.run(
        inputs = [],
        outputs = [run_out],
        executable = "/bin/sh",
        arguments = [
            "-c",
            """\
echo run on stdout
echo run on stderr >&2
touch {}
""".format(run_out.path),
        ],
    )
    shell_out = ctx.actions.declare_file("{}.run_shell".format(ctx.label.name))
    ctx.actions.run_shell(
        inputs = [],
        outputs = [shell_out],
        command = """\
echo run_shell on stdout
echo run_shell on stderr >&2
touch {}
""".format(shell_out.path),
    )
    return [DefaultInfo(
        files = depset(direct = [run_out, shell_out])
    )]

custom = rule(_custom_impl)
