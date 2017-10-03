"""A nested data structure for demonstrating pretty printing"""

from pprint import pprint

nested = {"a": [{"apple": 5, "arugula": 7},
                {"alligator": 9, "aarvark": 7},
                {"america": 7, "argentina": 9, "angola": 7}],
          "b": [{"banana": 6, "berry": 5},
                {"bird": 4, "bonobo": 6, "beluga": 6},
                {"belize": 6, "brazil": 6, "belgium": 7}],
          "c": [{"canteloupe": 10, "cherry": 6},
                {"cougar": 6, "cuttlefish": 10, "cat": 3, "canary": 6},
                {"canada": 6, "columbia": 8}]}


print "\n\nprinting:"
print nested

print "\n\npretty printing:"
pprint(nested)
