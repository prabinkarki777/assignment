college assignment


MapReduce Using Hadoop
Script to Run Hadoop Streaming Job
Here is the full script to run the Hadoop streaming job, including the command and the description of the input data (storedata.csv) and the expected output.


```sh
#!/bin/bash

# Define the Hadoop streaming jar location
HADOOP_STREAMING_JAR="/opt/homebrew/Cellar/hadoop/3.4.0/libexec/share/hadoop/tools/lib/hadoop-streaming-3.4.0.jar"

# Define the mapper and reducer script locations
MAPPER_SCRIPT="user/macbook/mapper.py"
REDUCER_SCRIPT="user/macbook/reducer.py"

# Define the input and output directories
INPUT_DIR="/user/macbook/salesdata.csv"
OUTPUT_DIR="/user/macbook/output"

# Run the Hadoop streaming job
hadoop jar $HADOOP_STREAMING_JAR \
-files $MAPPER_SCRIPT,$REDUCER_SCRIPT \
-mapper mapper.py \
-reducer reducer.py \
-input $INPUT_DIR \
-output $OUTPUT_DIR






