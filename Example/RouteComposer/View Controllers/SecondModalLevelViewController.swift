//
// Created by Eugene Kazaev on 22/01/2018.
//

import Foundation
import RouteComposer
import UIKit

class SecondModalLevelViewController: UIViewController, ExampleAnalyticsSupport {

    let screenType = ExampleScreenTypes.secondLevelModal

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Second modal level"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneTapped))
    }

    @IBAction func goToColorTapped() {
        try? router.navigate(to: ConfigurationHolder.configuration.colorScreen, with: "FF0000")
    }

    @IBAction func goToHomeTapped() {
        try? router.navigate(to: ConfigurationHolder.configuration.homeScreen, with: nil)
    }

    @IBAction func goToMinskTapped() {
        try? router.navigate(to: CitiesConfiguration.cityDetail(cityId: 18), animated: false)
    }

    @objc func doneTapped() {
        dismiss(animated: true)
    }

}
