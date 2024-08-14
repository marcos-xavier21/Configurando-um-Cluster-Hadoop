#/bin/bash

export SPARK_HOME=/opt/spark
export PYSPARK_DRIVER_PYTHON=ipython
export SPARK_MASTER_HOST=masternode
export SPARK_CONF_DIR=/opt/spark/conf
export PYSPARK_PYTHON=/opt/pyenv/versions/3.6.12/bin/python
export PYSPARK_SUBMIT_ARGS=--driver-memory 16g --executor-memory 16g pyspark-shell
