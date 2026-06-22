echo 'label: dos
type=8e' | sudo sfdisk --force /dev/sdc
sudo partprobe
sudo pvcreate /dev/sdc1
sudo vgcreate vg_datos /dev/sdc1
sudo lvcreate -L 5M vg_datos -n lv_docker
sudo lvcreate -L 1G vg_datos -n lv_workareas
sudo mkfs.ext4 /dev/vg_datos/lv_docker
sudo mkfs.ext4 /dev/vg_datos/lv_workareas
sudo mkdir -p /var/lib/docker /work
sudo mount /dev/vg_datos/lv_docker /var/lib/docker
sudo mount /dev/vg_datos/lv_workareas /work
