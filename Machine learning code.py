import matplotlib.pyplot as plt
import pandas as pd

from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression
from sklearn.metrics import mean_squared_error

sunshine = pd.read_csv('mlrfirsttrial.csv')

print(sunshine)
df = pd.DataFrame(sunshine)

x = df[['T2M', 'T2MDEW', 'T2MWET', 'TS', 'QV2M',	'RH2M',	'PRECTOTCORR',	'PS',	'WS10M'	,'WS10M_MAX',	'WS10M_MIN',	'WS10M_RANGE',	'WS50M'	,'WS50M_MAX',	'WS50M_MIN'	,'WS50M_RANGE'
]]

y = df[['ALLSKY_SFC_SW_DWN']]

x_train, x_test, y_train, y_test = train_test_split(x, y, train_size = 0.8, test_size = 0.2, random_state=6)

lm = LinearRegression()

model = lm.fit(x_train, y_train)

y_predict= lm.predict(x_test)

print("Train score:")
print(lm.score(x_train, y_train))

print("Test score:")
print(lm.score(x_test, y_test))

plt.scatter(y_test, y_predict, alpha=0.4)
plt.plot(range(20000), range(20000))

plt.xlabel("Actual Sunlight: $Y_i$")
plt.ylabel("Predicted Sunlight irradience: $\hat{Y}_i$")
plt.title("Actual Sunlight VS Predicted Sunlight irradience)")

plt.show()