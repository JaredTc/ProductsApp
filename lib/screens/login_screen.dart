import 'package:flutter/material.dart';
import 'package:products_app/widgets/auth_background.dart';
import 'package:products_app/widgets/card_container.dart';

import '../ui/input_decorations.dart';


class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox( height: 220,),
              CardContainer(child: Column(
                children: [

                  SizedBox( height: 20,),
                  Text('Login',
                  style: Theme.of(context).textTheme.headline4,),
                  const SizedBox( height: 30,),
                  _LoginForm()
                ],
              ) ),
              const SizedBox( height: 50,),
              TextButton(onPressed: (){

              },
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all( Colors.indigo.withOpacity(0.1)),
                  shape: MaterialStateProperty.all( StadiumBorder() )
                ),
                child: const Text('Create a new account', style: TextStyle( fontSize: 18, color: Colors.black87 ),
                )
                )
            ],
          ),
        ),
      )
   );
  }
}

class _LoginForm extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        child: Column(
          children: [
                    TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                hintText: 'john.doe@gmail.com',
                labelText: 'Email',
                prefixIcon: Icons.alternate_email_rounded
              ),
              onChanged: ( value ) {},
              // loginForm.email = value,
              validator: ( value ) {

                  String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                  RegExp regExp  = new RegExp(pattern);
                  
                  return regExp.hasMatch(value ?? '')
                    ? null
                    : 'write the correct email';

              },
            ),
            const SizedBox( height: 30 ),
            TextFormField(
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                hintText: '*****',
                labelText: 'password',
                prefixIcon: Icons.password
              ),
              onChanged: ( value ) {},
              //  => loginForm.password = value,
              validator: ( value ) {

                  return ( value != null && value.length >= 6 ) 
                    ? null
                    : 'the password should be the 6 characters';                                    
                  
              },
            ),
            const SizedBox( height: 30 ),
             MaterialButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              disabledColor: Colors.grey,
              elevation: 0,
              color: Colors.deepPurple,
              child: Container(
                padding: EdgeInsets.symmetric( horizontal: 80, vertical: 15),
                child: Text('Sign In',style: TextStyle(color: Colors.white), ),
                // child: Text(
                //   loginForm.isLoading 
                //     ? 'Espere'
                //     : 'Ingresar',
                //   style: TextStyle( color: Colors.white ),
                // )
              ),
              onPressed: (){},
              // onPressed: loginForm.isLoading ? null : () async {
                
              //   FocusScope.of(context).unfocus();
              //   final authService = Provider.of<AuthService>(context, listen: false);
                
              //   if( !loginForm.isValidForm() ) return;

              //   loginForm.isLoading = true;


              //   // TODO: validar si el login es correcto
              //   final String? errorMessage = await authService.login(loginForm.email, loginForm.password);

              //   if ( errorMessage == null ) {
              //     Navigator.pushReplacementNamed(context, 'home');
              //   } else {
              //     // TODO: mostrar error en pantalla
              //     // print( errorMessage );
              //     NotificationsService.showSnackbar(errorMessage);
              //     loginForm.isLoading = false;
              //   }
              // }
            )

          ],
        ),
      ),
    );
  }
}