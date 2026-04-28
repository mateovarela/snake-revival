# Snake Muxxu Web Adaptation

Este repositorio contiene una adaptación web estática para volver a jugar Snake de Muxxu en navegadores modernos mediante Ruffle y un servidor virtual en JavaScript.

## Créditos y fuentes originales

- `snake/` proviene del repositorio Snake de Eternal Twin: https://gitlab.com/eternaltwin/snake/snake
- `snake_wga/` proviene del archivo histórico Motion Twin Web Games Archives: https://github.com/motion-twin/WebGamesArchives
- Motion Twin es el autor original del juego Snake y de sus recursos históricos.
- Eternal Twin mantiene y publica el repositorio abierto de referencia para la variante Snake liberada públicamente.

## Qué contiene esta adaptación

- Reproducción del SWF original mediante Ruffle fijado en la versión `0.2.0-nightly.2026.02.14`
- Interceptación de `/start` y `/end` desde JavaScript para reemplazar el backend original
- Persistencia local con `localStorage["snake_db"]`
- Shell visual inspirado en la interfaz original de Muxxu

## Estructura relevante

- `index.html`: entrada principal para despliegue web
- `snake.html`: alias de la misma experiencia para compatibilidad
- `assets/css/snake.css`: estilos del shell HTML
- `assets/js/snake-app.js`: lógica de la adaptación e interceptores
- `snake/`: código fuente y SWF originales publicados abiertamente
- `snake_wga/`: código y assets archivados publicados abiertamente
- `versions.md`: historial técnico resumido de la reconstrucción

## Despliegue

No hace falta backend. El sitio está preparado para hosting estático (por ejemplo, mediante Vercel).

Requisitos operativos:

- Servir `ruffle-nightly-2026_02_14-web-selfhosted` junto con el resto del sitio
- Servir los `.wasm` correctamente
- Mantener las rutas relativas actuales de `snake/` y `snake_wga/`

## Desarrollo local

Usa cualquier servidor estático simple desde la raíz del proyecto. Ejemplos:

```powershell
python -m http.server 8000
```

Luego abre `http://localhost:8000/`.

## Licencias

Este repositorio mezcla materiales con licencias de origen distintas.

- `snake/` sigue la GNU Affero General Public License v3.0 según su upstream.
- `snake_wga/` sigue la Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License según su upstream.
- Los archivos de Ruffle conservan su licencia dual MIT / Apache-2.0.
- Los archivos propios de esta adaptación se distribuyen respetando esas mismas condiciones y referencias.

Consulta `LICENSE.md` para el detalle resumido.