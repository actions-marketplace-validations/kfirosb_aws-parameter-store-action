FROM amazon/aws-cli:2.9.12

RUN yum install jq -y
COPY entrypoint.sh /entrypoint.sh
RUN chmod 770 /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]