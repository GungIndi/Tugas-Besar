#SERVER
import socket, cv2, pickle,struct,imutils

# Socket Create
server_socket = socket.socket(socket.AF_INET,socket.SOCK_STREAM)
host_name  = socket.gethostname() # mengambil host name dari device
print('Host Name:',host_name)
host_ip = socket.gethostbyname(host_name) # mengambil ip host dari hostname
print('HOST IP:',host_ip)
port = 9999	# menentukan port yang akan dibuka 
socket_address = (host_ip,port)

# Socket Bind
server_socket.bind(socket_address) # assign dan mengikat socket ke nomor ip dan port untuk dijadikan sebagai server

# Socket Listen
server_socket.listen(5)# masuk ke dalam mode listen, membuat server untuk bisa menerima koneksi, parameternya berupa batas koneksi yang akan diterima oleh socket
print("LISTENING AT:",socket_address)

# Socket Accept
while True:
	client_socket,addr = server_socket.accept() #digunakan untuk menerima koneksi yang masuk
	print('GOT CONNECTION FROM:',addr)
	if client_socket:
		vid = cv2.VideoCapture(0) # meng capture video frame by frame
		while(vid.isOpened()): # mereturn true jika proses video capture berhasil
			img,frame = vid.read() #
			frame = imutils.resize(frame,width=300) # meresize size dari frame video
			a = pickle.dumps(frame) # membongkar frame per frame dengan pickling untuk dikirim melalui jaringan
			message = struct.pack("Q",len(a))+a # mempack data yang telah di pickling ke dalam bentuk bytes dengan format "Q"
			client_socket.sendall(message) # mengirimkan paket kepada client
			
			cv2.imshow('TRANSMITTING VIDEO',frame) # menunjukan paket yang telah dikirimkan
			if cv2.waitKey(1) == '13':
				client_socket.close() # menutup socket