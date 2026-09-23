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