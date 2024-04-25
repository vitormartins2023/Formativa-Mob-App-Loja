import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // método para realizar a conversão do dado consumido da api



class leitura extends StatefulWidget {
  const leitura({super.key});

  @override
  State<leitura> createState() => _leituraState();
}

class _leituraState extends State<leitura> {
  String url = "http://10.109.83.18:3000/produtos"; // url que será consumida para realizar os métodos
   // async função assincrona
   List dado =[];
   var produtos = <Produto>[]; // variavel produtos está criando uma lista do tipo produto vazia
   //List<int> valor =[]; exemplo lista com numero inteiro 

  _getdado()async{
    // http.response método que cria uma variavel para resposta da api
    // await é porque a função é assincrona
    // método para fazer requisição get http.get
    // Uri.parse é necessário para o http.get
    http.Response resposta = await http.get(Uri.parse(url)); 
   // var dado =json.decode(resposta.body); // json decode faz a conversão do dado para json
   dado = json.decode(resposta.body);
   // List cria um dado do tipo lista para receber a informação json
   //Map<String,dynamic> dado = json.decode(resposta.body) as List;
   // print a lista de produtos
    for(int i =0; i<dado.length; i++)
    {
      print(dado[i]);
    }
    setState(() {
      // dado.map vai converter nosso json em uma lista
      produtos = dado.map((json) => Produto.fromJson(json)).toList();
    });
   
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("App http métodos"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Produtos:", style: TextStyle(fontSize: 18),),
            ElevatedButton(onPressed: _getdado, child: Text("Leitura")),             
            Column(
              // exibe os dados no text
              // map faz o mapeamento dos dados na lista
              children:produtos.map((produto)=>Text("${produto.nome} - R\$ ${produto.valor}",
              style: TextStyle(fontSize: 18),)).toList(),
            
            ),
          ],
        ),
      ),
    );
  }
}

class Produto{
  String id;
  String nome;
  String valor;
  Produto(this.id, this.nome, this.valor);
  // Função factory é a função responsável por decodificar o dado json consumido através da api
  factory Produto.fromJson(Map<String,dynamic>json){
    return Produto(json["id"],json["nome"],json["valor"]);

  }  
}
// Classe produto_n para armazenar a lista total de produtos
class Produto_n{
  List prod =[];
  Produto_n(this.prod);
}

