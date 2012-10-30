#!/usr/bin/env python

from setuptools import setup
import package

try:
    longdesc = open('README.rst').read()
except Exception:
    longdesc = "Safe long description"

setup(
    # Metadata
    name='package',
    version='.'.join(map(str, package.VERSION))
    description='Description',
    long_description=longdesc,
    author='Josh Bothun',
    author_email='joshbothun@gmail.com',
    classifiers=[
        'Programming Language :: Python',
    ],
    install_requires=[]

    # Program data
    scripts=['bin/command'],
    packages=['package'],
)
