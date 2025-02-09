# Используем официальный Node.js образ как основу
FROM node:16

# Устанавливаем рабочую директорию в контейнере
WORKDIR /project

# Копируем package.json и устанавливаем зависимости
COPY package.json /project/
RUN npm install

# Устанавливаем electron-builder
RUN npm install electron-builder --save-dev

# Копируем весь проект в контейнер
COPY . /project/

# Выполняем сборку, когда контейнер будет запущен
CMD ["npx", "electron-builder", "--linux"]
