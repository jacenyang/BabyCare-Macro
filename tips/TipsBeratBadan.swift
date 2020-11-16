//
//  File.swift
//  BabyCare-MC3
//
//  Created by Muhammad Syabran on 17/11/20.
//  Copyright © 2020 Ivan Winata. All rights reserved.
//

import UIKit

class TipsBeratBadan: ViewController {
    
    @IBOutlet weak var funfactLabel: UILabel!
    @IBOutlet weak var caraLabel: UILabel!
    @IBOutlet weak var tahapanLabel: UILabel!
    @IBOutlet weak var isiLabel: UILabel!
    
    @IBOutlet weak var kebutuhanLabel: UILabel!
    @IBOutlet weak var kebutuhan1Label: UILabel!
    @IBOutlet weak var isiButuh1Label: UILabel!
    
    @IBOutlet weak var kebutuhan2Label: UILabel!
    @IBOutlet weak var isiButuh2Label: UILabel!
    
    @IBOutlet weak var kebutuhan3Label: UILabel!
    @IBOutlet weak var isiButuh3Label: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        berat() 
        
    }
    
    @IBAction func btnTutupTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func berat() {
        funfactLabel.text = "Apabila berat pada bayi prematur di bawah 1500 gram, angka kematian bisa mencapai 25 hingga 50%."
        caraLabel.text = "Cara menambahkan berat badan bayi prematur"
        tahapanLabel.text = "Memberikan asupan ASI"
        isiLabel.text = "Sama seperti bayi dengan waktu kelahiran normal, bayi prematur pun juga perlu asupan ASI dari sang ibu. Tidak hanya untuk menambah nutrisi, ASI juga dapat melindungi bayi dari infeksi. Kebanyakan bayi prematur membutuhkan 8 sampai 10 kali menyusui dalam sehari. Dalam kasus tertentu, bayi prematur juga bisa mendapatkan asupan susu formula khusus apabila ASI belum juga keluar dari payudara. Susu formula khusus untuk bayi prematur diklaim dapat memberikan kandungan yang dibutuhkan tubuh mirip dengan ASI. Idealnya, berat pada tubuh bayi prematur akan bertambah dan sesuai dengan berat lahir normal sekitar 14 hari setelah dilahirkan. Namun dalam kondisi tertentu, waktunya bisa juga bisa lebih lama. Setidaknya, berat pada bayi prematur dapat bertambah 5 gram dalam sehari untuk anak dengan usia kelahiran 24 minggu. Sementara itu, penambahan berat pada tubuh bayi prematur umumnya sebanyak 20 gram sehari untuk bayi dengan usia kelahiran 33 minggu. Bagaimanapun, berat badan bayi prematur setidaknya akan bertambah sekitar 15 gram per hari atau 112 hingga 200 gram setiap minggunya sampai berusia 4 bulan."
        
        kebutuhanLabel.text = "Nutrisi Utama yang Dibutuhkan Bayi Prematur"
        kebutuhan1Label.text = "Protein"
        isiButuh1Label.text = "ASI dari wanita yang melahirkan bayi prematur mengandung lebih banyak protein, yaitu 35% atau 0,7 gram lebih banyak daripada kandungan protein pada ASI dari wanita yang melahirkan bayi cukup bulan. Protein pada ASI juga lebih mudah dicerna oleh sistem pencernaan bayi prematur yang masih belum berkembang dengan sempurna."
        
        kebutuhan2Label.text = "Lemak"
        isiButuh2Label.text = "Kandungan lemak pada ASI dari wanita yang melahirkan bayi prematur juga lebih banyak. Kadarnya 23% lebih tinggi daripada kadar lemak dalam ASI normal. Kadar lemak yang tinggi pada ASI bayi prematur ini dibutuhkan untuk mempercepat pertambahan berat badan bayi prematur."
        
        kebutuhan3Label.text = "Karbohidrat"
        isiButuh3Label.text = "Karbohidrat pada ASI bayi prematur juga terbilang tinggi. Tingginya kadar karbohidrat pada ASI bayi prematur ini berguna untuk membantu penyerapan mineral, seperti magnesium, fosfor, dan kalsium. Karbohidrat kompleks pada ASI juga berperan menghambat perlekatan bakteri jahat pada dinding usus. Tidak hanya itu, ASI dari bayi prematur juga mengandung lebih banyak sistein, taurin, dan lipase yang bisa meningkatkan penyerapan beragam nutrisi lainnya dari ASI. Karena kandungannya yang memang sangat ideal untuk mengoptimalkan pertumbuhan bayi, ASI merupakan sumber nutrisi utama untuk bayi prematur."
    }
}
