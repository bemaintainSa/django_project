# Django Project

A simple Django 5.1 project using Python 3.11.

## Setup

1. Clone the repository
2. Create a virtual environment:
   ```
   python3.11 -m venv venv
   ```
3. Activate the virtual environment:
   - On macOS/Linux:
     ```
     source venv/bin/activate
     ```
   - On Windows:
     ```
     venv\Scripts\activate
     ```
4. Install dependencies:
   ```
   pip install -r requirements.txt
   ```

## Running the Development Server

To start the development server:

```
python manage.py runserver
```

Then access the application at http://127.0.0.1:8000/

## Project Structure

- `mysite/` - The main project settings package
- `core/` - A simple app that demonstrates basic Django functionality
