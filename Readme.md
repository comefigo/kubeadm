# 概要

kubeadmによる環境構築

# memo

- リセット`kubeadm reset`

## add firewall

```
inbound port 6443 source(self security group)
```

## add kube config

```
"  mkdir -p $HOME/.kube",
"  sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config",
"  sudo chown $(id -u):$(id -g) $HOME/.kube/config",
```

## flannel network

```
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/bc79dd1505b0c8681ece4de4c0d86c5cd2643275/Documentation/kube-flannel.yml
```
