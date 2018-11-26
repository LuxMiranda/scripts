# StackOverflow: http://stackoverflow.com/questions/21215059/cant-use-nvm-from-root-or-sudo
# Source: https://www.digitalocean.com/community/tutorials/how-to-install-node-js-with-nvm-node-version-manager-on-a-vps
# The below command seems to fix the problem

n=$(which node);n=${n%/bin/node}; chmod -R 755 $n/bin/*; sudo cp -r $n/{bin,lib,share} /usr/local

# The above command is a bit complicated, but all it's doing is copying whatever version of node
# you have active via nvm into the /usr/local/ directory (where user installed global files should
# live on a linux VPS) and setting the permissions so that all users can access them.
