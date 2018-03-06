# https://hub.docker.com/r/jheth/cci-node6-browsers-npm571-yarn/
FROM circleci/node:6-browsers

RUN sudo apt-get update -y \
    && sudo apt-get install -y curl tar file xz-utils build-essential

ENV NVM_DIR /home/circleci/.nvm
ENV NODE_VERSION 6.13.0

RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash \
   && . $NVM_DIR/nvm.sh \
   && nvm install $NODE_VERSION \
   && nvm alias default $NODE_VERSION \
   && nvm use default \
   && nvm list \
   && npm -g install npm@5.7.1 \
   && sudo rm /usr/local/bin/npm; sudo ln -s "$NVM_DIR/versions/node/$(nvm version)/bin/npm" "/usr/local/bin/npm"

RUN sudo npm install -g bower

