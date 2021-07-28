FROM gitpod/workspace-postgres
USER gitpod

COPY --chown=gitpod:gitpod .ruby-version /tmp
RUN echo "rvm_gems_path=/home/gitpod/.rvm" > ~/.rvmrc
RUN bash -lc "rvm reinstall ruby-$(cat /tmp/.ruby-version) && rvm use ruby-$(cat /tmp/.ruby-version) --default && gem install rails"
RUN echo "rvm_gems_path=/workspace/.rvm" > ~/.rvmrc

FROM gitpod/workspace-full
FROM gitpod/workspace-postgres

RUN curl -sL https://deb.nodesource.com/setup_lts.x | sudo bash
RUN curl https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

RUN sudo apt-get update

RUN sudo apt-get install -y \
    redis-server build-essential git \
    zlib1g-dev sassc libsass-dev curl yarn nodejs

RUN sudo rm -rf /var/lib/apt/lists/*

USER gitpod

COPY --chown=gitpod:gitpod .ruby-version /tmp
RUN echo "rvm_gems_path=/home/gitpod/.rvm" > ~/.rvmrc
RUN bash -lc "rvm install ruby-3.0.1 && rvm use ruby-3.0.1 --default"
RUN echo "rvm_gems_path=/workspace/.rvm" > ~/.rvmrc