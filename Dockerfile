FROM	debian:9
ENV	DEBIAN_FRONTEND noninteractive
# atp-get
RUN	apt-get update && \
	apt-get install -y apt-utils libtool autoconf && \
	apt-get install -y libczmq4 libczmq-dev libczmq-dbg && \
	apt-get install -y libzmq5 libzmq5-dev libzmq5-dbg && \
	apt-get install -y python-pip libpq-dev python-dev libunwind-dev && \
	apt-get install -y openbabel python-openbabel python-imaging python-imaging-tk && \
	apt-get upgrade -y && \
	apt-get clean && rm -rf /var/lib/apt/lists/* && \
# Jupyter & Python
	pip install --upgrade pip && \
	pip install jupyter && \
	pip install ipywidgets && \
	pip install moldesign pyccc nbmolviz && \
	jupyter nbextension enable --python widgetsnbextension && \
	jupyter nbextension enable --python nbmolviz && \
	mkdir /notebook && \
	jupyter notebook --allow-root --generate-config && \
	echo "c.NotebookApp.allow_root = True" >> /root/.jupyter/jupyter_notebook_config.py && \
	echo "c.NotebookApp.ip = '*'" >> /root/.jupyter/jupyter_notebook_config.py && \
	echo "c.NotebookApp.open_browser = False" >> /root/.jupyter/jupyter_notebook_config.py && \
	echo "c.NotebookApp.notebook_dir = '/notebook'" >> /root/.jupyter/jupyter_notebook_config.py && \
	echo "c.NotebookApp.token = 'pass'" >> /root/.jupyter/jupyter_notebook_config.py && \
	rm -rf /tmp/*

CMD	["jupyter","notebook"]
