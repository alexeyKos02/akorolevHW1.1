//
//  ViewController.swift
//  akorolevPW1
//
//  Created by Yeva on 17.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var views: [UIView]!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func changeColorButtonPressed(_ sender: Any) {
        let button = sender as? UIButton
        button?.isEnabled = false
        var set = Set<UIColor>()
        while set.count < views.count {
            set.insert(
                UIColor(
                    red: .random(in: 0...1),
                    green: .random(in: 0...1),
                    blue: .random(in: 0...1),
                    alpha: 1
                )
            )
        }
        UIView.animate(withDuration: 2, animations: {
        for view in self.views {
        button?.setTitle("жди.", for: .normal)
        view.layer.cornerRadius = .random(in: 1...10)
        view.backgroundColor = set.popFirst()
        }
        })
        { completion in
            UIView.animate(withDuration: 2, animations: {
                for view in self.views {
                    view.frame.size.width = view.frame.size.width + .random(in:-40...40)
                    view.frame.size.height = view.frame.size.height + .random(in:-40...40)
                }
            })
            {completion in
                button?.isEnabled = true
                button?.setTitle("Нажми меня", for: .normal)
            }
        }
    }
}
