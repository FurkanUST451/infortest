import 'package:infotest/classes.dart';

class Texts {
  int _quesNo =0 ;
  List <Questions> _Bank=[
    Questions("Bilgi Testi Soruları", true),
    Questions("Titanik Gelimiş Geçmiş En Büyük Gemidir.",false),
    Questions("Dünyadaki Tavuk Sayısı İnsan Sayınısından Fazladır.",true),
    Questions("Kelebeklerin Ömrü Bir Gündür.", false),
    Questions("Dünya Düzdür.", false),
    Questions("Kaju Fıstığı Aslında Bir Meyvenin Sapıdır.", true),
    Questions("Fatih Sultan Mehmet Hiç Patates Yememiştir.", true),
  ];

   String textgetter () {
     return _Bank[_quesNo].text;
   }
   bool answergetter (){
     return _Bank[_quesNo].answer;
   }
   void nextques (){
     if(_quesNo+1<_Bank.length){
     _quesNo++;}
   }

   bool isover (){
     if(_quesNo+1>=_Bank.length){
       return true ;}
     else{return false;}
   }
  void restart (){
     _quesNo=0;
  }
}





