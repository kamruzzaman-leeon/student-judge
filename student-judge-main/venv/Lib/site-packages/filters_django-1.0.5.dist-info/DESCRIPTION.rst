.. image:: https://travis-ci.org/eflglobal/filters-django.svg?branch=master
   :target: https://travis-ci.org/eflglobal/filters-django
.. image:: https://readthedocs.org/projects/filters/badge/?version=latest
   :target: http://filters.readthedocs.io/

==============
Django Filters
==============
Adds filters for for Django-specific features, including:

- Search for a DB model instance matching the incoming value.

--------------------
Minimum Requirements
--------------------
These filters *should* work with any version of Django, but they have only been
tested against the following versions: 2.0, 1.11.

If you encounter any issues, please report them on our `Bug Tracker`_, and be
sure to indicate which version of Django you are using.

.. note::
   The Django Filters project will continue to support Django 1.11 (and Python
   2) as long as that branch is officially-supported.

------------
Installation
------------
This package is an extension for the `Filters library`, so you can install it
as an extra to ``filters``:

.. code:: bash

   pip install filters[django]


If desired, you can install this package separately.  This allows you to control
the package version separately from ``filters``.

.. code:: bash

   pip install filters-django


.. _Bug Tracker: https://github.com/eflglobal/filters-django/issues
.. _Filters library: https://pypi.python.org/pypi/filters


