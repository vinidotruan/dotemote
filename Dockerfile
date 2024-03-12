# Use a imagem base do Node.js
FROM node:latest

# Define o diretório de trabalho dentro do contêiner
WORKDIR /usr/src/app

# Copia os arquivos do projeto para o contêiner
COPY . .

# Instala as dependências do projeto
RUN npm install

# Executa o comando webpack para criar o bundle
RUN npx webpack

