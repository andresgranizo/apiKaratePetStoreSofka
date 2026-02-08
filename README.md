# PetStore API Test Automation

Automatización de pruebas API para PetStore usando **Karate Framework**.

## Tecnologías

- Karate 1.4.1
- JUnit 5
- Maven
- Java 17

## Estructura

```
api-karate-petstore/
├── src/test/java/
│   ├── karate-config.js      # Configuración global
│   ├── PetStoreRunner.java   # Runner de JUnit
│   └── petstore/
│       └── pet-crud.feature  # Casos de prueba
├── pom.xml
├── README.md
└── conclusiones.txt          # Hallazgos y conclusiones
```

## Requisitos

- Java 17+
- Maven 3.x+

## Ejecución

```bash
# Clonar y entrar al proyecto
git clone <url-repositorio>
cd api-karate-petstore

# Ejecutar todos los tests
mvn clean test

# Ejecutar por tag
mvn test -Dkarate.options="--tags @add-pet"
mvn test -Dkarate.options="--tags @get-pet-by-id"
mvn test -Dkarate.options="--tags @update-pet"
mvn test -Dkarate.options="--tags @find-by-status"
```

## Reportes y Resultados

Después de ejecutar los tests, los reportes se generan en:

| Tipo | Ubicación |
|------|-----------|
| Reporte HTML | `target/karate-reports/karate-summary.html` |
| Reportes JSON | `target/karate-reports/*.json` |
| Timeline | `target/karate-reports/karate-timeline.html` |

## Casos de Prueba

| Tag | Descripción | Endpoint |
|-----|-------------|----------|
| `@add-pet` | Crear mascota | POST /pet |
| `@get-pet-by-id` | Consultar por ID | GET /pet/{id} |
| `@update-pet` | Actualizar a status "sold" | PUT /pet |
| `@find-by-status` | Buscar por status | GET /pet/findByStatus |

## Documentación

| Archivo | Descripción |
|---------|-------------|
| `README.md` | Instrucciones de ejecución |
| `conclusiones.txt` | Hallazgos y conclusiones del ejercicio |

## API

- **URL Base**: https://petstore.swagger.io/v2
- **Documentación**: https://petstore.swagger.io/

## Autor

Andrés Granizo
