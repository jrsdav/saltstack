============
Cron Formula
============

A simple linux formula used to manage cron jobs. This was borrowed from the official SaltStack **salt-formula-linux** repo to function as a standalone state.

    https://github.com/salt-formulas/salt-formula-linux

To use, add **cron** to your pillar tree (see example below) and include it in your state:

.. code-block:: yaml

    include:
      - cron

Pillar Example
------------

Here is an example of the pillar data structure:

.. code-block:: yaml

    cron:
      job:
        cmd1:
          command: '/cmd/to/run'
          identifier: cmd1
          enabled: true
          user: 'root'
          hour: 2
          minute: 0
        cmd2:
          command: '/cmd/to/run'
          identifier: cmd2
          enabled: true
          user: 'bob'
          hour: 5
          dayweek: 4
          minute: 15
        cmd3:
          command: '/cmd/to/run'
          identifier: cmd3
          enabled: false 
          user: 'user'
          hour: 10
          daymonth: 15
          minute: 17
