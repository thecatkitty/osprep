Operating System Preparation Utility
====================================
This project aims to create a unified workflow for preparing and customizing operating system installation media. The major foundation of this project is to make it **target platform** independent, that means to be able to process scripts for generating any kind of media of any kind of operating system. As for now, the only **development platform** able to run the whole process is Linux, however it is possible to prepare scripts (but not yet to create an image) on WSL.

It allows You to change settings, add packages to the image and to create a ready-to-go disk image.

Prerequisites
-------------
OSPrep needs `bash`, `wget` and `unxz` to run. If You want to run it with an interactive menu, `dialog` is going to be necessary as well.

Package format
--------------
OSPrep package is a XZ-compressed TAR archive containing at least two files in GNU Makefile format:
* `setting.mk` - file with modifiable settings
* `apply.mk` - file with configuration processing and image generation build targets

See [com.microsoft.msdos~8.0](packages/com/microsoft/msdos~8.0/) for reference.

### `settings.mk` format
Despite preserving a valid GNU Makefile format, `settings.mk` adds some new syntax to it. A line in this file looks like that:
```make
<setting name> = <default value or blank><tabulator>#%<type><tabulator><description to be displayed>[<tabulator><opt1> <opt2> <opt3...>]
```

* **Setting name** should be in lower-case letters and underscores.
* Available **types** of settings are:
  * `T` - simple text
  * `C` - checkbox (Boolean value, 0 or 1)
  * `O` - option list

**Example:**
```make
display  = EGA	#%O	Display type	EGA LCD CGA MONO
codepage = 437	#%T	Code page
docs     = 0	#%C	Install documentation
```

Commandline usage
-----------------
**Run interactive interface:** Run with no arguments.

```
osprep <command> [args] [options]
```

**Options**

<dl>
  <dt>-l, --local</dt>
  <dd>Disable checking for package updates</dd>


  <dt>--format=text|csv</dt>
  <dd>Set output format</dd>
</dl>

**Commands**

<dl>
  <dt>-v, --version</dt>
  <dd>Printout version information and exit</dd>

  <dt>-h, --help, help</dt>
  <dd>Show the help text and exit</dd>
</dl>

<dl>
  <dt>update [&lt;url&gt;]</dt>
  <dd>Update local repository, optionally change remote repository address</dd>

  <dt>bases</dt>
  <dd>Show a list of available project base packages</dd>

  <dt>base &lt;name&gt;[~&lt;version&gt;]</dt>
  <dd>Select base package for the project</dd>

  <dt>packages</dt>
  <dd>Show a list of packages available for the project</dd>

  <dt>add &lt;name&gt;[~&lt;version&gt;]</dt>
  <dd>Add a package to the project</dd>

  <dt>remove &lt;name&gt;[~&lt;version&gt;]</dt>
  <dd>Remove packages from the project</dd>

  <dt>list</dt>
  <dd>Show a list of packages added to the project</dd>

  <dt>snap</dt>
  <dd>Download and extract selected packages</dd>

  <dt>set [&lt;name&gt;~&lt;version&gt;[::&lt;key&gt; [&lt;value&gt;]]</dt>
  <dd>Show or modify configuration variables</dd>

  <dt>apply</dt>
  <dd>Apply packages and configuration</dd>

  <dt>discard</dt>
  <dd>Discard all changes from base</dd>

  <dt>image <name></dt>
  <dd>Create output disk image</dd>
</dl>

All project settings are stored in the current working directory in subdirectory `.osprep`, whereas packagelists and downloaded packages are stored in local repository in `~/.osprep`.

Target directory means subdirectory `target` of the current working directory.

© 2018 Mateusz Karcz. All rights reserved.<br/>
Licensed under the [MIT License](LICENSE).
