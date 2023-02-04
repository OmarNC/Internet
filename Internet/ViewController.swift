//
//  ViewController.swift
//  Internet
//
//  Created by Omar Nieto on 03/02/23.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var activityIndicatior: UIActivityIndicatorView!
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        /*
        let monitorRed = NWPathMonitor()
        
        // ...
        
        
        monitorRed.start(queue: DispatchQueue.global())
        
        monitorRed.pathUpdateHandler = { pathMonitor in
            var mensaje = ""
            
            if  pathMonitor.status == .satisfied {
                mensaje = "Tu dispositivo se ha conectado a Internet con "
                if  pathMonitor.usesInterfaceType(.wifi) {
                    mensaje = mensaje + "Wifi"
                } else if pathMonitor.usesInterfaceType(.cellular) {
                    mensaje = mensaje + "datos de celular"
                } else if pathMonitor.usesInterfaceType(.wiredEthernet) {
                    mensaje = mensaje + "cable Ethernet"
                } else if pathMonitor.usesInterfaceType(.other) {
                    mensaje = mensaje + "dispositivo desconocido"
                }
            } else {
                mensaje = "Tu dispositivo no tiene conexión a Internet"
            }
            
            let ac = UIAlertController(title: "Conexión a Internet", message: mensaje, preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default){
                alertaction in
            }
            ac.addAction(action)
            DispatchQueue.main.async {
                self.present(ac, animated: true)
                self.activityIndicatior.stopAnimating()
            }
            
         
        } */
        
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        let ad = UIApplication.shared.delegate as! AppDelegate
        
        var mensaje = ""
        
        if ad.hasInternetAccess {
            mensaje = "La conexión a intener es: " + ad.connetionType
            
            //Se carga el contenido HTML
            //1. Creamos la URL
            let urlString = "https://manualweb.net/html/introduccion-html/"
            guard let url = URL(string: urlString) else { return }
            
            //
            guard let url2 =  Bundle.main.url(forResource: "entrenamiento_anaeróbico", withExtension: "pdf") else { return }
            
            //2. Creamos la petición para enviar
            let request = URLRequest(url: url2)
            webView.load(request)
            
            
        } else {
            mensaje = "No hay conexión a Intenet"
        }
        
        
        let ac = UIAlertController(title: "Conexión a Internet", message: mensaje, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default){
            alertaction in
        }
        ac.addAction(action)
       // DispatchQueue.main.async {
            self.present(ac, animated: true)
            self.activityIndicatior.stopAnimating()
       // }
    }

}

