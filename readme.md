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

```

## Input Data: storedata.csv

The `storedata.csv` file contains sales data with the following columns:
- ORDERNO: Order number
- PRODUCTNO: Product number
- PRICE: Price per unit
- QUANTITY: Quantity sold
- SALES: Total sales amount
- QTRID: Quarter ID
- MONTHID: Month ID
- YEARID: Year ID



```csv
"ORDERNO","PRODUCTNO","PRICE","QUANTITY","SALES","QTRID","MONTHID","YEARID"
10107,2,85.7,30,2587,1,2,2003
10107,5,95.8,39,3879.49,1,2,2003
10121,5,71.5,34,2700,1,2,2003
10134,2,94.74,41,3884.34,3,7,2004
10134,5,100,27,3307.77,3,7,2004
10159,14,100,49,5205.27,4,10,2005
10168,1,96.66,36,3479.66,4,10,2006
10180,12,100,42,4695.6,4,11,2006
```

## Final Output
```csv
ProductNo,MonthId,YearId,Quantity
1,10,2006,36
2,2,2003,30
2,7,2004,41
5,2,2003,73
5,7,2004,27
12,11,2006,42
14,10,2005,49
```





