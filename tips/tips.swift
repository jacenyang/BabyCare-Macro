//
//  tips.swift
//  BabyCare-MC3
//
//  Created by Ivan Winata on 10/08/20.
//  Copyright © 2020 Ivan Winata. All rights reserved.
//

import UIKit

class tips: UIViewController {

    @IBOutlet weak var scrollViewtps: UIScrollView!
    @IBOutlet weak var titlelbl: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var textLbl: UILabel!
    @IBOutlet weak var test: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
         self.navigationController?.isNavigationBarHidden = false
        
        
        scrollViewtps.contentLayoutGuide.bottomAnchor.constraint(equalTo: test.bottomAnchor).isActive = true
        showTips()
        
        
        
    }

    
    func showTips(){
        titlelbl.text = "Demam"
        textLbl.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec malesuada velit in commodo facilisis. Quisque imperdiet finibus orci, ac efficitur odio accumsan vel. Duis eu lorem tempus, imperdiet felis quis, consequat ex. Nunc lobortis tellus sit amet est porta, id volutpat justo bibendum. Proin elementum lectus eu augue placerat ullamcorper. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus ac maximus diam. Aenean mollis fermentum ligula, id rutrum odio aliquam interdum. Fusce ultricies ornare sapien at ullamcorper. Fusce hendrerit scelerisque pretium. Pellentesque at dictum metus, nec dictum diam. Nam gravida turpis commodo augue tempor, nec ornare neque vulputate. Mauris at bibendum erat, id aliquam libero. . "
    }
    

    
    

}
