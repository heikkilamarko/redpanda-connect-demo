import requests


def get_chuck_norris_joke():
    url = "https://api.chucknorris.io/jokes/random"

    try:
        response = requests.get(url)
        response.raise_for_status()

        joke_data = response.json()
        joke = joke_data.get("value")

        return joke
    except requests.exceptions.RequestException as e:
        return f"Error fetching joke: {e}"


if __name__ == "__main__":
    joke = get_chuck_norris_joke()
    print(f"Chuck Norris joke: {joke}")
