# test_install.py
# Run tests for webserver installation
"""
roles/webserver/tasks/install.yml
"""

SERVICE = "nginx"
PKG = "nginx"


def test_install_nginx_webserver__package_installed(host):
    """Verify nginx package is installed"""
    assert host.package(PKG).is_installed


def test_start_nginx_service__service_running_enabled(host):
    """Veryify nginx service is running and enabled"""
    assert host.service(SERVICE).is_running and host.service(SERVICE).is_enabled
