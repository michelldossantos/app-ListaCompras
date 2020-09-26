//
//  UITextFieldExtension.swift
//  appListaCompras
//
//  Created by Michel dos Santos on 18/09/20.
//  Copyright © 2020 Mizia Lima. All rights reserved.
//

import Foundation
import  UIKit

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        
        if textField == textFieldNome && !produtoExiste(){
            textFieldQuantidade.becomeFirstResponder()
            
        }else{
            textFieldQuantidade.text = String(getQuantidadeDoItem(nomeProduto: textFieldNome.text!))
            alteraNomeBotaoSalvar() // altera nome do botão salvar para Salvar Edição
            buttonExcluir.isEnabled = true // ativa botão excluit
        }
        
        return true
    }
    
}
