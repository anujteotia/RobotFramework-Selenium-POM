import requests
from requests import HTTPError


class Tags(object):
    ROBOT_LIBRARY_SCOPE = 'GLOBAL'
    
    def __init__(self):
        self.host_url = "https://qa-task.backbasecloud.com"
    
    def get_tags(self, auth_user, auth_pwd):
        """
        This function fetches the tags available
        :param auth_user: user name for Basic Auth
        :param auth_pwd: Password for Basic Auth
        :return: returns a dictionary of contains all the tags
        """
        endpoint = "/api/tags"
        host_uri = self.host_url + endpoint
        headers = {
            'Content-Type': 'application/json; charset=utf-8'
        }
        response = requests.get(host_uri, headers=headers, auth=(auth_user, auth_pwd))
        if response.status_code != 200:
            raise HTTPError(response.status_code, response.content)
        return response.json()
