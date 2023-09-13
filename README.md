# Дипломный практикум в Yandex.Cloud
## Цели:
### Этапы выполнения:
* Создание облачной инфраструктуры
* Создание Kubernetes кластера
* Создание тестового приложения
* Подготовка cистемы мониторинга и деплой приложения
* Установка и настройка CI/CD

## Этапы выполнения:
### Создание облачной инфраструктуры
Поскольку Terraform не доступен в РФ, его не использовал.

## Создание Kubernetes кластера
Директория - ./kube

#### Настройка мастер ноды:
    femsk@ubuntu-test-vm:~/diploma/diploma/kube$ ssh femsk@$master
    Welcome to Ubuntu 20.04.6 LTS (GNU/Linux 5.4.0-162-generic x86_64)
    femsk@master-node:~$ kubectl get nodes
    NAME          STATUS   ROLES           AGE     VERSION
    master-node   Ready    control-plane   4m57s   v1.28.1

#### Добавление воркеров в кластер:
    femsk@ubuntu-test-vm:~/diploma/diploma/kube$ ssh femsk@$master
    Welcome to Ubuntu 20.04.6 LTS (GNU/Linux 5.4.0-162-generic x86_64)
    femsk@master-node:~$ kubectl get nodes
    NAME          STATUS   ROLES           AGE   VERSION
    master-node   Ready    control-plane   11m   v1.28.1
    work-node1    Ready    <none>          26s   v1.28.1
    work-node2    Ready    <none>          26s   v1.28.1
#### Команда kubectl get pods --all-namespaces отрабатывает без ошибок:
    femsk@master-node:~$ kubectl get pods --all-namespaces
    NAMESPACE      NAME                                  READY   STATUS    RESTARTS   AGE
    kube-flannel   kube-flannel-ds-pdsfw                 1/1     Running   0          3m9s
    kube-flannel   kube-flannel-ds-svz8s                 1/1     Running   0          13m
    kube-flannel   kube-flannel-ds-ws5bm                 1/1     Running   0          3m9s
    kube-system    coredns-5dd5756b68-6s65z              1/1     Running   0          13m
    kube-system    coredns-5dd5756b68-vp2pm              1/1     Running   0          13m
    kube-system    etcd-master-node                      1/1     Running   0          13m
    kube-system    kube-apiserver-master-node            1/1     Running   0          13m
    kube-system    kube-controller-manager-master-node   1/1     Running   0          13m
    kube-system    kube-proxy-2rcrs                      1/1     Running   0          13m
    kube-system    kube-proxy-g6qz7                      1/1     Running   0          3m9s
    kube-system    kube-proxy-p4wsf                      1/1     Running   0          3m9s
    kube-system    kube-scheduler-master-node            1/1     Running   0          13m
    femsk@master-node:~$
## Создание тестового приложения



    


