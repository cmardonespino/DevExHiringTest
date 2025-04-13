FROM public.ecr.aws/blinkit/public.ecr.aws/docker/library/node:22.14.0 AS build

WORKDIR /home/devexhiringtest
COPY package.json /home/devexhiringtest

RUN npm install

COPY . /home/devexhiringtest

FROM build AS test

RUN npm run test

FROM build AS lint

RUN npm run lint