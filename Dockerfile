FROM docker:stable

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

RUN mkdir -p /ethconfig

COPY keystore /ethconfig/keystore
COPY genesis.json /ethconfig/genesis.json
COPY password.txt /ethconfig/password.txt

ENTRYPOINT ["/entrypoint.sh"]