#!/usr/bin/env python

import sys


def mapper():
    # Skip the header row
    next(sys.stdin)

    # Iterate over each line from standard input
    for line in sys.stdin:
        # Remove leading and trailing whitespace
        line = line.strip()
        # Split the line into fields
        fields = line.split(',')

        # Extract relevant fields
        product_no = int(fields[1])
        month_id = int(fields[6])
        year_id = int(fields[7])
        quantity = int(fields[3])

        # Format key-value pair for output
        output = "{},{},{}\t{}".format(product_no, month_id, year_id, quantity)

        # Emit key-value pair to standard output
        print(output)
        # print('%s,%s,%s\t%s' % (product_no, month_id, year_id, quantity))


if __name__ == "__main__":
    mapper()
