import seaborn as sns
import matplotlib as mpl
import matplotlib . pyplot as plt
import pandas as pd
data = pd.read_csv ('graficas\bambuco\*.csv ')
print ( data . describe () )
sns .set( style =" ticks ")
sns . pairplot ( data , hue =" Vector de caracteristicas")
plt . savefig ('graficas_python\bambuco\pixeles.pdf', dpi =400 , bbox_inches ='tight' , pad_inches=0.1)
