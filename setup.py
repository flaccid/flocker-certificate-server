from setuptools import setup

try:
    import pkg_resources
    import setuptools
except ImportError:
    # Import setuptools if it's not already installed
    import distribute_setup
    distribute_setup.use_setuptools()

from setuptools import find_packages

setup(
    name="flocker_certificate_server",
    version="0.1",
    description=("""
    Server for transforming data from Catalog Agents and passing it on
    to the ClusterHQ SaaS Volume Catalog's search database.
    """),
    author="ClusterHQ, Inc.",
    author_email="flocker-users@clusterhq.com",
    url="https://github.com/ClusterHQ/volume-catalog",
    packages = find_packages(exclude=["*.tests", "*.tests.*", "tests.*", "tests"]),
    entry_points={
        "console_scripts": [
            "flocker-certificate-service = flocker_certificate_service.api:main",
        ],
    },
    install_requires=[
        "Twisted>=14",
        "treq>=14",
        "pyasn1>=0.1",
        "pyrsistent>=0.11.9",
        "eliot>=0.9.0",
        "streql",
    ],
)
