import requests

import requests
from urllib.parse import urlencode, urlparse, parse_qs

def get_authorization_code(auth_url, client_id, redirect_uri, scope):
    """
    Direct the user to the authorization URL to get the authorization code.
    """
    auth_params = {
        'response_type': 'code',
        'client_id': client_id,
        'redirect_uri': redirect_uri,
        'scope': scope,
        'prompt': 'login'
    }
    authorization_url = f"{auth_url}?{urlencode(auth_params)}"
    print(f"Please go to this URL and authorize access: {authorization_url}")
    redirect_response = input("Paste the full redirect URL here: ")
    parsed_url = urlparse(redirect_response)
    authorization_code = parse_qs(parsed_url.query)['code'][0]
    return authorization_code

def get_access_token(token_url, client_id, client_secret, redirect_uri, authorization_code):
    """
    Exchange the authorization code for an access token.
    """
    token_data = {
        'grant_type': 'authorization_code',
        'code': authorization_code,
        'redirect_uri': redirect_uri,
        'client_id': client_id,
        'client_secret': client_secret
    }

    response = requests.post(token_url, data=token_data)
    response_data = response.json()

    if response.status_code != 200:
        raise Exception(f"Failed to obtain access token: {response_data}")

    return response_data

# Example usage:
auth_url = 'https://clemia-test-cudifn.zitadel.cloud/oauth/v2/authorize'
token_url = 'https://clemia-test-cudifn.zitadel.cloud/oauth/v2/token'
client_id = '269374843445656715@clemia'
client_secret = 'KPaR2Sj7VQOgOrfimhS3te6mDlXhiplraAeo8BuoBOkbgeFwSnaSHR4ybGpP5XYc'
redirect_uri = 'http://localhost:4444/auth.html'
scope = 'openid profile email'


def interactive_login():
    authorization_code = get_authorization_code(auth_url, client_id, redirect_uri, scope)
    access_token_response = get_access_token(token_url, client_id, client_secret, redirect_uri, authorization_code)
    return access_token_response['access_token']


