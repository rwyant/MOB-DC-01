//
//  ViewController.swift
//  Open Weather
//
//  Created by Rob Wyant on 3/9/15.
//  Copyright (c) 2015 Rob Wyant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var weatherDescription: UILabel!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var temperatureDescription: UILabel!

    
    
    @IBAction func updateWeatherButton(sender: UIButton) {
        weatherDescription.text = "Loading..."
        temperatureDescription.text = ""
        
        Weather.retrieveWeather(cityTextField.text + "," + stateTextField.text) {(weather) -> Void in
            if weather.friendlyWeather != nil {self.weatherDescription.text = "The description of the weather in \(self.cityTextField.text) is '\(weather.friendlyWeather!)'."
        } else {self.weatherDescription.text = "Please check your city or state."}
            if weather.fahrenheit != nil {self.temperatureDescription.text = "The weather in \(self.cityTextField.text) is \(weather.fahrenheit!) degrees."}
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Weather.retrieveWeather("washington,dc") { (weather) -> Void in
            self.weatherDescription.text = "The description of the weather in Washington, DC is '\(weather.friendlyWeather!)'."
            self.temperatureDescription.text = "The weather in Washington, DC is \(weather.fahrenheit!) degrees."
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

