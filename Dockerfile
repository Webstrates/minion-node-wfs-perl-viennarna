FROM perl:latest

WORKDIR /minion
RUN wget http://dk.archive.ubuntu.com/ubuntu/pool/main/g/gsl/libgsl2_2.1+dfsg-2_amd64.deb \
  && dpkg -i libgsl2_2.1+dfsg-2_amd64.deb \
  && wget https://www.tbi.univie.ac.at/RNA/download/debian/debian_9_0/viennarna_2.4.12-1_amd64.deb \
  && dpkg -i viennarna_2.4.12-1_amd64.deb \
  && wget https://www.tbi.univie.ac.at/RNA/download/debian/debian_9_0/perl-rna_2.4.12-1_amd64.deb \
  && dpkg -i perl-rna_2.4.12-1_amd64.deb \
  && wget https://www.tbi.univie.ac.at/RNA/download/debian/debian_9_0/viennarna-dev_2.4.12-1_amd64.deb \
  && dpkg -i viennarna-dev_2.4.12-1_amd64.deb \
  && rm -rf /minion/*.deb
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - \
  && apt-get update -y \
  && apt-get install -y build-essential nodejs git-core
RUN npm install -g webstrates-file-system

CMD ["sh", "/minion/main.sh"]
