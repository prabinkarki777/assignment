#!/usr/bin/env python

import sys


def reducer():
    product_sales = {}
    input_data = sys.stdin.read()
    sys.stderr.write(input_data)

    # Iterate over each line in the input
    for line in input_data.split('\n'):
        # Remove leading and trailing whitespace
        line = line.strip()
        # If line is empty, skip
        if not line:
            continue
        # Split the line into key and value
        key, value = line.split('\t', 1)
        # Convert value to integer
        quantity = int(value)
        # Split the key into fields
        product_no, month_id, year_id = map(int, key.split(','))
        # Update intermediate result for the current key
        product_sales.setdefault((product_no, year_id, month_id), 0)
        product_sales[(product_no, year_id, month_id)] += quantity

    # Sort the keys of the dictionary
    sorted_keys = sorted(product_sales.keys())

    # Print header
    print("ProductNo,MonthId,YearId,Quantity")

    # Emit the sorted key-value pairs
    for key in sorted_keys:
        print('%d,%d,%d,%d' % (key[0], key[2], key[1], product_sales[key]))


if __name__ == "__main__":
    reducer()
