FROM python:3.6-slim
# RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
# RUN python get-pip.py
RUN pip install pandas
RUN pip install tqdm
RUN pip install mysql-connector-python
RUN pip install colored
WORKDIR /usr/local/app
CMD [ "python","import_data.py" ]