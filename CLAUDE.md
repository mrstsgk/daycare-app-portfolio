# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a daycare management application built with Spring Boot + Kotlin backend and React + TypeScript frontend. It
includes functionalities such as student management, attendance tracking, and communication tools for parents and staff.
The backend follows Clean Architecture principles with strict layer separation.

## Architecture

### Backend (Clean Architecture)

The backend is organized in separate Gradle subprojects that enforce dependency direction:

- **domain/** - Core business entities and interfaces (e.g., `Student`, `StudentRepository`)
- **usecase/** - Application business logic that orchestrates domain objects (e.g., `ReadStudentUsecase`)
- **infrastructure/** - External concerns like database access using JOOQ (e.g., `StudentRepositoryImpl`)
- **presentation/** - REST controllers and OpenAPI-generated models (e.g., `ReadStudentController`)

**Dependency Flow**: presentation → usecase → domain ← infrastructure

### Frontend

- **Vite + React 18** with TypeScript
- **API client** in `src/api/client.ts` using Axios with environment-based URL configuration
- ***Vitest** for testing

### Database & Code Generation

- **PostgreSQL** with **Flyway** migrations in `backend/migration/`
- **JOOQ** for type-safe database access (generated from actual DB schema)
- **OpenAPI Generator** creates Kotlin model classes from `backend/openapi/api.yaml`

## Development Commands

### Backend

```bash
cd backend

# Build and test
./gradlew build                 # Full build including all subprojects
./gradlew test                  # Run tests (excludes JOOQ generation)
./gradlew detekt               # Run static analysis

# Code generation (requires running database)
docker-compose up -d db        # Start PostgreSQL
./gradlew generateJooq         # Generate JOOQ classes from DB schema
./gradlew openApiGenerate      # Generate Kotlin models from OpenAPI spec

# Database operations
./gradlew flywayMigrate        # Run database migrations
./gradlew flywayClean          # Clean database (development only)
```

### Frontend

```bash
cd frontend

# Development
npm run dev                    # Start dev server (port 3000)
npm run build                  # Build for production

# Code quality
npm run lint                   # ESLint check
npm run lint:fix              # ESLint with auto-fix
npm run format                # Format with Prettier
npm run format:check          # Check Prettier formatting
npm run lint:format          # Run both lint and format

# Testing
npm run test                  # Run Vitest tests
npm run test:watch           # Run tests in watch mode
npm run test:ui              # Run tests with UI

# API generation
npm run generate-api         # Generate API client from running backend
```

### Docker

```bash
# Full application
docker-compose up -d --build   # Start all services

# Individual services
docker-compose up -d db        # Database only
docker-compose up -d --build backend
docker-compose up -d --build frontend
```

## Code Generation Workflow

1. **Database Schema Changes**:
    - Create migration in `backend/migration/V{version}__{description}.sql`
    - Start database: `docker-compose up -d db`
    - Regenerate JOOQ: `./gradlew generateJooq`
    - Update repository implementations

2. **API Changes**:
    - Update `backend/openapi/api.yaml`
    - Regenerate models: `./gradlew openApiGenerate`
    - Update controllers to use new models
    - Regenerate frontend client: `npm run generate-api`

## Testing & CI

### Backend CI (.github/workflows/backend-check.yml)

- **Triggers**: Kotlin, Gradle, YAML, SQL file changes
- **Runs**: Detekt static analysis, unit tests
- **Environment**: Ubuntu + JDK 21

### Frontend CI (.github/workflows/frontend-check.yml)

- **Triggers**: JS/TS/JSON/CSS file changes
- **Runs**: ESLint, Prettier format check, build verification
- **Environment**: Ubuntu + Node.js 18

### Code Quality Rules

- **Backend**: Detekt rules in `backend/detekt/detekt.yml` (magic numbers, return count limits, etc.)
- **Frontend**: ESLint + Prettier with TypeScript strict mode

## Development Guidelines

Based on `.github/copilot-instructions.md`:

### Code Review Priority Levels

- **MUST**: Security vulnerabilities, functional bugs, performance issues, data integrity problems
- **SHOULD**: Readability, maintainability, test coverage, coding standards
- **IMO**: Alternative approaches, style preferences

### Language-Specific Guidelines

- **Kotlin**: Prioritize null safety, proper exception handling, single responsibility principle
- **TypeScript**: Avoid `any` type, proper useEffect dependencies, clear component responsibilities
- **Database**: Optimize queries to avoid N+1 problems, proper indexing, clear transaction boundaries

## Environment Configuration

### URLs & Ports

- **Frontend**: http://localhost:3000
- **Backend API**: http://localhost:8080/api/students
- **OpenAPI Docs**: http://localhost:8080/swagger-ui.html
- **Database**: localhost:5432 (daycare/daycareuser/daycarepass)

### Environment Variables

- **Frontend**: `REACT_APP_API_BASE_URL` (defaults to localhost:8080 in development)
- **Backend**: Spring datasource configuration via Docker Compose environment

## Package Scripts & Gradle Tasks

### Key Frontend Scripts

- `build`: TypeScript compilation + Vite build
- `lint:format`: Combined linting and formatting check
- `generate-api`: Creates API client from OpenAPI spec

### Key Backend Tasks

- `openApiGenerate`: Generates Kotlin models, automatically copies to presentation layer
- `generateJooq`: Requires running PostgreSQL database
- `detekt`: Static analysis (run in CI)