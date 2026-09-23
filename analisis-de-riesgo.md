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