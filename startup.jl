#!/usr/bin/env julia

import Pkg
Pkg.activate(".")
Pkg.instantiate()

using Pluto
Pluto.run(
    host="0.0.0.0",        # Escuchar en todas las interfaces de red
    port=1234,             # Puerto estándar para Pluto
    launch_browser=false,  # No intentar abrir un navegador
    require_secret_for_access=false,  # No requerir secreto para acceso
    require_secret_for_open_links=false, # No requerir secreto para links
    show_fb_bar=false,     # No mostrar barra de retroalimentación (feedback)
    auto_reload_from_file=true, # Recargar automáticamente al cambiar archivos
)