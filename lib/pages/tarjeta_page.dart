import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:stripe_app/bloc/pagar/pagar_bloc.dart';
import 'package:stripe_app/models/tarjeta_credito.dart';
import 'package:stripe_app/widgets/total_pay_button.dart';


class TarjetaPage extends StatelessWidget {

  
  @override
  Widget build(BuildContext context) {

    final tarjeta = context.read<PagarBloc>().state.tarjeta;

    return Scaffold(
      appBar: AppBar(
        title: Text('Pagar'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios), 
          onPressed: (){
            context.read<PagarBloc>().add(OnDesactivarTarjeta());
            Navigator.pop(context);            
          }
        ),
      ),
      body: Stack(
        children: [
          Container(),
          Hero(
            tag: tarjeta.cardNumber,
              child: CreditCardWidget(
              height: 200,
              cardNumber: tarjeta.cardNumberHidden, 
              expiryDate: tarjeta.expiracyDate, 
              cardHolderName: tarjeta.cardHolderName, 
              cvvCode: tarjeta.cvv, 
              showBackView: false,
            ),
          ),
          Positioned(
            bottom: 0,
            child: TotalPayButton()        
          ),
          
        ],
      ),
   );
  }
}