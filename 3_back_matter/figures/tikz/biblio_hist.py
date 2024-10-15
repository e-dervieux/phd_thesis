import numpy as np
import os
from matplotlib import pyplot as plt
import tikzplotlib


def rp(*args): return os.path.realpath(os.path.join(*args))


bib_file = rp(__file__, "..", "..", "..", "..", "clean_bibliography.bib")

with open(bib_file, 'r') as r_file:

    bib_database = r_file.readlines()

bib_database = [line.replace('\t', '') for line in bib_database]
bib_database = [line.replace(' ', '') for line in bib_database]
years = []

for line in bib_database:

    if line.find('Year=') >= 0:

        year = line[line.find('{') + 1:line.find('}')]

        try:
            years.append(int(year) if int(year) >= 1900 else 1899)
        except ValueError:
            print(f"Could not read value: {year} in line {line}")

print("Overall number of entries: {0}".format(len(years)))

plt.figure("Dates")
hrange = (1894, 2024)
n, bins, patches = plt.hist(years, bins=65, range=hrange, edgecolor='black')
colors = ['r']*3
colors.extend(['b']*62)
for c, p in zip(colors, patches):
    p.set_facecolor(c)
plt.ylabel("Number of entries")
plt.xlabel("Publication year")
plt.xlim(1898, 2024)

tikzplotlib.save("bib_hist_raw.tex_dirty")

plt.show()
