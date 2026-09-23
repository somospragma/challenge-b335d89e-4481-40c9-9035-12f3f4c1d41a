# Publicación de Contrato de Consulta de Cuentas

El sistema de open banking necesita publicar un contrato para la consulta de cuentas que defina los recursos, los consentimientos necesarios y los posibles errores, asegurando que no haya huecos de seguridad. Los actores involucrados son el 'originador de la solicitud', el 'proveedor de servicios de pago' y el 'buró de riesgos'. El contrato debe manejar un volumen de 1 500 solicitudes por segundo en hora pico, asegurando idempotencia del registro de la solicitud por número de operación y canal, donde dos invocaciones con la misma clave producen un solo registro y devuelven la misma respuesta dentro de 24 horas. En caso de timeout del buró mayor a 2 segundos, el sistema debe continuar operando.

## Informacion General

| Campo | Valor |
|-------|-------|
| **Tema** | Contrato Open Banking |
| **Nivel** | senior-l2 |
| **Tipo** | practical |
| **Tiempo estimado** | 8 horas |

## Fases del Reto

### Fase 0: Configuración del Proyecto

**Objetivo:** Obtener el proyecto base funcional enviando el Código Base a un asistente de IA, que lo analizará, corregirá errores y generará un ZIP listo para usar.

**Tiempo estimado:** 15-30 minutos

**Instrucciones:**

- Asegúrate de tener instalado para ejecutar el proyecto: Un IDE o editor de código.
- Copia todo el contenido del campo **Código Base** de este reto — incluyendo el texto de instrucciones que aparece al inicio.
- Abre un asistente de IA (Claude en claude.ai, ChatGPT o Gemini — se recomienda Claude), pega el contenido copiado en el chat y envíalo.
- El asistente analizará los archivos, corregirá errores y generará un archivo ZIP descargable. Descárgalo y extráelo en la carpeta donde quieras trabajar.
- Verifica que el proyecto arranca sin errores.

**Entregable:** El proyecto compila/arranca sin errores.

<details>
<summary>Pistas de conocimiento</summary>

- Copia el Código Base completo incluyendo el texto de instrucciones al inicio — esas instrucciones le indican al asistente exactamente qué hacer con los archivos.
- Si el asistente no genera el ZIP automáticamente al terminar el análisis, escríbele: "genera el ZIP ahora".
- Si el proyecto tiene errores al arrancar, comparte el mensaje de error con el mismo asistente para que lo corrija.

</details>

### Fase 1: Definición de Recursos y Consentimientos

**Objetivo:** Identificar y definir los recursos y consentimientos necesarios para la consulta de cuentas.

**Tiempo estimado:** 2 horas

**Instrucciones:**

- Enumerar los recursos necesarios para la consulta de cuentas.
- Definir los consentimientos requeridos para acceder a cada recurso.
- Asegurar que no haya huecos de seguridad en la definición de recursos y consentimientos.

**Entregable:** Documento que detalla los recursos y consentimientos para la consulta de cuentas.

<details>
<summary>Pistas de conocimiento</summary>

- Considerar las regulaciones de open banking y los estándares de seguridad.
- Evaluar los posibles riesgos y mitigaciones para cada recurso y consentimiento.

</details>

### Fase 2: Definición de Errores y Manejo de Excepciones

**Objetivo:** Identificar y definir los posibles errores y establecer el manejo de excepciones para el contrato de consulta de cuentas.

**Tiempo estimado:** 3 horas

**Instrucciones:**

- Enumerar los posibles errores que pueden ocurrir durante la consulta de cuentas.
- Definir el manejo de excepciones para cada error identificado.
- Asegurar que el sistema continúe operando en caso de timeout del buró mayor a 2 segundos.

**Entregable:** Documento que detalla los posibles errores y el manejo de excepciones para el contrato de consulta de cuentas.

<details>
<summary>Pistas de conocimiento</summary>

- Considerar los modos de falla específicos para cada error.
- Evaluar las consecuencias de cada error y las posibles mitigaciones.

</details>

### Fase 3: Publicación del Contrato

**Objetivo:** Publicar el contrato de consulta de cuentas asegurando que cumple con los requisitos definidos en las fases anteriores.

**Tiempo estimado:** 3 horas

**Instrucciones:**

- Revisar el documento de recursos y consentimientos.
- Revisar el documento de errores y manejo de excepciones.
- Publicar el contrato de consulta de cuentas asegurando que cumple con todos los requisitos.

**Entregable:** Contrato publicado de consulta de cuentas.

<details>
<summary>Pistas de conocimiento</summary>

- Verificar que el contrato cumple con las regulaciones de open banking y los estándares de seguridad.
- Asegurar que el contrato maneja correctamente los recursos, consentimientos y errores definidos.

</details>

## Dimensiones Evaluadas

- **queEs**: ¿Qué es un contrato de consulta de cuentas en el contexto de open banking?
- **paraQueSirve**: ¿Para qué sirve definir los recursos y consentimientos en un contrato de consulta de cuentas?
- **comoSeUsa**: ¿Cómo se usa el contrato de consulta de cuentas en el sistema de open banking?
- **erroresComunes**: ¿Cuáles son los errores comunes que pueden ocurrir durante la consulta de cuentas y cómo se manejan?
- **queDecisionesImplica**: ¿Qué decisiones implica la publicación de un contrato de consulta de cuentas en términos de seguridad y cumplimiento?

## Criterios de Evaluacion

- Definir correctamente los recursos y consentimientos para la consulta de cuentas.
- Identificar y manejar correctamente los posibles errores y excepciones.
- Publicar el contrato de consulta de cuentas cumpliendo con las regulaciones y estándares de seguridad.

## Como trabajar con un asistente de IA

Hay dos caminos, elegi uno:

- **AGENTS.md** (recomendado) — instrucciones nativas del repo. Abri esta carpeta con tu agente local (Claude Code, Cursor, Codex, Copilot, Gemini) y las carga solo. Sabe que archivos faltan y con que comando se verifica, y completa el scaffold escribiendo en disco.
- **PROMPT_MEJORA.md** — para copiar y pegar en un chat (claude.ai, ChatGPT). Devuelve un ZIP con el proyecto. Sirve si no tenes un agente en el IDE.

Ninguno de los dos resuelve las fases del reto: eso es tu trabajo.

## Verificacion

El proyecto esta listo para trabajar cuando este comando corre sin errores:

```bash
npx --yes @redocly/cli lint openapi.yaml
```

---

*Reto generado automaticamente por Challenge Generator - Pragma*
