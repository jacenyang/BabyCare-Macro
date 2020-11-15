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
    
    @IBOutlet weak var judulLabel: UILabel!
    @IBOutlet weak var pengertianLabel: UILabel!
    @IBOutlet weak var harusLabel: UILabel!
    @IBOutlet weak var janganLabel: UILabel!
    @IBOutlet weak var penyakitLabel: UILabel!    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        scrollViewtps.contentLayoutGuide.bottomAnchor.constraint(equalTo: penyakitLabel.bottomAnchor).isActive = true
        showTips()
        
    }

    
    func showTips(){
        judulLabel.text = "Demam Pada Bayi Prematur"
        
        pengertianLabel.text = "Demam adalah keadaan ketika suhu badan lebih dari 37.5 ˚C dan dapat menjadi gejala dari masalah yang lebih serius."
        
        harusLabel.text = """
        1. Dapatkan penanganan intensif dari dokter.
        2. Cuci tangan dan peralatan yang digunakan untuk mencegah penyebaran infeksi
        3. Perhatikan tanda-tanda dehidrasi pada bayi seperti menangis tanpa air mata dan mulut yang kering.
        """

        janganLabel.text = """
        1. Menggunakan obat rumahan
        2. Mengompres bayi dengan air dingin karena menyebabkan bayi menggigil
        3. Berhenti menyusui bayi karena bayi demam lebih cepat mengalami dehidrasi
        4. Memberi obat tanpa anjuran dokter
        5. Membawa bayi ke area umum
        6. Memakaikan pakaian yang tebal karena mencegah penurunan panas
        """
        
        penyakitLabel.text = """
        Demam pada bayi biasanya terkait dengan infeksi akibat penyakit berikut:
        1. Infeksi pada saluran pernapasan atas
        2. Pneumonia
        3. Infeksi Telinga
        4. Flu
        5. Pilek
        6. Radang tenggorakan
        7. Infeksi saluran kencing
        8. Meningitis

        """
    }
    

    
    

}
