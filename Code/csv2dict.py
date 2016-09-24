import csv

with open('coordinates.csv', mode='r') as infile:
    reader = csv.reader(infile)
    next(reader, None)  # skip the headers
    mydict = {rows[3]:(float(rows[1]),float(rows[2])) for rows in reader}
    
    