//
// Created by Eugene Kazaev on 2019-08-12.
//

#if os(iOS)

import Foundation
import UIKit

public extension Router {

    // MARK: Navigation methods for the Destination instance

    /// Navigates the application to the view controller configured in `Destination` with the `Context` provided.
    ///
    /// - Parameters:
    ///   - destination: `Destination` instance.
    ///   - animated: if true - the navigation should be animated where it is possible.
    ///   - completion: completion block.
    func navigate<VC: UIViewController, C>(to destination: Destination<VC, C>, animated: Bool = true, completion: ((_: RoutingResult) -> Void)? = nil) throws {
        try navigate(to: destination.step, with: destination.context, animated: animated, completion: completion)
    }

    /// Navigates the application to the view controller configured in `Destination` with the `Context` provided.
    /// Method does not throw errors, but propagates them to the completion block.
    ///
    /// - Parameters:
    ///   - destination: `Destination` instance.
    ///   - animated: if true - the navigation should be animated where it is possible.
    ///   - completion: completion block.
    func commitNavigation<VC: UIViewController, C>(to destination: Destination<VC, C>, animated: Bool = true, completion: ((_: RoutingResult) -> Void)? = nil) {
        do {
            try navigate(to: destination, animated: animated, completion: completion)
        } catch {
            completion?(.failure(error))
        }
    }

}

#endif
