class TabulaturaView extends StatelessWidget{
  final Tabulatura tabulatura;
  TabulaturaView({Key key,@required this.tabulatura}):super(key :key);
  @override
  Widget build(BuildContext context){
    Widget build(BuildContext context) {
      getData();
      return Scaffold(
          appBar: AppBar(
          title: Text('Trova Tab'),
      ),
      body: Container(
  }
}