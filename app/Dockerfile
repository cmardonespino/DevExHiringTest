FROM public.ecr.aws/blinkit/public.ecr.aws/docker/library/node:22.14.0 AS build

COPY . /home/devexhiringtest
WORKDIR /home/devexhiringtest

#COPY package*.json ./

RUN npm install

ENTRYPOINT ["npm", "start"]

FROM build AS test

RUN npm test