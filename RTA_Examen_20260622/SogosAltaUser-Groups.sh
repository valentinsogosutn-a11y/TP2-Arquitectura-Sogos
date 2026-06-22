USUARIO_REF=$1
LISTA=$2
if [[ -z "$USUARIO_REF" || -z "$LISTA" ]]; then
echo "Uso: $0 <usuario_referencia> <archivo_lista>"
exit 1
fi
CLAVE_HASH=$(sudo grep "^$USUARIO_REF:" /etc/shadow | awk -F ":" "{print \$2}")
while IFS="," read -r USUARIO GRUPO HOME_DIR
do
[[ -z "$USUARIO" || "$USUARIO" == #* ]] && continue
if ! getent group "$GRUPO" >/dev/null; then
sudo groupadd "$GRUPO"
fi
sudo useradd -m -s /bin/bash -g "$GRUPO" -d "$HOME_DIR" -p "$CLAVE_HASH" "$USUARIO"
echo "Usuario $USUARIO creado correctamente."
done < "$LISTA"
