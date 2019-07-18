FROM resin/rpi-raspbian

RUN apt-get update
RUN apt-get install -y python python-pip alsa-utils build-essential
RUN apt-get install python-dev
RUN pip install numpy 
RUN apt-get install -y libblas-dev
RUN apt-get install -y liblapack-dev
RUN apt-get install -y gfortran
RUN pip install librosa
RUN pip install pandas
RUN pip install sklearn
RUN echo "deb http://ftp.debian.org/debian jessie-backports main" > /etc/apt/sources.list.d/backports.list

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 8B48AD6246925553
RUN apt-get update
RUN apt-get install -y python-dill
#RUN pip install pickle
RUN pip install simplejson

RUN pip install pydub
#RUN apt-get install python-numpy python-librosa
RUN apt-get install -y libav-tools libavcodec-extra-56

ADD http://ftp.osuosl.org/pub/blfs/conglomeration/alsa-utils/alsa-utils-1.1.3.tar.bz2 /alsa/alsa-utils-1.1.3.tar.bz2
#ADD ftp://ftp.alsa-project.org/pub/utils/alsa-utils-1.1.3.tar.bz2 /alsa/alsa.tar.bz2
WORKDIR /alsa
RUN tar xvjf alsa-utils-1.1.3.tar.bz2
WORKDIR /alsa/alsa-utils-1.1.3
RUN apt-get -y install libncursesw5-dev libasound2-dev 
RUN ./configure --disable-alsaconf --disable-bat --disable-xmlto --with-curses=ncursesw
RUN make
RUN make install