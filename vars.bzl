def _defineProgrammer_impl(ctx):
    return [
        platform_common.TemplateVariableInfo({
            "PROGPORT": ctx.attr.port,
        }),
    ]

defineProgrammer = rule(
    implementation = _defineProgrammer_impl,
    attrs = {"port": attr.string()},
)

def programmer(port = "/dev/ttyS5"):
    defineProgrammer(
        name = "programmerPort",
        port = "$(PROGRAMMER_PORT)",
    )
