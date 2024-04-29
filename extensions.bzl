load("//:copybara.bzl", "copybara_config")
load("//:copybara_dependencies.bzl", "copybara_dependency")

def _copybara_dependency_impl(_ctx):
    copybara_dependency()

version = tag_class(attrs = {"version": attr.string()})
sha256 = tag_class(attrs = {"sha256": attr.string()})

def _copybara_config_impl(module_ctx):
    copybara_config(
        copybara_sha256 = module_ctx.modules.tags.sha256,
        copybara_version = module_ctx.modules.tags.version,
    )

copybara_dependency_extension = module_extension(
    implementation = _copybara_dependency_impl,
)

copybara_config_extension = module_extension(
    implementation = _copybara_config_impl,
    tag_classes = {"version": version, "sha256": sha256},
)
