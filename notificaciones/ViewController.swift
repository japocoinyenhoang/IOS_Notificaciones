//
//  ViewController.swift
//  notificaciones
//
//  Created by Tardes on 17/5/21.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var txtTitulo: UITextField!
    
    
    @IBOutlet weak var txtDescripcion: UITextField!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func enviarNotificacionAction(_ sender: Any) {
        enviarNotificacion()
    }
    
    func enviarNotificacion() {
        //1. Crear el triger de la notificacion
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 6.0, repeats: false)
        
        //2. Crear el contenido de la notificacion
        let notificacion = UNMutableNotificationContent ()
        notificacion.title = "Título"
        notificacion.subtitle = "subtitulo"
        notificacion.body = "texto largo notificacion"
        notificacion.sound = UNNotificationSound.default
        
        //3. Creamos un request
        let request = UNNotificationRequest(identifier: "notificacion basica", content: notificacion, trigger: trigger)
        
        //declaramos un delegado
        UNUserNotificationCenter.current().delegate = self
        
        
        //4. Añadimos el request al centro de notificaciones
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        
        UNUserNotificationCenter.current().add(request) { (error) in
            if let error = error {
                print ("se ha producido un error: \(error)")
            }
        }
    }
}

extension ViewController: UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        completionHandler([.badge, .sound])
        
    }
    
}


