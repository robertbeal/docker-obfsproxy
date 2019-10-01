import os
import pytest
import subprocess
import testinfra


@pytest.fixture(scope="session")
def host(request):
    subprocess.check_call(["docker", "build", "-t", "image-under-test", "."])
    docker_id = (
        subprocess.check_output(
            [
                "docker",
                "run",
                "--rm",
                "-d",
                "--entrypoint=/usr/bin/tail",
                "-t",
                "image-under-test",
            ]
        )
        .decode()
        .strip()
    )

    yield testinfra.get_host("docker://" + docker_id)

    # teardown
    subprocess.check_call(["docker", "rm", "-f", docker_id])


def test_system(host):
    assert host.system_info.distribution == "alpine"
    assert host.system_info.release.startswith("3.")


def test_entrypoint(host):
    entrypoint = "/usr/local/bin/entrypoint.sh"
    assert host.file(entrypoint).exists
    assert oct(host.file(entrypoint).mode) == "0o555"


def test_version(host):
    assert host.check_output("obfsproxy --version") == os.environ.get(
        "VERSION", "0.2.13"
    )


def test_user(host):
    user = "obfsproxy"
    assert host.user(user).exists
    assert host.user(user).shell == "/bin/false"


@pytest.mark.parametrize("package", [("python"), ("py-pip"), ("su-exec")])
def test_installed_dependencies(host, package):
    assert host.package(package).is_installed
