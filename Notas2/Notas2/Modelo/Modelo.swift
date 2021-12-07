//
//  Modelo.swift
//  Notas2
//
//  Created by Birdi on 09-08-21.
//

import Foundation
import CoreData
import UIKit


class Modelo {
    
    public static let shared = Modelo()
    
    func contexto() -> NSManagedObjectContext {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        return delegate.persistentContainer.viewContext
    }
    
    func saveData(titulo: String, nota: String, fecha: Date){
        
        let context = contexto()
        let entityNotas = NSEntityDescription.insertNewObject(forEntityName: "Notas", into: context) as! Notas
        entityNotas.titulo = titulo
        entityNotas.nota = nota
        entityNotas.fecha = fecha
        
        do {
            try context.save()
            print("guardó")
        } catch let error as NSError {
            print("no guardó", error.localizedDescription)
        }
        
    }
    
    func editData(titulo: String, nota: String, fecha: Date, notas: Notas){
        
        let context = contexto()
        notas.setValue(titulo, forKey: "titulo")
        notas.setValue(nota, forKey: "nota")
        notas.setValue(fecha, forKey: "fecha")
        
        do {
            try context.save()
            print("editó")
        } catch let error as NSError {
            print("no editó", error.localizedDescription)
        }
        
    }
    
}
