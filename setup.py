import os
import re
import codecs
from setuptools import setup, find_packages


def _find_version(*file_paths):
    """Read the version number from a source file.

    Why read it, and not import?
    see https://groups.google.com/d/topic/pypa-dev/0PkjVpcxTzQ/discussion

    """
    dirpath = os.path.abspath(os.path.dirname(__file__))
    with codecs.open(os.path.join(dirpath, *file_paths), "r", "latin1") as f:
        version_file = f.read()

    # The version line must have the pattern __version__="ver"
    version_match = re.search(r"^__version__ = ['\"]([^'\"]*)['\"]", version_file, re.M)
    if version_match:
        return version_match.group(1)
    raise RuntimeError("Unable to find version string")


install_requires = []

tests_require = ["pytest", "pytest-cov", "coverage"]

docs_require = ["sphinx", "sphinx_rtd_theme"]

demos_require = [
    # NOTE: demos require the installation of jupyter
    # but this process is done in scripts/install_jupyter.sh
    # because it requires to configure environment variables
]
extras_require = {
    "tests": install_requires + tests_require,
    "docs": install_requires + docs_require,
    "dev": install_requires + tests_require + docs_require + demos_require,
}


setup(
    name="Safran-template",
    version=_find_version("ses_template", "__init__.py"),
    description="Common utility functions",
    classifiers=[
        "Development Status :: Alpha",
        "Environment :: Console",
        "Operating System :: OS Independent",
        "Intended Audience :: Science/Research",
        "Programming Language :: Python :: 3.10",
        "Topic :: Scientific/Engineering",
    ],
    license="DF",
    author="The Data SES Team",
    author_email="herve.kouamo@safrangroup.com",
    url="",
    download_url="",
    include_package_data=False,
    install_requires=install_requires,
    tests_require=tests_require,
    extras_require=extras_require,
    packages=find_packages(),
    entry_points={
        "console_scripts": []
    }
)
