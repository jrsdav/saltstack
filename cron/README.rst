============
Cron Fomula
============

A simple linux formula used to manage cron jobs.

To use, include in your state:

.. code-block:: yaml
    include:
      - cron

Pillar Example
------------

Heere is an example of what your pillar data should look like:

.. code-block:: yaml
    cron:
      job:
        cmd1:
          name: '/cmd/to/run'
          identifier: cmd1
          enabled: true
          user: 'root'
          hour: 2
          minute: 0
        cmd2:
          name: '/cmd/to/run'
          identifier: cmd2
          enabled: true
          user: 'bob'
          hour: 5
          dayweek: 4
          minute: 15
        cmd3:
          name: '/cmd/to/run'
          identifier: cmd3
          enabled: false 
          user: 'user'
          hour: 10
          daymonth: 15
          minute: 17
