FROM julia:1.10

# Crea un usuario no-root (evita problemas de permisos)
ARG NB_USER=jovyan
ARG NB_UID=1000
RUN useradd -u ${NB_UID} -m ${NB_USER}
WORKDIR /home/${NB_USER}
USER ${NB_USER}

# Copia los archivos de proyecto con permisos correctos
COPY --chown=${NB_USER}:${NB_USER} Project.toml Manifest.toml ./

# Instala dependencias con precompilación
RUN julia --project=. -e 'using Pkg; \
    Pkg.instantiate(); \
    Pkg.precompile()'

# Copia el resto con permisos adecuados
COPY --chown=${NB_USER}:${NB_USER} . .

EXPOSE 1234

CMD julia Pluto_run.jl