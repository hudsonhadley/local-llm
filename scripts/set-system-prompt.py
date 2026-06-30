import os
import requests

from dotenv import load_dotenv

script_dir = os.path.dirname(os.path.abspath(__file__))
root_dir = os.path.dirname(script_dir)

load_dotenv(os.path.join(root_dir, '.env'))

with open(os.path.join(script_dir, 'system_prompt.txt')) as prompt_in:
    prompt = prompt_in.read()

port = os.getenv('FRONTEND_PORT', '3000')
base = f'http://localhost:{port}'

resp = requests.post(f'{base}/api/settings', json={'system_prompt': prompt})
resp.raise_for_status()
print(resp.json().get('message', resp.json()))
