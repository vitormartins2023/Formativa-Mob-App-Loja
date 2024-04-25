import 'package:flutter/material.dart';
import 'package:loja_flutter_1/mercado.dart';
import 'package:loja_flutter_1/cadastro.dart';
 
void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false,
  home: TelaLogin(),)
    );
}



class TelaLogin extends StatelessWidget {
TelaLogin({super.key});
 TextEditingController _user = TextEditingController();
 TextEditingController _passw = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Mercado"), backgroundColor: Colors.blue,
        
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
                       borderRadius: BorderRadius.circular(15) // borda do TextField
                      ),labelStyle: TextStyle(backgroundColor:Colors.white ),
                      hintText: "Insira seu login"),
                      controller: _user ,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextField(
                      keyboardType: TextInputType.number, // text field para a senha
                      decoration: InputDecoration(border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(15) // borda do TextField
                      ),labelStyle: TextStyle(backgroundColor:Colors.white ),
                      hintText: "Insira sua senha"),
                      controller: _passw ,
                      obscureText: true, // parametro para esconder a senha
                      obscuringCharacter: "*", // parametro para escolher o tipo de caracter para esconder a senha
                    ),
                  ),
      
                ],
              ),

            ),
    
          
          ElevatedButton(onPressed: (){
            if(_user.text == "admin" && _passw.text=="1234"){
              print('Login correto');
              Navigator.push(context,MaterialPageRoute(builder: (context) => mercado()));
            }
            
            else{print('Login correto');}
          },

          
          
           child: Text("Entrar")),
ElevatedButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => cadastro()),
    );
  },
  child: Text("Cadastro"),
),
        ],
      ),
    ),
    );
  }
}