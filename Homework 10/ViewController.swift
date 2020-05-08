//
//  ViewController.swift
//  Homework 10
//
//  Created by Dioh Desuah on 5/8/20.
//  Copyright © 2020 Dioh Desuah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var favSport: UITextField!
    @IBOutlet weak var favColor: UITextField!
    @IBOutlet weak var favFood: UITextField!
    @IBOutlet weak var prefCandy: UITextField!
    @IBOutlet weak var results: UITextView!
    

    @IBAction func saveResults(_ sender: Any) {
        let csvLine:String =
        "\(favSport.text!), \(favColor.text!),\(favFood.text!),\(prefCandy.text!)"
        
        let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask,  true)
        let docDir:String=paths[0]
        let resultsFile:String=(docDir as NSString).appendingPathComponent("results.csv")
        
        
        
        
    if !FileManager.default.fileExists(atPath: resultsFile) {
            FileManager.default.createFile(atPath: resultsFile,contents: nil, attributes: nil)
        }
        let
        fileHandle:FileHandle=FileHandle (forUpdatingAtPath:resultsFile)!
        fileHandle.seekToEndOfFile()
        fileHandle.write(csvLine.data(using:String.Encoding.utf8)!)
        fileHandle.closeFile()
        
        favSport.text = ""
        favColor.text = ""
        favFood.text = ""
        prefCandy.text = ""
        
    }
   
    @IBAction func displayResults(_ sender: Any) {
        let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask,  true)
        let docDir:String=paths[0]
        let resultsFile:String=(docDir as NSString).appendingPathComponent("results.csv")
        
        if FileManager.default.fileExists(atPath: resultsFile){
            let fileHandle:FileHandle = FileHandle(forReadingAtPath:resultsFile)!
            let resultsData:String!=NSString(data: fileHandle.availableData, encoding:
                String.Encoding.utf8.rawValue)! as String
            fileHandle.closeFile()
            
            
            results?.text=resultsData
        }
        else{
            //file does not exist
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

