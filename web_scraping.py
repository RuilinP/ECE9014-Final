from zenrows import ZenRowsClient
from bs4 import BeautifulSoup
import pandas as pd
from datetime import datetime

client = ZenRowsClient("660e412a8be5279caf2d1caaa008507a4cc70cd4")

urls = [
    "https://www.kobo.com/us/en/ebook/the-house-of-cross-2",
    "https://www.kobo.com/us/en/ebook/the-24th-hour-1",
    "https://www.kobo.com/us/en/ebook/sgt-frog-vol-10",
    "https://www.kobo.com/us/en/ebook/oshi-no-ko-vol-8",
    "https://www.kobo.com/jp/ja/ebook/AotHhFTYGzK9oYkyfsZNYA",
    "https://www.kobo.com/jp/ja/ebook/yxZkRuzB3DuEWFXOSF_ZJw",
    "https://www.kobo.com/jp/ja/ebook/-z4uVKvX-j-44b7MLc9eGg",
    "https://www.kobo.com/tw/zh/ebook/tDsuu4l9PTaA60pY2uDb8A",
    "https://www.kobo.com/tw/zh/ebook/StwILMoDzDeOxSUl2jV-SQ",
    "https://www.kobo.com/tw/zh/ebook/zIMDg4NARzqLd9vYg8bGXQ",
    "https://www.kobo.com/jp/ja/ebook/nBzfvIHgOjOiIris0dO_rg",
    
]

publishers = []  
books = []       
authors = [] 
publisher_id_counter = 1
book_id_counter = 1
author_id_counter = 1

for url in urls:
    response = client.get(url)
    if response.status_code == 200:
        soup = BeautifulSoup(response.text, 'html.parser')

        # Region
        if "/jp/ja/" in url:
            region_id = 3  # Japan
            date_format = "%Y年%m月%d日"  # Japanese date format
        elif "/tw/zh/" in url:
            region_id = 4  # Taiwan
            date_format = "%Y年%m月%d日"  # Taiwanese date format
        else:
            region_id = 2  # United States
            date_format = "%B %d, %Y"  # English date format

        # Book details
        title = soup.find('h1', class_='title product-field').get_text(strip=True) if soup.find('h1', class_='title product-field') else "N/A"
        author_name = soup.find('a', class_='contributor-name').get_text(strip=True) if soup.find('a', class_='contributor-name') else "N/A"
        description = soup.find('div', class_='synopsis-description').get_text(strip=True) if soup.find('div', class_='synopsis-description') else "N/A"

        # Rakuten ID (Book ID)
        book2ndmeta = soup.find('div', class_="bookitem-secondary-metadata")
        table1 = book2ndmeta.find_next('ul')
        line = table1.find_all('li')[3]
        rakuten_id = line.find_next('span').text.strip()

        line2 = table1.find_all('li')[2]
        publisher_anchor = line2.find('a')
        publisher_name = publisher_anchor.find('span').text.strip()

        # Release Day
        release_day_element = soup.findAll('li', translate='no')[1]
        raw_release_day = release_day_element.find_next('span').text.strip()
        release_date = datetime.strptime(raw_release_day, date_format).strftime("%Y-%m-%d")

        # Price
        price = soup.find('meta', property='og:price')['content'] if soup.find('meta', property='og:price') else "N/A"

        publisher_id = None
        for publisher in publishers:
            if publisher['publisher_name'] == publisher_name:
                publisher_id = publisher['publisher_id']
                break

        if not publisher_id:
            publisher_id = publisher_id_counter
            publishers.append({
                "publisher_id": publisher_id,
                "publisher_name": publisher_name
            })
            publisher_id_counter += 1


        author_id = None
        for author in authors:
            if author['author_name'] == author_name:
                author_id = author['author_id']
                break

        if not author_id:
            author_id = author_id_counter
            authors.append({
                "author_id": author_id,
                "author_name": author_name
            })
            author_id_counter += 1

        books.append({
            "book_id": book_id_counter,
            "title": title,
            "rakuten_id": rakuten_id,
            "release_date": release_date,
            "price": price,
            "publisher_id": publisher_id,
            "region_id": region_id,  
            "description": description,
            "author_id": author_id,
        })
        book_id_counter += 1

publisher_df = pd.DataFrame(publishers)
book_df = pd.DataFrame(books)
author_df = pd.DataFrame(authors)

publisher_df.to_csv('publisher_web_scraped.csv', index=False, encoding='utf-8-sig')
book_df.to_csv('books_web_scraped.csv', index=False, encoding='utf-8-sig')
author_df.to_csv('author_web_scraped.csv', index=False, encoding='utf-8-sig')

print("Data saved to 'publisher_web_scraped.csv', 'author_web_scraped.csv', and 'books_web_scraped.csv'")
