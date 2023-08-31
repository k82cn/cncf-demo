# cncf-demo
The demo of CNCF projects



## Requirements

### Vagrant

```
$ wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
$ echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
$ sudo apt update && sudo apt install vagrant
```

### libvirt

```
$ sudo apt-get install -y qemu libvirt-daemon-system ebtables libguestfs-tools \
  libxslt-dev libxml2-dev zlib1g-dev ruby-dev libvirt-dev
$ sudo vagrant plugin install vagrant-libvirt
```


## Startup


```
$ sudo ./bring_up_env.sh
```


## Tips

### ArgoCD login

```
$ argoPass=$(kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d)
$ echo $argoPass

$ argoURL=$(minikube service argo-cd-argocd-server -n argocd --url | tail -n 1 | sed -e 's|http://||')
$ echo $argoURL

$ argocd login --insecure --grpc-web $argoURL  --username admin --password $argoPass
```
