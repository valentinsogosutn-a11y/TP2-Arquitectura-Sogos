git clone https://github.com/upszot/UTN-FRA_SO_Examenes.git
cd UTN-FRA_SO_Examenes
sudo ./202406/script_Precondicion.sh
source ~/.bashrc && history -a
sudo fdisk -l | grep -E "Disk /dev/sd"
sudo pvcreate /dev/sdc
sudo vgcreate vg_datos /dev/sdc
sudo lvcreate -L 500M -n lv_docker vg_datos
sudo lvcreate -L 300M -n lv_workspaces vg_datos
sudo lvcreate -L 200M -n lv_swap vg_datos
sudo mkfs.ext4 /dev/vg_datos/lv_docker
sudo mkfs.ext4 /dev/vg_datos/lv_workspaces
sudo mkswap /dev/vg_datos/lv_swap
sudo mkdir -p /var/lib/docker
sudo mkdir -p /workspaces
sudo mount /dev/vg_datos/lv_docker /var/lib/docker
sudo mount /dev/vg_datos/lv_workspaces /workspaces
sudo swapon /dev/vg_datos/lv_swap
sudo groupadd 2P_202406
sudo useradd -m -g 2P_202406 developer
sudo chown -R developer:2P_202406 /workspaces
df -h | grep -E "lv_|Filesystem" && swapon --show && id developer && ls -ld /workspaces
git remote -v
git remote set-url origin https://github.com/valentinsogosutn-a11y/TP2-Arquitectura-Sogos.git
git remote -v
git add .
git commit -m "Parcial - LVM y Usuarios completados"
git push -u origin master
cd UTN-FRA_SO_Examenes
git config --global user.email "valentinsogosutn@gmail.com"git config --global user.email "valentinsogosutn@gmail.com"
git config --global user.email "valentinsogosutn@gmail.com"
git config --global user.name "valentinsogosutn-a11y"
git add .
git commit -m "Parcial - LVM y Usuarios completados"
git config --global user.email "valentinsogosutn@gmail.cogit config --global user.email "valentinsogosutn@gmail.com"git commit -m "Parcial - LVM y Usuarios completa
           git push -u origin mast
clear
git push -u origin master --force
cd ~/UTN-FRA_SO_Examenes
git push -u origin master --force
cd ~/UTN-FRA_SO_Examenes
clear
cd ~/UTN-FRA_SO_Examenes
git config --global user.email "valentinsogosutn@gmail.com"
cd ~/UTN-FRA_SO_Examenes~git config --global user.email "valentinsogosutn@gmail.com"
cd ~/UTN-FRA_SO_Examenes
git config --global user.email "valentinsogosutn@gmail.com"
git config --global user.name "valentinsogosutn-a11y"
git add .
git commit -m "Parcial - Punto A"
git push -u origin master --force
git remote set-url origin https://github.com/valentinsogosutn-a11y/TP2-Arquitectura-Sogos.git
git remote -v
git push -u origin master --force
git status
git log -n 3 --oneline
find ~ -maxdepth 3 -not -path '*/.*'
cd 202509
git status
cd ~
rm -rf ~/UTN-FRA_SO_Examenes
git clone https://github.com/valentinsogosutn-a11y/TP2-Arquitectura-Sogos.git UTN-FRA_SO_Examenes
cd ~/UTN-FRA_SO_Examenes
git config --global user.email "valentinsogosutn@gmail.com"
git config --global user.name "valentinsogosutn-a11y"
git status
cd 202509
cd ~
rm -rf ~/UTN-FRA_SO_Examenes
git clone https://github.com/valentinsogosutn-a11y/TP2-Arquitectura-Sogos.git ~/UTN-FRA_SO_Examenes
cd ~/UTN-FRA_SO_Examenes
git config --global user.email "valentinsogosutn@gmail.com"
git config --global user.name "valentinsogosutn-a11y"
cd 202509
lsblk
#!/bin/bash
echo "Particionando discos..."
echo 'label: dos
size=2047M, type=8e' | sudo sfdisk /dev/sdb
echo 'label: dos
size=1023M, type=8e' | sudo sfdisk /dev/sdc
sudo wipefs -a /dev/sdb1 /dev/sdc1
sudo pvcreate /dev/sdb1 /dev/sdc1
sudo vgcreate vg_datos /dev/sdb1
sudo vgcreate vg_temp /dev/sdc1
sudo vgchange -an vg_datos vg_temp
sudo vgremove -f vg_datos
sudo vgremove -f vg_temp
sudo pvremove -f /dev/sdb1 /dev/sdc1
sudo wipefs -a /dev/sdb /dev/sdc
echo 'label: dos
size=2047M, type=8e' | sudo sfdisk --force /dev/sdb
echo 'label: dos
size=1023M, type=8e' | sudo sfdisk --force /dev/sdc
sudo partprobe
lsblk
sudo umount /var/lib/docker
sudo umount /workspaces
sudo swapoff -a
sudo vgchange -an vg_datos
sudo lvremove -f /dev/vg_datos/lv_docker
sudo lvremove -f /dev/vg_datos/lv_workspaces
sudo lvremove -f /dev/vg_datos/lv_swap
sudo vgremove -f vg_datos
lsblk
sudo dmsetup remove_all
sudo pvremove -ff /dev/sdb /dev/sdc
sudo wipefs -a /dev/sdb /dev/sdc
sudo vgremove -ff vg_datos
lsblk
cd ~/UTN-FRA_SO_Examenes/202509
cat << 'EOF' > Punto_A.sh
echo 'label: dos
size=2047M, type=8e' | sudo sfdisk --force /dev/sdb
echo 'label: dos
size=1023M, type=8e' | sudo sfdisk --force /dev/sdc
sudo pvcreate /dev/sdb1 /dev/sdc1
sudo vgcreate vg_datos /dev/sdb1
sudo vgcreate vg_temp /dev/sdc1
sudo lvcreate -L 5M vg_datos -n lv_docker
sudo lvcreate -L 1.5G vg_datos -n lv_workareas
sudo lvcreate -L 512M vg_temp -n lv_swap
sudo mkfs.ext4 /dev/mapper/vg_datos-lv_docker
sudo mkfs.ext4 /dev/mapper/vg_datos-lv_workareas
sudo mkswap /dev/mapper/vg_temp-lv_swap
sudo mkdir -p /var/lib/docker/ /work/
sudo mount /dev/mapper/vg_datos-lv_docker /var/lib/docker/
sudo mount /dev/mapper/vg_datos-lv_workareas /work/
sudo swapon /dev/mapper/vg_temp-lv_swap
sudo bash -c 'cat <<EOF_FSTAB >> /etc/fstab
/dev/mapper/vg_datos-lv_docker /var/lib/docker/ ext4 defaults 0 0
/dev/mapper/vg_datos-lv_workareas /work/ ext4 defaults 0 0
/dev/mapper/vg_temp-lv_swap none swap sw 0 0
EOF_FSTAB'
sudo systemctl restart docker
EOF

chmod +x Punto_A.sh
sudo ./Punto_A.sh
sudo umount /var/lib/docker 2>/dev/null
sudo umount /work 2>/dev/null
sudo swapoff -a
sudo lvremove -f /dev/vg_datos/lv_docker 2>/dev/null
sudo lvremove -f /dev/vg_datos/lv_workareas 2>/dev/null
sudo lvremove -f /dev/vg_temp/lv_swap 2>/dev/null
sudo vgremove -f vg_datos vg_temp 2>/dev/null
sudo pvremove -f /dev/sdb1 /dev/sdc1 2>/dev/null
sudo wipefs -a /dev/sdb /dev/sdc
echo 'label: dos
size=2047M, type=8e' | sudo sfdisk --force /dev/sdb
echo 'label: dos
size=1023M, type=8e' | sudo sfdisk --force /dev/sdc
sudo partprobe
sudo pvcreate /dev/sdb1 /dev/sdc1
sudo vgcreate vg_datos /dev/sdb1
sudo vgcreate vg_temp /dev/sdc1
echo 'label: dos
type=8e' | sudo sfdisk --force /dev/sdb
sudo partprobe
lsblk
sudo swapoff -a
sudo umount /var/lib/docker 2>/dev/null
sudo umount /work 2>/dev/null
sudo vgremove -ff vg_datos vg_temp 2>/dev/null
sudo pvremove -ff /dev/sdb1 /dev/sdc1 2>/dev/null
sudo wipefs -a /dev/sdb /dev/sdc
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
sudo bash -c 'cat <<EOF >> /etc/fstab
/dev/mapper/vg_datos-lv_docker /var/lib/docker ext4 defaults 0 0
/dev/mapper/vg_datos-lv_workareas /work ext4 defaults 0 0
EOF'
cat << 'EOF' > Punto_A.sh
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
EOF

chmod +x Punto_A.sh
git add Punto_A.sh
git commit -m "Entrega: Resuelto Punto A de LVM"
git push
sudo bash -c 'cat <<EOF > /usr/local/bin/SogosAltaUser-Groups.sh
USUARIO_REF=\$1
LISTA=\$2
if [[ -z "\$USUARIO_REF" || -z "\$LISTA" ]]; then
echo "Uso: \$0 <usuario_referencia> <archivo_lista>"
exit 1
fi
CLAVE_HASH=\$(sudo grep "^\$USUARIO_REF:" /etc/shadow | awk -F ":" "{print \$2}")
while IFS="," read -r USUARIO GRUPO HOME_DIR
do
[[ -z "\$USUARIO" || "\$USUARIO" == #* ]] && continue
if ! getent group "\$GRUPO" >/dev/null; then
sudo groupadd "\$GRUPO"
fi
sudo useradd -m -s /bin/bash -g "\$GRUPO" -d "\$HOME_DIR" -p "\$CLAVE_HASH" "\$USUARIO"
echo "Usuario \$USUARIO creado correctamente."
done < "\$LISTA"
EOF
sudo rm /usr/local/bin/SogosAltaUser-Groups.sh
sudo bash -c 'cat << '\''EOF'\'' > /usr/local/bin/SogosAltaUser-Groups.sh
USUARIO_REF=$1vagrant ssh
sudo nano /usr/local/bin/SogosAltaUser-Groups.sh
sudo chmod +x /usr/local/bin/SogosAltaUser-Groups.sh
mkdir -p RTA_Examen_20260622
sudo cp /usr/local/bin/SogosAltaUser-Groups.sh RTA_Examen_20260622/
cat << 'EOF' > Punto_B.sh
sudo /usr/local/bin/SogosAltaUser-Groups.sh vagrant ../202406/bash_script/Lista_Usuarios.txt
EOF

git add RTA_Examen_20260622/SogosAltaUser-Groups.sh Punto_B.sh
exit
mkdir -p /vagrant/RTA_Examen_20260622
sudo cp /usr/local/bin/SogosAltaUser-Groups.sh /vagrant/RTA_Examen_20260622/
cat << 'EOF' > /vagrant/Punto_B.sh
sudo /usr/local/bin/SogosAltaUser-Groups.sh vagrant ../202406/bash_script/Lista_Usuarios.txt
EOF

exit
cp /usr/local/bin/SogosAltaUser-Groups.sh ~
cat << 'EOF' > ~/Punto_B.sh
sudo /usr/local/bin/SogosAltaUser-Groups.sh vagrant ../202406/bash_script/Lista_Usuarios.txt
EOF

exit
cd /vagrant/202406/docker/
ls /vagrant
mount | grep vboxsf
cd /home/vagrant/carpeta_compartida/202509/docker/
ls -F /home/vagrant/carpeta_compartida/202509/
ls -F /home/vagrant/carpeta_compartida/
pwd
cd /home/vagrant/carpeta_compartida/repo_completo/202509/
cd docker
mkdir docker
cd docker
ls
cat <<EOF > index.html
<html>
<body>
<h1>Nombre: Valentin</h1>
<h1>Apellido: Sogos</h1>
<h1>Division: 115</h1>
</body>
</html>
EOF

cat <<EOF > Dockerfile
FROM nginx
COPY index.html /usr/share/nginx/html/index.html
EOF

cat <<EOF > run.sh
docker run -d -p 8080:80 valentinsogosutn/web1-sogos:latest
EOF

chmod +x run.sh
docker login -u valentinsogosutn
docker build -t valentinsogosutn/web1-sogos:latest .
docker push valentinsogosutn/web1-sogos:latest
sudo apt update
sudo apt install docker.io -y
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker $USER
exit
cd /home/vagrant/carpeta_compartida/repo_completo/202509/docker/
docker login -u valentinsogosutn
docker build -t valentinsogosutn/web1-sogos:latest .
docker push valentinsogosutn/web1-sogos:latest
exit
cd /vagrant/202406/ansible/
ls -F /
ls -F /home/
ls -F /home/vagrant/
ls -F /work/
cd /home/vagrant/UTN-FRA_SO_Examenes/202406/ansible/
ansible-playbook -i inventory playbook.yml
ls -l /tmp/2do_parcial/alumno/
ls -l /tmp/2do_parcial/equipo/
sudo apt update
sudo apt install ansible -y
cd /vagrant/202406/ansible/
ls -F
sudo apt update
sudo apt install ansible -y
mkdir -p roles/2do_parcial/{tasks,templates,vars}
cat <<EOF > roles/2do_parcial/vars/main.yml
nombre_alumno: "Valentin"
apellido_alumno: "Sogos"
division_alumno: "115"
EOF

cat <<EOF > roles/2do_parcial/tasks/main.yml
- name: "Crear estructura de directorios"
file:
path: "{{ item }}"
state: directory
mode: '0755'
with_items:
- "/tmp/2do_parcial/alumno"
- "/tmp/2do_parcial/equipo"
- name: "Generar datos_alumno.txt"
template:
src: "datos_alumno.j2"
dest: "/tmp/2do_parcial/alumno/datos_alumno.txt"
EOF

ansible-playbook -i inventory playbook.yml
cat <<EOF > roles/2do_parcial/tasks/main.yml
---
- name: "Crear estructura de directorios"
file:
path: "{{ item }}"
state: directory
mode: '0755'
with_items:
- "/tmp/2do_parcial/alumno"
- "/tmp/2do_parcial/equipo"
- name: "Generar datos_alumno.txt"
template:
src: "datos_alumno.j2"
dest: "/tmp/2do_parcial/alumno/datos_alumno.txt"
EOF

cat <<EOF > inventory
localhost ansible_connection=local
EOF

ls -la inventory/
ansible-playbook -i inventory/ playbook.yml
cat <<EOF > roles/2do_parcial/tasks/main.yml
---
- name: "Crear estructura de directorios"
file:
path: "{{ item }}"
state: directory
mode: '0755'
with_items:
- "/tmp/2do_parcial/alumno"
- "/tmp/2do_parcial/equipo"
- name: "Generar datos_alumno.txt"
template:
src: "datos_alumno.j2"
dest: "/tmp/2do_parcial/alumno/datos_alumno.txt"
EOF

echo "localhost ansible_connection=local" > inventory/hosts
ansible-playbook -i inventory/ playbook.yml --connection=local
cat <<'EOF' > roles/2do_parcial/tasks/main.yml
---
- name: "Crear estructura de directorios"
file:
path: "{{ item }}"
state: directory
mode: '0755'
with_items:
- "/tmp/2do_parcial/alumno"
- "/tmp/2do_parcial/equipo"
- name: "Generar datos_alumno.txt"
template:
src: "datos_alumno.j2"
dest: "/tmp/2do_parcial/alumno/datos_alumno.txt"
EOF

cat roles/2do_parcial/tasks/main.yml
ansible-playbook -i inventory/ playbook.yml --connection=local
rm roles/2do_parcial/tasks/main.yml
cat <<'EOF' > roles/2do_parcial/tasks/main.yml
---
- name: "Crear estructura de directorios"
file:
path: "{{ item }}"
state: directory
mode: '0755'
with_items:
- "/tmp/2do_parcial/alumno"
- "/tmp/2do_parcial/equipo"
- name: "Generar datos_alumno.txt"
template:
src: "datos_alumno.j2"
dest: "/tmp/2do_parcial/alumno/datos_alumno.txt"
EOF

cat roles/2do_parcial/tasks/main.yml
ansible-playbook -i inventory/ playbook.yml --connection=local
rm -f roles/2do_parcial/tasks/main.yml
printf -- "---\n- name: Crear estructura de directorios\n  file:\n    path: \"{{ item }}\"\n    state: directory\n    mode: '0755'\n  with_items:\n    - /tmp/2do_parcial/alumno\n    - /tmp/2do_parcial/equipo\n\n- name: Generar datos_alumno.txt\n  template:\n    src: datos_alumno.j2\n    dest: /tmp/2do_parcial/alumno/datos_alumno.txt\n" > roles/2do_parcial/tasks/main.yml
cat roles/2do_parcial/tasks/main.yml
ansible-playbook -i inventory/ playbook.yml --connection=local
mkdir -p roles/2do_parcial/templates/
cat <<'EOF' > roles/2do_parcial/templates/datos_alumno.j2
Alumno: {{ nombre_alumno }} {{ apellido_alumno }}
Division: {{ division_alumno }}
EOF

ansible-playbook -i inventory/ playbook.yml --connection=local
cat /tmp/2do_parcial/alumno/datos_alumno.txt
exit
history -a
cp ~/.bash_history /vagrant/
ls -ld /vagrant/
mount | grep vagrant
vagrant ssh
history -a
cp ~/.bash_history /home/vagrant/carpeta_compartida/
exit