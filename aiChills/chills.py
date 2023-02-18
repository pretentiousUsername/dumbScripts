from bs4 import BeautifulSoup
import requests

chillsUrl = 'https://www.youtube.com/c/Top15s'

def scrapeInfo(url):
    r = requests.get(url)
    s = r.text

    soup = BeautifulSoup(s, 'html.parser')

    title = soup.find('a', id="video-title", title)
    id = soup.find("meta", itemprop="videoId")

    data = {'title':title, 'id':id}
    return data

if __name__ == "__main__":
	
    #data = []
    data = scrapeInfo(chillsUrl)
	
    # printing the dictionary
    print(data)


