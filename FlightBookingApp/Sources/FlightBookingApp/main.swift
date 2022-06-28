import PerfectLib
import PerfectHTTP
import PerfectHTTPServer

//Creating object
let server = HTTPServer()

//Assingning Port.
//Server will listen '8090' port
server.serverPort = 8090

server.addRoutes(setupRouter())

//Start Server
do {
    try server.start()
} catch let err {
    print("Error starting server \(err.localizedDescription)")
}
