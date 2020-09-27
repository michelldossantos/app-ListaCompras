//
//  UITableViewDataSourceExtension.swift
//  appListaCompras
//
//  Created by Michel dos Santos on 25/09/20.
//  Copyright © 2020 Mizia Lima. All rights reserved.
//

import Foundation
import UIKit

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrayItens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = arrayItens[indexPath.row].nome
        return cell
    }
    
    
}
