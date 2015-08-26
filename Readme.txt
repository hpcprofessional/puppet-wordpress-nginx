This profile will create a wordpress virtual host using extensions to the nginx module that may have written as part of Puppet Fundamentals training. (If not, the full module is provided). Please note that this is provided for training and not for use in a production environment.

This contains two puppet modules:
	nginx:
		Contains enhancements to the nginx module written in class. One should back up one's own code and then either overwrite everything with this module or carefully merge in the differences as appropraite (e.g. vhost.conf.erb).
		Additionally, a phpinfo.php file will be created in the document root of each vhost, for troubleshooting php if required. To use it, create a new vhost and load phpinfo.php in lynx:
			#lynx newvhost.puppetlabs.vm/phpinfo.php
		(Lots of PHP information should be created from the one line of PHP code if PHP is working as expected)

	profile:
		Contains a profile that includes wordpress, php-fpm, mysql and nginx configuration to quickly and easily spin up a wordpress stack.

The hunner-wordpress module needs to be installed, with its dependencies, for this to work. (https://forge.puppetlabs.com/hunner/wordpress):
	#puppet module install hunner-wordpress

Once that's done, one should be able to:
	#puppet apply --noop profile/examples/init.pp 
	#puppet apply profile/examples/init.pp 

Success can be verified in the student VM by using lynx to open wordpress.puppetlabs.vm. (To view from another host, you'll need to resolve wordpress.puppetlabs.vm to the VM's IP address, perhaps via /etc/hosts or c:\WINDOWS\system32\drivers\etc\hosts.) It should look like a more colorful version of this:

                                                                           WordPress › Installation (p1 of 2)
                                                  WordPress

                                                   Welcome

   Welcome to the famous five minute WordPress installation process! You may want to browse the ReadMe documentation at your leisure. Otherwise, just fill in the information below and you’ll be on your way to using the most extendable and powerful personal publishing platform in the world.

                                             Information needed

   Please provide the following information. Don’t worry, you can always change these settings later.

   Site Title _________________________
   Username _________________________

   Usernames can have only alphanumeric characters, spaces, underscores, hyphens, periods and the @
   symbol.
   Password, twice

   A password will be automatically generated for you if you leave this blank.
   _________________________

   _________________________
   Strength indicator

   Hint: The password should be at least seven characters long. To make it stronger, use upper and
(NORMAL LINK) Use right-arrow or <return> to activate.
  Arrow keys: Up and Down to move.  Right to follow a link; Left to go back.
 H)elp O)ptions P)rint G)o M)ain screen Q)uit /=search [delete]=history list

Cheers,

Paul.

Happy Puppeting!
