#!/bin/bash

# Variables
## Chemins
echo "Affichage des variables"

WIKI_NAME="wikijs"
echo "WIKI_NAME : "$WIKI_NAME

INSTALL_DIR="/opt/"$WIKI_NAME
echo "INSTALL_DIR : "$INSTALL_DIR

STACK_NAME=$WIKI_NAME
echo "STACK_NAME : "$STACKNAME

INSTALL_SCRIPT_PATH=$BASH_SOURCE
echo "INSTALL_SCRIPT_PATH : "$INSTALL_SCRIPT_PATH

## Comptes
DB_PASSWORD="ChangeMe@Altherneum"
ADMIN_EMAIL="admin@altherneum.fr"
ADMIN_PASSWORD="RootMe@Altherneum"
PORT="8080"

# Vérification du sudo
if [ "$EUID" -ne 0 ]; then
  echo "Merci de lancer le script via en SuperUser ou Root";
  exit 1
else
  echo "Le script est lancé en tant que SuperUser ou Root"
fi

# Install
echo "DNF Docker & Docker Compose..."
dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
dnf install -y docker-ce docker-ce-cli containerd.io
curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
systemctl enable --now docker
## Check docker
echo "Docker enabled : " $(systemctl is-enabled docker)
echo "Docker active : " $(systemctl is-active docker)

# Creer directory
echo "Création de la structure de dossier /$INSTALL_DIR"
mkdir -p "$INSTALL_DIR/config" "$INSTALL_DIR/data" "$INSTALL_DIR/db"
echo "Résultat via \"ls -la $INSTALL_DIR\" ; "
echo $(ls -la $INSTALL_DIR)

echo "Creating docker compose"
cat << EOF > "$INSTALL_DIR/docker-compose.yml"
version: '3'
services:
  db:
    image: postgres:16
    container_name: ${STACK_NAME}_db
    restart: unless-stopped
    volumes:
      - $INSTALL_DIR/db:/var/lib/postgresql/data
    environment:
      POSTGRES_DB: wiki
      POSTGRES_USER: wikijs
      POSTGRES_PASSWORD: $DB_PASSWORD
    logging:
      driver: "none"
    healthcheck:
      test: ["CMD", "pg_isready", "-U", "wikijs"]
      interval: 10s
      timeout: 5s
      retries: 5

  wiki:
    image: ghcr.io/requarks/wiki:2
    container_name: ${STACK_NAME}
    restart: unless-stopped
    depends_on:
      db:
        condition: service_healthy
    ports:
      - "$PORT:3000"
    volumes:
      - $INSTALL_DIR/config:/config
      - $INSTALL_DIR/data:/data
    environment:
      DB_TYPE: postgres
      DB_HOST: ${STACK_NAME}_db
      DB_PORT: 5432
      DB_USER: wikijs
      DB_PASS: $DB_PASSWORD
      DB_NAME: wiki
      ADMIN_EMAIL: $ADMIN_EMAIL
      ADMIN_PASS: $ADMIN_PASSWORD
EOF

# Afficher le docker-compose
more $INSTALL_DIR/docker-composer.yml

# Permission RWX & owner
echo "chown RWX:755 $INSTALL_DIR"
chown -R $(whoami):$(whoami) "$INSTALL_DIR"
chmod -R 755 "$INSTALL_DIR"

# Deploy the stack
echo "Starting Docker Compose"
cd "$INSTALL_DIR"
docker-compose up -d

# Afficher docker PS
echo "Affichage des \"docker PS\""
docker ps