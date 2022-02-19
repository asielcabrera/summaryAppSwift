import Fluent
import FluentMySQLDriver
import Vapor

// configures your application
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

//albertobepet:xZPX1231231230XPZx@bepet.xyz/bepetgps
    
//    app.databases.use(.mysql(
//        hostname: Environment.get("DATABASE_HOST") ?? "bepet.xyz",
//        port: Environment.get("DATABASE_PORT").flatMap(Int.init(_:)) ?? MySQLConfiguration.ianaPortNumber,
//        username: Environment.get("DATABASE_USERNAME") ?? "albertobepet",
//        password: Environment.get("DATABASE_PASSWORD") ?? "xZPX1231231230XPZx",
//        database: Environment.get("DATABASE_NAME") ?? "bepetgps"
//    ), as: .mysql)
    configureDatabase(app: app)

    app.migrations.add(CreateTodo())

    // register routes
    try routes(app)
}

func configureDatabase(app: Application) {
    let host = Environment.get("DATABASE_HOST") ?? "bepet.xyz"
    let port = Environment.get("DATABASE_PORT").flatMap(Int.init(_:)) ?? MySQLConfiguration.ianaPortNumber
    let user = Environment.get("DATABASE_USERNAME") ?? "albertobepet"
    let pass = Environment.get("DATABASE_PASSWORD") ?? "xZPX1231231230XPZx"
    let name = Environment.get("DATABASE_NAME") ?? "bepetgps"
    
    app.databases.use(.mysql(hostname: host, port: port, username: user, password: pass, database: name, tlsConfiguration: .forClient(certificateVerification: .none)), as: .mysql)
}
