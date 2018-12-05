FROM armhf/python:3.6
# RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
# RUN python get-pip.py
WORKDIR /usr/local/app
RUN pip install pandas
RUN pip install tqdm
RUN pip install mysql-connector-python
RUN pip install colored
CMD [ "python","import_data.py" ]