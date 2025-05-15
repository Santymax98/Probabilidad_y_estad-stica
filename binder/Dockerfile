FROM julia:1.10

WORKDIR /home/jovyan

# Copia primero los archivos de entorno
COPY Project.toml Manifest.toml ./

# Instala las dependencias
RUN julia --project=. -e 'using Pkg; Pkg.instantiate()'

# Luego copia el resto del repositorio
COPY . .

EXPOSE 1234

CMD ["julia", "Pluto_run.jl"]
