# Sprayrails - Intelligent Herbicide Dispenser   (W210, Spring 2018, Team: John, Jason, Stan, Zach)

This is the sprayer-resident rails app for the herbicide dispenser.  It runs on both the Raspberry Pi's rasberrian
OS, and will also run under Ubuntu (actually Xubuntu) locally, and will also run in the clound on Heroku.

When running locally on Ubuntu or in the cloud, the pump and camera actions are simulted.

Purpose of running in Ubuntu is just that the devlopment PC is faster than the Rpi, and more developoment
tools are available, but development is possible solely using Rpi.

Purpose of running in the cloud was for our User testing (and alow our in-class demonstration of A/B user interface
testing.)

# Environment

* For Raspberry Pi, its quite difficult to natively install a ruby 2.3.1 (recommended, since this is
the default in Ubuntu 18.01, as well as the defaultd/recommended by Heroku.  So RVM is used to build
the version of ruby.   Therefore to run the rails app, it needs to start from a login shell
(e.g. /bin/bash --login)

* The classifier runs in a separate process, and is written in python.  That python needs to run in
a virtual environment.  (It's "venv" on the raspberry pi)

* Because the "user trigger" (the button pushed to cycle the camera/classifier/spray routine) goes
through the rails app (by running curl on a particular address), we want to fix the rails port
address at a conventional 8080.   This could be changed, but was picked by convention (e.g. could
move to port 80 if desired)

* We're using the new rails storage feature for image data.   On the raspberry pi or local
Ubuntu, it just uses the
local storage directory.  But if running on Heroku, take note that thes uses an AWS S3 bucket.  Review
the rails *storage* feature for details.

* Hardware control for the pump and for the button are a bit different; it is split between the (better)
GPIO interface and the (soon to be depreicated) "sysfs" interface.   In the long term, will want to move
away from sysfs.

# Notes on hardware:  Bill of materials

* Battery ($91  33Ah Lead acid deep cycle AGM)

* Raspberry Pi ($35 Model 3B+)

* Pump ($25 Adafruit Industries 12V Peristaltic, includes tubing)

* Power converter ($7 Hobbywing 3A 12V to 5/6V converter)

* FET driver ($2  Internaional Rectifier IRL8721

* Diode (for FET flyback protection) ($0.03 1N4148 (commodity part, multi source)

* Spray head ($3 Rainbird model 188  note: must be heated and formed with heat gun)

* Front wheel ($24 Shepherd hardware model 9794 8 inch swivel caster wheel)

* Rear wheels ($14 ea (qty two) Shepherd hardware model 9795 8 inch fixed caster wheel)

* Lumber, reservoir, 3/8 inch carriage bolts, misc hardware, wire, adhesive (c$25 total)



