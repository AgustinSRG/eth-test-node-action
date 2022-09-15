FROM docker:stable

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

RUN mkdir -p /ethconfig

COPY keystore .
COPY genesis.json .
COPY password.txt .

ENTRYPOINT ["/entrypoint.sh"]