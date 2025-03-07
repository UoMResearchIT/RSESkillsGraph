import os;
import urllib;
import urllib.request;
import json;

def get_people():
    url = 'https://balextest.itservices.manchester.ac.uk/api/skills/getAllGrouped'
    api_key = os.getenv('CAPX_API_KEY')
    headers = {'x-api-key': api_key}
    try:
        request = urllib.request.Request(url, headers=headers)
        response = urllib.request.urlopen(request)
        data = json.loads(response.read())
    except Exception as e:
        print(f'Error fetching data from API: {e}', file=sys.stderr)
        sys.exit(1)
    
    # Transform the data to match the old format
    transformed_data = {}
    for person, skills in data.items():
        transformed_data[person] = {
            "interests": [skill["controlledName"] for skill in skills]
        }
    return transformed_data

if __name__ == "__main__":
    data = get_people()
    print(data)
