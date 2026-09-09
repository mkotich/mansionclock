# Mansion Clock

Modern Mansion Clock chime system.

The Mansion Clock plays a sequence of hourly chimes with different
background music depending on the time of day.

## Directory Layout

```
/home/mansionclock/modern/
├── README.md
├── playchime.sh
├── audio/
│   ├── chime.mp3
│   ├── foyer.mp3
│   └── musicbox.mp3
└── scheduling/
    ├── cron.d/
    │   └── mansionclock
    └── systemd/
        ├── mansionclock.service
        └── mansionclock.timer
```

## Requirements

* bash
* date
* mpv
* cron/crond or systemd

## Playback

The clock operates from 8:00 AM through 8:00 PM.

8:00 AM, 12:00 PM, and 8:00 PM:
foyer.mp3

9:00 AM through 11:00 AM and 1:00 PM through 7:00 PM:
musicbox.mp3

The chime count is determined automatically from the current
12-hour clock value.

## Scheduling

Two scheduling methods are provided. Use either cron or systemd,
but do not enable both at the same time.

### Cron

Install the cron configuration:

```
cp /home/mansionclock/modern/scheduling/cron.d/mansionclock /etc/cron.d/mansionclock
chmod 644 /etc/cron.d/mansionclock
```

The cron configuration runs the clock at the top of every hour from
8:00 AM through 8:00 PM as the `mansionclock` user.

To disable cron scheduling, remove the installed configuration:

```
rm /etc/cron.d/mansionclock
```

### systemd

The systemd configuration uses a oneshot service and timer.

For a user-level installation, copy the units to the `mansionclock`
user's systemd directory:

```
mkdir -p /home/mansionclock/.config/systemd/user
cp /home/mansionclock/modern/scheduling/systemd/* /home/mansionclock/.config/systemd/user/
```

Reload the user systemd configuration:

```
systemctl --user daemon-reload
```

Enable and start the timer:

```
systemctl --user enable --now mansionclock.timer
```

Check the timer:

```
systemctl --user status mansionclock.timer
```

List scheduled timers:

```
systemctl --user list-timers
```

To disable systemd scheduling:

```
systemctl --user disable --now mansionclock.timer
```

The systemd service can also be run manually for testing:

```
systemctl --user start mansionclock.service
```

View service output with:

```
journalctl --user -u mansionclock.service
```

## Testing

The playback script can be run directly as the `mansionclock` user:

```
/home/mansionclock/modern/playchime.sh
```

This bypasses the scheduler and immediately plays the appropriate
music and chimes for the current time.

## Installation

1. Copy the `modern` directory to:

   ```
   /home/mansionclock/modern/
   ```

2. Ensure ownership is:

   ```
   mansionclock:mansionclock
   ```

3. Ensure the playback script is executable:

   ```
   chmod 755 /home/mansionclock/modern/playchime.sh
   ```

4. Select either the cron or systemd scheduling method described above.

## Git

Repository:

```
mansionclock
```

The `legacy/` directory contains the original Mansion Clock
implementation and is retained for historical reference.
