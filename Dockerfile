# Imagen base node:23-slim pesa muy poco la imagen
FROM node:23.1-slim

# Información del autor y otra metainformación
LABEL developer="Michel Israel"
LABEL maintainer="Michel Israel <hackerkids@live.com>" 
LABEL version="1.0" 
LABEL description="es una versión ligera de Node.jsbasada en la versión 23.1. Las imágenes "slim" son populares porque ocupan menos espacio y se cargan más rápido, siendo ideales para aplicaciones donde el tamaño de la imagen es una preocupación."

# Especificar el directorio de trabajo en la imagen docker
WORKDIR /app

# Copiar los fichero del proyecto
# Empezamos por los que cargan las dependencias
# COPY package.json
# COPY package-lock.json
COPY package*.json ./

# Ahora necesitamos obtener los módulos
RUN npm install \
    && npm cache clean --force \
    && rm -rf /tmp/* /root/.npm/_cacache

# Copiar el directorio de la aplicación
# COPY /src /app/
COPY . .

EXPOSE 5000

# Ejecuta la aplicación
# CMD ["node", "src/index.js"]
CMD ["npm", "start"]

# Ja es pot executar amb
# docker build -t node-game .

# Copiar script
# COPY ...
# Definir el punto de entrada com a script
# ENTRYPOINT [ "executable" ]

--