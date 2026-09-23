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