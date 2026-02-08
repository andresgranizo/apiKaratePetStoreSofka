# Pruebas API - PetStore con Karate

Proyecto de automatizacion de pruebas para la API de PetStore (Swagger) usando Karate Framework.

Se cubren las operaciones CRUD sobre el endpoint `/pet`.

## Como correr los tests

Necesitas Java 17 y Maven instalados.

```bash
mvn clean test
```

Si quieres correr un test especifico por tag:

```bash
mvn test -Dkarate.options="--tags @add-pet"
mvn test -Dkarate.options="--tags @get-pet-by-id"
mvn test -Dkarate.options="--tags @update-pet"
mvn test -Dkarate.options="--tags @find-by-status"
```

## Que se prueba

- **POST /pet** - Crear una mascota nueva con datos random
- **GET /pet/{id}** - Consultar la mascota que se acaba de crear
- **PUT /pet** - Actualizar el nombre y cambiar el status a "sold"
- **GET /pet/findByStatus** - Buscar mascotas filtradas por status

## Reportes

Despues de ejecutar, los reportes quedan en `target/karate-reports/`. El principal es `karate-summary.html`.

## API

URL base: https://petstore.swagger.io/v2

Docs: https://petstore.swagger.io/
