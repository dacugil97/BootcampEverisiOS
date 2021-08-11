//
//  MapTableViewCell.swift
//  GrouponForEveris
//
//  Created by David Cuñado Gil on 11/8/21.
//

import UIKit
import MapKit

protocol UITableViewCellProtocol {
    func configCell(model: CardViewModel)
}

class MapTableViewCell: UITableViewCell, ReuseIdentifierView {
    
    // MARK: - IBOutlets
    @IBOutlet weak var myMapView: MKMapView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension MapTableViewCell: UITableViewCellProtocol {
    func configCell(model: CardViewModel) {
        // Creamos un punto en el mapa
        let latitud: CLLocationDegrees = model.division?.lat ?? 0
        let longitud: CLLocationDegrees = model.division?.lng ?? 0
        
        // Creamos el zoom
        let latDelta: CLLocationDegrees = 0.001
        let lngDelta: CLLocationDegrees = 0.001
        
        // Unimos punto y zoom
        let location: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitud, longitude: longitud)
        let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lngDelta)
        let region: MKCoordinateRegion = MKCoordinateRegion(center: location, span: span)
        
        self.myMapView.setRegion(region, animated: false)
        
        // Colocamos la chincheta
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = model.division?.name
        annotation.subtitle = "Aqui david"
        
        self.myMapView.addAnnotation(annotation)
    }
    
    
}
