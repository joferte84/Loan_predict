# Usa la imagen base oficial de Jupyter Notebook
FROM jupyter/base-notebook:latest

# Establece el directorio de trabajo en el contenedor
WORKDIR /usr/src/app

# Copia los archivos y directorios necesarios al contenedor
COPY ./archive/*.csv /usr/src/app/archive/
COPY ["./Loan predict.ipynb", "/usr/src/app/"]

# Instala las dependencias necesarias (ejemplo con pip)
# Asegúrate de incluir todas las librerías necesarias para tu notebook
RUN pip install numpy pandas matplotlib seaborn scipy scikit-learn imbalanced-learn xgboost

# El puerto en el que se ejecutará Jupyter Notebook
EXPOSE 8888

# Comando para ejecutar Jupyter Notebook
# Puedes ajustar los flags según tus necesidades
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--allow-root", "--NotebookApp.token=''", "--NotebookApp.password=''"]
