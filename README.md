[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/1AdE32lK)
## Ejercitación: Responsive Design

En esta práctica vas a tomar una plantilla HTML/CSS ya armada y aplicar **diseño responsive** para que el sitio funcione correctamente en desktop, tablet y móvil.

## Objetivo de aprendizaje

- Aplicar media queries con criterio.
- Reorganizar layouts según ancho de pantalla.
- Mejorar legibilidad y espaciado en pantallas reducidas.
- Evitar desbordes horizontales.

## Material de referencia

Los bocetos finales de la actividad están en:

- `Bocetos/Boceto_desktop.png`
- `Bocetos/Boceto_tablet.png`
- `Bocetos/Boceto_mobile.png`

Tomalos como guía visual para aproximarte al resultado esperado.

## Archivos de trabajo

- `index.html` (estructura base)
- `css/estilos.css` (estilos y media queries)

> Importante: no hace falta rehacer el HTML completo. El foco del ejercicio es responsive desde CSS.

## Consigna

Partiendo de la plantilla actual:

1. Definí una media query para `max-width: 768px` (tablet).
2. Definí una media query para `max-width: 450px` (móvil).
3. Ajustá distribución, anchos, tamaños y espaciado para que el contenido mantenga buena lectura.
4. Verificá que no haya scroll horizontal innecesario.
5. Respetá la estructura general y buscá similitud visual con los bocetos.

## Qué se evalúa automáticamente (GitHub Classroom)

El repositorio incluye checks automáticos que validan:

- estructura base del proyecto (`index.html`, `css/estilos.css`, meta viewport),
- existencia de media queries de 768px y 450px,
- ajustes de layout para tablet,
- ajustes de layout para móvil (ancho de tarjetas y bloques principales).

Si falla un check, revisá la pestaña **Actions** para ver el mensaje específico.

## Qué se evalúa en revisión docente

Además de los checks, hay corrección humana sobre:

- correspondencia global con los bocetos,
- calidad visual (alineación, jerarquía tipográfica, espaciado),
- consistencia responsive entre secciones.

> Aprobar checks automáticos **no reemplaza** la corrección docente final.

## Recomendaciones técnicas

- Preferí unidades relativas (`%`, `rem`) cuando sea útil.
- Si un bloque está en fila en desktop, evaluá pasarlo a columna en móvil.
- Ajustá `padding`, `margin` y tamaños de texto para pantallas pequeñas.
- Probá los anchos desde el inspector del navegador (modo responsive).

## Entrega sugerida

1. Implementar cambios en `css/estilos.css`.
2. Verificar comportamiento visual en desktop/tablet/móvil.
3. Hacer commit y push.
4. Corroborar estado de checks en GitHub.

---

¡Éxitos! La idea es practicar decisiones de diseño adaptativo reales, no solo “hacer que pase el test”.
