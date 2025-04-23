import random

# Lista de URLs
urls = ['www.cnn.com', 'www.crap.com', 'www.myblog.com', 'www.flickr.com', 'cnn.com/index.htm']

# Crear y escribir en el archivo pages.log
with open('pages.log', 'w') as file:
    for url in urls:
        # Asignar un puntaje aleatorio float entre 1.0 y 10.0, redondeado a una cifra decimal
        score = round(random.uniform(1.0, 10.0), 1)
        # Escribir la URL y el puntaje separados por tabulación
        file.write(f'{url}\t{score}\n')

print("Archivo pages.log creado con éxito.")
