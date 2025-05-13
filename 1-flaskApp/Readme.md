## 1.Write code for a simple user registration form for an event using Flask and Docker in DevOps

# Flask Registration App

A lightweight Flask application with a clean registration form and Docker support. This project demonstrates how to create a simple web application using Flask and containerize it using Docker.


## 🚀 Setup and Run Instructions

### Without Docker

1. **Install dependencies**
   ```bash
   pip install -r requirements.txt
   ```
   
   > **Note:** Installing packages globally (without a virtual environment) may cause version conflicts with other Python projects. If you encounter issues, consider using a virtual environment:
   > ```bash
   > python -m venv venv
   > source venv/bin/activate  # On Windows: venv\Scripts\activate
   > pip install -r requirements.txt
   > ```

3. **Run the Flask app**
   ```bash
   python3 app.py
   ```

4. **Visit the app in your browser**
   ```
   http://localhost:5000/register
   ```

### 🐳 Using Docker

1. **Build the Docker image**
   ```bash
   docker build -t flask-register-app .
   ```

2. **Run the container**
   ```bash
   docker run -p 5000:5000 flask-register-app
   ```

3. **Visit in your browser**
   ```
   http://localhost:5000/register
   ```

## 🔍 How It Works

### ⚙️ Flask Overview

Flask is a micro web framework for Python that allows you to build web applications with minimal setup:

* **Routing**: The `@app.route('/register')` decorator handles URL routing to specific functions
* **Request Handling**: The same route can handle different HTTP methods (GET for displaying forms, POST for processing submissions)
* **Form Data**: Access submitted form data using `request.form['field_name']`
* **Templates**: The `render_template()` function renders HTML templates from the `templates/` directory
* **Jinja2**: Flask uses Jinja2 templating engine that allows you to embed Python-like expressions in HTML

### 🐳 Docker Overview

Docker allows you to package your entire application and its dependencies into a container:

* **Containerization**: Your app runs in isolated containers that work consistently across different environments
* **Dockerfile**: Defines how to build the image that contains your application code, dependencies, and runtime
* **Layers**: Docker builds images in layers, making builds faster and more efficient
* **Portability**: You can run the app anywhere Docker is installed, regardless of the host operating system
* **Scaling**: Docker makes it easy to scale your application horizontally by running multiple containers

## 🛠️ Key Components

### 1. `app.py`
* A Flask application with one route: `/register`
* Supports both GET (display form) and POST (handle form submission)
* Renders `register.html` on GET and `success.html` on successful POST
* Validates form input and provides appropriate feedback

### 2. Templates
* `register.html`: A clean, responsive form to collect name, email, and password
* `success.html`: Displays a simple success message after form submission

### 3. `requirements.txt`
Contains necessary dependencies:
```
Flask==2.3.2
```

### 4. `Dockerfile`
Defines how to build the Docker image:
* Uses Python as the base image
* Copies application code and dependencies
* Sets up the working directory
* Exposes the necessary port
* Defines the command to run the application
