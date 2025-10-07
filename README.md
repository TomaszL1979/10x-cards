# 10x-cards

A web application that enables the automatic generation of educational flashcards using LLMs. The project aims to significantly speed up and simplify the process of creating flashcards, allowing users to quickly transform the text they enter into high-quality learning cards.

## Table of Contents
- [10x-cards](#10x-cards)
  - [Table of Contents](#table-of-contents)
  - [Project Name](#project-name)
  - [Project Description](#project-description)
  - [Tech Stack](#tech-stack)
  - [Getting Started Locally](#getting-started-locally)
    - [Prerequisites](#prerequisites)
    - [Installation](#installation)
  - [Available Scripts](#available-scripts)
  - [Project Scope](#project-scope)
  - [Project Status](#project-status)
  - [License](#license)

## Project Name
10x-cards

## Project Description
10x-cards is a web application designed to facilitate the rapid creation and management of educational flashcard sets using AI. The application leverages LLM models via API to generate flashcard suggestions based on the provided text.

## Tech Stack
- **Frontend**: Astro 5, React 19, TypeScript 5, Tailwind 4, Shadcn/ui
- **Backend**: Supabase with PostgreSQL database, user authentication
- **AI**: Openrouter.ai for AI model communication
- **CI/CD and Hosting**: GitHub Actions, DigitalOcean

## Getting Started Locally
### Prerequisites
- Node.js v22.14.0 (as specified in `.nvmrc`)
- npm (comes with Node.js)

### Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/TomaszL1979/10x-cards
   cd 10x-astro-starter
   ```
2. Install dependencies:
   ```bash
   npm install
   ```
3. Run the development server:
   ```bash
   npm run dev
   ```
4. Build for production:
   ```bash
   npm run build
   ```

## Available Scripts
- `npm run dev` - Start development server
- `npm run build` - Build for production
- `npm run preview` - Preview production build
- `npm run lint` - Run ESLint
- `npm run lint:fix` - Fix ESLint issues

## Project Scope
- **Functionalities**:
  - Automatic flashcard generation from text.
  - Manual creation and management of flashcards.
  - User authentication system.
  - Integration with a repetition algorithm.
  - Data storage compliant with GDPR.
- **Limitations**:
  - MVP does not include advanced repetition algorithm, gamification, mobile apps, document import, public API, flashcard sharing, advanced notifications, advanced search.

## Project Status
Currently in development.

## License
This project is licensed under the MIT License.
