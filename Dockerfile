FROM docker:stable

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

RUN mkdir -p /root/.ethereum/

COPY keystore /root/.ethereum/keystore
COPY genesis.json /root/.ethereum/genesis.json
COPY password.txt /root/.ethereum/password.txt

ENTRYPOINT ["/entrypoint.sh"]