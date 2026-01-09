FROM sagemath/sagemath:latest

WORKDIR /home/sage/project

EXPOSE 8888

CMD ["sage", "-n", "jupyter", "--ip=0.0.0.0", "--no-browser", "--NotebookApp.token=''"]
