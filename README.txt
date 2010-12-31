Table of Contents
-----------------
1. About
   1a. Dependencies
2. How to use Lauf
   2a. Core Plugins
   2b. Built-in Plugins
   2c. Common Issues
   2d. Command Line Options
   2e. Configuration
3. Keyboard shortcut
4. License

1.) About
What is Lauf? Well for one it's the german word for "Run". Also to answer your next question, No. I am NOT german. Lauf is a lightweight application and task launcher that's completely programmed in the simple SHELL scripting language. Lauf is made to run under the Dash interpreter but has no problem running on Bash.

1a. Dependencies
The following must be installed in order for Lauf to work properly:
a. Zenity
b. Notify-OSD
   This is optional, as long as you change the lauf_notify_style from "notify-osd" or "message".
   By default, notify-osd will be used.
c. Coreutils
** Plugin dependencies are not listed, When activating an external plugin, It's dependencies will be shown. **

2.) How to use Lauf?
Typing an application name into Lauf will execute that application.
Plugins in the 'core' folder have the same depenedencies as Lauf, and don't require to be activated.
Plugins in the 'plugins' folder require some sort of other software that might not be installed on your system, and require being activated.
There are also some built-in plugins.

2a. CORE PLUGINS
a. help
   help with <application>
b. calc
   calc <arbitary math>
c. plugins
   plugins + <plugin_name>
   plugins - <plugin_name>
d. delete
   delete <file_name>
e. shred
   shred <file_name>
f. move
   move <file_name> to <dir>
g. copy
   copy <file_name> to <dir>
h. split
   split <file_name>
i. about

2b. Built-in plugins
a. Run command with output:
   $ <command>
b. Run bash style commands:
   #! <command>
c. Run what ever was last entered:
   ~

2c. Common Issues
a. Lauf simply blinks when I type in <blank>
   Either you made a typo, your plugin isn't activated, or that application isn't installed.
b. Lauf won't run:
   Run chmod a+x /dir/to/lauf/lauf
   Make sure all dependencies are installed
c. Lauf GUI shows up, but nothing is working?
   Make sure the core folder exist and has the core plugins in it
   Make sure you have read and write permissions in the directory you extracted Lauf to
d. Terminal commands with '$' aren't working
   Make sure you didn't make any mistakes with using the commands arguements. 'help with COMMAND'
   Some commands do not output to the standard output, This can't be helped.
e. Tweet.sh says that it was successful, but nothing was posted!
   Make sure that your supertweet.net account is activated, and the 
   tweet_user and tweet_pass reflects on the supertweet.net account 
   settings!

2d. Command Line Options
Running Lauf with no command line options will just execute Lauf normally.
a. Skip Lauf GUI and run a plugin
   -p --plugin
b. Debugging Lauf and Plugins
   -d --debug
c. Help with command line options
   -h --help

2e. Configuration
There's various options and settings that you can change without having to modify Lauf's program files.
You can edit  lauf.cfg file directly. It's commented well enough that there should be no need to go into detail.

3.) Keyboard Shortcut
a. Head over to System > Preferences > Keyboard Shortcuts.
b. Click 'add' and enter 'Lauf' as the name, /dir/you/extracted/lauf/to/lauf as it's 'command'
c. Click 'OK'.
d. Double click on the created keystroke
e. Press a Keystroke combination to bind Lauf to
f. Click 'Ok'.

4.) License
Lauf - a lightweight application and task launcher
Copyright (C) 2010 Joshua Redfield
Copyright (C) 2010 Hunterm
This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
You should have received a copy of the GNU General Public License along with this program.  If not, see <http://www.gnu.org/licenses/>.
