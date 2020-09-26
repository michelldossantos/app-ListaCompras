////
////  funcProduto.swift
////  appListaCompras
////
////  Created by Michel dos Santos on 25/09/20.
////  Copyright © 2020 Mizia Lima. All rights reserved.
////
//
//import Foundation
//
////MARK: Func Produto
//
//func criarProduto(item: Item) { // salva o produto no array
//    
//    arrayItens.append(item)
//    print(buttonSalvar.currentTitle!)
//    
//}
//
//func salvarOuEditar()  {
//    if !produtoExiste()  && buttonSalvar.currentTitle! != "Salvar Edição" { // se nao existe , chama a funçnao criar o produto
//        let item = Item(nome: textFieldNome.text!, quantidade: Int(textFieldQuantidade.text!)!)
//        criarProduto(item: item)
//        
//    }else{
//        if produtoExiste() && buttonSalvar.currentTitle! == "Salvar Edição"{ // salvar a
//            editarProduto()
//        }
//        
//    }
//    buttonSalvar.setTitle("Salvar", for: .normal)
//    listaProdutos()
//    limpaTextField()
//}
//
//func editarProduto() { // corrigir lógica
//    if buttonSalvar.currentTitle! == "Salvar Edição"{
//        for produto in arrayItens{
//            if produto.nome == textFieldNome.text{
//                produto.quantidade = Int(textFieldQuantidade.text!)!
//                print("Altera")
//            }
//            
//        }
//        //            print("Altera")
//    }
//    
//}
//
//func excluirProduto() {
//    if let itemExclui = textFieldNome.text {
//        for (index, produto) in arrayItens.enumerated(){
//            if itemExclui == produto.nome{
//                arrayItens.remove(at: index)
//            }
//            
//        }
//    }
//    limpaTextField()
//    listaProdutos()
//}
//
//func produtoExiste() -> Bool { // verifica se o nome digitado na TexfilNome possui na lista
//    
//    for item in arrayItens {
//        if item.nome == textFieldNome.text {
//            return true
//        }
//    }
//    return false
//}
//
//func listaProdutos() { // lista todos os itens da lista
//    tableViewList.reloadData()
//
//}
//
//func getQuantidadeDoItem(nomeProduto: String) -> Int{ // retorna a quantidade de um item do array
//    for item in arrayItens{
//        if item.nome == nomeProduto{
//            return item.quantidade
//        }
//    }
//    return 0
//}
