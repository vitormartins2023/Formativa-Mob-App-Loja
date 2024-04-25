import 'package:flutter/material.dart';
import 'package:loja_flutter_1/produtos.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class mercado extends StatefulWidget {
  const mercado({super.key});

  @override
  State<mercado> createState() => _mercadoState();
}
int cont =0;

class _mercadoState extends State<mercado> {
  TextEditingController nome = TextEditingController();
  TextEditingController valor = TextEditingController();
  TextEditingController quantidade = TextEditingController();

  _postprodutos(){
    String url = "http://10.109.83.18:3000/produtos";

    Map<String,dynamic>msg2={
      "nome":nome.text,
      "valor":valor.text,
      "quantidade":quantidade.text,
    };
    print("${nome.text}, ${valor.text}, ${quantidade.text}");
    http.post(
      Uri.parse(url),
      headers: <String,String>{
        'Content-type':'application/json; charset=UTF-8',
      },
      //body:jsonEncode(mensagem) , // transforma a mensagem para o formato json para fazer o post
      body: jsonEncode(msg2),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Mercado"),
      ),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 300, // largura
              height: 400, // altura do size box
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  
                  
                  Padding(
                    padding: const EdgeInsets.all(12.0), // padding para ajustar o espaço entre os elementos
                    child: TextField(
                      keyboardType: TextInputType.name, // text field para o login
                      decoration: InputDecoration(border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(15) // borda do TextField
                      ),labelStyle: TextStyle(backgroundColor:Colors.white ),
                      hintText: "Digite o nome do produto"),
                      controller: nome
                    ),
                  ),
                  
                  
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextField(
                      keyboardType: TextInputType.number, // text field para a senha
                      decoration: InputDecoration(border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(15) // borda do TextField
                      ),labelStyle: TextStyle(backgroundColor:Colors.white ),
                      hintText: "Digite o valor do produto"),
                      controller: valor // parametro para escolher o tipo de caracter para esconder a senha
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextField(
                      keyboardType: TextInputType.number, // text field para a senha
                      decoration: InputDecoration(border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(15) // borda do TextField
                      ),labelStyle: TextStyle(backgroundColor:Colors.white ),
                      hintText: "Digite a quantidade do produto"), // parametro para escolher o tipo de caracter para esconder a senha
                     controller: quantidade
                    ),
                   
                  ),
      
                ],
              ),

            ),
    
          
          ElevatedButton(onPressed: _postprodutos, child: Text("Cadastro")),
           ElevatedButton(onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => leitura()),
           );
  },
  child: Text("Produtos"),
),
        ],
      ),
    ),
    );
  }
}
         

              
         