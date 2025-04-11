# Deploying to Render

This document outlines the steps taken to deploy this Django project to Render.

## Files Created for Render Deployment

1. **runtime.txt**: Specifies the Python version for Render.

   ```
   python-3.11
   ```

2. **build.sh**: Build script that Render runs during deployment.

   ```bash
   #!/usr/bin/env bash
   # exit on error
   set -o errexit

   # Install python dependencies
   pip install -r requirements.txt

   # Apply database migrations
   python manage.py migrate

   # Collect static files
   python manage.py collectstatic --no-input
   ```

3. **render.yaml**: Configuration file for Render services.

   ```yaml
   services:
     - type: web
       name: django-project
       runtime: python
       buildCommand: "./build.sh"
       startCommand: "gunicorn mysite.wsgi:application"
       envVars:
         - key: DATABASE_URL
           fromDatabase:
             name: django_db
             property: connectionString
         - key: SECRET_KEY
           generateValue: true
         - key: PYTHON_VERSION
           value: 3.11

   databases:
     - name: django_db
       plan: free
       databaseName: django
       user: django
   ```

4. **Updated requirements.txt**: Added necessary packages for production.

   ```
   Django==5.1
   asgiref==3.8.1
   sqlparse==0.5.3
   dj-database-url==2.1.0
   psycopg2-binary==2.9.9
   whitenoise==6.6.0
   gunicorn==21.2.0
   ```

5. **Updated settings.py**: Made the following changes:
   - Added environment variable support for SECRET_KEY
   - Set DEBUG to False in production
   - Added Render's hostname to ALLOWED_HOSTS
   - Added whitenoise for static file handling
   - Added PostgreSQL database configuration for production
   - Configured static files for production

## Deployment Steps

1. Commit all changes to GitHub:

   ```bash
   git add .
   git commit -m "Configure project for Render deployment"
   GIT_SSH_COMMAND="ssh -i ~/.ssh/id_rsa_bemaintainsa" git push
   ```

2. On Render:

   - Create a new Web Service
   - Connect your GitHub repository
   - Choose the "Use render.yaml" option
   - Click "Create Web Service"

3. Render will automatically:
   - Provision a PostgreSQL database
   - Set up the environment variables
   - Build and deploy your application

## Accessing Your Deployed Application

Once deployment is complete, your application will be available at:
`https://django-project.onrender.com`

## Troubleshooting

If you encounter issues:

1. Check the deployment logs on Render dashboard
2. Verify that all environment variables are set correctly
3. Ensure your database migrations are running properly
4. Check that static files are being served correctly
