import sys,json


json_data = open('report.json')
print "json_data:\n"
print json_data
data = json.load(json_data)

if data["numFound"] == 0:
  print "All is ok, no entries found."
  sys.exit(0)

print json.dumps(data, indent=4)
sys.exit(1)