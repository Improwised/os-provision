ansible_args = ["-vvv", "--skip-tags=sssd"]

Vagrant.configure("2") do |config|
  config.vm.box = "archlinux/archlinux"

  # Run Ansible from the Vagrant VM
  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook = "playbook.yaml"
    ansible.install_mode = "pip"
    ansible.version = "2.12.1"
  end
end

# Vagrant.configure("2") do |config|
#   config.vm.box = "archlinux/archlinux"
#   # config.vm.synced_folder ".", "/vagrant", disabled: true
#   config.vm.provision "ansible" do |ansible|
#     ansible.raw_arguments = ansible_args
#     ansible.playbook = "playbook.yml"
#   end
# end

# Vagrant.configure("2") do |config|
#   config.vm.box = "peru/ubuntu-20.04-server-amd64"
#   # config.vm.synced_folder ".", "/vagrant", disabled: true
#   config.vm.provision "ansible" do |ansible|
#     ansible.raw_arguments = ansible_args
#     ansible.playbook = "playbook.yml"
#   end
# end
