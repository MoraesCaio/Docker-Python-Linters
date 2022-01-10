# docker run --rm -it -e FIX='true' -v $(pwd):/data tj_feed:linter
FROM python:3.9.9-slim-buster

WORKDIR /data/

RUN pip install \
        isort==5.8.0 \
        black==21.12b0 \
        mypy==0.930 \
        flake8==3.9.2 \
        flake8-annotations==2.7.0 \
        pylint==2.12.2

COPY run.sh /docker_python_linters/run.sh
COPY .pylintrc /docker_python_linters/.pylintrc

ENV FIX=false
ENV CHECK=true

ENTRYPOINT [ "/docker_python_linters/run.sh" ]