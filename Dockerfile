FROM ethereum/client-go:alltools-latest

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

COPY keystore /keystore
COPY genesis.json /genesis.json
COPY password.txt /password.txt

ENTRYPOINT ["/entrypoint.sh"]