//
//  ViewController.swift
//  reachibilityTutorial
//
//  Created by Shawal's Mac on 24/12/2020.
//

import UIKit
import Network

class ViewController: UIViewController {

    @IBOutlet weak var notify: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async {
            self.monitorNetwork()
        }
       
    }

    
    func monitorNetwork()  {
        
        let monitor = NWPathMonitor()
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied{
                
                DispatchQueue.main.async {
                    self.notify.text = "Internet Connected"
                    self.notify.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                    self.view.backgroundColor = .systemGreen
                }
                
            }else{
                DispatchQueue.main.async {
                    self.notify.text = "inetnet not connected"
                    self.notify.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                    self.view.backgroundColor = .systemRed
                }
            }
        }
        
        let queue = DispatchQueue(label: "Network")
        monitor.start(queue: queue)
        
    }

}

