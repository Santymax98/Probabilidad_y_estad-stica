FROM julia:1.10

WORKDIR /home/jovyan

COPY . .

RUN julia --project=. -e 'using Pkg; Pkg.instantiate()'

EXPOSE 1234

CMD ["julia", "Pluto_run.jl"]