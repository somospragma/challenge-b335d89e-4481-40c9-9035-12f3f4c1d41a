# Prompt para Mejorar el Codigo Base

Copia y pega el contenido del bloque de abajo en un asistente de IA (Claude, ChatGPT)
para obtener un ZIP con el proyecto completo y arrancable.

Si preferis trabajar en tu editor con un agente local (Claude Code, Cursor, Copilot), usa `AGENTS.md` en vez de este archivo: dice lo mismo pero para que escriba los archivos en disco.

## Las dos reglas que no se negocian

1. **Completa el boilerplate.** Todo lo que el proyecto necesita para compilar y arrancar: manifiesto de dependencias, punto de entrada, configuracion, capa de interfaz, y las capas del patron arquitectonico declarado. Eso es andamiaje y es tu trabajo.
2. **NO resuelvas el reto.** Los entregables de las fases son el trabajo de la persona. El hueco pedagogico se deja como esta: el proyecto arranca, pero lo que el reto pide implementar NO esta implementado.

Dicho de otra forma: si algo impide compilar, arreglalo. Si algo es logica de negocio incompleta, validaciones ausentes, un secreto hardcodeado o un patron mejorable, dejalo exactamente como esta — es lo que la persona tiene que encontrar.

## Superficie de practica — NO resuelvas

Estos archivos SON el ejercicio de la persona. No los implementes; deja stubs.

- `openapi.yaml` — El topic pide el contrato de API: openapi.yaml es el ejercicio.

## Como saber que terminaste

```bash
npx --yes @redocly/cli lint openapi.yaml
```

Ese comando corriendo sin errores es la definicion de "listo".

---

```
## Briefing del reto (autoridad)
Este bloque manda sobre los archivos adjuntos. El stack y el rol salen de AQUÍ, no de un topic genérico ni de markdown placeholder.

### Perfil
Chapter Integración, Especialidad Analista, Tecnología Open Banking, Senior

### Brecha de conocimiento
Define el recurso, los consentimientos y los errores de un API de open banking sin dejar huecos de seguridad

### Misión / candidato
Publicar el contrato de consulta de cuentas

### Datos adicionales
Candidato Senior en banca abierta

### Reto
- Tema: Contrato Open Banking
- Seniority: senior-l2
- Tipo: practical
- Título: Publicación de Contrato de Consulta de Cuentas
- Tiempo estimado: 8 horas

### Fases (trabajo del HUMANO — PROHIBIDO completarlas)
No implementes estos entregables. Dejalos como hueco pedagógico. El asistente solo materializa el proyecto arrancable para que el participante pueda trabajar.
- Fase 1: Definición de Recursos y Consentimientos — objetivo: Identificar y definir los recursos y consentimientos necesarios para la consulta de cuentas. — entregable (NO resolver): Documento que detalla los recursos y consentimientos para la consulta de cuentas.
- Fase 2: Definición de Errores y Manejo de Excepciones — objetivo: Identificar y definir los posibles errores y establecer el manejo de excepciones para el contrato de consulta de cuentas. — entregable (NO resolver): Documento que detalla los posibles errores y el manejo de excepciones para el contrato de consulta de cuentas.
- Fase 3: Publicación del Contrato — objetivo: Publicar el contrato de consulta de cuentas asegurando que cumple con los requisitos definidos en las fases anteriores. — entregable (NO resolver): Contrato publicado de consulta de cuentas.

Eres un asistente experto en análisis, corrección y generación de archivos de cualquier tipo:
código fuente, documentación, hojas de cálculo, documentos Word, configuraciones, entre otros.
Voy a enviarte una cadena de texto que contiene uno o más archivos. Cada archivo está delimitado por un marcador con el siguiente formato:
// === ARCHIVO: ruta/del/archivo.extension ===
o también puede aparecer como:
## === ARCHIVO: ruta/del/archivo.extension ===
Lo que sigue al marcador puede ser:

El contenido real del archivo (código, texto, YAML, etc.)
Una descripción en lenguaje natural de lo que debe contener el archivo


TU TAREA
PASO 0 — ¿Esto es un proyecto o una carcasa?
Antes de extraer archivos, leé el Briefing (si está) y diagnosticá el adjunto.

Es CARCASA si ocurre CUALQUIERA de estas:
- No hay manifiesto de dependencias del stack del briefing (manifest.json de VTEX IO / package.json / pom.xml / build.gradle / requirements.txt / go.mod / *.tf / *.csproj, según corresponda)
- Hay un "binario" que en realidad es un comentario ("no puede ser mostrado como texto plano", placeholder .fig/.docx vacío)
- Los markdowns ya completan entregables de fases posteriores ("se implementó fade-in", lista de áreas ya resuelta)

Si es CARCASA:
- MATERIALIZÁ un proyecto que arranca en el stack del briefing (VTEX IO Store Framework, Angular, Terraform, pytest, Nest, etc.). Incluí manifiesto, punto de entrada y capa de interfaz reales.
- NO copies los markdowns de "solución" como si fueran el producto. Son ruido de generación.
- NO resuelvas las fases del briefing (están marcadas PROHIBIDO). Dejá el hueco pedagógico: el flujo existe, las microinteracciones/calidad/infra que el reto pide NO están hechas.
- Después seguí al PASO 5 (ZIP).

Si es un proyecto REAL (manifiesto + código que compila o arranca):
- Seguí PASO 1 en adelante. 🔴 compilación sí. 🟡 pedagógico no.

PASO 1 — Detección y extracción
Identifica todos los archivos presentes en la cadena. Para cada archivo extrae:

Su ruta completa (ej: src/main/java/com/pragma/Service.java)
Su contenido o descripción

PASO 2 — Clasificación por tipo
Clasifica cada archivo en una de estas categorías:
A) Código fuente (Java, Python, TypeScript, JavaScript, Kotlin, etc.)
B) Configuración / documentación (YAML, properties, Markdown, JSON, txt, etc.)
C) Excel (.xlsx, .xls, .csv)
D) Word (.docx, .doc)
E) Otro tipo de archivo binario o especial
PASO 3 — Clasificación de errores en código fuente

Objetivo prioritario: que el proyecto compile. No corrijas flujo de negocio ni lógica funcional.

Antes de modificar cualquier archivo de código fuente, clasifica cada problema encontrado en una de estas dos categorías:
🔴 ERROR DE COMPILACIÓN — corregir siempre
Son errores que impiden que el proyecto arranque, sin valor pedagógico:

Import faltante o incorrecto
Clase, método o variable referenciada que no existe en ningún archivo del proyecto
Error de sintaxis
Anotación con atributos inválidos
Dependencia ausente en pom.xml, package.json, etc.
Archivo referenciado que no existe y debe ser creado con implementación mínima

→ CORREGIR estos errores.
🟡 PROBLEMA FUNCIONAL O DE CALIDAD — preservar siempre
Son problemas que no impiden compilar. Pueden ser intencionales para el aprendizaje:

Clave secreta hardcodeada ("secret", "password123")
API deprecada que funciona pero tiene reemplazo moderno
Lógica de negocio incorrecta o incompleta
Código redundante o de baja legibilidad
Falta de validaciones en flujo de negocio
Patrones de diseño incorrectos pero funcionales
Concurrencia no segura
Configuración funcional pero no óptima

→ PRESERVAR tal cual. No corregir, no mejorar, no comentar.
PASO 4 — Procesamiento según tipo de archivo
Tipo A — Código fuente
Aplica únicamente las correcciones clasificadas como 🔴 ERROR DE COMPILACIÓN.
No alteres ningún elemento clasificado como 🟡 PROBLEMA FUNCIONAL O DE CALIDAD.
Si falta un archivo referenciado, créalo con la implementación mínima necesaria para compilar.
Tipo B — Configuración / documentación
Extrae el contenido tal cual, sin modificaciones salvo errores evidentes de sintaxis
(ej: YAML mal indentado).
Tipo C — Excel (.xlsx)
Si viene con contenido real, genera el archivo respetando ese contenido.
Si viene con descripción en lenguaje natural, genera un archivo Excel funcional con:

Fila de encabezados en negrita con color de fondo distintivo
Columnas con ancho ajustado al contenido
Tipos de dato correctos por columna
Validaciones si la descripción lo indica
Hojas nombradas descriptivamente si hay más de una
Filas de ejemplo si no hay datos reales

Tipo D — Word (.docx)
Si viene con contenido real, genera el archivo respetando ese contenido.
Si viene con descripción en lenguaje natural, genera un documento Word funcional con:

Estilos de título (Título 1, Título 2) para jerarquía de secciones
Fuente legible (Calibri o equivalente), tamaño 11-12pt para cuerpo
Márgenes estándar
Tabla de contenido si tiene múltiples secciones
Tablas con encabezados en negrita si aplica

Tipo E — Otro
Genera el archivo con el contenido o estructura más apropiada según la descripción.
PASO 5 — Exportación en ZIP
Empaqueta todos los archivos en un único archivo ZIP descargable respetando exactamente
la estructura de rutas indicada por los marcadores.
El ZIP debe incluir:

Archivos de código con únicamente los errores de compilación corregidos
Archivos de configuración y documentación sin cambios
Archivos nuevos creados para resolver dependencias de compilación faltantes
Archivos Excel y Word generados desde descripción

IMPORTANTE: El ZIP debe estar listo para descargar al finalizar. No preguntes si el usuario
quiere generarlo. Simplemente genera el archivo y proporciona el enlace de descarga; No debes desplegar en el chat el resumen de lo que arreglaste al Zip, solo entregalo.

REGLAS IMPORTANTES

No omitas ningún archivo aunque no tenga errores ni modificaciones
Respeta los nombres y rutas exactas indicadas por los marcadores
Si un archivo no tiene marcador claro, infiere el nombre desde su contenido
Si la cadena contiene solo documentación, placeholders o binarios fake, NO la reproduzcas:
aplicá PASO 0 (materializar el proyecto del briefing). Reproducir la carcasa es un fallo.
No agregues texto después del enlace de descarga del ZIP
No preguntes si el usuario quiere el ZIP: simplemente generalo siempre
Si detectas que falta un archivo de configuración necesario para compilar
(pom.xml, package.json, requirements.txt, build.gradle, etc.), créalo e inclúyelo
inferiendo su contenido desde los imports y frameworks detectados en el código
Nunca corrijas problemas 🟡 aunque parezcan obvios o fáciles de mejorar.
El participante que recibirá este proyecto los debe encontrar y resolver él mismo.


INPUT
Aquí está la cadena con los archivos:

// === ARCHIVO: openapi.yaml ===
openapi: 3.1.0
info:
  title: Contrato de Consulta de Cuentas - Open Banking
  description: |
    API para la consulta de cuentas bancarias conforme a los estándares FAPI y PSD2.
    Permite a los TPP (Third Party Providers) acceder a información de cuentas con el consentimiento explícito del usuario.
    Soporta idempotencia en operaciones críticas y manejo de errores específicos para Open Banking.
    Volumen máximo esperado: 1500 solicitudes/segundo en hora pico.
  version: 1.0.0
  contact:
    name: Equipo de Integración Open Banking
    email: openbanking@empresa.com
  license:
    name: Apache 2.0
    url: https://www.apache.org/licenses/LICENSE-2.0.html
servers:
  - url: https://api.banco.com/open-banking/v1
    description: Servidor de producción
  - url: https://sandbox.api.banco.com/open-banking/v1
    description: Servidor de sandbox para pruebas
tags:
  - name: Cuentas
    description: Operaciones relacionadas con la consulta de cuentas bancarias
  - name: Consentimientos
    description: Gestión de consentimientos para acceso a datos bancarios
  - name: Operaciones
    description: Registro y consulta de operaciones con idempotencia
paths:
  /accounts:
    get:
      tags:
        - Cuentas
      summary: Consulta de cuentas bancarias
      description: |
        Retorna la lista de cuentas bancarias asociadas al consentimiento proporcionado.
        Requiere token de acceso con scope `accounts` y consentimiento válido.
        En caso de timeout del buró de riesgos (>2s), la operación continúa con datos cacheados si están disponibles.
      operationId: getAccounts
      security:
        - FAPIAuth:
            - accounts
      parameters:
        - $ref: '#/components/parameters/x-fapi-interaction-id'
        - $ref: '#/components/parameters/x-idempotency-key'
        - $ref: '#/components/parameters/x-fapi-auth-date'
        - $ref: '#/components/parameters/x-fapi-customer-ip-address'
        - name: account-type
          in: query
          description: Tipo de cuenta a filtrar (opcional)
          required: false
          schema:
            type: string
            enum:
              - CURRENT
              - SAVINGS
              - LOAN
              - CREDIT_CARD
              - INVESTMENT
      responses:
        '200':
          description: Lista de cuentas bancarias asociadas al consentimiento
          headers:
            x-fapi-interaction-id:
              $ref: '#/components/headers/x-fapi-interaction-id'
          content:
            application/json:
              schema:
                type: object
                properties:
                  data:
                    type: array
                    items:
                      $ref: '#/components/schemas/Account'
                  links:
                    $ref: '#/components/schemas/Links'
                  meta:
                    $ref: '#/components/schemas/Meta'
              examples:
                success:
                  value:
                    data:
                      - account_id: a9d7e3f1-5b8c-4d2e-8f7a-1b9c0d3e2f1a
                        iban: ES9121000418450200051332
                        currency: EUR
                        account_type: CURRENT
                        account_sub_type: PERSONAL
                        description: Cuenta corriente personal
                        balance:
                          amount: 1250.75
                          currency: EUR
                        last_refreshed: 2023-10-15T14:30:00Z
                    links:
                      self: https://api.banco.com/open-banking/v1/accounts
                    meta:
                      total_pages: 1
        '400':
          $ref: '#/components/responses/BadRequest'
        '401':
          $ref: '#/components/responses/Unauthorized'
        '403':
          $ref: '#/components/responses/ForbiddenConsentRevoked'
        '404':
          $ref: '#/components/responses/NotFound'
        '409':
          $ref: '#/components/responses/ConflictIdempotency'
        '429':
          $ref: '#/components/responses/TooManyRequests'
        '500':
          $ref: '#/components/responses/InternalServerError'
        '503':
          $ref: '#/components/responses/ServiceUnavailable'
        '504':
          $ref: '#/components/responses/GatewayTimeoutBureau'

  /accounts/{accountId}:
    get:
      tags:
        - Cuentas
      summary: Consulta de detalle de una cuenta específica
      description: |
        Retorna el detalle de una cuenta bancaria específica identificada por su `accountId`.
        Requiere token de acceso con scope `accounts` y consentimiento válido para la cuenta solicitada.
      operationId: getAccountById
      security:
        - FAPIAuth:
            - accounts
      parameters:
        - $ref: '#/components/parameters/x-fapi-interaction-id'
        - $ref: '#/components/parameters/x-idempotency-key'
        - $ref: '#/components/parameters/x-fapi-auth-date'
        - $ref: '#/components/parameters/x-fapi-customer-ip-address'
        - name: accountId
          in: path
          description: Identificador único de la cuenta
          required: true
          schema:
            type: string
            format: uuid
            example: a9d7e3f1-5b8c-4d2e-8f7a-1b9c0d3e2f1a
      responses:
        '200':
          description: Detalle de la cuenta solicitada
          headers:
            x-fapi-interaction-id:
              $ref: '#/components/headers/x-fapi-interaction-id'
          content:
            application/json:
              schema:
                type: object
                properties:
                  data:
                    $ref: '#/components/schemas/AccountDetail'
                  links:
                    $ref: '#/components/schemas/Links'
              examples:
                success:
                  value:
                    data:
                      account_id: a9d7e3f1-5b8c-4d2e-8f7a-1b9c0d3e2f1a
                      iban: ES9121000418450200051332
                      currency: EUR
                      account_type: CURRENT
                      account_sub_type: PERSONAL
                      description: Cuenta corriente personal
                      balance:
                        amount: 1250.75
                        currency: EUR
                      overdraft:
                        limit: 500.00
                        used: 0.00
                        available: 500.00
                      last_refreshed: 2023-10-15T14:30:00Z
                      transactions:
                        - transaction_id: txn-12345
                          amount: -50.00
                          currency: EUR
                          description: Compra en Amazon
                          status: BOOKED
                          booking_date: 2023-10-14
                    links:
                      self: https://api.banco.com/open-banking/v1/accounts/a9d7e3f1-5b8c-4d2e-8f7a-1b9c0d3e2f1a
        '400':
          $ref: '#/components/responses/BadRequest'
        '401':
          $ref: '#/components/responses/Unauthorized'
        '403':
          $ref: '#/components/responses/ForbiddenConsentRevoked'
        '404':
          $ref: '#/components/responses/NotFoundAccount'
        '429':
          $ref: '#/components/responses/TooManyRequests'
        '500':
          $ref: '#/components/responses/InternalServerError'

  /operations:
    post:
      tags:
        - Operaciones
      summary: Registra una operación con idempotencia
      description: |
        Registra una operación bancaria garantizando idempotencia mediante la clave `x-idempotency-key`.
        Si la operación ya fue registrada con la misma clave en las últimas 24 horas, retorna la respuesta original.
        Requiere token de acceso con scope `operations`.
      operationId: registerOperation
      security:
        - FAPIAuth:
            - operations
      parameters:
        - $ref: '#/components/parameters/x-fapi-interaction-id'
        - $ref: '#/components/parameters/x-idempotency-key'
        - $ref: '#/components/parameters/x-fapi-auth-date'
        - $ref: '#/components/parameters/x-fapi-customer-ip-address'
      requestBody:
        description: Datos de la operación a registrar
        required: true
        content:
          application/json:
            schema:
              $ref: '#/components/schemas/OperationRequest'
            examples:
              sample:
                value:
                  operation_id: op-67890
                  type: PAYMENT
                  amount: 150.00
                  currency: EUR
                  account_id: a9d7e3f1-5b8c-4d2e-8f7a-1b9c0d3e2f1a
                  beneficiary:
                    name: Juan Pérez
                    iban: ES7921000418450200051333
                  reference: Pago factura 2023-10
      responses:
        '201':
          description: Operación registrada exitosamente
          headers:
            x-fapi-interaction-id:
              $ref: '#/components/headers/x-fapi-interaction-id'
          content:
            application/json:
              schema:
                type: object
                properties:
                  data:
                    $ref: '#/components/schemas/OperationResponse'
              examples:
                success:
                  value:
                    data:
                      operation_id: op-67890
                      status: PENDING
                      created_at: 2023-10-15T15:00:00Z
        '200':
          description: Operación ya registrada previamente (respuesta idempotente)
          headers:
            x-fapi-interaction-id:
              $ref: '#/components/headers/x-fapi-interaction-id'
          content:
            application/json:
              schema:
                type: object
                properties:
                  data:
                    $ref: '#/components/schemas/OperationResponse'
              examples:
                idempotent:
                  value:
                    data:
                      operation_id: op-67890
                      status: COMPLETED
                      created_at: 2023-10-14T10:30:00Z
        '400':
          $ref: '#/components/responses/BadRequest'
        '401':
          $ref: '#/components/responses/Unauthorized'
        '403':
          $ref: '#/components/responses/Forbidden'
        '409':
          $ref: '#/components/responses/ConflictIdempotency'
        '429':
          $ref: '#/components/responses/TooManyRequests'
        '500':
          $ref: '#/components/responses/InternalServerError'

components:
  securitySchemes:
    FAPIAuth:
      type: oauth2
      description: |
        Autenticación conforme a FAPI 1.0 Advanced Profile usando OAuth 2.0.
        Los scopes requeridos son:
        - `accounts`: Acceso a información de cuentas
        - `operations`: Registro de operaciones
      flows:
        authorizationCode:
          authorizationUrl: https://auth.banco.com/oauth2/authorize
          tokenUrl: https://auth.banco.com/oauth2/token
          refreshUrl: https://auth.banco.com/oauth2/token
          scopes:
            accounts: Acceso a información de cuentas bancarias
            operations: Registro de operaciones bancarias
            consent: Gestión de consentimientos

  parameters:
    x-fapi-interaction-id:
      name: x-fapi-interaction-id
      in: header
      description: Identificador único de la interacción para trazabilidad
      required: true
      schema:
        type: string
        format: uuid
        example: 73c2d838-3f91-4439-86f2-163d78869dc6
    x-idempotency-key:
      name: x-idempotency-key
      in: header
      description: |
        Clave de idempotencia para garantizar que la operación se registre una sola vez.
        Debe ser única por operación y canal dentro de un período de 24 horas.
      required: true
      schema:
        type: string
        format: uuid
        example: 1b9c0d3e-2f1a-4d2e-8f7a-5b8c9d7e3f1a
    x-fapi-auth-date:
      name: x-fapi-auth-date
      in: header
      description: Fecha y hora en que se autenticó el usuario (formato RFC7231)
      required: true
      schema:
        type: string
        format: date-time
        example: 'Sun, 15 Oct 2023 14:30:00 GMT'
    x-fapi-customer-ip-address:
      name: x-fapi-customer-ip-address
      in: header
      description: Dirección IP del cliente que origina la solicitud
      required: false
      schema:
        type: string
        format: ipv4
        example: 192.168.1.1

  headers:
    x-fapi-interaction-id:
      description: Identificador único de la interacción devuelto en la respuesta
      schema:
        type: string
        format: uuid
        example: 73c2d838-3f91-4439-86f2-163d78869dc6

  schemas:
    Account:
      type: object
      required:
        - account_id
        - iban
        - currency
        - account_type
        - balance
        - last_refreshed
      properties:
        account_id:
          type: string
          format: uuid
          description: Identificador único de la cuenta
          example: a9d7e3f1-5b8c-4d2e-8f7a-1b9c0d3e2f1a
        iban:
          type: string
          pattern: '^[A-Z]{2,2}[0-9]{2,2}[a-zA-Z0-9]{1,30}$'
          description: Número Internacional de Cuenta Bancaria (IBAN)
          example: ES9121000418450200051332
        currency:
          type: string
          pattern: '^[A-Z]{3,3}$'
          description: Código de moneda ISO 4217
          example: EUR
        account_type:
          type: string
          enum:
            - CURRENT
            - SAVINGS
            - LOAN
            - CREDIT_CARD
            - INVESTMENT
          description: Tipo de cuenta
        account_sub_type:
          type: string
          enum:
            - PERSONAL
            - BUSINESS
            - JOINT
          description: Subtipo de cuenta
        description:
          type: string
          description: Descripción de la cuenta proporcionada por el cliente
          example: Cuenta corriente personal
        balance:
          $ref: '#/components/schemas/Amount'
        last_refreshed:
          type: string
          format: date-time
          description: Fecha y hora de la última actualización de la información
          example: 2023-10-15T14:30:00Z

    AccountDetail:
      allOf:
        - $ref: '#/components/schemas/Account'
        - type: object
          required:
            - overdraft
            - transactions
          properties:
            overdraft:
              type: object
              required:
                - limit
                - used
                - available
              properties:
                limit:
                  type: number
                  format: double
                  description: Límite de sobregiro permitido
                  example: 500.00
                used:
                  type: number
                  format: double
                  description: Monto de sobregiro utilizado
                  example: 0.00
                available:
                  type: number
                  format: double
                  description: Monto de sobregiro disponible
                  example: 500.00
            transactions:
              type: array
              items:
                $ref: '#/components/schemas/Transaction'
              description: Transacciones recientes asociadas a la cuenta

    Transaction:
      type: object
      required:
        - transaction_id
        - amount
        - currency
        - description
        - status
        - booking_date
      properties:
        transaction_id:
          type: string
          description: Identificador único de la transacción
          example: txn-12345
        amount:
          type: number
          format: double
          description: Monto de la transacción
          example: -50.00
        currency:
          type: string
          pattern: '^[A-Z]{3,3}$'
          description: Código de moneda ISO 4217
          example: EUR
        description:
          type: string
          description: Descripción de la transacción
          example: Compra en Amazon
        status:
          type: string
          enum:
            - BOOKED
            - PENDING
            - CANCELLED
          description: Estado de la transacción
        booking_date:
          type: string
          format: date
          description: Fecha de contabilización de la transacción
          example: 2023-10-14

    OperationRequest:
      type: object
      required:
        - operation_id
        - type
        - amount
        - currency
        - account_id
        - beneficiary
        - reference
      properties:
        operation_id:
          type: string
          description: Identificador único de la operación
          example: op-67890
        type:
          type: string
          enum:
            - PAYMENT
            - TRANSFER
            - DEPOSIT
          description: Tipo de operación
        amount:
          type: number
          format: double
          description: Monto de la operación
          example: 150.00
        currency:
          type: string
          pattern: '^[A-Z]{3,3}$'
          description: Código de moneda ISO 4217
          example: EUR
        account_id:
          type: string
          format: uuid
          description: Identificador de la cuenta origen
          example: a9d7e3f1-5b8c-4d2e-8f7a-1b9c0d3e2f1a
        beneficiary:
          type: object
          required:
            - name
            - iban
          properties:
            name:
              type: string
              description: Nombre del beneficiario
              example: Juan Pérez
            iban:
              type: string
              pattern: '^[A-Z]{2,2}[0-9]{2,2}[a-zA-Z0-9]{1,30}$'
              description: IBAN del beneficiario
              example: ES7921000418450200051333
        reference:
          type: string
          description: Referencia de la operación
          example: Pago factura 2023-10

    OperationResponse:
      type: object
      required:
        - operation_id
        - status
        - created_at
      properties:
        operation_id:
          type: string
          description: Identificador único de la operación
          example: op-67890
        status:
          type: string
          enum:
            - PENDING
            - COMPLETED
            - FAILED
            - REJECTED
          description: Estado de la operación
        created_at:
          type: string
          format: date-time
          description: Fecha y hora de creación de la operación
          example: 2023-10-15T15:00:00Z

    Amount:
      type: object
      required:
        - amount
        - currency
      properties:
        amount:
          type: number
          format: double
          description: Monto numérico
          example: 1250.75
        currency:
          type: string
          pattern: '^[A-Z]{3,3}$'
          description: Código de moneda ISO 4217
          example: EUR

    Links:
      type: object
      required:
        - self
      properties:
        self:
          type: string
          format: uri
          description: Enlace a la propia solicitud
          example: https://api.banco.com/open-banking/v1/accounts
        first:
          type: string
          format: uri
          description: Enlace a la primera página de resultados
        prev:
          type: string
          format: uri
          description: Enlace a la página anterior
        next:
          type: string
          format: uri
          description: Enlace a la página siguiente
        last:
          type: string
          format: uri
          description: Enlace a la última página de resultados

    Meta:
      type: object
      properties:
        total_pages:
          type: integer
          description: Número total de páginas disponibles
          example: 1
        total_records:
          type: integer
          description: Número total de registros disponibles
          example: 5

    Error:
      type: object
      required:
        - code
        - message
        - details
      properties:
        code:
          type: string
          description: Código de error específico del dominio
          example: ACCOUNT_NOT_FOUND
        message:
          type: string
          description: Mensaje descriptivo del error
          example: La cuenta solicitada no existe
        details:
          type: array
          items:
            type: object
            properties:
              field:
                type: string
                description: Campo asociado al error (si aplica)
              issue:
                type: string
                description: Descripción del problema específico
          example:
            - field: accountId
              issue: Debe ser un UUID válido

  responses:
    BadRequest:
      description: Solicitud mal formada o parámetros inválidos
      headers:
        x-fapi-interaction-id:
          $ref: '#/components/headers/x-fapi-interaction-id'
      content:
        application/json:
          schema:
            $ref: '#/components/schemas/Error'
          examples:
            invalid_param:
              value:
                code: INVALID_REQUEST
                message: Parámetros de la solicitud inválidos
                details:
                  - field: account-type
                    issue: Debe ser uno de CURRENT, SAVINGS, LOAN, CREDIT_CARD, INVESTMENT

    Unauthorized:
      description: No autorizado - token inválido o expirado
      headers:
        x-fapi-interaction-id:
          $ref: '#/components/headers/x-fapi-interaction-id'
      content:
        application/json:
          schema:
            $ref: '#/components/schemas/Error'
          examples:
            invalid_token:
              value:
                code: UNAUTHORIZED
                message: Token de acceso inválido o expirado
                details: []

    Forbidden:
      description: Prohibido - falta scope o permiso necesario
      headers:
        x-fapi-interaction-id:
          $ref: '#/components/headers/x-fapi-interaction-id'
      content:
        application/json:
          schema:
            $ref: '#/components/schemas/Error'
          examples:
            missing_scope:
              value:
                code: INSUFFICIENT_SCOPE
                message: Falta scope requerido para acceder al recurso
                details:
                  - field: scope
                    issue: Requiere scope 'accounts'

    ForbiddenConsentRevoked:
      description: Prohibido - consentimiento revocado o inválido
      headers:
        x-fapi-interaction-id:
          $ref: '#/components/headers/x-fapi-interaction-id'
      content:
        application/json:
          schema:
            $ref: '#/components/schemas/Error'
          examples:
            consent_revoked:
              value:
                code: CONSENT_REVOKED
                message: El consentimiento para acceder a la cuenta ha sido revocado
                details: []

    NotFound:
      description: Recurso no encontrado
      headers:
        x-fapi-interaction-id:
          $ref: '#/components/headers/x-fapi-interaction-id'
      content:
        application/json:
          schema:
            $ref: '#/components/schemas/Error'
          examples:
            not_found:
              value:
                code: RESOURCE_NOT_FOUND
                message: El recurso solicitado no existe
                details: []

    NotFoundAccount:
      description: Cuenta no encontrada
      headers:
        x-fapi-interaction-id:
          $ref: '#/components/headers/x-fapi-interaction-id'
      content:
        application/json:
          schema:
            $ref: '#/components/schemas/Error'
          examples:
            account_not_found:
              value:
                code: ACCOUNT_NOT_FOUND
                message: La cuenta solicitada no existe
                details:
                  - field: accountId
                    issue: No existe cuenta con el ID proporcionado

    ConflictIdempotency:
      description: Conflicto - operación ya registrada con la misma clave de idempotencia
      headers:
        x-fapi-interaction-id:
          $ref: '#/components/headers/x-fapi-interaction-id'
      content:
        application/json:
          schema:
            $ref: '#/components/schemas/Error'
          examples:
            idempotency_conflict:
              value:
                code: IDEMPOTENCY_CONFLICT
                message: Operación ya registrada con la misma clave de idempotencia
                details:
                  - field: x-idempotency-key
                    issue: La clave ya fue utilizada en las últimas 24 horas

    TooManyRequests:
      description: Demasiadas solicitudes - límite de tasa excedido
      headers:
        x-fapi-interaction-id:
          $ref: '#/components/headers/x-fapi-interaction-id'
        Retry-After:
          description: Tiempo en segundos para reintentar la solicitud
          schema:
            type: integer
            example: 30
      content:
        application/json:
          schema:
            $ref: '#/components/schemas/Error'
          examples:
            rate_limit_exceeded:
              value:
                code: RATE_LIMIT_EXCEEDED
                message: Límite de tasa excedido
                details: []

    InternalServerError:
      description: Error interno del servidor
      headers:
        x-fapi-interaction-id:
          $ref: '#/components/headers/x-fapi-interaction-id'
      content:
        application/json:
          schema:
            $ref: '#/components/schemas/Error'
          examples:
            internal_error:
              value:
                code: INTERNAL_SERVER_ERROR
                message: Error interno del servidor
                details: []

    ServiceUnavailable:
      description: Servicio no disponible temporalmente
      headers:
        x-fapi-interaction-id:
          $ref: '#/components/headers/x-fapi-interaction-id'
        Retry-After:
          description: Tiempo en segundos para reintentar la solicitud
          schema:
            type: integer
            example: 60
      content:
        application/json:
          schema:
            $ref: '#/components/schemas/Error'
          examples:
            service_unavailable:
              value:
                code: SERVICE_UNAVAILABLE
                message: Servicio no disponible temporalmente
                details: []

    GatewayTimeoutBureau:
      description: Timeout en la respuesta del buró de riesgos (>2s)
      headers:
        x-fapi-interaction-id:
          $ref: '#/components/headers/x-fapi-interaction-id'
      content:
        application/json:
          schema:
            $ref: '#/components/schemas/Error'
          examples:
            bureau_timeout:
              value:
                code: BUREAU_TIMEOUT
                message: Timeout en la respuesta del buró de riesgos
                details:
                  - field: timeout
                    issue: Tiempo de espera excedido (>2s)

// === ARCHIVO: openapi.yaml ===
openapi: 3.1.0
info:
  title: Contrato de Consulta de Cuentas - Open Banking
  description: |
    API para la consulta de cuentas en Open Banking conforme a los estándares FAPI/PSD2.
    Maneja idempotencia, timeouts y consentimientos para operaciones de consulta de saldos
    y movimientos de cuentas.
  version: 1.0.0
  contact:
    name: Equipo de Integración Financiera
    email: integracion@banco.com
  license:
    name: Apache 2.0
    url: https://www.apache.org/licenses/LICENSE-2.0.html
servers:
  - url: https://api.banco.com/open-banking/v1
    description: Servidor de producción
  - url: https://sandbox.api.banco.com/open-banking/v1
    description: Servidor de sandbox para pruebas
paths:
  /accounts:
    get:
      tags:
        - Accounts
      summary: Consulta de cuentas disponibles
      description: |
        Retorna la lista de cuentas asociadas al consentimiento otorgado por el titular.
        Requiere scope `accounts` y consentimiento activo.
      operationId: getAccounts
      security:
        - fapiAuth:
            - accounts
      parameters:
        - $ref: '#/components/parameters/xIdempotencyKey'
        - $ref: '#/components/parameters/xRequestId'
        - $ref: '#/components/parameters/ConsentId'
      responses:
        '200':
          description: Lista de cuentas recuperada exitosamente
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/AccountsResponse'
              examples:
                success:
                  value:
                    accounts:
                      - account_id: "a3d4e5f6-7890-1234-5678-9abcdef01234"
                        iban: "ES9121000418450200051332"
                        currency: "EUR"
                        account_type: "CURRENT"
                        status: "ENABLED"
                        balances:
                          - balance_type: "CLOSING_AVAILABLE"
                            amount:
                              value: 1250.30
                              currency: "EUR"
                      - account_id: "b4c5d6e7-8901-2345-6789-0abcdef12345"
                        iban: "ES7921000418450200051340"
                        currency: "EUR"
                        account_type: "SAVINGS"
                        status: "ENABLED"
                        balances:
                          - balance_type: "CLOSING_AVAILABLE"
                            amount:
                              value: 5420.75
                              currency: "EUR"
        '400':
          $ref: '#/components/responses/BadRequest'
        '401':
          $ref: '#/components/responses/Unauthorized'
        '403':
          $ref: '#/components/responses/Forbidden'
        '404':
          $ref: '#/components/responses/NotFound'
        '409':
          $ref: '#/components/responses/Conflict'
        '429':
          $ref: '#/components/responses/TooManyRequests'
        '500':
          $ref: '#/components/responses/InternalServerError'
        '504':
          $ref: '#/components/responses/GatewayTimeout'
  /accounts/{accountId}/balances:
    get:
      tags:
        - Balances
      summary: Consulta de saldos de una cuenta
      description: |
        Retorna los saldos disponibles para una cuenta específica.
        Requiere scope `balances` y consentimiento activo para la cuenta solicitada.
      operationId: getAccountBalances
      security:
        - fapiAuth:
            - balances
      parameters:
        - $ref: '#/components/parameters/xIdempotencyKey'
        - $ref: '#/components/parameters/xRequestId'
        - $ref: '#/components/parameters/ConsentId'
        - $ref: '#/components/parameters/AccountId'
      responses:
        '200':
          description: Saldos recuperados exitosamente
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/BalancesResponse'
              examples:
                success:
                  value:
                    account_id: "a3d4e5f6-7890-1234-5678-9abcdef01234"
                    balances:
                      - balance_type: "CLOSING_AVAILABLE"
                        amount:
                          value: 1250.30
                          currency: "EUR"
                      - balance_type: "CLOSING_BOOKED"
                        amount:
                          value: 1200.00
                          currency: "EUR"
        '400':
          $ref: '#/components/responses/BadRequest'
        '401':
          $ref: '#/components/responses/Unauthorized'
        '403':
          $ref: '#/components/responses/Forbidden'
        '404':
          $ref: '#/components/responses/NotFound'
        '429':
          $ref: '#/components/responses/TooManyRequests'
        '500':
          $ref: '#/components/responses/InternalServerError'
  /accounts/{accountId}/transactions:
    get:
      tags:
        - Transactions
      summary: Consulta de movimientos de una cuenta
      description: |
        Retorna los movimientos de una cuenta específica en un rango de fechas.
        Requiere scope `transactions` y consentimiento activo para la cuenta solicitada.
      operationId: getAccountTransactions
      security:
        - fapiAuth:
            - transactions
      parameters:
        - $ref: '#/components/parameters/xIdempotencyKey'
        - $ref: '#/components/parameters/xRequestId'
        - $ref: '#/components/parameters/ConsentId'
        - $ref: '#/components/parameters/AccountId'
        - $ref: '#/components/parameters/DateFrom'
        - $ref: '#/components/parameters/DateTo'
        - $ref: '#/components/parameters/Limit'
      responses:
        '200':
          description: Movimientos recuperados exitosamente
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/TransactionsResponse'
              examples:
                success:
                  value:
                    account_id: "a3d4e5f6-7890-1234-5678-9abcdef01234"
                    transactions:
                      - transaction_id: "txn_550e8400-e29b-41d4-a716-446655440000"
                        amount:
                          value: -50.00
                          currency: "EUR"
                        status: "BOOKED"
                        booking_date: "2023-10-15"
                        value_date: "2023-10-14"
                        remittance_information: "Compra en SUPERMERCADO ABC"
                      - transaction_id: "txn_550e8400-e29b-41d4-a716-446655440001"
                        amount:
                          value: 1200.00
                          currency: "EUR"
                        status: "BOOKED"
                        booking_date: "2023-10-10"
                        value_date: "2023-10-10"
                        remittance_information: "Nómina OCT2023"
        '400':
          $ref: '#/components/responses/BadRequest'
        '401':
          $ref: '#/components/responses/Unauthorized'
        '403':
          $ref: '#/components/responses/Forbidden'
        '404':
          $ref: '#/components/responses/NotFound'
        '429':
          $ref: '#/components/responses/TooManyRequests'
        '500':
          $ref: '#/components/responses/InternalServerError'

components:
  securitySchemes:
    fapiAuth:
      type: oauth2
      description: |
        Autenticación FAPI con flujo de código de autorización y PKCE.
        Scopes requeridos:
        - `accounts`: Acceso a información de cuentas
        - `balances`: Acceso a saldos
        - `transactions`: Acceso a movimientos
      flows:
        authorizationCode:
          authorizationUrl: https://auth.banco.com/oauth2/authorize
          tokenUrl: https://auth.banco.com/oauth2/token
          scopes:
            accounts: Acceso a cuentas
            balances: Acceso a saldos
            transactions: Acceso a movimientos
          refreshUrl: https://auth.banco.com/oauth2/token

  parameters:
    xIdempotencyKey:
      name: x-idempotency-key
      in: header
      description: |
        Clave de idempotencia para garantizar que operaciones con la misma clave
        dentro de 24 horas produzcan el mismo resultado.
        Formato: UUIDv4.
      required: true
      schema:
        type: string
        format: uuid
        example: "550e8400-e29b-41d4-a716-446655440000"
    xRequestId:
      name: x-request-id
      in: header
      description: Identificador único de la solicitud para trazabilidad.
      required: true
      schema:
        type: string
        format: uuid
        example: "550e8400-e29b-41d4-a716-446655440001"
    ConsentId:
      name: Consent-Id
      in: header
      description: Identificador del consentimiento otorgado por el titular.
      required: true
      schema:
        type: string
        format: uuid
        example: "a1b2c3d4-e5f6-7890-1234-567890abcdef"
    AccountId:
      name: accountId
      in: path
      description: Identificador único de la cuenta.
      required: true
      schema:
        type: string
        format: uuid
        example: "a3d4e5f6-7890-1234-5678-9abcdef01234"
    DateFrom:
      name: dateFrom
      in: query
      description: Fecha inicial para la consulta de movimientos (formato ISO 8601).
      required: true
      schema:
        type: string
        format: date
        example: "2023-10-01"
    DateTo:
      name: dateTo
      in: query
      description: Fecha final para la consulta de movimientos (formato ISO 8601).
      required: true
      schema:
        type: string
        format: date
        example: "2023-10-31"
    Limit:
      name: limit
      in: query
      description: Número máximo de movimientos a retornar.
      schema:
        type: integer
        minimum: 1
        maximum: 1000
        default: 100
        example: 50

  schemas:
    Amount:
      type: object
      required:
        - value
        - currency
      properties:
        value:
          type: number
          format: decimal
          example: 1250.30
        currency:
          type: string
          pattern: "^[A-Z]{3}$"
          example: "EUR"
    Account:
      type: object
      required:
        - account_id
        - iban
        - currency
        - account_type
        - status
      properties:
        account_id:
          type: string
          format: uuid
          example: "a3d4e5f6-7890-1234-5678-9abcdef01234"
        iban:
          type: string
          pattern: "^[A-Z]{2}[0-9]{2}[A-Z0-9]{11,30}$"
          example: "ES9121000418450200051332"
        currency:
          type: string
          pattern: "^[A-Z]{3}$"
          example: "EUR"
        account_type:
          type: string
          enum: [CURRENT, SAVINGS, LOAN, CREDIT_CARD]
          example: "CURRENT"
        status:
          type: string
          enum: [ENABLED, DISABLED, DELETED]
          example: "ENABLED"
        balances:
          type: array
          items:
            $ref: '#/components/schemas/Balance'
    Balance:
      type: object
      required:
        - balance_type
        - amount
      properties:
        balance_type:
          type: string
          enum: [CLOSING_AVAILABLE, CLOSING_BOOKED, EXPECTED, INTERIM_AVAILABLE]
          example: "CLOSING_AVAILABLE"
        amount:
          $ref: '#/components/schemas/Amount'
    Transaction:
      type: object
      required:
        - transaction_id
        - amount
        - status
        - booking_date
        - value_date
      properties:
        transaction_id:
          type: string
          example: "txn_550e8400-e29b-41d4-a716-446655440000"
        amount:
          $ref: '#/components/schemas/Amount'
        status:
          type: string
          enum: [BOOKED, PENDING, CANCELLED, REJECTED]
          example: "BOOKED"
        booking_date:
          type: string
          format: date
          example: "2023-10-15"
        value_date:
          type: string
          format: date
          example: "2023-10-14"
        remittance_information:
          type: string
          example: "Compra en SUPERMERCADO ABC"
    AccountsResponse:
      type: object
      required:
        - accounts
      properties:
        accounts:
          type: array
          items:
            $ref: '#/components/schemas/Account'
    BalancesResponse:
      type: object
      required:
        - account_id
        - balances
      properties:
        account_id:
          type: string
          format: uuid
          example: "a3d4e5f6-7890-1234-5678-9abcdef01234"
        balances:
          type: array
          items:
            $ref: '#/components/schemas/Balance'
    TransactionsResponse:
      type: object
      required:
        - account_id
        - transactions
      properties:
        account_id:
          type: string
          format: uuid
          example: "a3d4e5f6-7890-1234-5678-9abcdef01234"
        transactions:
          type: array
          items:
            $ref: '#/components/schemas/Transaction'
    ErrorResponse:
      type: object
      required:
        - error
        - error_description
        - timestamp
      properties:
        error:
          type: string
          example: "invalid_request"
        error_description:
          type: string
          example: "El parámetro 'dateFrom' es obligatorio"
        timestamp:
          type: string
          format: date-time
          example: "2023-10-15T14:30:00Z"
        error_uri:
          type: string
          format: uri
          example: "https://docs.banco.com/errors/invalid_request"

  responses:
    BadRequest:
      description: Solicitud mal formada
      content:
        application/json:
          schema:
            $ref: '#/components/schemas/ErrorResponse'
          examples:
            invalid_parameter:
              value:
                error: "invalid_request"
                error_description: "El parámetro 'dateFrom' es obligatorio"
                timestamp: "2023-10-15T14:30:00Z"
    Unauthorized:
      description: No autorizado
      content:
        application/json:
          schema:
            $ref: '#/components/schemas/ErrorResponse'
          examples:
            invalid_token:
              value:
                error: "invalid_token"
                error_description: "El token de acceso es inválido o ha expirado"
                timestamp: "2023-10-15T14:30:00Z"
    Forbidden:
      description: Prohibido - consentimiento revocado o insuficiente
      content:
        application/json:
          schema:
            $ref: '#/components/schemas/ErrorResponse'
          examples:
            consent_revoked:
              value:
                error: "consent_revoked"
                error_description: "El consentimiento ha sido revocado por el titular"
                timestamp: "2023-10-15T14:30:00Z"
    NotFound:
      description: Recurso no encontrado
      content:
        application/json:
          schema:
            $ref: '#/components/schemas/ErrorResponse'
          examples:
            account_not_found:
              value:
                error: "not_found"
                error_description: "La cuenta solicitada no existe o no está accesible"
                timestamp: "2023-10-15T14:30:00Z"
    Conflict:
      description: Conflicto por idempotencia
      content:
        application/json:
          schema:
            $ref: '#/components/schemas/ErrorResponse'
          examples:
            idempotency_conflict:
              value:
                error: "conflict"
                error_description: "Ya existe una operación con la misma clave de idempotencia"
                timestamp: "2023-10-15T14:30:00Z"
    TooManyRequests:
      description: Demasiadas solicitudes (throttling)
      content:
        application/json:
          schema:
            $ref: '#/components/schemas/ErrorResponse'
          examples:
            rate_limit_exceeded:
              value:
                error: "too_many_requests"
                error_description: "Límite de solicitudes excedido. Intente nuevamente en 60 segundos."
                timestamp: "2023-10-15T14:30:00Z"
    InternalServerError:
      description: Error interno del servidor
      content:
        application/json:
          schema:
            $ref: '#/components/schemas/ErrorResponse'
          examples:
            server_error:
              value:
                error: "server_error"
                error_description: "Error interno del servidor. Intente nuevamente más tarde."
                timestamp: "2023-10-15T14:30:00Z"
    GatewayTimeout:
      description: Timeout del buró de riesgos
      content:
        application/json:
          schema:
            $ref: '#/components/schemas/ErrorResponse'
          examples:
            gateway_timeout:
              value:
                error: "gateway_timeout"
                error_description: "El buró de riesgos no respondió en el tiempo esperado"
                timestamp: "2023-10-15T14:30:00Z"

// === ARCHIVO: flujo-de-consentimiento.md ===
# Flujo de Consentimiento - Open Banking (FAPI/PSD2)

## Descripción General
Este documento describe el flujo de consentimiento para la consulta de cuentas en Open Banking, alineado con los estándares FAPI (Financial-grade API) y PSD2 (Payment Services Directive 2). El flujo garantiza que el titular de la cuenta otorgue su consentimiento explícito antes de que el originador pueda acceder a sus datos.

## Actores
| Actor               | Descripción                                                                                     |
|---------------------|-------------------------------------------------------------------------------------------------|
| **Originador**      | Entidad que solicita el acceso a los datos de la cuenta (ej. AISP - Account Information Service Provider). |
| **PSP**             | Proveedor de Servicios de Pago (ej. banco del titular de la cuenta).                           |
| **Titular**         | Persona física o jurídica dueña de la cuenta bancaria.                                         |
| **Buró de Riesgos** | Sistema externo que valida la identidad y riesgo asociado a la solicitud de consentimiento.    |

## Diagrama de Flujo (BPMN)
```mermaid
sequenceDiagram
    participant Originador
    participant PSP
    participant Titular
    participant Buró de Riesgos

    Originador->>PSP: 1. Solicitud de autorización (consentimiento)
    PSP->>Buró de Riesgos: 2. Validación de identidad y riesgo
    Buró de Riesgos-->>PSP: 3. Respuesta de validación
    alt Validación exitosa
        PSP->>Titular: 4. Redirección a página de consentimiento
        Titular->>PSP: 5. Otorgamiento de consentimiento
        PSP->>PSP: 6. Generación de Consent-Id
        PSP->>Originador: 7. Redirección con authorization_code
        Originador->>PSP: 8. Intercambio de authorization_code por access_token (con PKCE)
        PSP->>Originador: 9. access_token + refresh_token
    else Validación fallida
        PSP->>Originador: 4. Error de validación (ej. riesgo alto)
    end
```

## Puntos de Decisión

### 1. Validación de Identidad y Riesgo (Buró de Riesgos)
- **Regla**: El PSP debe validar la identidad del titular y evaluar el riesgo de la solicitud mediante el buró de riesgos.
- **Criterios**:
  - **Identidad**: Verificación de datos biométricos o credenciales (ej. 2FA).
  - **Riesgo**: Puntuación de riesgo basada en historial de transacciones, ubicación geográfica y comportamiento.
- **Manejo de Fallos**:
  - Si la validación falla → PSP rechaza la solicitud (código `403 Forbidden`).
  - Si el buró no responde en **2 segundos** → PSP continúa con validación local (degradación controlada).

### 2. Otorgamiento de Consentimiento (Titular)
- **Regla**: El titular debe otorgar consentimiento explícito para cada scope solicitado (`accounts`, `balances`, `transactions`).
- **Detalles del Consentimiento**:
  - **Scopes**: Lista de permisos solicitados (ej. `accounts:read`, `balances:read`).
  - **Duración**: Máximo **90 días** (requisito PSD2).
  - **Revocabilidad**: El titular puede revocar el consentimiento en cualquier momento.
- **Manejo de Fallos**:
  - Si el titular rechaza el consentimiento → PSP redirige al originador con error `access_denied`.

### 3. Idempotencia de la Solicitud
- **Regla**: El originador debe incluir un `x-idempotency-key` (UUIDv4) en cada solicitud para evitar duplicados.
- **Alcance**: Las solicitudes con la misma clave dentro de **24 horas** deben producir la misma respuesta.
- **Manejo de Fallos**:
  - Si se detecta un conflicto de idempotencia → PSP retorna `409 Conflict` con el resultado original.

### 4. Throttling y Límites de Tasa
- **Regla**: Para manejar **1,500 solicitudes/segundo** en hora pico, el PSP aplica throttling.
- **Límites**:
  - **Por originador**: 100 solicitudes/segundo.
  - **Por consentimiento**: 10 solicitudes/segundo.
- **Manejo de Fallos**:
  - Si se excede el límite → PSP retorna `429 Too Many Requests` con header `Retry-After`.

## Reglas de Negocio

### 1. Consentimiento Activo
- **Regla**: Solo se permiten solicitudes con un `Consent-Id` válido y activo.
- **Validación**: El PSP verifica:
  - El `Consent-Id` existe en su base de datos.
  - El consentimiento no ha sido revocado.
  - El scope del token cubre el recurso solicitado.
- **Códigos de Error**:
  - `403 Forbidden`: Consentimiento revocado o insuficiente.
  - `404 Not Found`: Consentimiento no existe.

### 2. Formato de Datos
- **IBAN**: Debe cumplir con el estándar ISO 13616 (regex: `^[A-Z]{2}[0-9]{2}[A-Z0-9]{11,30}$`).
- **UUID**: Identificadores de cuentas y transacciones deben ser UUIDv4.
- **Fechas**: Formato ISO 8601 (ej. `2023-10-15`).

### 3. Manejo de Timeouts
- **Regla**: Si el buró de riesgos no responde en **2 segundos**, el PSP:
  - Continúa con validación local (degradación controlada).
  - Registra un evento de timeout para monitoreo.
  - **No** retorna error al originador (la operación continúa).

## Ejemplo de Flujo Exitoso
1. **Solicitud de Autorización**:
   ```http
   GET https://auth.banco.com/oauth2/authorize?response_type=code
   &client_id=originador_123
   &redirect_uri=https://originador.com/callback
   &scope=accounts%20balances%20transactions
   &state=xyz123
   &code_challenge=E9Melhoa2OwvFrEMTJguCHaoeK1t8URWbuGJSstw-cM
   &code_challenge_method=S256
   ```

2. **Redirección a Consentimiento**:
   ```http
   HTTP/1.1 302 Found
   Location: https://banco.com/consent?consent_id=a1b2c3d4-e5f6-7890-1234-567890abcdef
   ```

3. **Intercambio de Código por Token**:
   ```http
   POST https://auth.banco.com/oauth2/token
   Content-Type: application/x-www-form-urlencoded

   grant_type=authorization_code
   &code=authorization_code_123
   &redirect_uri=https://originador.com/callback
   &client_id=originador_123
   &code_verifier=dBjftJeZ4CVP-mB92K27uhbUJU1p1r_wW1gFWFOEjXk
   ```

4. **Respuesta Exitosa**:
   ```json
   {
     "access_token": "access_token_xyz",
     "token_type": "Bearer",
     "expires_in": 3600,
     "refresh_token": "refresh_token_xyz",
     "scope": "accounts balances transactions"
   }
   ```

## Manejo de Errores
| Código HTTP | Error               | Descripción                                                                                     |
|--------------|---------------------|-------------------------------------------------------------------------------------------------|
| 400          | invalid_request     | Parámetros faltantes o inválidos.                                                              |
| 401          | invalid_token       | Token de acceso inválido o expirado.                                                           |
| 403          | consent_revoked     | Consentimiento revocado o sin los scopes necesarios.                                           |
| 404          | not_found           | Recurso no encontrado (ej. cuenta no existe).                                                  |
| 409          | conflict            | Conflicto de idempotencia (solicitud duplicada).                                                |
| 429          | too_many_requests   | Límite de solicitudes excedido.                                                                |
| 500          | server_error        | Error interno del servidor.                                                                    |
| 504          | gateway_timeout     | Timeout del buró de riesgos (operación continúa en modo degradado).                            |

## Referencias
- [FAPI 1.0 - Financial-grade API](https://openid.net/wg/fapi/)
- [PSD2 - Payment Services Directive 2](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX%3A32015L2366)
- [Open Banking Implementation Entity (OBIE)](https://openbanking.org.uk/)
- [ISO 20022 - Financial Services](https://www.iso20022.org/)

// === ARCHIVO: mapeo-de-datos.csv ===
campo_origen,campo_destino,tipo,obligatorio,regla_transformacion,ejemplo
consent_id,consentId,string,SI,UUIDv4 a UUIDv4 (sin transformación),"a1b2c3d4-e5f6-7890-1234-567890abcdef"
account_id,id_cuenta,string,SI,UUIDv4 a UUIDv4 (formato PSP a estándar),"a3d4e5f6-7890-1234-5678-9abcdef01234"
account_number,iban,string,SI,Conversión de número de cuenta a IBAN según ISO 13616,"ES9121000418450200051332"
account_type,tipo_cuenta,string,SI,Mapeo de valores: CURRENT→CUENTA_CORRIENTE, SAVINGS→CUENTA_AHORRO,"CUENTA_CORRIENTE"
balance_type,tipo_saldo,string,SI,Mapeo de valores: CLOSING_AVAILABLE→SALDO_DISPONIBLE, CLOSING_BOOKED→SALDO_CONTABLE,"SALDO_DISPONIBLE"
amount,monto,decimal,SI,Valor numérico con 2 decimales (sin transformación),1250.30
currency,moneda,string,SI,Código ISO 4217 (3 letras),"EUR"
status,estado,string,SI,Mapeo de valores: ENABLED→ACTIVA, DISABLED→INACTIVA, DELETED→ELIMINADA,"ACTIVA"
transaction_id,id_transaccion,string,SI,UUIDv4 a UUIDv4 (sin transformación),"txn_550e8400-e29b-41d4-a716-446655440000"
transaction_amount,monto_transaccion,decimal,SI,Valor numérico con signo (negativo para débitos),-50.00
booking_date,fecha_contable,date,SI,Fecha en formato ISO 8601 (YYYY-MM-DD),"2023-10-15"
value_date,fecha_valor,date,SI,Fecha en formato ISO 8601 (YYYY-MM-DD),"2023-10-14"
remittance_info,descripcion,string,NO,Texto libre (máximo 140 caracteres),"Compra en SUPERMERCADO ABC"
originator_id,id_originador,string,SI,Identificador del originador (formato alfanumérico),"originador_123"
channel,canal,string,SI,Mapeo de valores: MOBILE→APP_MOVIL, WEB→PORTAL_WEB, API→INTERFAZ_API,"APP_MOVIL"
operation_number,numero_operacion,string,SI,Identificador único de operación (formato alfanumérico),"OP20231015143000"

## Reglas de Transformación Adicionales
1. **IBAN**:
   - El sistema origen puede enviar el número de cuenta en formato nacional (ej. `00418450200051332`).
   - El mapeo debe convertirlo a IBAN según el estándar ISO 13616 (ej. `ES9121000418450200051332`).

2. **Tipos de Cuenta**:
   - El sistema origen usa valores en inglés (`CURRENT`, `SAVINGS`).
   - El destino espera valores en español (`CUENTA_CORRIENTE`, `CUENTA_AHORRO`).

3. **Montos**:
   - Los montos deben mantener **2 decimales** y el signo (negativo para débitos).
   - Ejemplo: `50.0` (origen) → `-50.00` (destino) para una transacción de débito.

4. **Fechas**:
   - Las fechas deben convertirse a formato ISO 8601 (`YYYY-MM-DD`).
   - Ejemplo: `15/10/2023` (origen) → `2023-10-15` (destino).

5. **Descripciones**:
   - Las descripciones deben truncarse a **140 caracteres** si superan ese límite.
   - Ejemplo: `"Pago de servicio de telefonía móvil con número 600123456"` → `"Pago de servicio de telefonía móvil..."`.

## Validaciones de Obligatoriedad
| Campo               | Obligatorio | Validación                                                                                     |
|---------------------|-------------|------------------------------------------------------------------------------------------------|
| consent_id          | SI          | UUIDv4 válido.                                                                                 |
| account_id          | SI          | UUIDv4 válido.                                                                                 |
| iban                | SI          | Formato IBAN válido (ISO 13616).                                                              |
| account_type        | SI          | Valor en lista: `CUENTA_CORRIENTE`, `CUENTA_AHORRO`, `PRESTAMO`, `TARJETA_CREDITO`.             |
| balance_type        | SI          | Valor en lista: `SALDO_DISPONIBLE`, `SALDO_CONTABLE`, `SALDO_ESPERADO`.                       |
| amount              | SI          | Valor numérico con 2 decimales.                                                                |
| currency            | SI          | Código ISO 4217 (3 letras).                                                                    |
| status              | SI          | Valor en lista: `ACTIVA`, `INACTIVA`, `ELIMINADA`.                                             |
| transaction_id      | SI          | UUIDv4 válido.                                                                                 |
| transaction_amount  | SI          | Valor numérico con signo.                                                                      |
| booking_date        | SI          | Fecha en formato ISO 8601.                                                                     |
| value_date          | SI          | Fecha en formato ISO 8601.                                                                     |
| originator_id       | SI          | Alfanumérico (máximo 50 caracteres).                                                           |
| channel             | SI          | Valor en lista: `APP_MOVIL`, `PORTAL_WEB`, `INTERFAZ_API`.                                    |
| operation_number    | SI          | Alfanumérico (máximo 30 caracteres).                                                           |

// === ARCHIVO: criterios-de-aceptacion.feature ===
Feature: Consulta de cuentas en Open Banking
  Como originador de la solicitud
  Quiero consultar las cuentas de un cliente con su consentimiento
  Para cumplir con los requisitos de PSD2 y FAPI

  Background:
    Given el sistema de Open Banking está operativo
    And el proveedor de servicios de pago (PSP) está registrado
    And el buró de riesgos está disponible

  Scenario: Consulta exitosa de cuentas con consentimiento válido
    Given un cliente con IBAN "ES9121000418450200051332"
    And el cliente ha otorgado consentimiento con scope "accounts"
    And el consentimiento tiene ID "a4b5c6d7-89ef-0123-4567-89abcdef0123"
    And el consentimiento no ha expirado
    When el originador envía una solicitud GET a "/accounts" con:
      | header                | valor                                      |
      | Authorization         | Bearer eyJhbGciOiJQUzI1NiIsInR5cCI6IkpXVCJ9... |
      | x-idempotency-key     | op-20240515-123456-channel-web              |
      | x-fapi-interaction-id | 1a2b3c4d-5678-90ef-ghij-klmnopqrstuv         |
    Then la respuesta debe tener código de estado 200
    And la respuesta debe contener un array de cuentas con al menos una cuenta
    And cada cuenta debe tener:
      | campo          | tipo     | ejemplo                          |
      | account_id     | string   | "acc-78901234567890"            |
      | iban           | string   | "ES9121000418450200051332"      |
      | currency       | string   | "EUR"                           |
      | account_type   | string   | "CURRENT"                       |
      | available_balance | number | 1250.75                          |

  Scenario: Consulta con idempotencia - primera invocación
    Given un cliente con IBAN "ES9121000418450200051332"
    And el cliente ha otorgado consentimiento con scope "accounts"
    And el consentimiento tiene ID "b5c6d7e8-90fa-1234-5678-9abcdef01234"
    When el originador envía una solicitud GET a "/accounts" con:
      | header                | valor                                      |
      | Authorization         | Bearer eyJhbGciOiJQUzI1NiIsInR5cCI6IkpXVCJ9... |
      | x-idempotency-key     | op-20240515-654321-channel-mobile           |
    Then la respuesta debe tener código de estado 200
    And la respuesta debe contener el header "x-idempotency-key-created" con valor "true"

  Scenario: Consulta con idempotencia - invocación duplicada dentro de 24 horas
    Given una solicitud previa con x-idempotency-key "op-20240515-654321-channel-mobile" que tuvo respuesta 200
    When el originador envía una solicitud GET a "/accounts" con el mismo x-idempotency-key
    Then la respuesta debe tener código de estado 200
    And la respuesta debe ser idéntica a la respuesta previa
    And la respuesta debe contener el header "x-idempotency-key-created" con valor "false"

  Scenario: Consulta con consentimiento revocado
    Given un cliente con IBAN "ES9121000418450200051332"
    And el consentimiento del cliente ha sido revocado
    When el originador envía una solicitud GET a "/accounts"
    Then la respuesta debe tener código de estado 403
    And la respuesta debe contener:
      | campo       | valor                                      |
      | error       | "consent_revoked"                         |
      | error_description | "El consentimiento ha sido revocado"   |

  Scenario: Consulta con consentimiento expirado
    Given un cliente con IBAN "ES9121000418450200051332"
    And el consentimiento del cliente ha expirado
    When el originador envía una solicitud GET a "/accounts"
    Then la respuesta debe tener código de estado 403
    And la respuesta debe contener:
      | campo       | valor                                      |
      | error       | "consent_expired"                         |
      | error_description | "El consentimiento ha expirado"       |

  Scenario: Consulta sin header de idempotencia
    Given un cliente con IBAN "ES9121000418450200051332"
    And el cliente ha otorgado consentimiento válido
    When el originador envía una solicitud GET a "/accounts" sin x-idempotency-key
    Then la respuesta debe tener código de estado 400
    And la respuesta debe contener:
      | campo       | valor                                      |
      | error       | "invalid_request"                         |
      | error_description | "x-idempotency-key es obligatorio"    |

  Scenario: Consulta con timeout del buró de riesgos (2 segundos)
    Given el buró de riesgos está respondiendo con timeout de 2.1 segundos
    And un cliente con IBAN "ES9121000418450200051332"
    And el cliente ha otorgado consentimiento válido
    When el originador envía una solicitud GET a "/accounts"
    Then la respuesta debe tener código de estado 200
    And la respuesta debe contener un array de cuentas con al menos una cuenta
    And las cuentas deben incluir un campo "risk_assessment" con valor "degraded"

  Scenario: Consulta con throttling - límite de 1500 RPS
    Given el sistema ha recibido 1500 solicitudes en el último segundo
    And un cliente con IBAN "ES9121000418450200051332"
    And el cliente ha otorgado consentimiento válido
    When el originador envía una solicitud GET a "/accounts"
    Then la respuesta debe tener código de estado 429
    And la respuesta debe contener:
      | campo       | valor                                      |
      | error       | "too_many_requests"                       |
      | error_description | "Límite de tasa excedido"             |
      | retry_after | 1                                          |

  Scenario: Consulta con IBAN inválido
    Given un cliente con IBAN "ES0000000000000000000000"
    And el cliente ha otorgado consentimiento válido
    When el originador envía una solicitud GET a "/accounts"
    Then la respuesta debe tener código de estado 400
    And la respuesta debe contener:
      | campo       | valor                                      |
      | error       | "invalid_iban"                            |
      | error_description | "El IBAN proporcionado no es válido" |

  Scenario: Consulta con token sin scope adecuado
    Given un cliente con IBAN "ES9121000418450200051332"
    And el token de autorización no tiene scope "accounts"
    When el originador envía una solicitud GET a "/accounts"
    Then la respuesta debe tener código de estado 403
    And la respuesta debe contener:
      | campo       | valor                                      |
      | error       | "insufficient_scope"                      |
      | error_description | "El token no tiene el scope requerido"|

// === ARCHIVO: analisis-de-riesgo.md ===
# Análisis de Riesgo para el Contrato de Consulta de Cuentas

## 1. Introducción
Este documento identifica los modos de falla potenciales en la integración del contrato de consulta de cuentas, su impacto en el negocio y las estrategias de mitigación propuestas. El análisis cubre los componentes clave: originador de la solicitud, proveedor de servicios de pago (PSP), buró de riesgos y los flujos de consentimiento definidos en `flujo-de-consentimiento.md`.

## 2. Modos de Falla y Impacto

### 2.1. Timeout del Buró de Riesgos
- **Descripción**: El buró de riesgos no responde dentro del umbral de 2 segundos definido en el SLA.
- **Causas**: Congestión en la red del buró, fallos en sus sistemas internos, o alta demanda en hora pico.
- **Impacto**:
  - **Operacional**: Degradación del servicio de consulta de cuentas. Los clientes experimentan respuestas lentas o fallidas.
  - **Negocio**: Pérdida de confianza de los TPP (Third Party Providers) y posibles penalizaciones por incumplimiento de SLA.
  - **Regulatorio**: Riesgo de no cumplir con los requisitos de disponibilidad de PSD2 (Artículo 33).
- **Probabilidad**: Media (2-3 incidentes/mes en condiciones normales).
- **Severidad**: Alta (afecta a todos los TPP y clientes finales).

### 2.2. Duplicidad de Solicitudes por Falta de Idempotencia
- **Descripción**: Múltiples solicitudes con la misma clave de idempotencia (`x-idempotency-key`) son procesadas como transacciones independientes debido a fallos en el almacenamiento de claves.
- **Causas**:
  - Fallos en la capa de caché o base de datos que almacena las claves de idempotencia.
  - Tiempos de vida (TTL) demasiado cortos para las claves (ej. < 24 horas).
  - Errores en la lógica de validación de la clave.
- **Impacto**:
  - **Operacional**: Inconsistencias en los datos de las cuentas (ej. balances duplicados).
  - **Negocio**: Posibles disputas con TPP por cargos duplicados.
  - **Regulatorio**: Incumplimiento de FAPI 1.0 (sección 5.2.2 sobre idempotencia).
- **Probabilidad**: Baja (1 incidente/mes en condiciones normales).
- **Severidad**: Crítica (afecta la integridad de los datos).

### 2.3. Revocación de Consentimiento Durante el Procesamiento
- **Descripción**: El consentimiento del cliente es revocado mientras la solicitud de consulta está en proceso.
- **Causas**:
  - El cliente revoca el consentimiento a través de su banco o PSP.
  - El consentimiento expira durante el procesamiento.
- **Impacto**:
  - **Operacional**: Solicitudes fallidas con código `403 Forbidden`.
  - **Negocio**: Experiencia de usuario negativa y posibles quejas.
  - **Regulatorio**: Cumplimiento de PSD2 (Artículo 36 sobre revocación de consentimiento).
- **Probabilidad**: Media (5-10 incidentes/día).
- **Severidad**: Media (afecta a solicitudes individuales).

### 2.4. Throttling por Exceso de Solicitudes (1500 RPS)
- **Descripción**: El sistema recibe más de 1500 solicitudes por segundo, superando el límite definido.
- **Causas**:
  - Ataques DDoS.
  - Campañas masivas de TPP (ej. sincronización de cuentas al inicio del día).
  - Errores en los clientes que envían solicitudes en bucle.
- **Impacto**:
  - **Operacional**: Degradación del servicio para todos los TPP.
  - **Negocio**: Pérdida de ingresos por solicitudes rechazadas.
  - **Regulatorio**: Riesgo de incumplimiento de disponibilidad (PSD2 Artículo 33).
- **Probabilidad**: Alta (diario en hora pico).
- **Severidad**: Alta (afecta a todos los TPP).

### 2.5. Errores en el Mapeo de Datos
- **Descripción**: Los datos recibidos del PSP o del buró de riesgos no se transforman correctamente según el `mapeo-de-datos.csv`.
- **Causas**:
  - Cambios en los esquemas de datos del PSP o buró sin notificación.
  - Errores en las reglas de transformación definidas en `mapeo-de-datos.csv`.
  - Campos obligatorios faltantes en las respuestas.
- **Impacto**:
  - **Operacional**: Respuestas con datos incompletos o incorrectos.
  - **Negocio**: Decisiones basadas en información errónea (ej. aprobaciones de crédito).
  - **Regulatorio**: Riesgo de incumplimiento de ISO 20022 (esquemas de datos).
- **Probabilidad**: Media (1-2 incidentes/semana).
- **Severidad**: Alta (afecta la calidad de los datos).

### 2.6. Fallos en la Autenticación y Autorización (FAPI)
- **Descripción**: Los tokens de acceso no cumplen con los requisitos de FAPI (ej. firma no válida, scope insuficiente).
- **Causas**:
  - Tokens expirados.
  - Tokens con scopes incorrectos (ej. falta `accounts`).
  - Errores en la validación de la firma del token.
- **Impacto**:
  - **Operacional**: Solicitudes rechazadas con código `401 Unauthorized` o `403 Forbidden`.
  - **Negocio**: Interrupción del servicio para TPP.
  - **Regulatorio**: Incumplimiento de FAPI 1.0 (sección 5.2 sobre autenticación).
- **Probabilidad**: Alta (50-100 incidentes/día).
- **Severidad**: Alta (afecta a solicitudes individuales).

## 3. Estrategias de Mitigación

| Modo de Falla                     | Estrategia de Mitigación                                                                                                                                                                                                 | Responsable          | Métrica de Éxito                                                                 |
|------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------|----------------------------------------------------------------------------------|
| Timeout del Buró de Riesgos        | - Implementar un **circuit breaker** (ej. Resilience4j) para fallar rápido si el buró no responde en 2 segundos.<br>- **Retry con backoff exponencial** (máx. 2 reintentos).<br>- **Degradación elegante**: Retornar respuesta 200 con `risk_assessment: "degraded"` si el buró falla. | Equipo de Integración | - 99.9% de solicitudes con respuesta en < 2.5 segundos.<br>- 0% de fallos por timeout del buró sin degradación. |
| Duplicidad de Solicitudes          | - Almacenar claves de idempotencia en **Redis con TTL de 24 horas** y validación atómica.<br>- Usar **transacciones distribuidas** para garantizar consistencia en el registro de solicitudes.<br>- Implementar **logs de auditoría** para rastrear solicitudes duplicadas. | Equipo de Plataforma  | - 0% de solicitudes duplicadas procesadas como transacciones independientes.       |
| Revocación de Consentimiento       | - **Validar el estado del consentimiento en tiempo real** antes de procesar la solicitud.<br>- Implementar **webhooks** para notificar revocaciones de consentimiento.<br>- Cachear el estado del consentimiento con **TTL de 5 segundos**. | Equipo de Seguridad   | - 100% de solicitudes con consentimiento revocado rechazadas con 403.             |
| Throttling (1500 RPS)              | - Implementar **rate limiting** por TPP usando Redis (ej. Token Bucket).<br>- Retornar código `429 Too Many Requests` con header `Retry-After`.<br>- **Priorizar solicitudes** de TPP con mejores SLA.                                 | Equipo de Plataforma  | - 0% de degradación del servicio por throttling en condiciones normales.         |
| Errores en el Mapeo de Datos       | - **Validación de esquemas** usando JSON Schema antes de procesar las respuestas.<br>- Implementar **pruebas automatizadas** para las reglas de transformación en `mapeo-de-datos.csv`.<br>- **Alertas en tiempo real** para campos faltantes o inválidos. | Equipo de Integración | - 100% de respuestas con datos válidos según ISO 20022.                          |
| Fallos en Autenticación (FAPI)     | - **Validar tokens** usando una librería certificada FAPI (ej. OAuth2 Server).<br>- Implementar **logs detallados** para errores de autenticación.<br>- **Cachear tokens válidos** con TTL igual al `exp` del token.                        | Equipo de Seguridad   | - 0% de solicitudes rechazadas por errores de autenticación evitables.            |


## 4. Recomendaciones Adicionales

### 4.1. Observabilidad
- Implementar **métricas en tiempo real** para:
  - Tiempo de respuesta del buró de riesgos.
  - Tasa de éxito/fallo de las solicitudes.
  - Tasa de throttling aplicado.
  - Estado del circuit breaker (abierto/cerrado).
- Usar herramientas como **Prometheus + Grafana** para visualizar las métricas.
- Configurar **alertas proactivas** para umbrales críticos (ej. > 1% de fallos en 5 minutos).

### 4.2. Pruebas de Resiliencia
- Realizar **pruebas de caos** (ej. Chaos Monkey) para simular fallos del buró de riesgos.
- Ejecutar **pruebas de carga** para validar el límite de 1500 RPS.
- Implementar **pruebas automatizadas** para los escenarios Gherkin definidos en `criterios-de-aceptacion.feature`.

### 4.3. Cumplimiento Regulatorio
- Auditar el contrato `openapi.yaml` contra los requisitos de **FAPI 1.0** y **PSD2** usando herramientas como **Redocly CLI**.
- Documentar todas las decisiones de arquitectura en `README.md` para cumplir con **ISO 20022** y **BIAN**.
- Implementar **logs de auditoría** para todas las solicitudes (cumplimiento de PSD2 Artículo 36).

## 5. Conclusión
El contrato de consulta de cuentas presenta riesgos operacionales y regulatorios que pueden mitigarse con las estrategias propuestas. La implementación de circuit breakers, retries, degradación elegante y observabilidad proactiva son clave para garantizar la resiliencia del servicio. Se recomienda priorizar las mitigaciones para los modos de falla con mayor severidad y probabilidad (timeout del buró, throttling y fallos de autenticación).

// === ARCHIVO: README.md ===
# Contrato de Consulta de Cuentas - Decisión Arquitectónica

## 1. Arquitectura Elegida: Orquestación con Degradación Elegante

### 1.1. Orquestación vs. Coreografía
Se optó por un modelo **orquestado** para la consulta de cuentas, donde un componente central (el PSP) coordina las interacciones con el buró de riesgos y valida el consentimiento. Esta decisión se basa en:

- **Control Centralizado**: Facilita la gestión de errores y la degradación elegante (ej. timeout del buró).
- **Cumplimiento de FAPI**: Permite validar tokens y scopes de manera consistente antes de invocar servicios externos.
- **Observabilidad**: Simplifica el monitoreo de flujos complejos (ej. idempotencia, throttling).

**Trade-offs**:
- **Ventajas**:
  - Mayor control sobre la lógica de negocio.
  - Facilidad para implementar patrones de resiliencia (circuit breaker, retries).
  - Cumplimiento más sencillo de requisitos regulatorios (PSD2, FAPI).
- **Desventajas**:
  - Acoplamiento entre componentes.
  - Mayor carga en el PSP en comparación con un modelo coreografiado.

### 1.2. Seguridad: Cumplimiento de FAPI
El contrato implementa los requisitos de **FAPI 1.0** para garantizar seguridad en entornos de Open Banking:

- **Autenticación**: Tokens JWT firmados con `PS256` (requisito FAPI 5.2.2).
- **Scopes**: Validación estricta de scopes (ej. `accounts`) en cada solicitud.
- **Idempotencia**: Header `x-idempotency-key` con TTL de 24 horas (FAPI 5.2.2).
- **Protección contra CSRF**: Uso de `x-fapi-interaction-id` para rastrear solicitudes.
- **Logs de Auditoría**: Registro de todas las solicitudes para cumplimiento de PSD2 (Artículo 36).

### 1.3. Escalabilidad: 1500 RPS
Para manejar **1500 solicitudes por segundo** en hora pico, se implementan las siguientes estrategias:

- **Rate Limiting**: Throttling por TPP usando Redis (algoritmo Token Bucket).
- **Caché**: Almacenamiento de claves de idempotencia y estados de consentimiento en Redis.
- **Degradación Elegante**: Respuestas parciales (ej. `risk_assessment: "degraded"`) si el buró falla.
- **Balanceo de Carga**: Uso de un API Gateway (ej. Kong, AWS API Gateway) para distribuir solicitudes.

## 2. Estructura del Proyecto
```
.
├── openapi.yaml                # Contrato OpenAPI 3.1 con extensiones FAPI
├── flujo-de-consentimiento.md   # Flujo de consentimiento en BPMN
├── mapeo-de-datos.csv           # Transformación de datos origen-destino
├── criterios-de-aceptacion.feature # Especificación Gherkin para validación
├── analisis-de-riesgo.md        # Modos de falla y mitigaciones
├── README.md                    # Decisión arquitectónica y setup
└── seguridad.md                 # Detalles de autenticación y autorización
```

## 3. Validación del Contrato
Para validar el contrato `openapi.yaml` contra la especificación OpenAPI 3.1 y FAPI, ejecuta:

```bash
npx --yes @redocly/cli@1.12.0 lint openapi.yaml
```

**Requisitos previos**:
- Node.js (v16 o superior).
- Redocly CLI instalado globalmente o como dependencia de desarrollo.

## 4. Ejecución de Pruebas
Los escenarios definidos en `criterios-de-aceptacion.feature` pueden ejecutarse usando una herramienta como **Cucumber** o **Postman**. Para validar los criterios de aceptación:

1. **Pruebas Manuales**: Usar Postman o Insomnia para enviar solicitudes al endpoint `/accounts` con los ejemplos proporcionados.
2. **Pruebas Automatizadas**: Implementar los escenarios en Cucumber con un framework de testing (ej. Java + RestAssured, TypeScript + Jest).

## 5. Trade-offs Clave

| Decisión               | Beneficio                                                                 | Riesgo                                                                                     | Mitigación                                                                 |
|------------------------|---------------------------------------------------------------------------|-------------------------------------------------------------------------------------------|----------------------------------------------------------------------------|
| Orquestación           | Control centralizado, cumplimiento de FAPI                               | Acoplamiento, mayor carga en el PSP                                                      | Usar patrones de resiliencia (circuit breaker, retries).                  |
| Redis para idempotencia | Alto rendimiento, TTL configurable                                        | Dependencia de infraestructura adicional                                                  | Implementar fallback a base de datos en caso de fallo de Redis.           |
| Degradación elegante   | Disponibilidad continua incluso con fallos del buró                      | Respuestas parciales que pueden afectar decisiones de negocio                           | Documentar claramente el estado `degraded` en el contrato.                |
| Throttling por TPP     | Protección contra abusos y ataques DDoS                                  | Posible rechazo de solicitudes legítimas en hora pico                                    | Priorizar TPP con mejores SLA y monitorear tasa de throttling.            |
| FAPI 1.0               | Cumplimiento regulatorio, interoperabilidad con otros PSP                | Complejidad adicional en la validación de tokens y scopes                                | Usar librerías certificadas FAPI (ej. OAuth2 Server).                     |


## 6. Cumplimiento Regulatorio

| Regulación       | Requisito                                                                 | Implementación en el Contrato                                                                 |
|-------------------|---------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------|
| **PSD2**          | Artículo 33: Disponibilidad y continuidad del servicio                   | - Throttling con `429 Too Many Requests`.<br>- Degradación elegante para fallos del buró.  |
| **PSD2**          | Artículo 36: Revocación de consentimiento                                | - Validación en tiempo real del estado del consentimiento.<br>- Respuesta `403` si revocado. |
| **FAPI 1.0**      | Sección 5.2.2: Idempotencia                                               | - Header `x-idempotency-key` con TTL de 24 horas.<br>- Respuesta `409` para duplicados.      |
| **FAPI 1.0**      | Sección 5.2: Autenticación                                                | - Tokens JWT firmados con `PS256`.<br>- Validación estricta de scopes.                       |
| **ISO 20022**     | Esquemas de datos estandarizados                                         | - Mapeo de datos en `mapeo-de-datos.csv` con validación de formatos (ej. IBAN).             |


## 7. Próximos Pasos
1. **Implementación**: Desarrollar los adaptadores para el PSP y el buró de riesgos según `mapeo-de-datos.csv`.
2. **Pruebas de Carga**: Validar el límite de 1500 RPS con herramientas como JMeter o Gatling.
3. **Pruebas de Seguridad**: Auditar el contrato contra vulnerabilidades comunes (ej. OWASP API Top 10).
4. **Documentación**: Completar `seguridad.md` con detalles de autenticación y autorización.
5. **Monitoreo**: Implementar métricas y alertas para los modos de falla identificados en `analisis-de-riesgo.md`.

// === ARCHIVO: seguridad.md ===
# Requisitos de Seguridad para el Contrato de Consulta de Cuentas

## 1. Autenticación y Autorización
El contrato de consulta de cuentas debe implementar un esquema de seguridad robusto basado en **OAuth 2.0** y **FAPI (Financial-grade API)**, garantizando la autenticación del cliente y la autorización de los scopes requeridos para acceder a los recursos protegidos.

### 1.1. Esquema de Autenticación
- **Protocolo**: OAuth 2.0 con extensión FAPI 1.0.
- **Flujo Recomendado**: `authorization_code` con PKCE (Proof Key for Code Exchange) para clientes públicos y `client_credentials` para clientes confidenciales.
- **Algoritmo de Firma**: JWT firmado con **PS256** (RSASSA-PSS con SHA-256) o **ES256** (ECDSA con SHA-256).
- **Scopes Obligatorios**:
  - `accounts`: Acceso a información de cuentas.
  - `payments`: Iniciación de pagos (si aplica).
  - `consents`: Gestión de consentimientos.

**Ejemplo de Header de Autenticación (Bearer Token):**
```http
Authorization: Bearer eyJhbGciOiJQUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6IjEifQ.eyJzY29wZSI6ImFjY291bnRzIGNvbnNlbnRzIiwiY2xpZW50X2lkIjoiY2xpZW50MTIzIiwiZXhwIjoxNjMwMDAwMDAwfQ.Signature
```

### 1.2. Requisitos de FAPI
- **Protección de Tokens**: Los tokens de acceso deben tener un tiempo de vida corto (**máximo 5 minutos**) y renovarse mediante tokens de refresco.
- **Protección de IDs de Consentimiento**: Los IDs de consentimiento deben ser UUID v4 y no predecibles.
- **Cifrado de Payloads**: Todos los payloads deben cifrarse usando **JWE (JSON Web Encryption)** con el algoritmo **A256GCM** y clave derivada de un acuerdo de claves ECDH-ES.

**Ejemplo de Payload Cifrado (JWE):**
```json
{
  "protected": "eyJlbmMiOiJBMjU2R0NNIiwiYWxnIjoiRUNESC1FUyIsImtpZCI6IjEifQ",
  "iv": "6KB707dM9YTIgHtLvtgWQ8m",
  "ciphertext": "g_hEwksO1Ax8QpD...",
  "tag": "Mz-VPPyU4RlcuYv1IwIvzw"
}
```

## 2. Manejo de Tokens de Consentimiento
Los tokens de consentimiento son críticos para garantizar que solo las partes autorizadas accedan a los datos del usuario.

### 2.1. Estructura del Token de Consentimiento
- **Formato**: JWT firmado con **PS256** o **ES256**.
- **Claims Obligatorios**:
  - `iss`: Issuer (identificador del ASPSP).
  - `sub`: Subject (identificador del usuario).
  - `aud`: Audience (identificador del TPP).
  - `exp`: Expiration time (máximo 90 días).
  - `iat`: Issued at.
  - `consent_id`: UUID v4 del consentimiento.
  - `scopes`: Lista de scopes autorizados (ej: `["accounts", "payments"]`).

**Ejemplo de Token de Consentimiento:**
```json
{
  "iss": "https://aspsp.example.com",
  "sub": "user123",
  "aud": "tpp123",
  "exp": 1632825600,
  "iat": 1630233600,
  "consent_id": "a1b2c3d4-e5f6-7890-g1h2-i3j4k5l6m7n8",
  "scopes": ["accounts", "consents"]
}
```

### 2.2. Validación del Token de Consentimiento
- **Verificación de Firma**: Validar la firma del token usando la clave pública del issuer.
- **Verificación de Expiración**: Rechazar tokens expirados con código **`401 Unauthorized`**.
- **Verificación de Scopes**: Asegurar que el token contiene los scopes requeridos para el endpoint invocado.
- **Verificación de Revocación**: Consultar el servicio de consentimientos para confirmar que el token no ha sido revocado.

**Ejemplo de Respuesta para Token Inválido:**
```http
HTTP/1.1 401 Unauthorized
Content-Type: application/json

{
  "error": "invalid_token",
  "error_description": "El token de consentimiento ha expirado o ha sido revocado."
}
```

## 3. Cifrado de Payloads
Todos los payloads enviados y recibidos deben cifrarse para proteger la confidencialidad e integridad de los datos.

### 3.1. Requisitos de Cifrado
- **Algoritmo**: **A256GCM** (AES-GCM con clave de 256 bits).
- **Acuerdo de Claves**: **ECDH-ES** (Elliptic Curve Diffie-Hellman Ephemeral Static) con curva **P-256**.
- **Headers Obligatorios**:
  - `alg`: Algoritmo de acuerdo de claves (ej: `ECDH-ES`).
  - `enc`: Algoritmo de cifrado (ej: `A256GCM`).
  - `kid`: Key ID (identificador de la clave pública del receptor).

**Ejemplo de Payload Cifrado (Request/Response):**
```json
{
  "protected": "eyJhbGciOiJFQ0RILUVTIiwiZW5jIjoiQTI1NkdDTSIsImtpZCI6IjEifQ",
  "iv": "6KB707dM9YTIgHtLvtgWQ8m",
  "ciphertext": "g_hEwksO1Ax8QpD...",
  "tag": "Mz-VPPyU4RlcuYv1IwIvzw"
}
```

## 4. Mecanismos de Idempotencia
Para garantizar que una operación no se procese más de una vez, se implementa un mecanismo de idempotencia basado en claves únicas.

### 4.1. Header de Idempotencia
- **Header Obligatorio**: `x-idempotency-key` (UUID v4 o hash SHA-256 de la operación).
- **Tiempo de Vida**: 24 horas.
- **Respuesta para Clave Duplicada**:
  - **Código HTTP**: `409 Conflict`.
  - **Body**: Detalles de la operación original.

**Ejemplo de Request con Idempotencia:**
```http
POST /accounts HTTP/1.1
Authorization: Bearer eyJhbGciOiJQUzI1NiIsInR5cCI6IkpXVCJ9...
Content-Type: application/json
x-idempotency-key: a1b2c3d4-e5f6-7890-g1h2-i3j4k5l6m7n8

{
  "consent_id": "a1b2c3d4-e5f6-7890-g1h2-i3j4k5l6m7n8",
  "account_id": "ES9121000418450200051332"
}
```

**Ejemplo de Respuesta para Clave Duplicada:**
```http
HTTP/1.1 409 Conflict
Content-Type: application/json

{
  "error": "idempotency_key_conflict",
  "error_description": "Ya existe una operación con esta clave de idempotencia.",
  "original_response": {
    "status": "success",
    "data": {
      "account_id": "ES9121000418450200051332",
      "balance": 1250.75,
      "currency": "EUR"
    }
  }
}
```

## 5. Manejo de Errores de Seguridad
Los errores de seguridad deben manejarse con códigos HTTP específicos y mensajes claros.

### 5.1. Códigos de Error Comunes
| Código HTTP | Error               | Descripción                                                                                     |
|-------------|---------------------|-------------------------------------------------------------------------------------------------|
| 401         | `invalid_token`     | Token de acceso o consentimiento inválido, expirado o revocado.                              |
| 403         | `insufficient_scope`| El token no tiene los scopes necesarios para acceder al recurso.                              |
| 403         | `consent_revoked`   | El consentimiento asociado al token ha sido revocado.                                         |
| 429         | `rate_limit_exceeded`| Se ha excedido el límite de solicitudes por segundo (1500 req/s en hora pico).                |
| 400         | `invalid_request`   | La solicitud contiene parámetros inválidos o falta información requerida (ej: `x-idempotency-key`). |

**Ejemplo de Respuesta de Error:**
```http
HTTP/1.1 403 Forbidden
Content-Type: application/json

{
  "error": "consent_revoked",
  "error_description": "El consentimiento asociado al token ha sido revocado.",
  "consent_id": "a1b2c3d4-e5f6-7890-g1h2-i3j4k5l6m7n8"
}
```

## 6. Requisitos de Throttling y Rate Limiting
Para garantizar la disponibilidad del servicio, se implementan mecanismos de throttling y rate limiting.

### 6.1. Límites de Tasa
- **Límite Global**: 1500 solicitudes por segundo en hora pico.
- **Límite por Cliente**: 100 solicitudes por segundo por cliente (identificado por `client_id`).
- **Respuesta para Exceso de Tasa**:
  - **Código HTTP**: `429 Too Many Requests`.
  - **Headers**:
    - `Retry-After`: Tiempo en segundos hasta que se pueda volver a intentar la solicitud.

**Ejemplo de Respuesta para Rate Limiting:**
```http
HTTP/1.1 429 Too Many Requests
Content-Type: application/json
Retry-After: 10

{
  "error": "rate_limit_exceeded",
  "error_description": "Se ha excedido el límite de solicitudes por segundo."
}
```

## 7. Validación de Datos
Todos los datos de entrada deben validarse para garantizar su integridad y conformidad con los estándares.

### 7.1. Validaciones Comunes
| Campo          | Tipo       | Validación                                                                                     | Ejemplo                  |
|----------------|------------|-------------------------------------------------------------------------------------------------|
| `account_id`   | String     | Formato IBAN (regex: `^[A-Z]{2}[0-9]{2}[A-Z0-9]{11,30}$`).                                     | `ES9121000418450200051332` |
| `consent_id`   | String     | UUID v4 (regex: `^[0-9a-f]{8}-[0-9a-f]{4}-4[0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$`).      | `a1b2c3d4-e5f6-7890-g1h2-i3j4k5l6m7n8` |
| `amount`       | Number     | Mayor que 0 y con hasta 2 decimales.                                                           | `1250.75`                |
| `currency`     | String     | Código ISO 4217 (3 letras).                                                                    | `EUR`                    |

**Ejemplo de Respuesta para Dato Inválido:**
```http
HTTP/1.1 400 Bad Request
Content-Type: application/json

{
  "error": "invalid_request",
  "error_description": "El campo 'account_id' no cumple con el formato IBAN.",
  "invalid_fields": [
    {
      "field": "account_id",
      "reason": "Formato inválido"
    }
  ]
}
```

## 8. Ejemplo Completo de Flujo de Consulta de Cuentas
A continuación, se presenta un ejemplo completo de un flujo de consulta de cuentas, incluyendo autenticación, manejo de consentimientos y cifrado de payloads.

### 8.1. Request de Consulta de Cuentas
```http
POST /accounts HTTP/1.1
Authorization: Bearer eyJhbGciOiJQUzI1NiIsInR5cCI6IkpXVCJ9.eyJzY29wZSI6ImFjY291bnRzIGNvbnNlbnRzIiwiY2xpZW50X2lkIjoiY2xpZW50MTIzIiwiZXhwIjoxNjMwMDAwMDAwfQ...
Content-Type: application/jwe
x-idempotency-key: a1b2c3d4-e5f6-7890-g1h2-i3j4k5l6m7n8

{
  "protected": "eyJhbGciOiJFQ0RILUVTIiwiZW5jIjoiQTI1NkdDTSIsImtpZCI6IjEifQ",
  "iv": "6KB707dM9YTIgHtLvtgWQ8m",
  "ciphertext": "g_hEwksO1Ax8QpD...",
  "tag": "Mz-VPPyU4RlcuYv1IwIvzw"
}
```

**Payload Descifrado (Request):**
```json
{
  "consent_id": "a1b2c3d4-e5f6-7890-g1h2-i3j4k5l6m7n8",
  "account_id": "ES9121000418450200051332"
}
```

### 8.2. Response Exitoso
```http
HTTP/1.1 200 OK
Content-Type: application/jwe

{
  "protected": "eyJhbGciOiJFQ0RILUVTIiwiZW5jIjoiQTI1NkdDTSIsImtpZCI6IjEifQ",
  "iv": "6KB707dM9YTIgHtLvtgWQ8m",
  "ciphertext": "g_hEwksO1Ax8QpD...",
  "tag": "Mz-VPPyU4RlcuYv1IwIvzw"
}
```

**Payload Descifrado (Response):**
```json
{
  "account_id": "ES9121000418450200051332",
  "balance": 1250.75,
  "currency": "EUR",
  "transactions": [
    {
      "transaction_id": "txn123",
      "amount": 100.50,
      "currency": "EUR",
      "description": "Compra en supermercado",
      "date": "2023-10-01T12:00:00Z"
    }
  ]
}
```

## 9. Referencias
- [OpenID Financial-grade API (FAPI)](https://openid.net/wg/fapi/)
- [OAuth 2.0 (RFC 6749)](https://datatracker.ietf.org/doc/html/rfc6749)
- [OpenAPI Specification 3.1.0](https://spec.openapis.org/oas/v3.1.0)
- [ISO 20022](https://www.iso20022.org/)
- [JSON Web Encryption (JWE)](https://datatracker.ietf.org/doc/html/rfc7516)
- [JSON Web Signature (JWS)](https://datatracker.ietf.org/doc/html/rfc7515)
```
