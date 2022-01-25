FROM python:2.7 

RUN pip install --upgrade pip && \
    pip install --no-cache-dir git+git://github.com/tianhuil/SimpleHTTPAuthServer.git@master 

CMD ["python","-m","SimpleHTTPAuthServer","80","theServerAccount:NotSoSecureSecret"]
