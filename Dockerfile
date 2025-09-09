FROM node:22-trixie

RUN useradd app --create-home

ENV APP_PATH /opt/app

RUN mkdir -p $APP_PATH

RUN chown -R app:app $APP_PATH

USER app

WORKDIR $APP_PATH

COPY --chown=app:app package.json $APP_PATH/package.json
COPY --chown=app:app package-lock.json $APP_PATH/package-lock.json

RUN npm ci

COPY --chown=app:app . $APP_PATH
RUN npm run build

CMD NODE_ENV=production node build/src/index.js
