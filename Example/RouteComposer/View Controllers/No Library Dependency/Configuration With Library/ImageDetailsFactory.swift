//
// Created by Eugene Kazaev on 25/02/2018.
//

import Foundation
import ImageDetailsController
import RouteComposer
import UIKit

class ImageDetailsFactory: Factory {

    typealias ViewController = ImageDetailsViewController

    typealias Context = String

    weak var delegate: ImageDetailsControllerDelegate?

    init(delegate: ImageDetailsControllerDelegate) {
        self.delegate = delegate
    }

    func build(with context: String) throws -> ImageDetailsViewController {
        guard let viewController = UIStoryboard(name: "Images", bundle: Bundle.main)
            .instantiateViewController(withIdentifier: "ImageDetailsViewController") as? ViewController else {
            throw RoutingError.compositionFailed(.init("Could not load ImagesViewController from the storyboard."))
        }
        viewController.delegate = delegate
        viewController.imageID = context
        viewController.imageFetcher = ImageDetailsFetcherImpl()
        return viewController
    }

}
