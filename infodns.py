import dns.resolver

def main():
	informacion = ['A','AAAA','NS','SOA','MX','MF','MD','TXT']
	for c in informacion:
		try:
			a = dns.resolver.query("innovacionseguros.com.co", c)
			for q in a:
				print(q)
		except:
			print("No se pudo obtener la consulta")

if __name__ == '__main__':
	try:
		main()
	except KeyboardInterrupt:
		exit()