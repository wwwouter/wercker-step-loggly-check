import sys,json

reportPath = str(sys.argv[1])

json_data = open(reportPath)
data = json.load(json_data)

if data["numFound"] == 0:
  print "All is ok, no entries found."
  sys.exit(0)

# print json.dumps(data, indent=4)
sys.exit(1)