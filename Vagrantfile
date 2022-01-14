Vagrant.configure("2") do |config|

  config.vm.box = "archlinux/archlinux"
  config.vm.synced_folder ".", "/vagrant", disabled: true
  config.vm.provision "ansible_local" do |ansible|
    ansible.raw_arguments = ["-vvv --skip-tags sssd"]
    ansible.install = true
    ansible.install_mode = "pip"
    ansible.playbook = "playbook.yml"
    ansible.raw_arguments = ["-vv"]
  end
end
