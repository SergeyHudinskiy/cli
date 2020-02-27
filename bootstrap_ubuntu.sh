#!/bin/bash
apt-get update -y

#uaa cli
apt-get install ruby -y
apt-get install ruby-dev -y
apt-get install ruby-build -y
gem install cf-uaac

#bosh cli 
curl -LJO  https://github.com/cloudfoundry/bosh-cli/releases/download/v6.2.0/bosh-cli-6.2.0-linux-amd64
chmod +x ./bosh-cli-*-linux-amd64
mv ./bosh-cli-*-linux-amd64 /usr/local/bin/bosh

#cf cli with completion
curl -L "https://packages.cloudfoundry.org/stable?release=linux64-binary&source=github" | tar -zx
mv cf /usr/local/bin
curl -o /usr/share/bash-completion/completions/cf https://raw.githubusercontent.com/cloudfoundry/cli/master/ci/installers/completion/cf

#om cli for working with OpsManager
curl -LJO https://github.com/pivotal-cf/om/releases/download/4.4.2/om-linux-4.4.2
chmod +x ./om-linux-*
mv ./om-linux-* /usr/local/bin/om

#credhub cli
curl -L https://github.com/cloudfoundry-incubator/credhub-cli/releases/download/2.6.2/credhub-linux-2.6.2.tgz | tar -zx
mv ./credhub /usr/local/bin/credhub

#direnv tool which can load and unload environment variables depending on the current directory
curl -LJO https://github.com/direnv/direnv/releases/download/v2.21.2/direnv.linux-amd64
chmod +x ./direnv.linux-amd64
mv ./direnv.linux-amd64 /usr/local/bin/direnv
echo 'eval "$(direnv hook bash)"' >> /home/ubuntu/.bashrc

#Pivotal Network CLI
curl -LJO https://github.com/pivotal-cf/pivnet-cli/releases/download/v1.0.0/pivnet-linux-amd64-1.0.0
chmod +x ./pivnet-linux-amd64-*
mv ./pivnet-linux-amd64-* /usr/local/bin/pivnet
