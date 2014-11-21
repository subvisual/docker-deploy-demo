$fig = <<START
curl -L https://github.com/docker/fig/releases/download/1.0.1/fig-`uname -s`-`uname -m` > /usr/local/bin/fig; chmod +x /usr/local/bin/fig
START

Vagrant.configure("2") do |config|
  config.vm.box = "hashicorp/precise64"

  # rails server port forwarding
  config.vm.network :forwarded_port, host: 3000, guest: 3000

  # install latest docker
  config.vm.provision "docker"
  config.vm.provision "shell", inline: $fig
end
