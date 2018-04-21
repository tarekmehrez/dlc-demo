# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "centos/7"
  config.vm.hostname = "dlc-demo-vm"

  config.vm.synced_folder ".", "/dlc-demo"

  config.vm.network "forwarded_port", guest: 5000, host: 5000


  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
  end

  config.vm.provision "shell", inline: <<-SHELL
    systemctl stop firewalld
    systemctl disable firewalld

    # install system dependencies - python distribution
    if [ ! -e /opt/miniconda ]; then

      CONDA_INSTALLER=$(mktemp)
      curl -sL https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -o $CONDA_INSTALLER
      bash $CONDA_INSTALLER -b -p /opt/miniconda

    else
      echo 'Miniconda already installed'
    fi

    echo 'export PATH=/opt/miniconda/bin:$PATH' | tee /etc/profile.d/miniconda.sh
    chmod a+x /etc/profile.d/miniconda.sh
    source /etc/profile.d/miniconda.sh 
    
    # install python dependencies via the package manager - pip
    pip install -r /dlc-demo/requirements.txt
  SHELL
end
