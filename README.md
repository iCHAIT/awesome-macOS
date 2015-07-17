# awesome-mac

A curated list of awesome applications and developer tools for your mac.


## Why?

Having used windows all my life, when I bought my first mac it was a bit difficult for me to get used to the OS and the different keys. Whenever I got stuck up with something I had to google it everytime no matter how big or small the issue was. So I thought of compiling together all the stuff that I have learned in my process of using my mac. Hopefully it would help someone.


#### Basic keys & symbols

| Symbol    | Key         | 
|:---------:|:-----------:|
|  &#8984;  | Command Key |
|  &#8963;  | Control Key |
|  &#8997;  | Option Key  |
|  &#8679;  | Shift Key   |


- [System preferences](#system-preferences)


Applications
============

- [iTerm2](#iterm2)
- [TextExpander](#textexpander)
- [Sublime Text 3](#sublime)
- [Alfred](#alfred)
- [Quicksilver](#quicksilver)
- [Cloudapp](#cloudapp)
- [Mac2Imgur](#mac2imgur)
- [Adium](#adium)
- [Caffeine](#caffeine)
- [RazorSQL](#razorsql)
- [PSequel](#psql)
- [Dash](#dash)
- [TheUnarchiver](#theunarchiver)
- [Google Chrome](#googlechrome)
- [Pocket](#pocket)
- [fish](#fish)
- [XtraFinder](#xtrafinder)
- [dropbox](#dropbox)
- [virtualbox](#virtualbox)
- [Xcode](#xcode)
- [Zsh](#zsh)
- [CodeBlocks](#codeblocks)
- [ClipMenu](#clipmenu)
- [TextMate](#textmate)
- [Clementine](#clementine)
- [Github](#github)
- [LightShot](#lightshot)
- [CloudClip](#cloudclip)


Programmming Languages
======================

- [Python](#python)
- [MySQL](#mysql)
- [MySQL WorkBench](#mysqlworkbench)
- [R](#r)
- [Go](#go)


Developement Tools
==================

- [Homebrew](#homebrew)
- [Git](#git)
- [Virtualenv](#virtualenv)
- [pip](#pip)
- [sass](#sass)
- [wget](#wget)
- [Mercurial](#mercurial)
- [Pelican](#pelican)
- [pyQT](#pyqt)
- [Heroku](#heroku)


Useful Shortcuts
================

- Useful shortcuts
- Other Useful things


Useful Stuff
============

- Applescripts
- OS X Mirror


## System preferences

There are a couple tweaks I like to make to the System Preferences. Feel free to follow these, or to ignore them, depending on your personal preferences.

In **Apple Icon > System Preferences**:

- Trackpad > Tap to click
- Dock > Automatically hide and show the Dock
- Security & Privacy > Allow apps downloaded from > Anywhere (this in particular is one of the most useful and important modification that you'll want to make.)


## iTerm2

Since we're going to be spending a lot of time in the command-line, let's install a better terminal than the default one. Download and install [iTerm2](http://www.iterm2.com/) (the newest version, even if it says "beta release").

In **Finder**, drag and drop the **iTerm** Application file into the **Applications** folder.

You can now launch iTerm, through the **Launchpad** for instance.

Let's just quickly change some preferences. In **iTerm > Preferences...**, under the tab **General**, uncheck **Confirm closing multiple sessions** and **Confirm "Quit iTerm2 (Cmd+Q)" command** under the section **Closing**.

In the tab **Profiles**, create a new one with the "+" icon, and rename it to your first name for example. Then, select **Other Actions... > Set as Default**. Finally, under the section **Window**, change the size to something better, like **Columns: 125** and **Rows: 35**.

When done, hit the red "X" in the upper left (saving is automatic in OS X preference panes). Close the window and open a new one to see the size change.


## Homebrew

Package managers make it so much easier to install and update applications (for Operating Systems) or libraries (for programming languages). The most popular one for OS X is [Homebrew](http://brew.sh/).

### Install

An important dependency before Homebrew can work is the **Command Line Tools** for **Xcode**. These include compilers that will allow you to build things from source.

Now, Xcode weights something like 2GB, and you don't need it unless you're developing iPhone or Mac apps. Good news is Apple provides a way to install only the Command Line Tools, without Xcode. To do this you need to go to [http://developer.apple.com/downloads](http://developer.apple.com/downloads), and sign in with your Apple ID (the same one you use for iTunes and app purchases). Unfortunately, you're greeted by a rather annoying questionnaire. All questions are required, so feel free to answer at random.

Once you reach the downloads page, search for "command line tools", and download the latest **Command Line Tools (OS X Mountain Lion) for Xcode**. Open the **.dmg** file once it's done downloading, and double-click on the **.mpkg** installer to launch the installation. When it's done, you can unmount the disk in Finder.

**Note**: If you are running **OS X 10.9 Mavericks**, then you can install the Xcode Command Line Tools directly from the command line with `$ xcode-select --install`, and you don't have to go through the download page and the questionnaire.

Finally, we can install Hombrew! In the terminal paste the following line (without the `$`), hit **Enter**, and follow the steps on the screen:

    $ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

One thing we need to do is tell the system to use programs installed by Hombrew (in `/usr/local/bin`) rather than the OS default if it exists. We do this by adding `/usr/local/bin` to your `$PATH` environment variable:

    $ echo 'export PATH="/usr/local/bin:$PATH"' >> ~/.bash_profile

Open a new terminal tab with **Cmd+T** (you should also close the old one), then run the following command to make sure everything works:

    $ brew doctor
    
### Usage

To install a package (or **Formula** in Homebrew vocabulary) simply type:

    $ brew install <formula>
        
To update Homebrew's directory of formulae, run:

    $ brew update
    
**Note**: I've seen that command fail sometimes because of a bug. If that ever happens, run the following (when you have Git installed):

    $ cd /usr/local
    $ git fetch origin
    $ git reset --hard origin/master

To see if any of your packages need to be updated:

    $ brew outdated
    
To update a package:

    $ brew upgrade <formula>
        
Homebrew keeps older versions of packages installed, in case you want to roll back. That rarely is necessary, so you can do some cleanup to get rid of those old versions:

    $ brew cleanup

To see what you have installed (with their version numbers):

    $ brew list --versions


## Git

What's a developer without [Git](http://git-scm.com/)? To install, simply run:

    $ brew install git
    
When done, to test that it installed fine you can run:

    $ git --version
    
And `$ which git` should output `/usr/local/bin/git`.

Let's set up some basic configuration. Download the [.gitconfig](https://raw.githubusercontent.com/nicolashery/mac-dev-setup/master/.gitconfig) file to your home directory:

    $ cd ~
    $ curl -O https://raw.githubusercontent.com/nicolashery/mac-dev-setup/master/.gitconfig

It will add some color to the `status`, `branch`, and `diff` Git commands, as well as a couple aliases. Feel free to take a look at the contents of the file, and add to it to your liking.

Next, we'll define your Git user (should be the same name and email you use for [GitHub](https://github.com/) and [Heroku](http://www.heroku.com/)):

    $ git config --global user.name "Your Name Here"
    $ git config --global user.email "your_email@youremail.com"

They will get added to your `.gitconfig` file.

To push code to your GitHub repositories, we're going to use the recommended HTTPS method (versus SSH). So you don't have to type your username and password everytime, let's enable Git password caching as described [here](https://help.github.com/articles/set-up-git):

    $ git config --global credential.helper osxkeychain
    
**Note**: On a Mac, it is important to remember to add `.DS_Store` (a hidden OS X system file that's put in folders) to your `.gitignore` files. You can take a look at this repository's [.gitignore](https://github.com/nicolashery/mac-dev-setup/blob/master/.gitignore) file for inspiration.
    

## Sublime Text 3

With the terminal, the text editor is a developer's most important tool. Everyone has their preferences, but unless you're a hardcore [Vim](http://en.wikipedia.org/wiki/Vim_(text_editor)) user, a lot of people are going to tell you that [Sublime Text](http://www.sublimetext.com/) is currently the best one out there.

Go ahead and [download](http://www.sublimetext.com/) it. Open the **.dmg** file, drag-and-drop in the **Applications** folder, you know the drill now. Launch the application.

**Note**: At this point I'm going to create a shortcut on the OS X Dock for both for Sublime Text and iTerm. To do so, right-click on the running application and select **Options > Keep in Dock**.

Sublime Text is not free, but I think it has an unlimited "evaluation period". Anyhow, we're going to be using it so much that even the seemingly expensive $70 price tag is worth every penny. If you can afford it, I suggest you [support](http://www.sublimetext.com/buy) this awesome tool. :)

Just like the terminal, let's configure our editor a little. Go to **Sublime Text 2 > Preferences > Settings - User** and paste the following in the file that just opened:

```json
{
    "font_face": "Consolas",
    "font_size": 13,
    "rulers":
    [
        79
    ],
    "highlight_line": true,
    "bold_folder_labels": true,
    "highlight_modified_tabs": true,
    "tab_size": 2,
    "translate_tabs_to_spaces": true,
    "word_wrap": false,
    "indent_to_bracket": true
}
```
    
Feel free to tweak these to your preference. When done, save the file and close it.

I use tab size 2 for everything except Python and Markdown files, where I use tab size 4. If you have a Python and Markdown file handy (or create dummy ones with `$ touch dummy.py`), for each one, open it and go to **Sublime Text 2 > Preferences > Settings - More > Syntax Specific - User** to paste in:

```json
{
    "tab_size": 4
}
```

Now for the color. I'm going to change two things: the **Theme** (which is how the tabs, the file explorer on the left, etc. look) and the **Color Scheme** (the colors of the code). Again, feel free to pick different ones, or stick with the default.

A popular Theme is the [Soda Theme](https://github.com/buymeasoda/soda-theme). To install it, run:

    $ cd ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/
    $ git clone https://github.com/buymeasoda/soda-theme/ "Theme - Soda"
    
Then go to **Sublime Text 2 > Preferences > Settings - User** and add the following two lines:

    "theme": "Soda Dark.sublime-theme",
    "soda_classic_tabs": true

Restart Sublime Text for all changes to take effect (Note: on the Mac, closing all windows doesn't close the application, you need to hit **Cmd+Q**).

The Soda Theme page also offers some [extra color schemes](https://github.com/buymeasoda/soda-theme#syntax-highlighting-colour-schemes) you can download and try. But to be consistent with my terminal, I like to use the **Solarized** Color Scheme, which already ships with Sublime Text. To use it, just go to **Sublime Text 2 > Preferences > Color Scheme > Solarized (Dark)**. Again, this is really according to personal flavors, so pick what you want.

Sublime Text 2 already supports syntax highlighting for a lot of languages. I'm going to install a couple that are missing:

    $ cd ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/
    $ git clone https://github.com/jashkenas/coffee-script-tmbundle CoffeeScript
    $ git clone https://github.com/miksago/jade-tmbundle Jade
    $ git clone https://github.com/danro/LESS-sublime.git LESS
    $ git clone -b SublimeText2 https://github.com/kuroir/SCSS.tmbundle.git SCSS
    $ git clone https://github.com/nrw/sublime-text-handlebars Handlebars

Let's create a shortcut so we can launch Sublime Text from the command-line:

    $ cd ~
    $ mkdir bin
    $ ln -s "/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl" ~/bin/subl

Now I can open a file with `$ subl myfile.py` or start a new project in the current directory with `$ subl .`. Pretty cool.

Sublime Text is very extensible. For now we'll leave it like that, we already have a solid installation. To add more in the future, a good place to start would be to install the [Sublime Package Control](http://wbond.net/sublime_packages/package_control/installation).


## Python

OS X, like Linux, ships with [Python](http://python.org/) already installed. But you don't want to mess with the system Python (some system tools rely on it, etc.), so we'll install our own version with Homebrew. It will also allow us to get the very latest version of Python 2.7.

The following command will install Python 2.7 and any dependencies required (it can take a few minutes to build everything):

    $ brew install python
    
When finished, you should get a summary in the terminal. Running `$ which python` should output `/usr/local/bin/python`.

It also installed [Pip]() (and its dependency [Distribute]()), which is the package manager for Python. Let's upgrade them both:

    $ pip install --upgrade distribute
    $ pip install --upgrade pip
    
Executable scripts from Python packages you install will be put in `/usr/local/share/python`, so let's add it to the `$PATH`. To do so, we'll create a `.path` text file in the home directory (I've already set up `.bash_profile` to call this file):

    $ cd ~
    $ subl .path
    
And add these lines to `.path`:

```bash
PATH=/usr/local/share/python:$PATH
export PATH
```
    
Save the file and open a new terminal to take the new `$PATH` into account (everytime you open a terminal, `.bash_profile` gets loaded).

### Pip Usage

Here are a couple Pip commands to get you started. To install a Python package:

    $ pip install <package>

To upgrade a package:

    $ pip install --upgrade <package>
        
To see what's installed:

    $ pip freeze
    
To uninstall a package:

    $ pip uninstall <package>

## Virtualenv

[Virtualenv](http://www.virtualenv.org/) is a tool that creates an isolated Python environment for each of your projects. For a particular project, instead of installing required packages globally, it is best to install them in an isolated folder in the project (say a folder named `venv`), that will be managed by virtualenv.

The advantage is that different projects might require different versions of packages, and it would be hard to manage that if you install packages globally. It also allows you to keep your global `/usr/local/lib/python2.7/site-packages` folder clean, containing only critical or big packages that you always need (like IPython, Numpy).

### Install

To install virtualenv, simply run:

    $ pip install virtualenv

### Usage

Let's say you have a project in a directory called `myproject`. To set up virtualenv for that project:

    $ cd myproject/
    $ virtualenv venv --distribute
    
If you want your virtualenv to also inherit globally installed packages (like IPython or Numpy mentioned above), use:

    $ virtualenv venv --distribute --system-site-packages

These commands create a `venv` subdirectory in your project where everything is installed. You need to **activate** it first though (in every terminal where you are working on your project):

    $ source venv/bin/activate
    
You should see a `(venv)` appear at the beginning of your terminal prompt indicating that you are working inside the virtualenv. Now when you install something:

    $ pip install <package>

It will get installed in the `venv` folder, and not conflict with other projects.

**Important**: Remember to add `venv` to your project's `.gitignore` file so you don't include all of that in your source code!

As mentioned earlier, I like to install big packages (like Numpy), or packages I always use (like IPython) globally. All the rest I install in a virtualenv.


## IPython

[IPython](http://ipython.org/) is an awesome project which provides a much better Python shell than the one you get from running `$ python` in the command-line. It has many cool functions (running Unix commands from the Python shell, easy copy & paste, creating Matplotlib charts in-line, etc.) and I'll let you refer to the [documentation](http://ipython.org/ipython-doc/stable/index.html) to discover them.

### Install

Before we install IPython, we'll need to get some dependencies. Run the following:

    $ brew update # Always good to do
    $ brew install zeromq # Necessary for pyzmq
    $ brew install pyqt # Necessary for the qtconsole
    
It may take a few minutes to build these.

Once it's done, we can install IPython with all the available options:

    $ pip install ipython[zmq,qtconsole,notebook,test]

### Usage

You can launch IPython from the command line with `$ ipython`, but what's more interesting is to use its [QT Console](http://ipython.org/ipython-doc/stable/interactive/qtconsole.html). Launch the QT Console by running:

    $ ipython qtconsole
    
You can also customize the font it uses:

    $ ipython qtconsole --ConsoleWidget.font_family="Consolas" --ConsoleWidget.font_size=13
    
And since I'm lazy and I don't want to type or copy & paste that all the time, I'm going to create an alias for it. Create a `.extra` text file in your home directory with `$ subl ~/.extra` (I've set up `.bash_profile` to load `.extra`), and add the following line:

```bash
alias ipy='ipython qtconsole --ConsoleWidget.font_family="Consolas" --ConsoleWidget.font_size=13'
```
    
Open a fresh terminal. Now when you run `$ ipy`, it will launch the QT Console with your configured options.

To use the in-line Matplotlib functionality (nice for scientific computing), run `$ ipy --pylab=inline`.


## MySQL

### Install

We will install [MySQL](http://www.mysql.com/) using Homebrew, which will also install some header files needed for MySQL bindings in different programming languages (MySQL-Python for one).

To install, run:

    $ brew update # Always good to do
    $ brew install mysql

As you can see in the ouput from Homebrew, before we can use MySQL we first need to set it up with:

    $ unset TMPDIR
    $ mkdir /usr/local/var
    $ mysql_install_db --verbose --user=`whoami` --basedir="$(brew --prefix mysql)" --datadir=/usr/local/var/mysql --tmpdir=/tmp

### Usage

To start the MySQL server, use the `mysql.server` tool:

    $ mysql.server start
    
To stop it when you are done, run:

    $ mysql.server stop
    
You can see the different commands available for `mysql.server` with:

    $ mysql.server --help
    
To connect with the command-line client, run:

    $ mysql -uroot
    
(Use `exit` to quit the MySQL shell.)

**Note**: By default, the MySQL user `root` has no password. It doesn't really matter for a local development database. If you wish to change it though, you can use `$ mysqladmin -u root password 'new-password'`.


### MySQL Workbench

In terms of a GUI client for MySQL, I'm used to the official and free [MySQL Workbench](http://www.mysql.com/products/workbench/). But feel free to use whichever you prefer.

You can find the MySQL Workbench download [here](http://www.mysql.com/downloads/workbench/). (**Note**: It will ask you to sign in, you don't need to, just click on "No thanks, just start my download!" at the bottom.)


## Node.js

Install [Node.js](http://nodejs.org/) with Homebrew:

    $ brew update
    $ brew install node
    
The formula also installs the [npm](https://npmjs.org/) package manager. However, as suggested by the Homebrew output, we need to add `/usr/local/share/npm/bin` to our path so that npm-installed modules with executables will have them picked up.

To do so, add this line to your `~/.path` file, before the `export PATH` line:

```bash
PATH=/usr/local/share/npm/bin:$PATH
```
        
Open a new terminal for the `$PATH` changes to take effect.

We also need to tell npm where to find the Xcode Command Line Tools, by running:

    $ sudo xcode-select -switch /usr/bin

(If Xcode Command Line Tools were installed by Xcode, try instead:)

    $ sudo xcode-select -switch /Applications/Xcode.app/Contents/Developer

Node modules are installed locally in the `node_modules` folder of each project by default, but there are at least two that are worth installing globally. Those are [CoffeeScript](http://coffeescript.org/) and [Grunt](http://gruntjs.com/):

    $ npm install -g coffee-script
    $ npm install -g grunt-cli

### Npm usage

To install a package:

    $ npm install <package> # Install locally
    $ npm install -g <package> # Install globally

To install a package and save it in your project's `package.json` file:

    $ npm install <package> --save

To see what's installed:

    $ npm list # Local
    $ npm list -g # Global

To find outdated packages (locally or globally):

    $ npm outdated [-g]

To upgrade all or a particular package:

    $ npm update [<package>]

To uninstall a package:

    $ npm uninstall <package>


## Ruby and RVM

Like Python, [Ruby](http://www.ruby-lang.org/) is already installed on Unix systems. But we don't want to mess around with that installation. More importantly, we want to be able to use the latest version of Ruby.

### Install

When installing Ruby, best practice is to use [RVM](https://rvm.io/) (Ruby Version Manager) which allows you to manage multiple versions of Ruby on the same machine. Installing RVM, as well as the latest version of Ruby, is very easy. Just run:

    $ curl -L https://get.rvm.io | bash -s stable --ruby
    
When it is done, both RVM and a fresh version of Ruby 2.0 are installed. The following line was also automatically added to your `.bash_profile`:

```bash
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
```

I prefer to move that line to the `.extra` file, keeping my `.bash_profile` clean. I suggest you do the same.

After that, start a new terminal and run:

    $ type rvm | head -1
    
You should get the output `rvm is a function`.

### Usage

The following command will show you which versions of Ruby you have installed:

    $ rvm list

The one that was just installed, Ruby 2.0, should be set as default. When managing multiple versions, you switch between them with:

    $ rvm use system # Switch back to system install (1.8)
    $ rvm use 2.0.0 --default # Switch to 2.0.0 and sets it as default

Run the following to make sure the version you want is being used (in our case, the just-installed Ruby 1.9.3):

    $ which ruby
    $ ruby --version

You can install another version with:

    $ rvm install 1.9.3

To update RVM itself, use:

    $ rvm get stable
    
[RubyGems](http://rubygems.org/), the Ruby package manager, was also installed:

    $ which gem
    
Update to its latest version with:

    $ gem update --system
    
To install a "gem" (Ruby package), run:

    $ gem install <gemname>
        
To install without generating the documentation for each gem (faster):

    $ gem install <gemname> --no-document
        
To see what gems you have installed:

    $ gem list
    
To check if any installed gems are outdated:

    $ gem outdated
    
To update all gems or a particular gem:

    $ gem update [<gemname>]
    
RubyGems keeps old versions of gems, so feel free to do come cleaning after updating:

    $ gem cleanup
    
I mainly use Ruby for the CSS pre-processor [Compass](http://compass-style.org/), which is built on top of [Sass](http://sass-lang.com/):

    $ gem install compass --no-document


## Heroku

[Heroku](http://www.heroku.com/), if you're not already familiar with it, is a [Platform-as-a-Service](http://en.wikipedia.org/wiki/Platform_as_a_service) (PaaS) that makes it really easy to deploy your apps online. There are other similar solutions out there, but Heroku was among the first and is currently the most popular. Not only does it make a developer's life easier, but I find that having Heroku deployment in mind when building an app forces you to follow modern app development [best practices](http://www.12factor.net/).

### Install

Assuming that you have an account (sign up if you don't), let's install the [Heroku Client](https://devcenter.heroku.com/articles/using-the-cli) for the command-line. Heroku offers a Mac OS X installer, the [Heroku Toolbelt](https://toolbelt.heroku.com/), that includes the client. But for these kind of tools, I prefer using Homebrew. It allows us to keep better track of what we have installed. Luckily for us, Homebrew includes a `heroku-toolbelt` formula:

    $ brew install heroku-toolbelt
    
The formula might not have the latest version of the Heroku Client, which is updated pretty often. Let's update it now:

    $ heroku update
    
Don't be afraid to run `heroku update` every now and then to always have the most recent version.

### Usage

Login to your Heroku account using your email and password:

    $ heroku login
    
If this is a new account, and since you don't already have a public **SSH key** in your `~/.ssh` directory, it will offer to create one for you. Say yes! It will also upload the key to your Heroku account, which will allow you to deploy apps from this computer.

If it didn't offer create the SSH key for you (i.e. your Heroku account already has SSH keys associated with it), you can do so manually by running:

     $ mkdir ~/.ssh
     $ ssh-keygen -t rsa
     
Keep the default file name and skip the passphrase by just hitting Enter both times. Then, add the key to your Heroku account:

    $ heroku keys:add
    
Once the key business is done, you're ready to deploy apps! Heroku has a great [Getting Started](https://devcenter.heroku.com/articles/python) guide, so I'll let you refer to that (the one linked here is for Python, but there is one for every popular language). Heroku uses Git to push code for deployment, so make sure your app is under Git version control. A quick cheat sheet (if you've used Heroku before):

    $ cd myapp/
    $ heroku create myapp
    $ git push heroku master
    $ heroku ps
    $ heroku logs -t
    
The [Heroku Dev Center](https://devcenter.heroku.com/) is full of great resources, so be sure to check it out!


## GO
$ brew install go
Setup GOPATH to $HOME/Projects/go
Include $GOPATH/bin in PATH


## Apps

#### pyQT

http://nikolak.com/pyqt-qt-designer-getting-started/

#### CloudClip

For sharing various data from your ios device to your mac and vice versa


## Useful Shortcuts

Shortcuts
Window Maximize
Enter opens Keyboard. Rename?
Access Application Menu and Dock using keyboard
Show Desktop
Bring All to front


TODO
====

Write a blog post about the same.