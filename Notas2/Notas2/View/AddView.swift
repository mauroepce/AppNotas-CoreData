//
//  AddView.swift
//  Notas2
//
//  Created by Birdi on 09-08-21.
//

import UIKit

class AddView: UIViewController {

    
    @IBOutlet weak var titulo: UITextField!
    @IBOutlet weak var nota: UITextView!
    @IBOutlet weak var fecha: UIDatePicker!
    @IBOutlet weak var boton: UIButton!
    
    var notas : Notas?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = notas != nil ? "Editar nota" : "Crear nota"
        titulo.text = notas?.titulo
        nota.text = notas?.nota
        fecha.date = notas?.fecha ?? Date()
        if notas == nil{
            validarText()
        }else{
            boton.backgroundColor = .systemTeal
            validarText2()
        }

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    
    @IBAction func guardar(_ sender: UIButton) {
        if notas != nil {
            
            Modelo.shared.editData(titulo: titulo.text ?? "", nota: nota.text, fecha: fecha.date, notas: notas!)
            navigationController?.popViewController(animated: true)
        }else{
            Modelo.shared.saveData(titulo: titulo.text ?? "", nota: nota.text, fecha: fecha.date)
            navigationController?.popViewController(animated: true)
        }
    }
        
    func validarText(){
            boton.isEnabled = false
            boton.backgroundColor = .systemGray2
            titulo.addTarget(self, action: #selector(validarTextField), for: .editingChanged)
        }
    
    func validarText2(){
  
        titulo.addTarget(self, action: #selector(validarTextField), for: .editingChanged)
    }
        
    @objc func validarTextField(sender: UITextField){
        guard let titulo2 = titulo.text, !titulo2.isEmpty else{
            boton.isEnabled = false
            boton.backgroundColor = .systemGray2
            return
        }
        boton.isEnabled = true
        boton.backgroundColor = .systemTeal
        
        }
    
    }

