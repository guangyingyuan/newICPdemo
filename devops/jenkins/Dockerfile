# Pre-Built Docker Jenkins Images

FROM mycluster.icp:8500/default/jenkins:latest
 
USER root

RUN /usr/local/bin/install-plugins.sh docker-commons maven-plugin ant git-client git github-api github-branch-source github gitlab-plugin junit pipeline-build-step pipeline-input-step pipeline-rest-api pipeline-stage-step pipeline-stage-view scm-api subversion email-ext emailext-template

RUN apt-get update && apt-get install -y wget


# Configiure Docker 
RUN mkdir -p /etc/docker/certs.d/mycluster.icp:8500/
COPY resources/ca.crt /etc/docker/certs.d/mycluster.icp:8500/ca.crt

# Install kubectl CLI
COPY resources/IBM_Cloud_CLI_0.6.6_amd64.tar.gz /IBM_Cloud_CLI_0.6.6_amd64.tar.gz
RUN pwd
RUN tar -xzvf IBM_Cloud_CLI_0.6.6_amd64.tar.gz
RUN /Bluemix_CLI/install_bluemix_cli
RUN bx --help

COPY resources/icp-linux-amd64 /icp-linux-amd64
RUN bx plugin install /icp-linux-amd64
RUN bx pr --help
RUN echo "1" | bx pr login -a https://10.116.8.14:8443 --skip-ssl-validation -u admin -p admin

# Configure kubectl from ICP console 
COPY resources/kubectl /usr/local/bin/kubectl

RUN set -e
RUN mkdir -p ~/.kube
RUN chown -R $USER:$USER  ~/.kube/

COPY resources/kubecfg.crt ~/.kube/kubecfg.crt
COPY resources/kubecfg.key ~/.kube/kubecfg.key

RUN kubectl config set-cluster cfc-cluster --server=https://mycluster.icp:8001 --insecure-skip-tls-verify=true
RUN kubectl config set-context kubectl --cluster=cfc-cluster
RUN kubectl config set-credentials user --client-certificate=~/.kube/kubecfg.crt --client-key=~/.kube/kubecfg.key
RUN kubectl config set-context kubectl --user=user
RUN kubectl config use-context kubectl

RUN kubectl config current-context

RUN sh -c 'echo "10.116.8.14 mycluster.icp" >> /etc/hosts'
