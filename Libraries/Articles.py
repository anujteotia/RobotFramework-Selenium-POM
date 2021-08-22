import requests
import json
from requests import HTTPError
from Users import Users


class Articles(object):
    ROBOT_LIBRARY_SCOPE = 'GLOBAL'
    
    def __init__(self):
        self.host_url = "https://qa-task.backbasecloud.com"
    
    def list_articles(self, limit, auth_user, auth_pwd):
        """
        This function lists limited nu ber of articles controlled by argument limit
        :param limit: No of items to be returned
        :param auth_user: username for Basic Auth
        :param auth_pwd: Password for Basic Auth
        :return: returns a dictionary of articles
        """
        endpoint = "/api/articles"
        host_uri = self.host_url + endpoint
        headers = {
            'Content-Type': 'application/json; charset=utf-8'
        }
        params = {"limit": limit}
        response = requests.get(host_uri, headers=headers, params=params, auth=(auth_user, auth_pwd))
        if response.status_code != 200:
            raise HTTPError(response.status_code, response.content)
        return response.json()
    
    def create_article(self, title, description, body, taglist, email, password, auth_user, auth_pwd):
        """
        This function will create a new article
        :param title: title of the article
        :param description: description of the article
        :param body: body of the article
        :param taglist: list of tags
        :param email: login email Id
        :param password: password to login
        :param auth_user: username for Basic Auth
        :param auth_pwd: Password for Basic Auth
        :return: returns created article details in a dictionary
        """
        endpoint = "/api/articles"
        host_uri = self.host_url + endpoint
        resp = Users.user_auth(self, email, password, auth_user, auth_pwd)
        auth_token = resp['user']['token']
        payload = json.dumps({
            "article": {
                "title": title,
                "description": description,
                "body": body,
                "tagList": taglist
            }
        })
        headers = {
            "jwtauthorization": "Token {}".format(auth_token),
            'Content-Type': 'application/json'
        }
        response = requests.post(host_uri, data=payload, headers=headers, auth=(auth_user, auth_pwd))
        if response.status_code != 200:
            raise HTTPError(response.status_code, response.content)
        return response.json()


if __name__ == '__main__':
    obj = Articles()
    #print(obj.list_articles(10, 'candidatex', 'qa-is-cool'))
    #print(obj.create_article('new', 'new article', 'article created', 'newArt', 'newuser11@gmail.com', 'qa-is-cool', 'candidatex', 'qa-is-cool'))
    