#!/bin/bash
sudo apt-get -y update
sudo apt-get -y upgrade

sudo apt-get install -y libcurl4-openssl-dev
sudo apt-get install -y libssl-dev
sudo apt-get install -y jq
sudo apt-get install -y ruby-full
sudo apt-get install -y libcurl4-openssl-dev libxml2 libxml2-dev libxslt1-dev ruby-dev build-essential libgmp-dev zlib1g-dev
sudo apt-get install -y build-essential libssl-dev libffi-dev python-dev
sudo apt-get install -y python-setuptools
sudo apt-get install -y libldns-dev
sudo apt-get install -y python3-pip
sudo apt-get install -y python-pip
sudo apt-get install -y python-dnspython
sudo apt-get install -y git
sudo apt-get install -y rename
sudo apt-get install -y xargs

echo -e "\e[1;31m installing bash_profile aliases from recon_profile \e[0m"
git clone https://github.com/NetanMangal/recon_profile.git
cd recon_profile
cat .bash_profile >>~/.bash_profile
source ~/.bash_profile
echo -e "\e[1;31m done \e[0m"

#install go
if [[ -z "$GOPATH" ]]; then
	echo -e "\e[1;31m Installing Golang \e[0m"
	wget https://dl.google.com/go/go1.13.4.linux-amd64.tar.gz
	sudo tar -xvf go1.13.4.linux-amd64.tar.gz
	sudo mv go /usr/local
	export GOROOT=/usr/local/go
	export GOPATH=$HOME/go
	export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
	echo 'export GOROOT=/usr/local/go' >>~/.bash_profile
	echo 'export GOPATH=$HOME/go' >>~/.bash_profile
	echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >>~/.bash_profile
	source ~/.bash_profile
	sleep 1
else
	echo -e "\e[1;31m Go already installed \e[0m"
fi

#Don't forget to set up AWS credentials!
echo -e "\e[1;31m Don't forget to set up AWS credentials! \e[0m"
sudo apt-get install -y awscli
echo -e "\e[1;31m Don't forget to set up AWS credentials! \e[0m"

#create a tools folder in ~/
mkdir ~/tools
cd ~/tools/

#install aquatone
echo -e "\e[1;31m Installing Aquatone \e[0m"
go get github.com/michenriksen/aquatone
echo -e "\e[1;31m done \e[0m"

#install chromium
echo -e "\e[1;31m Installing Chromium \e[0m"
sudo snap install chromium
echo -e "\e[1;31m done \e[0m"

echo -e "\e[1;31m installing JSParser \e[0m"
git clone https://github.com/nahamsec/JSParser.git
cd JSParser*
sudo python setup.py install
cd ~/tools/
echo -e "\e[1;31m done \e[0m"

echo -e "\e[1;31m installing Sublist3r \e[0m"
git clone https://github.com/aboul3la/Sublist3r.git
cd Sublist3r*
pip install -r requirements.txt
cd ~/tools/
echo -e "\e[1;31m done \e[0m"

echo -e "\e[1;31m installing teh_s3_bucketeers \e[0m"
git clone https://github.com/tomdev/teh_s3_bucketeers.git
cd ~/tools/
echo -e "\e[1;31m done \e[0m"

echo -e "\e[1;31m installing dirsearch \e[0m"
git clone https://github.com/maurosoria/dirsearch.git
cd ~/tools/
echo -e "\e[1;31m done \e[0m"

echo -e "\e[1;31m installing lazys3 \e[0m"
git clone https://github.com/nahamsec/lazys3.git
cd ~/tools/
echo -e "\e[1;31m done \e[0m"

echo -e "\e[1;31m installing virtual host discovery \e[0m"
git clone https://github.com/jobertabma/virtual-host-discovery.git
cd ~/tools/
echo -e "\e[1;31m done \e[0m"

echo -e "\e[1;31m installing sqlmap \e[0m"
git clone --depth 1 https://github.com/sqlmapproject/sqlmap.git sqlmap-dev
cd ~/tools/
echo -e "\e[1;31m done \e[0m"

echo -e "\e[1;31m installing knock.py \e[0m"
git clone https://github.com/guelfoweb/knock.git
cd ~/tools/
echo -e "\e[1;31m done \e[0m"

echo -e "\e[1;31m installing lazyrecon \e[0m"
git clone https://github.com/nahamsec/lazyrecon.git
cd ~/tools/
echo -e "\e[1;31m done \e[0m"

echo -e "\e[1;31m installing nmap \e[0m"
sudo apt-get install -y nmap
echo -e "\e[1;31m done \e[0m"

echo -e "\e[1;31m installing massdns \e[0m"
git clone https://github.com/blechschmidt/massdns.git
cd ~/tools/massdns
make
cd ~/tools/
echo -e "\e[1;31m done \e[0m"

echo -e "\e[1;31m installing asnlookup \e[0m"
git clone https://github.com/yassineaboukir/asnlookup.git
cd ~/tools/asnlookup
pip install -r requirements.txt
cd ~/tools/
echo -e "\e[1;31m done \e[0m"

echo -e "\e[1;31m installing httprobe \e[0m"
go get -u github.com/tomnomnom/httprobe
echo -e "\e[1;31m done \e[0m"

echo -e "\e[1;31m installing unfurl \e[0m"
go get -u github.com/tomnomnom/unfurl
echo -e "\e[1;31m done \e[0m"

echo -e "\e[1;31m installing waybackurls \e[0m"
go get github.com/tomnomnom/waybackurls
echo -e "\e[1;31m done \e[0m"

echo -e "\e[1;31m installing crtndstry \e[0m"
git clone https://github.com/nahamsec/crtndstry.git
echo -e "\e[1;31m done \e[0m"

echo -e "\e[1;31m downloading Seclists \e[0m"
cd ~/tools/
git clone --depth 1 https://github.com/danielmiessler/SecLists.git
cd ~/tools/SecLists/Discovery/DNS/
##THIS FILE BREAKS MASSDNS AND NEEDS TO BE CLEANED
cat dns-Jhaddix.txt | head -n -14 >clean-jhaddix-dns.txt
cd ~/tools/
echo -e "\e[1;31m done \e[0m"

echo -e "\e[1;31m installing venom26/recon \e[0m"
git clone https://github.com/venom26/recon.git
echo -e "\e[1;31m done \e[0m"

echo -e "\e[1;31m installing wpscan \e[0m"
git clone https://github.com/wpscanteam/wpscan.git
cd wpscan*
sudo gem install bundler && bundle install --without test
cd ~/tools/
echo -e "\e[1;31m done \e[0m"

echo -e "\e[1;34m Resourcing bash_profile \e[0m"
sleep 1
source ~/.bash_profile
sleep 2

echo -e "\n\n\n\n\n\n\n\n\n\n\n\e[1;31m Done! All tools are set up in ~/tools \e[0m"
ls -la
echo -e "\e[1;36m One last time: don't forget to set up AWS credentials in ~/.aws/! \e[0m"
