import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() => runApp(
  MaterialApp(
    title: 'Accediendo a la Camara',
    home: Home(),
    theme: ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.red,
      accentColor: Colors.red
    )
  )
);

class Home extends StatefulWidget {
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {

  /* BEGING Declarations *************************************************************************/

  var picture;

  /* BEGING Funtions *****************************************************************************/

  void _openCamera() {
    picture = ImagePicker.pickImage(
      source: ImageSource.camera
    );
  }

  void _openGallery() {
    picture = ImagePicker.pickImage(
      source: ImageSource.gallery
    );
  }

  Future<void> _optionsDialogBox() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  child: Text('Tomar fotografia'),
                  onTap: _openCamera
                ),
                Padding(padding: EdgeInsets.all(8.0)),
                GestureDetector(
                  child: Text('Seleccionar desde galeria'),
                  onTap: _openGallery
                ),
              ],
            ),
          ),
        );
      }
    );
  }

  /* BEGING Boby *********************************************************************************/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Accediendo a la Camara'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.jpg'),
            fit: BoxFit.cover
          )
        ),
        child: Center(
          child: RaisedButton(
            child: Text('Camara'),
            onPressed: _optionsDialogBox
          ),
        ),
      )
    );
  }
}