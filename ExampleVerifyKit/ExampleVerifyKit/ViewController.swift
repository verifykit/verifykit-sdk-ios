//
//  ViewController.swift
//  ExampleVerifyKit
//
//  Created by Can Koç on 7.11.2019.
//  Copyright © 2019 VerifyKit. All rights reserved.
//

import UIKit
import VerifyKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let verifyKit = VerifyKit(options: getVerifyKitOptions())
        let viewController = verifyKit.viewControllerForLogin()
        viewController.kitDelegate = self
        self.present(viewController, animated: true, completion: nil)
    }
    
    private func getVerifyKitOptions() -> VerifyKitOptions {
        var theme = VerifyKitTheme()
        theme.appName = "VerifyKit"
        theme.statusBarColor = .default
        let options = VerifyKitOptions(environment: .debug, theme: theme)
        return options
    }
}

extension ViewController: VerifyKitDelegate {
    
    func didSuccess(with sessionCode: String) {
        print("VerifyKitDelegate didSuccess with \(sessionCode)")
    }
    
    func didFail(with error: VerifyKitError) {
        print("VerifyKitDelegate didFail with \(error)")
    }
}
