FROM docker:stable

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

RUN mkdir -p /ethconfig

COPY keystore /keystore
COPY genesis.json /genesis.json
COPY password.txt /password.txt

ENTRYPOINT ["/entrypoint.sh"]