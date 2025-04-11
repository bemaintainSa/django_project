# Django Project Setup Documentation

This document outlines all the steps taken to set up this Django 5.1 project with Python 3.11.

## 1. Python Installation

Python 3.11 was installed using Homebrew:

```bash
brew install python@3.11
```

Verification of installation:

```bash
python3.11 --version
# Output: Python 3.11.12
```

## 2. Project Directory Creation

```bash
mkdir -p django_project
cd django_project
```

## 3. Virtual Environment Setup

Created and activated a virtual environment:

```bash
python3.11 -m venv venv
source venv/bin/activate
```

## 4. Django Installation

Installed Django 5.1:

```bash
pip install django==5.1
```

## 5. Django Project Creation

Created the Django project structure:

```bash
django-admin startproject mysite .
```

This created the following structure:

- `manage.py`: Django's command-line utility for administrative tasks
- `mysite/`: The project package containing:
  - `__init__.py`: Empty file that tells Python this directory should be considered a package
  - `settings.py`: Project settings/configuration
  - `urls.py`: URL declarations for the project
  - `asgi.py`: Entry point for ASGI-compatible web servers
  - `wsgi.py`: Entry point for WSGI-compatible web servers

## 6. App Creation

Created a Django app named 'core':

```bash
python manage.py startapp core
```

This created the app with the following structure:

- `core/`:
  - `__init__.py`: Empty file marking the directory as a Python package
  - `admin.py`: For registering models with Django admin
  - `apps.py`: App configuration
  - `migrations/`: Directory for database migrations
  - `models.py`: For defining data models
  - `tests.py`: For writing tests
  - `views.py`: For handling requests and returning responses

## 7. App Registration

Added 'core' to `INSTALLED_APPS` in `mysite/settings.py`:

```python
INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'core',
]
```

## 8. View Creation

Created a simple view in `core/views.py`:

```python
from django.shortcuts import render
from django.http import HttpResponse

def home(request):
    return HttpResponse("<h1>Welcome to our Django Project!</h1>")
```

## 9. URL Configuration

Created `core/urls.py` to define URL patterns for the app:

```python
from django.urls import path
from . import views

urlpatterns = [
    path('', views.home, name='home'),
]
```

Updated the project's `mysite/urls.py` to include the app's URLs:

```python
from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('core.urls')),
]
```

## 10. Database Setup

Applied initial migrations to set up the database:

```bash
python manage.py migrate
```

## 11. Documentation

Created project documentation:

1. `README.md`: Basic project description and setup instructions
2. `requirements.txt`: List of project dependencies and versions

## 12. Development Server

Started the development server:

```bash
python manage.py runserver
```

The server runs at http://127.0.0.1:8000/ by default.

## Security Notes

- The default `SECRET_KEY` in `settings.py` should be changed before deploying to production
- Debug mode (`DEBUG = True`) should be turned off in production
- Consider using environment variables for sensitive settings in production

## Next Steps

To continue development:

1. Create templates for more sophisticated HTML rendering
2. Define models to store application data
3. Set up the admin interface with custom configurations
4. Implement forms for data entry and validation
5. Add authentication and user management
6. Configure static files for CSS and JavaScript
