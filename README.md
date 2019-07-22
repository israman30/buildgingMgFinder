# Hob Lux

The apartment finder application is exclusive for luxury buildings in Hoboken, NJ.

> MapKit, Collection view, Geo location, MK annotation

```Swift
var pin: AnnotationPin! 
MKMapViewDelegate, CLLocationManagerDelegate
```

<p align="center">
    <img src="/img/main.png" width="250"> <img src="/img/two.png" width="250"> <img src="/img/map.png" width="250">
</p>

```Swift
func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
// Create an annotation
    guard let annotation = annotation as? AnnotationPin else { return nil }
    // Give an id to the MKAnnotaitonView
    let identifier = "marker"
    var view: MKMarkerAnnotationView
    // Use the MkAnnotationView checking with id
    if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
as? MKMarkerAnnotationView {
        dequeuedView.annotation = annotation
        view = dequeuedView
        } else {
        // Popup the view if exits one + add a button
        view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
        view.canShowCallout = true
        view.calloutOffset = CGPoint(x: -5, y: 5)
        view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
    return view
}

// MARK: - Open marker annotation view with the Map App
func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView,
calloutAccessoryControlTapped control: UIControl) {
let location = view.annotation as! AnnotationPin
let launchOptions = [
MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving
]
location.mapItem().openInMaps(launchOptions: launchOptions)
}
```

Displaying a list of buildings where the user can select and navigate a gallery of photos.

> Collection view, Paging, Scrollview

<p align="center">
    <img src="/img/list.png" width="250"> <img src="/img/page.png" width="250"> <img src="/img/four.png" width="250">
</p>

## Thecnology

- Xcode & Swift

- UIKit & MapKit

## Author
-  [Israel Manzo ®](http://israelmanzo.com)
- [LinkedIn](https://www.linkedin.com/in/israel-manzo/)
- [Twitter](https://twitter.com/israman30)

