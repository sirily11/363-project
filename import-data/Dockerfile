FROM resin/raspberrypi3-alpine-python:3.6
# RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
# RUN python get-pip.py
RUN pip install numpy
WORKDIR /usr/temp
RUN git clone https://github.com/pandas-dev/pandas.git
WORKDIR /usr/temp/pandas
RUN pip install cython
RUN python setup.py install
RUN pip install tqdm
RUN pip install mysql-connector-python
RUN pip install colored
WORKDIR /usr/local/app
CMD [ "python","import_data.py" ]