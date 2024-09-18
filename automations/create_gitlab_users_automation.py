
import requests
from password_generator import PasswordGenerator


# Define the GitLab API URL and your private token
GITLAB_URL = 'http://192.168.245.137'  # Replace with your GitLab URL
API_TOKEN = ''  # Replace with your GitLab personal or admin token
# GitLab API endpoint to create a new user
API_ENDPOINT = f"{GITLAB_URL}/api/v4/users"


number_of_users = 10

# Loop to create multiple users
for i in range(number_of_users):
    #genetrate password
    pwo = PasswordGenerator()
    pwo.excludeschars = "!@#$%^&*()" 
    password = pwo.generate()


    # New user details
    new_user_data = {
        "email": f"user{i}@example.com",
        "password": password,  # A secure password for the user
        "username": f"user{i}",  # Username of the new user
        "name": f"user{i}",  # Full name of the new user
        "skip_confirmation": True,  # Skip email confirmation for the user
    }

    # Headers for authorization
    headers = {
        "PRIVATE-TOKEN": API_TOKEN,
        "Content-Type": "application/json"
    }

    # Function to create a new user
    def create_user(data):
        try:
            response = requests.post(API_ENDPOINT, json=data, headers=headers)
            
            # Check if the request was successful
            if response.status_code == 201:
                print(f"User {data['username']} created successfully.")
            else:
                print(f"Failed to create user: {response.status_code}")
                print(response.json())
        except Exception as e:
            print(f"An error occurred: {str(e)}")

    # Call the function to create the new user
    #create_user(new_user_data)
    print(new_user_data)
