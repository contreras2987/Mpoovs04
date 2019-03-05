//
//  SecondViewController.swift
//  tablas2.mpoo
//
//  Created by Macbook on 2/26/19.
//  Copyright © 2019 Biblioteca. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    
    @IBOutlet weak var nombre: UILabel!
    
    var dato: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nombre.text = dato 

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func cerrar(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
