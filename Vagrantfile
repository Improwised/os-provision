ansible_args = ["-vvv", "--skip-tags=sssd", "-e fleet_login_cred=#{ENV['FLEET_LOGIN_CRED']}"]

Vagrant.configure("2") do |config|
  config.vm.box = "archlinux/archlinux"
  # config.vm.synced_folder ".", "/vagrant", disabled: true
  config.vm.provision "ansible" do |ansible|
    ansible.raw_arguments = ansible_args
    ansible.playbook = "playbook.yml"
  end
end

Vagrant.configure("2") do |config|
  config.vm.box = "peru/ubuntu-20.04-server-amd64"
  # config.vm.synced_folder ".", "/vagrant", disabled: true
  config.vm.provision "ansible" do |ansible|
    ansible.raw_arguments = ansible_args
    ansible.playbook = "playbook.yml"
  end
end
