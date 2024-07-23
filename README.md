# Rails Contact API - Experiment

## Overview

This project is a Ruby on Rails API for handling contact submissions. The API receives POST requests with contact information and forwards them to a specified webhook URL. This migration was undertaken to test Ruby on Rails for an existing use case and to explore its features and capabilities.

## Getting Started

To set up and run this Rails API project, follow the instructions below.

### Prerequisites

- Ruby (version 3.3 or later)
- Rails (version 7.1 or later)
- Bundler (for managing gems)

### Installation


1. **Install Dependencies**

   Ensure you have `bundler` installed. If not, install it with:

   ```bash
   gem install bundler
   ```

   Then install the required gems:

   ```bash
   bundle install
   ```

1. **Setup Environment Variables**

   Create a `.env` file in the root directory of the project and set required environment variables:

   ```bash
   WEBHOOK_URL='https://example.com/webhook'
   ALLOWED_ORIGINS='server.dev'
   ```

3. **Start the Rails Server**

   ```bash
   rails server
   ```

   The API will be accessible at `http://localhost:3000/api/contacts`.

### API Endpoint

- **POST /api/contacts**

  Sends contact information to the configured webhook URL. Expects a JSON body with the following structure:

  ```json
  {
    "name": "John Doe",
    "email": "john@example.com",
    "message": "Hello!"
  }
  ```

### Files Covered

- **`app/controllers/api/contacts_controller.rb`**: Contains the `ContactsController` class which handles POST requests to the `/api/contacts` endpoint and forwards the contact data to the specified webhook URL using `Faraday`.

- **`config/application.rb`**: Configures middleware and application settings.

- **`config/initializers/cors.rb`**: Configures CORS settings to allow cross-origin requests.

- **`Gemfile`**: Includes the `faraday` gem for making HTTP requests.

- **`.env`**: Stores environment variables such as `WEBHOOK_URL`.

## Testing

You can test the endpoint using `curl` or tools like Postman:

```bash
curl -X POST http://localhost:3000/api/contacts \
     -H "Content-Type: application/json" \
     -d '{"contact": {"name": "John Doe", "email": "john@example.com", "message": "Hello!"}}'
```

## ToDo

- Get familiar with testing ruby
- Validate the form
- Create middleware to get the real ip from the headers
- Speed and stress test the api and compare it against the bun server