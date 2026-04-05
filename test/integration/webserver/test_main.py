# test_main.py
# Run tests for webserver role
"""
roles/webserver/tasks/main.yml
"""

ROLEPATH = "roles/webserver"
PKG = "nginx"

def test_install_nginx_webserver__package_installed(host):
    """ Verify nginx package is installed """
    assert host.package(PKG).is_installed
