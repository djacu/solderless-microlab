# -*- coding: utf-8 -*-

from setuptools import setup, find_packages

requirements = [line.strip() for line in open("requirements.txt").readlines()]

setup(
    version='0.1.0',
    name='microlab-backend',
    description='the microlab backend',
    packages=find_packages(exclude=('tests', 'docs')),
    # entry_points={'console_scripts': ['flasksample = flasksample.app:main']},
    install_requires=requirements
)
