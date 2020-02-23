This repository contains a buildout to install a development environment
for MorpCC, MorpFW and Rulez. 

Installing
============

You will need Visual Studio Code to make use of a number of convenience helpers
that have been preconfigured for the development of MorpCC. If you dont want to
use VSCode, read up ``.vscode/tasks.json`` for the common tasks. 

Checkout from git::

    git clone https://github.com/morpframework/mfw_workspace.git

Load the directory with VSCode::

    code mfw_workspace

Building
==========

To build, in VSCode command prompt, ``Tasks: Run Task > Build Project``. This will trigger
buildout to build the project.

Build script have been tested on Fedora 30, on ``Python 3.7``. Project relies on
``dataclasses``, so Python earlier than 3.7 is not supported. You may need to
install some build dependencies from your distro package manager for the python 
dependencies to build. 

Starting Demo CMS
=====================

``morpcc.tests.democms`` includes a demo application for testing/development
of the platform. You will need to setup following databases on your local
PostgreSQL installation:

* morpcc_democms
* morpcc_democms_warehouse
* morpcc_democms_cache

Configuration of the democms application resides in
``dev/morpcc/morpcc/tests/democms/settings.yml``

You will need to generate an alembic migration script to initialize your
database. We decided not to include default migration scripts so that it is
easier for devs to customize migration scripts to suit their own needs. 

To generate alembic migration, in VSCode command prompt, ``Tasks: Run Task >
Generate Migrations``.

To initialize database, in VSCode command prompt, ``Tasks: Run Task > Update
database``

To create initial admin user, in VSCode command prompt, ``Tasks: Run Task >
Create default admin user (admin:admin)``

To start, in VSCode, press F5 or on the window menu, ``Debug > Start Debugging``. 
This will start MorpCC.

To run unit tests, in VSCode command prompt, ``Tasks: Run Task > 
MorpCC: Test Project`` and ``Tasks: Run Task > MorpFW: Test Project``

Demo CMS shall be running at http://127.0.0.1:5000

Remember that you will need to initialize catalog indexes before you can create
a record in entities. To initialize catalog indexes, go to http://127.0.0.1:5000/index/
and click ``Upgrade database schema``

Getting Help / Contacting The Author
====================================

Come over to https://t.me/morpfw
