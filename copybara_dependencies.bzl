load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@com_github_rules_copybara_config//:config.bzl", "COPYBARA_SHA256", "COPYBARA_VERSION")

def copybara_dependency(maven_repo_mapping = "@maven"):
    http_archive(
        name = "com_github_google_copybara",
        sha256 = COPYBARA_SHA256,
        strip_prefix = "copybara-" + COPYBARA_VERSION,
        url = "https://github.com/google/copybara/archive/" + COPYBARA_VERSION + ".zip",
        repo_mapping = {"@maven": maven_repo_mapping},
    )
