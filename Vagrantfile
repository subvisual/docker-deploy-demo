$setup = <<SCRIPT
# Stop and remove any existing container
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)

# Build containers from Dockerfiles
docker build -t naps62/demo-postgres /app/docker/postgres
docker build -t naps62/demo-rails    /app/docker/rails

# Run and link the containers
docker run -d --name postgres -e POSTGRESQL_USER=docker -e POSTGRESQL_PASS=docker naps62/demo-postgres:latest
docker run -d --name rails    -p 3000:3000 -v /app:/app --link postgres:db        naps62/demo-rails:latest
SCRIPT

$start = <<START
docker start postgres
docker start rails
START


Vagrant.configure("2") do |config|
  config.vm.box = "hashicorp/precise64"

  # must use nfs for this otherwise rails performance will be awful
  # config.vm.synced_folder ".", "/app"

  # rails server port forwarding
  config.vm.network :forwarded_port, host: 3000, guest: 3000

  # need a private network for NFS shares to work
  config.vm.network :private_network, ip: '192.168.50.4'

  # install latest docker
  config.vm.provision "docker"

  # # setup the containers when the VM is first created
  # config.vm.provision "shell", inline: $setup

  # # make sure the correct containers are running every time we start the VM
  # config.vm.provision "shell", inline: $start, run: "always"
end
