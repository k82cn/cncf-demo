# cncf-demo
The demo of CNCF projects



## Requirements

```
$ wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
$ echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
$ sudo apt update && sudo apt install vagrant
```

```
$ sudo apt-get build-dep vagrant ruby-libvirt
$ sudo apt-get install -y qemu libvirt-daemon-system ebtables libguestfs-tools \
  libxslt-dev libxml2-dev zlib1g-dev ruby-dev
$ vagrant plugin install vagrant-libvirt
```
