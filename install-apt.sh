echo "Installing common packages on Ubuntu"
apt-get install -y vim tmux git tig screen irssi mutt bc bzip2 cmake cmus cowsay python-pip python-setuptools ipython dia fakeroot festival gcc g++ ghc gnupg gzip guake jq build-essential mysql-client nasm ntfs-3g gparted openssh-server openssh-client pv qbittorrent qemu-kvm qemu-system-x86 qemu-utils virt-manager rsync sshpass tcpdump unrar zip unzip vlc wireshark wget curl zsh unity-tweak-tool gimp audacity htop laptop-mode-tools mercurial network-manager-openvpn p7zip-full p7zip-rar apt-transport-https ca-certificates

echo "Installing common development libraries"

apt-get install -y libpython-dev python-pip libssl-dev dpkg-dev libffi-dev

echo "Installing common pip packages"
pip install --upgrade cloudmonkey youtube-dl ansible pip

echo "Installing 3rd party apps"
apt-get install -y skype flashplugin-installer

echo "Installing golang 1.7"
cd /tmp && wget https://storage.googleapis.com/golang/go1.7.1.linux-amd64.tar.gz && tar -C /usr/local -xzf go1.7.1.linux-amd64.tar.gz

echo "Installing chrome"
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list
apt-get update
apt-get install google-chrome-stable

echo "Installing docker"
echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" > /etc/apt/sources.list.d/docker.list
apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
apt-get update
apt-get install -y linux-image-extra-$(uname -r) linux-image-extra-virtual docker-engine

echo "Cleaning up junk"
apt-get remove --purge unity-scope-yelp unity-webapps-common
