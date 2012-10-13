module sf.network;
import sf.system : Time;
pragma(lib, "csfml-network-2");

class FtpListingResponse {
    private sfFtpListingResponse* ptr;
    private alias ptr this;
    bool opEquals(Object a) {
        auto cst = cast(FtpListingResponse)a;
        return cst !is null && cst.ptr == ptr;
        return true;
    }
    private this(sfFtpListingResponse* ptr) {
        this.ptr = ptr; 
    }

	~this() {
		sfFtpListingResponse_destroy(ptr);
	}
	bool isOk() {
		return sfFtpListingResponse_isOk(ptr);
	}
	FtpStatus status() {
		return sfFtpListingResponse_getStatus(ptr);
	}
	const(char)* message() {
		return sfFtpListingResponse_getMessage(ptr);
	}
	int count() {
		return sfFtpListingResponse_getCount(ptr);
	}
	const(char)* filename(int index) {
		return sfFtpListingResponse_getFilename(ptr,index);
	}
}


class FtpDirectoryResponse {
    private sfFtpDirectoryResponse* ptr;
    private alias ptr this;
    bool opEquals(Object a) {
        auto cst = cast(FtpDirectoryResponse)a;
        return cst !is null && cst.ptr == ptr;
        return true;
    }
    private this(sfFtpDirectoryResponse* ptr) {
        this.ptr = ptr; 
    }

	~this() {
		sfFtpDirectoryResponse_destroy(ptr);
	}
	bool isOk() {
		return sfFtpDirectoryResponse_isOk(ptr);
	}
	FtpStatus status() {
		return sfFtpDirectoryResponse_getStatus(ptr);
	}
	const(char)* message() {
		return sfFtpDirectoryResponse_getMessage(ptr);
	}
	const(char)* directory() {
		return sfFtpDirectoryResponse_getDirectory(ptr);
	}
}


class FtpResponse {
    private sfFtpResponse* ptr;
    private alias ptr this;
    bool opEquals(Object a) {
        auto cst = cast(FtpResponse)a;
        return cst !is null && cst.ptr == ptr;
        return true;
    }
    private this(sfFtpResponse* ptr) {
        this.ptr = ptr; 
    }

	~this() {
		sfFtpResponse_destroy(ptr);
	}
	bool isOk() {
		return sfFtpResponse_isOk(ptr);
	}
	FtpStatus status() {
		return sfFtpResponse_getStatus(ptr);
	}
	const(char)* message() {
		return sfFtpResponse_getMessage(ptr);
	}
}


class Ftp {
    private sfFtp* ptr;
    private alias ptr this;
    bool opEquals(Object a) {
        auto cst = cast(Ftp)a;
        return cst !is null && cst.ptr == ptr;
        return true;
    }
    private this(sfFtp* ptr) {
        this.ptr = ptr; 
    }

	this() {
		ptr = sfFtp_create();
	}
	~this() {
		sfFtp_destroy(ptr);
	}
	FtpResponse connect(IpAddress server,ushort port,Time timeout) {
		return new FtpResponse(sfFtp_connect(ptr,server,port,timeout));
	}
	FtpResponse loginAnonymous() {
		return new FtpResponse(sfFtp_loginAnonymous(ptr));
	}
	FtpResponse login(const(char) *userName,const(char) *password) {
		return new FtpResponse(sfFtp_login(ptr,userName,password));
	}
	FtpResponse disconnect() {
		return new FtpResponse(sfFtp_disconnect(ptr));
	}
	FtpResponse keepAlive() {
		return new FtpResponse(sfFtp_keepAlive(ptr));
	}
	FtpDirectoryResponse workingDirectory() {
		return new FtpDirectoryResponse(sfFtp_getWorkingDirectory(ptr));
	}
	FtpListingResponse directoryListing(const(char) *directory) {
		return new FtpListingResponse(sfFtp_getDirectoryListing(ptr,directory));
	}
	FtpResponse changeDirectory(const(char) *directory) {
		return new FtpResponse(sfFtp_changeDirectory(ptr,directory));
	}
	FtpResponse parentDirectory() {
		return new FtpResponse(sfFtp_parentDirectory(ptr));
	}
	FtpResponse createDirectory(const(char) *name) {
		return new FtpResponse(sfFtp_createDirectory(ptr,name));
	}
	FtpResponse deleteDirectory(const(char) *name) {
		return new FtpResponse(sfFtp_deleteDirectory(ptr,name));
	}
	FtpResponse renameFile(const(char) *file,const(char) *newName) {
		return new FtpResponse(sfFtp_renameFile(ptr,file,newName));
	}
	FtpResponse deleteFile(const(char) *name) {
		return new FtpResponse(sfFtp_deleteFile(ptr,name));
	}
	FtpResponse download(const(char) *distantFile,const(char) *destPath,FtpTransferMode mode) {
		return new FtpResponse(sfFtp_download(ptr,distantFile,destPath,mode));
	}
	FtpResponse upload(const(char) *localFile,const(char) *destPath,FtpTransferMode mode) {
		return new FtpResponse(sfFtp_upload(ptr,localFile,destPath,mode));
	}
}


class HttpRequest {
    private sfHttpRequest* ptr;
    private alias ptr this;
    bool opEquals(Object a) {
        auto cst = cast(HttpRequest)a;
        return cst !is null && cst.ptr == ptr;
        return true;
    }
    private this(sfHttpRequest* ptr) {
        this.ptr = ptr; 
    }

	this() {
		ptr = sfHttpRequest_create();
	}
	~this() {
		sfHttpRequest_destroy(ptr);
	}
	const(char)* field(const(char) *field,const(char) *value) {
		sfHttpRequest_setField(ptr,field,value); return field;
	}
	HttpMethod method(HttpMethod method) {
		sfHttpRequest_setMethod(ptr,method); return method;
	}
	const(char)* uri(const(char) *uri) {
		sfHttpRequest_setUri(ptr,uri); return uri;
	}
	uint httpVersion(uint major,uint minor) {
		sfHttpRequest_setHttpVersion(ptr,major,minor); return major;
	}
	const(char)* _body(const(char) *_body) {
		sfHttpRequest_setBody(ptr,_body); return _body;
	}
}


class HttpResponse {
    private sfHttpResponse* ptr;
    private alias ptr this;
    bool opEquals(Object a) {
        auto cst = cast(HttpResponse)a;
        return cst !is null && cst.ptr == ptr;
        return true;
    }
    private this(sfHttpResponse* ptr) {
        this.ptr = ptr; 
    }

	~this() {
		sfHttpResponse_destroy(ptr);
	}
	const(char)* field(const(char) *field) {
		return sfHttpResponse_getField(ptr,field);
	}
	HttpStatus status() {
		return sfHttpResponse_getStatus(ptr);
	}
	uint majorVersion() {
		return sfHttpResponse_getMajorVersion(ptr);
	}
	uint minorVersion() {
		return sfHttpResponse_getMinorVersion(ptr);
	}
	const(char)* _body() {
		return sfHttpResponse_getBody(ptr);
	}
}


class Http {
    private sfHttp* ptr;
    private alias ptr this;
    bool opEquals(Object a) {
        auto cst = cast(Http)a;
        return cst !is null && cst.ptr == ptr;
        return true;
    }
    private this(sfHttp* ptr) {
        this.ptr = ptr; 
    }

	this() {
		ptr = sfHttp_create();
	}
	~this() {
		sfHttp_destroy(ptr);
	}
	void setHost(const(char) *host,ushort port) {
		sfHttp_setHost(ptr,host,port); 
	}
	HttpResponse sendRequest(HttpRequest request,Time timeout) {
		return new HttpResponse(sfHttp_sendRequest(ptr,request,timeout));
	}
}


class Packet {
    private sfPacket* ptr;
    private alias ptr this;
    bool opEquals(Object a) {
        auto cst = cast(Packet)a;
        return cst !is null && cst.ptr == ptr;
        return true;
    }
    private this(sfPacket* ptr) {
        this.ptr = ptr; 
    }

	this() {
		ptr = sfPacket_create();
	}
	this(Packet packet) {
		ptr = sfPacket_copy(packet);
	}
	~this() {
		sfPacket_destroy(ptr);
	}
	void append(void *data,int sizeInBytes) {
		sfPacket_append(ptr,data,sizeInBytes);
	}
	void clear() {
		sfPacket_clear(ptr);
	}
	void* getData() {
		return sfPacket_getData(ptr);
	}
	int dataSize() {
		return sfPacket_getDataSize(ptr);
	}
	bool endOfPacket() {
		return sfPacket_endOfPacket(ptr);
	}
	bool canRead() {
		return sfPacket_canRead(ptr);
	}
	bool readBool() {
		return sfPacket_readBool(ptr);
	}
	byte readInt8() {
		return sfPacket_readInt8(ptr);
	}
	ubyte readUint8() {
		return sfPacket_readUint8(ptr);
	}
	short readInt16() {
		return sfPacket_readInt16(ptr);
	}
	ushort readUint16() {
		return sfPacket_readUint16(ptr);
	}
	int readInt32() {
		return sfPacket_readInt32(ptr);
	}
	uint readUint32() {
		return sfPacket_readUint32(ptr);
	}
	float readFloat() {
		return sfPacket_readFloat(ptr);
	}
	double readDouble() {
		return sfPacket_readDouble(ptr);
	}
	void readString(const(char) *string) {
		sfPacket_readString(ptr,string);
	}
	void writeBool(bool v) {
		sfPacket_writeBool(ptr,v);
	}
	void writeInt8(byte v) {
		sfPacket_writeInt8(ptr,v);
	}
	void writeUint8(ubyte v) {
		sfPacket_writeUint8(ptr,v);
	}
	void writeInt16(short v) {
		sfPacket_writeInt16(ptr,v);
	}
	void writeUint16(ushort v) {
		sfPacket_writeUint16(ptr,v);
	}
	void writeInt32(int v) {
		sfPacket_writeInt32(ptr,v);
	}
	void writeUint32(uint v) {
		sfPacket_writeUint32(ptr,v);
	}
	void writeFloat(float v) {
		sfPacket_writeFloat(ptr,v);
	}
	void writeDouble(double v) {
		sfPacket_writeDouble(ptr,v);
	}
	void writeString(const(char) *string) {
		sfPacket_writeString(ptr,string);
	}
}


class SocketSelector {
    private sfSocketSelector* ptr;
    private alias ptr this;
    bool opEquals(Object a) {
        auto cst = cast(SocketSelector)a;
        return cst !is null && cst.ptr == ptr;
        return true;
    }
    private this(sfSocketSelector* ptr) {
        this.ptr = ptr; 
    }

	this() {
		ptr = sfSocketSelector_create();
	}
	this(SocketSelector selector) {
		ptr = sfSocketSelector_copy(selector);
	}
	~this() {
		sfSocketSelector_destroy(ptr);
	}
	void addTcpListener(TcpListener socket) {
		sfSocketSelector_addTcpListener(ptr,socket);
	}
	void addTcpSocket(TcpSocket socket) {
		sfSocketSelector_addTcpSocket(ptr,socket);
	}
	void addUdpSocket(UdpSocket socket) {
		sfSocketSelector_addUdpSocket(ptr,socket);
	}
	void removeTcpListener(TcpListener socket) {
		sfSocketSelector_removeTcpListener(ptr,socket);
	}
	void removeTcpSocket(TcpSocket socket) {
		sfSocketSelector_removeTcpSocket(ptr,socket);
	}
	void removeUdpSocket(UdpSocket socket) {
		sfSocketSelector_removeUdpSocket(ptr,socket);
	}
	void clear() {
		sfSocketSelector_clear(ptr);
	}
	bool wait(Time timeout) {
		return sfSocketSelector_wait(ptr,timeout);
	}
	bool isTcpListenerReady(TcpListener socket) {
		return sfSocketSelector_isTcpListenerReady(ptr,socket);
	}
	bool isTcpSocketReady(TcpSocket socket) {
		return sfSocketSelector_isTcpSocketReady(ptr,socket);
	}
	bool isUdpSocketReady(UdpSocket socket) {
		return sfSocketSelector_isUdpSocketReady(ptr,socket);
	}
}


class TcpListener {
    private sfTcpListener* ptr;
    private alias ptr this;
    bool opEquals(Object a) {
        auto cst = cast(TcpListener)a;
        return cst !is null && cst.ptr == ptr;
        return true;
    }
    private this(sfTcpListener* ptr) {
        this.ptr = ptr; 
    }

	this() {
		ptr = sfTcpListener_create();
	}
	~this() {
		sfTcpListener_destroy(ptr);
	}
	bool  blocking(bool blocking) {
		sfTcpListener_setBlocking(ptr,blocking); return blocking;
	}
	bool isBlocking() {
		return sfTcpListener_isBlocking(ptr);
	}
	ushort localPort() {
		return sfTcpListener_getLocalPort(ptr);
	}
	SocketStatus listen(ushort port) {
		return sfTcpListener_listen(ptr,port);
	}
	SocketStatus accept(TcpSocket connected) {
		return sfTcpListener_accept(ptr, &connected.ptr);
	}
}


class TcpSocket {
    private sfTcpSocket* ptr;
    private alias ptr this;
    bool opEquals(Object a) {
        auto cst = cast(TcpSocket)a;
        return cst !is null && cst.ptr == ptr;
        return true;
    }
    private this(sfTcpSocket* ptr) {
        this.ptr = ptr; 
    }

	this() {
		ptr = sfTcpSocket_create();
	}
	~this() {
		sfTcpSocket_destroy(ptr);
	}
	bool  blocking(bool blocking) {
		sfTcpSocket_setBlocking(ptr,blocking); return blocking;
	}
	bool isBlocking() {
		return sfTcpSocket_isBlocking(ptr);
	}
	ushort localPort() {
		return sfTcpSocket_getLocalPort(ptr);
	}
	IpAddress remoteAddress() {
		return sfTcpSocket_getRemoteAddress(ptr);
	}
	ushort remotePort() {
		return sfTcpSocket_getRemotePort(ptr);
	}
	SocketStatus connect(IpAddress host,ushort port,Time timeout) {
		return sfTcpSocket_connect(ptr,host,port,timeout);
	}
	void disconnect() {
		sfTcpSocket_disconnect(ptr);
	}
	SocketStatus send(void *data,int size) {
		return sfTcpSocket_send(ptr,data,size);
	}
	SocketStatus receive(void *data,int maxSize,int *sizeReceived) {
		return sfTcpSocket_receive(ptr,data,maxSize,sizeReceived);
	}
	SocketStatus sendPacket(Packet packet) {
		return sfTcpSocket_sendPacket(ptr,packet);
	}
	SocketStatus receivePacket(Packet packet) {
		return sfTcpSocket_receivePacket(ptr,packet);
	}
}


class UdpSocket {
    private sfUdpSocket* ptr;
    private alias ptr this;
    bool opEquals(Object a) {
        auto cst = cast(UdpSocket)a;
        return cst !is null && cst.ptr == ptr;
        return true;
    }
    private this(sfUdpSocket* ptr) {
        this.ptr = ptr; 
    }

	this() {
		ptr = sfUdpSocket_create();
	}
	~this() {
		sfUdpSocket_destroy(ptr);
	}
	bool  blocking(bool blocking) {
		sfUdpSocket_setBlocking(ptr,blocking); return blocking;
	}
	bool isBlocking() {
		return sfUdpSocket_isBlocking(ptr);
	}
	ushort localPort() {
		return sfUdpSocket_getLocalPort(ptr);
	}
	SocketStatus bind(ushort port) {
		return sfUdpSocket_bind(ptr,port);
	}
	void unbind() {
		sfUdpSocket_unbind(ptr);
	}
	SocketStatus send(void *data,int size,IpAddress address,ushort port) {
		return sfUdpSocket_send(ptr,data,size,address,port);
	}
	SocketStatus receive(void *data,int maxSize,int *sizeReceived,IpAddress *address,ushort *port) {
		return sfUdpSocket_receive(ptr,data,maxSize,sizeReceived,address,port);
	}
	SocketStatus sendPacket(Packet packet,IpAddress address,ushort port) {
		return sfUdpSocket_sendPacket(ptr,packet,address,port);
	}
	SocketStatus receivePacket(Packet packet,IpAddress *address,ushort *port) {
		return sfUdpSocket_receivePacket(ptr,packet,address,port);
	}
	static uint maxDatagramSize() {
		return sfUdpSocket_maxDatagramSize();
	}
}

enum FtpTransferMode
{
    Binary,
    Ascii,
    Ebcdic,
}
enum FtpStatus
{
    RestartMarkerReply = 110,
    ServiceReadySoon = 120,
    DataConnectionAlreadyOpened = 125,
    OpeningDataConnection = 150,
    Ok = 200,
    PointlessCommand = 202,
    SystemStatus = 211,
    DirectoryStatus,
    FileStatus,
    HelpMessage,
    SystemType,
    ServiceReady = 220,
    ClosingConnection,
    DataConnectionOpened = 225,
    ClosingDataConnection,
    EnteringPassiveMode,
    LoggedIn = 230,
    FileActionOk = 250,
    DirectoryOk = 257,
    NeedPassword = 331,
    NeedAccountToLogIn,
    NeedInformation = 350,
    ServiceUnavailable = 421,
    DataConnectionUnavailable = 425,
    TranerAborted,
    FileActionAborted = 450,
    LocalError,
    InsufficientStorageSpace,
    CommandUnknown = 500,
    ParametersUnknown,
    CommandNotImplemented,
    BadCommandSequence,
    ParameterNotImplemented,
    NotLoggedIn = 530,
    NeedAccountToStore = 532,
    FileUnavailable = 550,
    PageTypeUnknown,
    NotEnoughMemory,
    FilenameNotAllowed,
    InvalidResponse = 1000,
    ConnectionFailed,
    ConnectionClosed,
    InvalidFile,
}
enum HttpMethod
{
    Get,
    Post,
    Head,
}
enum HttpStatus
{
    Ok = 200,
    Created,
    Accepted,
    NoContent = 204,
    ResetContent,
    PartialContent,
    MultipleChoices = 300,
    MovedPermanently,
    MovedTemporarily,
    NotModified = 304,
    BadRequest = 400,
    Unauthorized,
    Forbidden = 403,
    NotFound,
    RangeNotSatiiable = 407,
    InternalServerError = 500,
    NotImplemented,
    BadGateway,
    ServiceNotAvailable,
    GatewayTimeout,
    VersionNotSupported,
    InvalidResponse = 1000,
    ConnectionFailed,
}
enum SocketStatus
{
    Done,
    NotReady,
    Disconnected,
    Error,
}

struct IpAddress
{
    char [16]address;
}

private extern (C):
	
	
const IpAddress sfIpAddress_None;
const IpAddress sfIpAddress_LocalHost;
const IpAddress sfIpAddress_Broadcast;
IpAddress  sfIpAddress_fromString(const (char) *address);
IpAddress  sfIpAddress_fromBytes(ubyte byte0, ubyte byte1, ubyte byte2, ubyte byte3);
IpAddress  sfIpAddress_fromInteger(uint address);
void  sfIpAddress_toString(IpAddress address, const (char) *string);
uint  sfIpAddress_toInteger(IpAddress address);
IpAddress  sfIpAddress_getLocalAddress();
IpAddress  sfIpAddress_getPublicAddress(Time timeout);


void  sfFtpListingResponse_destroy(sfFtpListingResponse *ftpListingResponse);
bool   sfFtpListingResponse_isOk(sfFtpListingResponse *ftpListingResponse);
FtpStatus  sfFtpListingResponse_getStatus(sfFtpListingResponse *ftpListingResponse);
const (char) * sfFtpListingResponse_getMessage(sfFtpListingResponse *ftpListingResponse);
int  sfFtpListingResponse_getCount(sfFtpListingResponse *ftpListingResponse);
const (char) * sfFtpListingResponse_getFilename(sfFtpListingResponse *ftpListingResponse, int index);
void  sfFtpDirectoryResponse_destroy(sfFtpDirectoryResponse *ftpDirectoryResponse);
bool   sfFtpDirectoryResponse_isOk(sfFtpDirectoryResponse *ftpDirectoryResponse);
FtpStatus  sfFtpDirectoryResponse_getStatus(sfFtpDirectoryResponse *ftpDirectoryResponse);
const (char) * sfFtpDirectoryResponse_getMessage(sfFtpDirectoryResponse *ftpDirectoryResponse);
const (char) * sfFtpDirectoryResponse_getDirectory(sfFtpDirectoryResponse *ftpDirectoryResponse);
void  sfFtpResponse_destroy(sfFtpResponse *ftpResponse);
bool   sfFtpResponse_isOk(sfFtpResponse *ftpResponse);
FtpStatus  sfFtpResponse_getStatus(sfFtpResponse *ftpResponse);
const (char) * sfFtpResponse_getMessage(sfFtpResponse *ftpResponse);
sfFtp * sfFtp_create();
void  sfFtp_destroy(sfFtp *ftp);
sfFtpResponse * sfFtp_connect(sfFtp *ftp, IpAddress server, ushort port, Time timeout);
sfFtpResponse * sfFtp_loginAnonymous(sfFtp *ftp);
sfFtpResponse * sfFtp_login(sfFtp *ftp, const (char) *userName, const (char) *password);
sfFtpResponse * sfFtp_disconnect(sfFtp *ftp);
sfFtpResponse * sfFtp_keepAlive(sfFtp *ftp);
sfFtpDirectoryResponse * sfFtp_getWorkingDirectory(sfFtp *ftp);
sfFtpListingResponse * sfFtp_getDirectoryListing(sfFtp *ftp, const (char) *directory);
sfFtpResponse * sfFtp_changeDirectory(sfFtp *ftp, const (char) *directory);
sfFtpResponse * sfFtp_parentDirectory(sfFtp *ftp);
sfFtpResponse * sfFtp_createDirectory(sfFtp *ftp, const (char) *name);
sfFtpResponse * sfFtp_deleteDirectory(sfFtp *ftp, const (char) *name);
sfFtpResponse * sfFtp_renameFile(sfFtp *ftp, const (char) *file, const (char) *newName);
sfFtpResponse * sfFtp_deleteFile(sfFtp *ftp, const (char) *name);
sfFtpResponse * sfFtp_download(sfFtp *ftp, const (char) *distantFile, const (char) *destPath, FtpTransferMode mode);
sfFtpResponse * sfFtp_upload(sfFtp *ftp, const (char) *localFile, const (char) *destPath, FtpTransferMode mode);


sfHttpRequest * sfHttpRequest_create();
void  sfHttpRequest_destroy(sfHttpRequest *httpRequest);
void  sfHttpRequest_setField(sfHttpRequest *httpRequest, const (char) *field, const (char) *value);
void  sfHttpRequest_setMethod(sfHttpRequest *httpRequest, HttpMethod method);
void  sfHttpRequest_setUri(sfHttpRequest *httpRequest, const (char) *uri);
void  sfHttpRequest_setHttpVersion(sfHttpRequest *httpRequest, uint major, uint minor);
void  sfHttpRequest_setBody(sfHttpRequest *httpRequest, const (char) *_body);
void  sfHttpResponse_destroy(sfHttpResponse *httpResponse);
const (char) * sfHttpResponse_getField(sfHttpResponse *httpResponse, const (char) *field);
HttpStatus  sfHttpResponse_getStatus(sfHttpResponse *httpResponse);
uint  sfHttpResponse_getMajorVersion(sfHttpResponse *httpResponse);
uint  sfHttpResponse_getMinorVersion(sfHttpResponse *httpResponse);
const (char) * sfHttpResponse_getBody(sfHttpResponse *httpResponse);
sfHttp * sfHttp_create();
void  sfHttp_destroy(sfHttp *http);
void  sfHttp_setHost(sfHttp *http, const (char) *host, ushort port);
sfHttpResponse * sfHttp_sendRequest(sfHttp *http, sfHttpRequest *request, Time timeout);
sfPacket * sfPacket_create();
sfPacket * sfPacket_copy(sfPacket *packet);
void  sfPacket_destroy(sfPacket *packet);
void  sfPacket_append(sfPacket *packet, void *data, int sizeInBytes);
void  sfPacket_clear(sfPacket *packet);
void * sfPacket_getData(sfPacket *packet);
int  sfPacket_getDataSize(sfPacket *packet);
bool   sfPacket_endOfPacket(sfPacket *packet);
bool   sfPacket_canRead(sfPacket *packet);
bool   sfPacket_readBool(sfPacket *packet);
byte  sfPacket_readInt8(sfPacket *packet);
ubyte  sfPacket_readUint8(sfPacket *packet);
short  sfPacket_readInt16(sfPacket *packet);
ushort  sfPacket_readUint16(sfPacket *packet);
int  sfPacket_readInt32(sfPacket *packet);
uint  sfPacket_readUint32(sfPacket *packet);
float  sfPacket_readFloat(sfPacket *packet);
double  sfPacket_readDouble(sfPacket *packet);
void  sfPacket_readString(sfPacket *packet, const (char) *string);
void  sfPacket_writeBool(sfPacket *packet, bool  );
void  sfPacket_writeInt8(sfPacket *packet, byte );
void  sfPacket_writeUint8(sfPacket *packet, ubyte );
void  sfPacket_writeInt16(sfPacket *packet, short );
void  sfPacket_writeUint16(sfPacket *packet, ushort );
void  sfPacket_writeInt32(sfPacket *packet, int );
void  sfPacket_writeUint32(sfPacket *packet, uint );
void  sfPacket_writeFloat(sfPacket *packet, float );
void  sfPacket_writeDouble(sfPacket *packet, double );
void  sfPacket_writeString(sfPacket *packet, const (char) *string);
sfSocketSelector * sfSocketSelector_create();
sfSocketSelector * sfSocketSelector_copy(sfSocketSelector *selector);
void  sfSocketSelector_destroy(sfSocketSelector *selector);
void  sfSocketSelector_addTcpListener(sfSocketSelector *selector, sfTcpListener *socket);
void  sfSocketSelector_addTcpSocket(sfSocketSelector *selector, sfTcpSocket *socket);
void  sfSocketSelector_addUdpSocket(sfSocketSelector *selector, sfUdpSocket *socket);
void  sfSocketSelector_removeTcpListener(sfSocketSelector *selector, sfTcpListener *socket);
void  sfSocketSelector_removeTcpSocket(sfSocketSelector *selector, sfTcpSocket *socket);
void  sfSocketSelector_removeUdpSocket(sfSocketSelector *selector, sfUdpSocket *socket);
void  sfSocketSelector_clear(sfSocketSelector *selector);
bool   sfSocketSelector_wait(sfSocketSelector *selector, Time timeout);
bool   sfSocketSelector_isTcpListenerReady(sfSocketSelector *selector, sfTcpListener *socket);
bool   sfSocketSelector_isTcpSocketReady(sfSocketSelector *selector, sfTcpSocket *socket);
bool   sfSocketSelector_isUdpSocketReady(sfSocketSelector *selector, sfUdpSocket *socket);

sfTcpListener * sfTcpListener_create();
void  sfTcpListener_destroy(sfTcpListener *listener);
void  sfTcpListener_setBlocking(sfTcpListener *listener, bool  blocking);
bool   sfTcpListener_isBlocking(sfTcpListener *listener);
ushort  sfTcpListener_getLocalPort(sfTcpListener *listener);
SocketStatus  sfTcpListener_listen(sfTcpListener *listener, ushort port);
SocketStatus  sfTcpListener_accept(sfTcpListener *listener, sfTcpSocket **connected);
sfTcpSocket * sfTcpSocket_create();
void  sfTcpSocket_destroy(sfTcpSocket *socket);
void  sfTcpSocket_setBlocking(sfTcpSocket *socket, bool  blocking);
bool   sfTcpSocket_isBlocking(sfTcpSocket *socket);
ushort  sfTcpSocket_getLocalPort(sfTcpSocket *socket);
IpAddress  sfTcpSocket_getRemoteAddress(sfTcpSocket *socket);
ushort  sfTcpSocket_getRemotePort(sfTcpSocket *socket);
SocketStatus  sfTcpSocket_connect(sfTcpSocket *socket, IpAddress host, ushort port, Time timeout);
void  sfTcpSocket_disconnect(sfTcpSocket *socket);
SocketStatus  sfTcpSocket_send(sfTcpSocket *socket, void *data, int size);
SocketStatus  sfTcpSocket_receive(sfTcpSocket *socket, void *data, int maxSize, int *sizeReceived);
SocketStatus  sfTcpSocket_sendPacket(sfTcpSocket *socket, sfPacket *packet);
SocketStatus  sfTcpSocket_receivePacket(sfTcpSocket *socket, sfPacket *packet);
sfUdpSocket * sfUdpSocket_create();
void  sfUdpSocket_destroy(sfUdpSocket *socket);
void  sfUdpSocket_setBlocking(sfUdpSocket *socket, bool  blocking);
bool   sfUdpSocket_isBlocking(sfUdpSocket *socket);
ushort  sfUdpSocket_getLocalPort(sfUdpSocket *socket);
SocketStatus  sfUdpSocket_bind(sfUdpSocket *socket, ushort port);
void  sfUdpSocket_unbind(sfUdpSocket *socket);
SocketStatus  sfUdpSocket_send(sfUdpSocket *socket, void *data, int size, IpAddress address, ushort port);
SocketStatus  sfUdpSocket_receive(sfUdpSocket *socket, void *data, int maxSize, int *sizeReceived, IpAddress *address, ushort *port);
SocketStatus  sfUdpSocket_sendPacket(sfUdpSocket *socket, sfPacket *packet, IpAddress address, ushort port);
SocketStatus  sfUdpSocket_receivePacket(sfUdpSocket *socket, sfPacket *packet, IpAddress *address, ushort *port);
uint  sfUdpSocket_maxDatagramSize();

struct sfFtpListingResponse;
struct sfFtpDirectoryResponse;
struct sfFtpResponse;
struct sfFtp;
struct sfHttpRequest;
struct sfHttpResponse;
struct sfHttp;
struct sfPacket;
struct sfSocketSelector;
struct sfTcpListener;
struct sfTcpSocket;
struct sfUdpSocket;