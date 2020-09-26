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
    
    @IBOutlet weak var tableViewList: UITableView!
    //MARK: Actions
    @IBAction func buttonSalvarAction(_ sender: Any) {
        salvarOuEditar()
    }
    
    @IBAction func buttonLimparAction(_ sender: Any) {
        limpaTextField()
    }
    
    @IBAction func buttonExcluirAction(_ sender: Any) {
        excluirProduto()
    }
    
    //MARK: Func Produto
    
    func criarProduto(item: Item) { // salva o produto no array
        
        arrayItens.append(item)
        print(buttonSalvar.currentTitle!)
        
    }
    
    func salvarOuEditar()  {
        if !produtoExiste()  && buttonSalvar.currentTitle! != "Salvar Edição" { // se nao existe , chama a funçnao criar o produto
            let item = Item(nome: textFieldNome.text!, quantidade: Int(textFieldQuantidade.text!)!)
            criarProduto(item: item)
            
        }else{
            if produtoExiste() && buttonSalvar.currentTitle! == "Salvar Edição"{ // salvar a
                editarProduto()
            }
            
        }
        buttonSalvar.setTitle("Salvar", for: .normal)
        listaProdutos()
        limpaTextField()
    }
    
    func editarProduto() { // corrigir lógica
        if buttonSalvar.currentTitle! == "Salvar Edição"{
            for produto in arrayItens{
                if produto.nome == textFieldNome.text{
                    produto.quantidade = Int(textFieldQuantidade.text!)!
                    print("Altera")
                }
                
            }
            //            print("Altera")
        }
        
    }
    
    func excluirProduto() {
        if let itemExclui = textFieldNome.text {
            for (index, produto) in arrayItens.enumerated(){
                if itemExclui == produto.nome{
                    arrayItens.remove(at: index)
                }
                
            }
        }
        limpaTextField()
        listaProdutos()
    }
    
    func produtoExiste() -> Bool { // verifica se o nome digitado na TexfilNome possui na lista
        
        for item in arrayItens {
            if item.nome == textFieldNome.text {
                return true
            }
        }
        return false
    }
    
    func listaProdutos() { // lista todos os itens da lista
        tableViewList.reloadData()

    }
    
    func getQuantidadeDoItem(nomeProduto: String) -> Int{ // retorna a quantidade de um item do array
        for item in arrayItens{
            if item.nome == nomeProduto{
                return item.quantidade
            }
        }
        return 0
    }
    
    //MARK: Botão Salvar
    
    func alteraNomeBotaoSalvar(){
        if buttonSalvar.currentTitle == "Salvar" {
            buttonSalvar.setTitle("Salvar Edição", for: .normal)
        }
        
        
    }
    
    
    //MARK: Texfield
    func limpaTextField() { // limpar
        textFieldQuantidade.text = ""
        textFieldNome.text = ""
        buttonExcluir.isEnabled = false
        buttonSalvar.setTitle("Salvar", for: .normal)
    }
    
    //TODO: verificar a texfield
    
    func verificaTextField(){
        
    }
    
    
    
    
    //MARK: ViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonExcluir.isEnabled = false // deixa o botão excluir desabilitado
        textFieldNome.delegate = self
        textFieldQuantidade.delegate = self
        tableViewList.delegate = self
        tableViewList.dataSource = self
        
    }
    
}




extension ViewController: UITableViewDelegate{
    
}

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


