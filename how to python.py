#repl_python()

import pandas as pd
import matplotlib as mpl
import seaborn as sns

tips = sns.load_dataset("tips")
print(tips)

sns.set()
sns.lmplot(x="total_bill", y="tip",
           hue="smoker", data=tips)
mpl.pyplot.show()

flights = sns.load_dataset('flights')
flights = flights.pivot('month','year','passengers')
sns.heatmap(flights,cmap="OrRd")
mpl.pyplot.show()

sns.heatmap(flights,cmap="coolwarm",annot=True,fmt='d',linewidths=2)
