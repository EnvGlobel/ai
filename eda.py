import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import numpy as np

colors = pd.read_csv("colors.csv")

colors.info()

corr = colors.corr()

# colors["g"] = colors["g1"] + colors["g2"] + \
#     colors["g3"] + colors["g4"] + colors["g5"] + colors["g6"]
# colors["o"] = colors["o1"] + colors["o2"] + \
#     colors["o3"] + colors["o4"] + colors["o5"] + colors["o6"]
# colors["r"] = colors["r1"] + colors["r2"] + \
#     colors["r3"] + colors["r4"] + colors["r5"] + colors["r6"]
# colors["d"] = colors["d1"] + colors["d2"] + \
#     colors["d3"] + colors["d4"] + colors["d5"] + colors["d6"]

#colorsMelt = pd.melt(colors, ["g","o","r","d"], ["pm25", "pm10" "oz"])

mask = np.triu(np.ones_like(corr, dtype=np.bool))
mask[:, 3:] = 1
mask[1, 0] = 1


# Draw the heatmap with the mask and correct aspect ratio
sns.heatmap(corr, mask=mask, square=True)

plt.show()
