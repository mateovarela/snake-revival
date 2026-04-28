# Registro de Versiones - Reconstrucción Snake Muxxu

Este documento detalla la evolución técnica y funcional del proyecto para recrear el juego Snake de Muxxu en una versión local y persistente.

## Hitos Técnicos Fundamentales

Para reconstruir el juego, se resolvieron tres desafíos principales:

1. Bypass de Red: los archivos `.swf` originales intentaban comunicarse con servidores de Motion Twin que ya no existen. Se implementó un servidor virtual en JavaScript que intercepta `fetch` y `XMLHttpRequest`.
2. Protocolo Haxe 2.0: el juego utiliza un formato de serialización específico (`oy...g` para objetos, `j` para enums, `a...h` para arrays). Fue necesario realizar ingeniería inversa del código desofuscado para construir paquetes de datos compatibles.
3. Persistencia Local: se mapearon los datos enviados por el juego al finalizar la partida (`/end`) hacia `localStorage`, permitiendo guardar frutas y puntuaciones sin base de datos externa.

## Evolución de Versiones

### Versiones Iniciales (v1 - v21)

- Logro: identificación del modo `browser` como el único interactivo.
- Decisión técnica: descubrimiento del bypass de cifrado en `Codec.as`. Si el parámetro `data` comienza con la misma letra que la llave `k`, el juego entra en modo fake y acepta texto plano en lugar de datos cifrados.
- Problema: pantallas blancas constantes debido a cálculos de tiempo (`NaN`) y formatos de objeto incorrectos.

### Versión 22 (Stable - La Primera Jugable)

- Funcionalidad: primera versión donde el control de la serpiente y las cartas fue 100% funcional.
- Clave técnica: se inyectó el parámetro `time` con la hora del sistema para evitar el bloqueo del motor de juego y se ajustó el CSS para un escalado de 1200px.

### Versión 26 (Stable - Enciclopedia)

- Funcionalidad: implementación de la pestaña Enciclopedia.
- Clave técnica: se creó un serializador Haxe en JS para transformar el array de `localStorage` en un formato que el SWF `fruit.swf` pudiera leer. Se capturó por primera vez la lista de frutas al morir en la arena.

### Versión 32 (Stable - Traducción e Historial)

- Funcionalidad: registro de partidas y traducción de cartas.
- Clave técnica: se implementó un diccionario para traducir los IDs técnicos a nombres en español. Se solucionó el error de enum no encontrado mediante des-referenciación de atajos de memoria Haxe.

### Versión 33 (Stable - Identidad Visual)

- Funcionalidad: integración de la estética original.
- Clave técnica: carga de fuentes originales mediante `@font-face` y uso de recursos gráficos del portal Muxxu para fondo y marcos.

### Versión 43 (Stable - Flujo Sin Costuras)

- Funcionalidad: carga automática y corrección de bugs de navegación.
- Clave técnica: eliminación de pantallas negras iniciales mediante carga secuencial del SWF. Blindaje de la lógica de pestañas para evitar bloqueos por datos nulos.

### Versión 44

- Funcionalidad total: incluye progresión de frutas con subida de nivel visual en la pantalla final.
- Clave técnica: implementación de los umbrales de Muxxu (3, 17, 50, 100, 500) en el servidor virtual. El sistema detecta el progreso y dispara las animaciones originales de evolución de la enciclopedia.
- Limpieza: consolidación de interceptores y renombre de la base de datos a `snake_db`.

### Versión 49 (snake.html)

- Funcionalidad: reconstrucción total con motor local y visuales originales.
- Clave técnica: implementación de Ruffle self-hosted con la versión `0.2.0-nightly.2026.02.14`, eliminando la dependencia de internet y reduciendo el riesgo de regresiones del motor.

### Versión 50

- Funcionalidad: restauración del pool completo de cartas originales disponibles en la adaptación.
- Clave técnica: corrección del rango exportado hacia `_CardType` en la carga del modo arena. La adaptación estaba generando menos IDs de cartas que los presentes en el enum original, dejando fuera cartas del tramo final como `FOG` y `SHOOTING_STAR`.

### Versión 51

- Funcionalidad: preparación del proyecto para despliegue estático en Vercel sin cambiar la base jugable.
- Clave técnica: extracción de CSS y JavaScript desde `snake.html` hacia archivos dedicados, incorporación de `index.html` como entrada principal, creación de `vercel.json` con headers para Ruffle y WebAssembly, y documentación del proyecto con `README.md`, `LICENSE.md` y `.gitignore`.

## Resumen de Archivos Clave

- `index.html`: entrada principal para despliegue web.
- `snake.html`: alias compatible de la misma experiencia.
- `assets/js/snake-app.js`: lógica de la adaptación, servidor virtual e integración con Ruffle.
- `assets/css/snake.css`: estilos del shell HTML.
- `snake/swf/es/game.swf`: motor de la arena y selección de cartas.
- `snake/swf/es/fruit.swf`: visualizador de la enciclopedia de frutas.
- `snake_wga/`: repositorio de imágenes y recursos originales del portal.
- `localStorage["snake_db"]`: almacén persistente del progreso del jugador.