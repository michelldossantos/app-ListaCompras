//
//  ViewController.swift
//  appListaCompras
//
//  Created by Mizia Lima on 9/16/20.
//  Copyright © 2020 Mizia Lima. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Variaveis
    var arrayItens = [Item]()
    
    
    
    //MARK: Outlets
    @IBOutlet weak var textFieldNome: UITextField!
    @IBOutlet weak var textFieldQuantidade: UITextField!
    
    @IBOutlet weak var buttonSalvar: UIButton!
    @IBOutlet weak var buttonExcluir: UIButton!
    
    @IBOutlet weak var labelProduto: UILabel!
    @IBOutlet weak var labelItens: UILabel!
    
    //MARK: Actions
    @IBAction func buttonSalvarAction(_ sender: Any) {
        if !produtoExiste(nome: textFieldNome.text!)  && buttonSalvar.currentTitle! != "Salvar Edição" { // se nao existe , chama a funçnao criar o produto
            let item = Item(nome: textFieldNome.text!, quantidade: Int(textFieldQuantidade.text!)!)
                criarProduto(item: item)
        }else{
            var produtoEditar  = nomeProdutoExistente()
            
//            editarProduto() // se não chama pra editar
//            buttonSalvar.setTitle("Salvar Edição", for: .normal)
        }
        
        listaProdutos()
        limpaTextField()
        buttonSalvar.setTitle("Salvar", for: .normal)
        
    }
    
    @IBAction func buttonLimparAction(_ sender: Any) {
    }
    
    @IBAction func buttonExcluirAction(_ sender: Any) {
        
    }
    
    func criarProduto(item: Item) { // salva o produto no array
    
            arrayItens.append(item)
            print(buttonSalvar.currentTitle!)

    }
    
    func editarProduto(produtoEditar:Item) { // corrigir l;ogica
        if buttonSalvar.currentTitle! == "Salvar Edição"{
        for produto in arrayItens{
            if produto.nome == textFieldNome.text{
                produto.nome = textFieldNome.text!
                produto.quantidade = Int(textFieldQuantidade.text!)!
            }
            
        }
        }
        
    }
    
    func alteraNomeBotao(){
        if buttonSalvar.currentTitle == "Salvar" {
            buttonSalvar.setTitle("Salvar Edição", for: .normal)
        }
        
        
    }
    
    func excluirProduto() {
        
    }
    
    
    func produtoExiste(nome: String) -> Bool { // verifica se o nome passado já possui na lista
        for item in arrayItens {
            if item.nome == nome {
                labelProduto.text = nome
//                textFieldQuantidade.text = String(item.quantidade)
                return true
            }
        }
        return false
    }
    
    func listaProdutos() { // lista todos os itens da lista
        labelItens.text = ""
        for item in arrayItens {
            labelItens.text = labelItens.text! + item.nome + " "
            //falta quebrar linha
        }
    }
    
    func limpaTextField() { // limpar
        textFieldQuantidade.text = ""
        textFieldNome.text = ""
    }
    
    func nomeProdutoExistente() -> Item!{ // retotorna o produto existente
        for produto in arrayItens{
            if produto.nome == textFieldNome.text{
               return produto
               }
           
    }
         return nil
    }
    
    
    func getQuantidadeDoItem(nomeProduto: String) -> Int{
        for item in arrayItens{
            if item.nome == nomeProduto{
                return item.quantidade
            }
        }
        return 0
    }
    

    
    
    //MARK: ViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFieldNome.delegate = self
        textFieldQuantidade.delegate = self
        
    }
}


extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
//        if textField == textFieldNome{ // apertar return é a texfildNome
//            if produtoExiste(nome: textFieldNome.text!){ // Verifica se o nome do produtp existe
//                let produto = nomeProdutoExistente() // produto agora contém o item existente
//                textFieldQuantidade.text = String (produto!.quantidade) // manda para o texfildQuantidade , a quntidade desse item
//                buttonSalvar.setTitle("Salvar Edição", for: .normal) // produto existe , já altera o nome do botão
//                    }
//            textFieldQuantidade.becomeFirstResponder()
//            }
//        else{
//                buttonSalvar.setTitle("Salvar", for: .normal)
//
//        }
//
//
//        return true
//    }
        
        
        if textField == textFieldNome && !produtoExiste(nome: textFieldNome.text!){
            textFieldQuantidade.becomeFirstResponder()
            
        }else{
            textFieldQuantidade.text = String(getQuantidadeDoItem(nomeProduto: textFieldNome.text!))
            alteraNomeBotao()
            
        }
    return true
}
    
}
