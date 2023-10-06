import requests
from bs4 import BeautifulSoup

def main():
	agent = {'User-Agent':'Firefox'}
	peticion = requests.get(url="https://almacendecaballos.com/",headers=agent)
	soup = BeautifulSoup(peticion.text,'html5lib')
	for enlace in soup.find_all('link'):
		if '/wp-content/themes/' in enlace.get('href'):
			the = enlace.get('href')
			the = the.split('/')
			if 'themes' in the:
				pos = the.index('themes')
				theme = the[pos+1]
				print("Tema Vulnerable: " + theme)

if __name__ == '__main__':
	try:
		main()
	except KeyboardInterrupt:
		exit()