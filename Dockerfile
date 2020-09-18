FROM node:14.11.0-alpine3.12



RUN ["/bin/sh", "-c", "apk update && apk add bash"]

USER node

RUN ["/bin/bash", "-c", "/bin/mkdir /home/node/.npm-global"]

RUN ["/bin/bash", "-c", "npm config set prefix /home/node/.npm-global"]

RUN ["/bin/bash", "-c", "npm i @cloudflare/wrangler -g"]

RUN ["/bin/bash", "-c", "echo \"PATH=$PATH:/home/node/.npm-global/bin\" >> /home/node/.bashrc"]


CMD ["/bin/bash", "-c", "/home/node/.npm-global/bin/wrangler"]