import requests
import json
from requests import HTTPError


class Users(object):
    ROBOT_LIBRARY_SCOPE = 'GLOBAL'
    
    def __init__(self):
        self.host_url = "https://qa-task.backbasecloud.com"
        self.jwtToken = None
        
    def user_auth(self, email, password, auth_user, auth_pwd):
        """
        The function will authenticate the user using Basic Auth
        :param email: Email id of the user
        :param password: password of the user
        :param auth_user: username for Basic Auth
        :param auth_pwd: Password for Basic Auth
        :return: returns a dictionary containing the jwt token
        """
        endpoint = "/api/users/login"
        host_uri = self.host_url + endpoint
        payload = json.dumps({
            "user": {
                "email": email,
                "password": password
            }
        })
        headers = {
            'Content-Type': 'application/json; charset=utf-8'
        }
        response = requests.post(host_uri, data=payload, headers=headers, auth=(auth_user, auth_pwd))
        if response.status_code != 200:
            raise HTTPError(response.status_code, response.content)
        self.jwtToken = response.json()['user']['token']
        return response.json()
    
    def user_registration(self, username, email, password, auth_user, auth_pwd):
        """
        This functions registers a new user
        :param username: Username to be registered
        :param email: email to be registered
        :param password: pass for the new registration
        :param auth_user: username for Basic Auth
        :param auth_pwd: Password for Basic Auth
        :return: returns a dictionary containing the data about registered user.
        """
        endpoint = "/api/users"
        host_uri = self.host_url + endpoint
        payload = json.dumps({
            "user": {
                "username": username,
                "email": email,
                "password": password
            }
        })
        headers = {
            'Content-Type': 'application/json'
        }
        response = requests.post(host_uri, data=payload, headers=headers, auth=(auth_user, auth_pwd))
        if response.status_code != 200:
            raise HTTPError(response.status_code, response.content)
        return response.json()
    
    def get_current_user(self, email, password, auth_user, auth_pwd):
        """
        This function returns the details of authenticated current user
        :param email: email id for login
        :param password: login password
        :param auth_user: username for Basic Auth
        :param auth_pwd: Password for Basic Auth
        :return: returns the details of the current user
        """
        endpoint = "/api/user"
        host_uri = self.host_url + endpoint
        resp = self.user_auth(email, password, auth_user, auth_pwd)
        headers = {
            "jwtauthorization": "Token {}".format(self.jwtToken)
        }
        response = requests.get(host_uri, headers=headers, auth=(auth_user, auth_pwd))
        if response.status_code != 200:
            raise HTTPError(response.status_code, response.content)
        return response.json()

    def update_user(self, email, password, bio, image, auth_user, auth_pwd):
        """
        This function will update the details of the current user
        :param email: login email id
        :param password: login password
        :param bio: bio to be updated
        :param image: image to be updated
        :param auth_user: username for Basic Auth
        :param auth_pwd: Password for Basic Auth
        :return: returns a dictionary
        """
        endpoint = "/api/user"
        host_uri = self.host_url + endpoint
        resp = self.user_auth(email, password, auth_user, auth_pwd)
        username = email.split("@")[0]
        body = json.dumps({
            "user": {
                "email": email,
                "bio": bio,
                "image": image,
                "username": username
            }
        })
        headers = {
            "jwtauthorization": "Token {}".format(self.jwtToken)
        }
        print(body)
        print(headers)
        response = requests.put(host_uri, data=body, headers=headers, auth=(auth_user, auth_pwd))
        print(response.text)
        if response.status_code != 200:
            raise HTTPError(response.raise_for_status())
        return response.json()
    
        