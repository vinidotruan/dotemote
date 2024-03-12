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

# Expõe a porta em que o servidor web estará em execução (se necessário)
EXPOSE 80

# Comando para iniciar a aplicação (se necessário)
# CMD [ "npm", "start" ]
