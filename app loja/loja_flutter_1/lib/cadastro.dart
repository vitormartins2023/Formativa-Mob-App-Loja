import 'package:flutter/material.dart';

class cadastro extends StatefulWidget {
  const cadastro({super.key});

  @override
  State<cadastro> createState() => _cadastroState();
}
int cont =0;

class _cadastroState extends State<cadastro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App mercado cadastro"), backgroundColor: Colors.blue,
        
      ),
body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200, // largura
              height: 200, // altura do size box
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0), // padding para ajustar o espaço entre os elementos
                    child: TextField(
                      keyboardType: TextInputType.name, // text field para o login
                      decoration: InputDecoration(border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(30) // borda do TextField
                      ),labelStyle: TextStyle(backgroundColor:Colors.white ),
                      hintText: "Insira seu login"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextField(
                      keyboardType: TextInputType.number, // text field para a senha
                      decoration: InputDecoration(border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(30) // borda do TextField
                      ),labelStyle: TextStyle(backgroundColor:Colors.white ),
                      hintText: "Insira sua senha"),
                      obscureText: true, // parametro para esconder a senha
                      obscuringCharacter: "*", // parametro para escolher o tipo de caracter para esconder a senha
                    ),
                  ),
      
                ],
              ),

            ),
    
          
          ElevatedButton(onPressed: (){
            
          },

          
          
           child: Text("Cadastrar")),
        ],
      ),
    ),
    );
  }
}
         