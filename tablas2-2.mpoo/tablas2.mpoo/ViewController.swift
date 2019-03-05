//
//  ViewController.swift
//  tablas2.mpoo
//
//  Created by Macbook on 2/26/19.
//  Copyright © 2019 Biblioteca. All rights reserved.
//

import UIKit
/// UITableViewDelegate  gestionar las tablas
class ViewController: UIViewController , UITableViewDataSource  , UITableViewDelegate{
   
    
    @IBOutlet weak var tabla: UITableView!
    var alumnos: [String] = ["Bricia ", "Pedro" , "juan ", "Martin" , "Valentina" , "loise"]
    override func viewDidLoad() {
        super.viewDidLoad()
        //vas a regresar un dato  PROTOCOLO
    }
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return alumnos.count
        }
      
         ///ETIQUTA numberOfRowsInSection section NUMERO DE REGLONES EN LA SECCION,POR DEFAL TIENE UNA SECCCIONES DIRECTORIO
        //indexPath UN INDICE DE NUMERO , FILA CUAL FUE TOCADO "UN OBJETIO"
        // Dame una  celda para el renglon en
        
        ///ETIQUETA cellForRowAt NUMEROS DE CELDAS
        //// GENERA UITableViewCell es un objeto
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath)
            ///Dame una celda par el lugar en donde  nos da el indice
           
           // cell.backgroundColor = .blue
            cell.textLabel!.text = alumnos[indexPath.row]
            return cell
            
            
        }
    //posicion del renglon
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let optionMenu = UIAlertController (title: "Bienvenido ", message: "Bienvenido al catalogo", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "cancelar", style: .cancel, handler: nil)
        //optionMenu.addAction(cancelAction)
        let okAction = UIAlertAction(title: "OK", style: .default){(action:UIAlertAction)-> Void in
         let cell = tableView.cellForRow(at: indexPath)
            // Tipos enumerados 
            if cell?.accessoryType.rawValue == 0{
             cell?.accessoryType = .checkmark
            }else{
                cell?.accessoryType = .none
            }
            self.performSegue(withIdentifier: "toSecondView", sender: self)
            
        }
        optionMenu.addAction(cancelAction)
        optionMenu.addAction(okAction)
        //debe de aparecer "biebenido " o alerte  en cuando selecciones 
        present(optionMenu, animated: true ,completion: nil )
        /// el controlador de los accion
        //print(indexPath.row)
    }
    /// erencia  Mandar el dato del renglon que seleciono el usuario
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier=="toSecondView"){
        let indexPath = tabla.indexPathForSelectedRow
        let secondView = segue.destination as? SecondViewController
        secondView?.dato = alumnos[(indexPath?.row)!]
        }
    }
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        print(identifier)
        return false
    }
        

    }
    




