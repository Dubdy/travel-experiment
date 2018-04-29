import TravellerApp
import Service
import Vapor

do {
    var config = Config.default()
    var env = try Environment.detect()
    var services = Services.default()
    
    try TravellerApp.configure(&config, &env, &services)
    
    let app = try Application(
        config: config,
        environment: env,
        services: services
    )
    
    try TravellerApp.boot(app)
    
    try app.run()
} catch {
    print("Top-level failure: \(error)")
}
