import Routing
import Vapor
import Traveller

/// Called after your application has initialized.
///
/// [Learn More →](https://docs.vapor.codes/3.0/getting-started/structure/#bootswift)

public func boot(_ app: Application) throws {
    try Traveller.boot(app)
}
