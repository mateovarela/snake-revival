# Registro de Intervención - Snake Muxxu

Este archivo sirve como referencia para futuros agentes de IA o para el desarrollador en caso de necesitar retomar el mantenimiento del proyecto.

## 📌 Estado del Proyecto (Marzo 2026)
El juego se encuentra en una versión **100% autónoma y local**. Se ha eliminado la dependencia de servidores externos de Motion Twin y de la carga online del motor Ruffle.

## 🛠️ Arquitectura Técnica
- **Motor:** [Ruffle](https://ruffle.rs/) (Versión `0.2.0-nightly.2026.02.14`). Se sirve localmente desde la carpeta `ruffle-nightly-2026_02_14-web-selfhosted`.
- **Backend:** Servidor Virtual implementado en JavaScript (`snake.html`) que intercepta `fetch` y `XMLHttpRequest`.
- **Protocolo:** Ingeniería inversa de serialización Haxe 2.0 (`oy...g`).
- **Persistencia:** `localStorage["snake_db"]`.

## 🚨 Historial de Incidentes Críticos
### Incidente de "ABC Data Corrupt" (07/03/2026)
- **Causa:** Ruffle Nightly (vía unpkg) actualizó su parser de AVM2 y rompió la compatibilidad con los SWFs ofuscados originales.
- **Resolución:** Migración a una arquitectura **Self-Hosted**. Se fijó la versión estable de Ruffle anterior al incidente para garantizar funcionamiento perpetuo.

## 📝 Notas para el Futuro
1. **Evitar Actualizaciones de Ruffle:** No actualizar el motor a menos que sea estrictamente necesario para corregir un bug visual, y siempre probar exhaustivamente la carga de ActionScript 3.
2. **Estructura de Carpetas:** Mantener `snake/swf/` y `ruffle-...` en el mismo nivel que `snake.html`.
3. **Servidor Local:** El juego **requiere** un servidor web (ej: `python -m http.server`) para que Ruffle pueda cargar los archivos `.wasm` y los `.swf` por políticas de CORS.
