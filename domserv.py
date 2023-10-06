import requests
from bs4 import BeautifulSoup


def doomserv():
	sitio = "innovacionseguros.com.co"
	agent = {'User-Agent':'Firefox'}
	a = requests.get("https://viewdns.info/reverseip/?host={}&t=1".format(sitio),headers=agent)
	b = BeautifulSoup(a.text,'html5lib')
	c = b.find(id="null")
	d = c.find(border="1")
	for l in d.find_all("tr"):
		print("Dominio alojado en el servidor: " + l.td.string)

if __name__ == '__main__':
	try:
		doomserv()
	except KeyboardInterrupt:
		exit()