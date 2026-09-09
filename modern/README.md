Mansion Clock
=============

Modern Mansion Clock chime system.

Directory Layout
----------------

/home/mansionclock/modern/
├── audio/
│   ├── chime.mp3
│   ├── mansion_mid.mp3
│   └── music_box_fade.mp3
├── cron.d/
│   └── mansionclock
└── playchime.sh

Installation
------------

1. Copy the modern directory to:

   /home/mansionclock/modern/

2. Ensure ownership is:

   mansionclock:mansionclock

3. Install the cron configuration:

   cp /home/mansionclock/modern/cron.d/mansionclock /etc/cron.d/mansionclock

4. Set the required permissions:

   chmod 644 /etc/cron.d/mansionclock
   chmod 755 /home/mansionclock/modern/playchime.sh

Requirements
------------

- bash
- date
- mpv
- cron/crond

Schedule
--------

The clock operates from 8:00 AM through 8:00 PM.

8 AM, 12 PM, and 8 PM:
    mansion_mid.mp3

9-11 AM and 1-7 PM:
    music_box_fade.mp3

The chime count is determined automatically from the current
12-hour clock value.

Testing
-------

Run manually as the mansionclock user:

    /home/mansionclock/modern/playchime.sh

Git
---

Repository:
	mansionclock
