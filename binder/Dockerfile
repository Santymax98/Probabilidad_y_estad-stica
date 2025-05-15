FROM julia:1.10

ARG NB_USER=jovyan
ARG NB_UID=1000
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential \
    ca-certificates \
    curl \
    git \
    && apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN useradd -u ${NB_UID} -m ${NB_USER}
WORKDIR /home/${NB_USER}

# Instala Pluto y otros paquetes con versiones fijas
RUN julia -e 'using Pkg; Pkg.add(Pkg.PackageSpec(name="Pluto", version="0.20.8")); \
                      Pkg.add(Pkg.PackageSpec(name="PlutoUI", version="0.7.52")); \
                      Pkg.add("Plots"); Pkg.precompile()'

# Copiar archivos del proyecto (cuadernos, etc.)
COPY --chown=${NB_USER}:${NB_USER} . .

USER ${NB_USER}
EXPOSE 1234

# Script para iniciar Pluto
RUN echo 'using Pluto; Pluto.run(host="0.0.0.0", port=1234, launch_browser=false, require_secret_for_open_links=false, require_secret_for_access=false)' > /home/${NB_USER}/start_pluto.jl

CMD ["julia", "/home/jovyan/start_pluto.jl"]