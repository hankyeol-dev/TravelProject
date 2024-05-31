//
//  RestaurantMapViewController.swift
//  TravelProject
//
//  Created by 강한결 on 5/31/24.
//

import UIKit
import MapKit

class RestaurantMapViewController: UIViewController {
    
    static let id = "RestaurantMapViewController"
    
    var mapDatas: [(String, Double, Double)] = [("서울역", 37.554921, 126.970345)]
    var presentAddressTuple: (String, Double, Double) = ("서울역", 37.554921, 126.970345)

    @IBOutlet var restaurantMapView: MKMapView!
    @IBOutlet var inputFieldBackView: UIView!
    @IBOutlet var inputTextField: UITextField!
    @IBOutlet var justImageView: UIImageView!
    let addressPickerView = UIPickerView();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureMapView();
        configureTextInputField()
    }

    func configureTextInputField() {
        justImageView.tintColor = .systemGreen
        addressPickerView.delegate = self

        inputFieldBackView.backgroundColor = .clear
        inputTextField.backgroundColor = .white
        inputTextField.tintColor = .clear
        
        inputTextField.inputView = addressPickerView
        inputTextField.text = presentAddressTuple.0
    }
    
    func mappedMapData(_ data: [Restaurant]) {
        mapDatas = _map(data, cb: { ($0.name, $0.latitude, $0.longitude) });
    }
    
    func mappedPresentAddress(_ data: (String, Double, Double)) {
        presentAddressTuple = data;
    }
}

extension RestaurantMapViewController: MKMapViewDelegate {
    func configureMapView() {
        restaurantMapView.delegate = self
        
        restaurantMapView.setRegion(
            MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: presentAddressTuple.1, longitude: presentAddressTuple.2),
                latitudinalMeters: 100, longitudinalMeters: 100)
            , animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: presentAddressTuple.1, longitude: presentAddressTuple.2)
        annotation.title = presentAddressTuple.0
    
        restaurantMapView.addAnnotation(annotation)
    }
    
    func goToThatAddress(_ addressData: (String, Double, Double)) {
        restaurantMapView.setRegion(
            MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: addressData.1, longitude: addressData.2),
                latitudinalMeters: 100, longitudinalMeters: 100)
            , animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: addressData.1, longitude: addressData.2)
        annotation.title = addressData.0
    
        restaurantMapView.addAnnotation(annotation)
    }
}

extension RestaurantMapViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return mapDatas.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return mapDatas[row].0
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        inputTextField.text = mapDatas[row].0
        presentAddressTuple = (mapDatas[row].0, mapDatas[row].1, mapDatas[row].2)
        
        goToThatAddress(presentAddressTuple)
        
        view.endEditing(true)
    }
}
