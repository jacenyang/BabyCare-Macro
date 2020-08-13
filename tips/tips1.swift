//
//  tips.swift
//  BabyCare-MC3
//
//  Created by Ivan Winata on 10/08/20.
//  Copyright © 2020 Ivan Winata. All rights reserved.
//

import UIKit

class tips1: UIViewController {

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
        titlelbl.text = "Penanganan demam pada bayi prematur"
        textLbl.text = """
        Hal-hal yang tidak boleh dilakukan selama bayi demam:
        
        *Jangan pernah menggunakan obat rumahan untuk menanggulangi demam pada bayi Anda yang bisa jadi hanya merupakan gejala lain seperti infeksi yang lebih serius
        
        *Jangan pernah mengompres bayi Anda dengan air dingin karena dapat menyebabkan bayi menggigil dan memicu kenaikan temperatur badan bayi
        
        *Jangan pernah berhenti menyusui bayi Anda karena bayi demam akan lebih cepat mengalami dehidrasi
        
        *Jangan pernah memberikan obat tanpa anjuran dari dokter
        
        *Jangan pernah membawa bayi Anda ke area public
        
        *Jangan pernah memakaikan pakaian yang terlalu tebal karena akan menimbulkan ketidaknyamanan dan mencegah penurunan panas pada bayi Anda
        
        *Jangan pernah malas membersihkan tangan Anda dan peralatan yang digunakan bayi Anda untuk mencegah penyebaran infeksi
        
        *Jangan pernah lupa memperhatikan hal detail pada bayi Anda seperti apakah bayi menangis tanpa air mata, popok yang relatif tidak basah, kering pada mulut karena hal-hal tersebut adalah gejala dehidrasi.
        """
    }
    

    
    

}
