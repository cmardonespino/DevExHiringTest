FROM public.ecr.aws/blinkit/public.ecr.aws/docker/library/node:22.14.0

COPY . /home/devexhiringtest
WORKDIR /home/devexhiringtest

#COPY package*.json ./

RUN npm install

ENTRYPOINT ["npm", "start"]