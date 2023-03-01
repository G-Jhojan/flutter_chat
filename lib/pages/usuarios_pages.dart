import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/models/usuario.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class UsuariosPage extends StatefulWidget {
  @override
  State<UsuariosPage> createState() => _UsuariosPageState();
}

class _UsuariosPageState extends State<UsuariosPage> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  final usuarios = [
    Usuario(
        uid: '1',
        nombre: 'Jhojan Guerra',
        online: true,
        email: 'jhojanrock98@gmail.com'),
    Usuario(
        uid: '2',
        nombre: 'Kelly Guerra',
        online: true,
        email: 'jhojanrock98@gmail.com'),
    Usuario(
        uid: '3',
        nombre: 'Leonidas Guerra',
        online: false,
        email: 'jhojanrock98@gmail.com'),
    Usuario(
        uid: '4',
        nombre: 'Lucia  Orbe',
        online: true,
        email: 'jhojanrock98@gmail.com'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Mi nombre',
            style: TextStyle(color: Colors.black87),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.exit_to_app, color: Colors.black87),
            onPressed: () {},
          ),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 10),
              child: Icon(
                Icons.check_circle,
                color: Colors.blue[400],
              ),
            )
          ],
        ),
        body: SmartRefresher(
          onRefresh: _cargarUsuarios,
          enablePullDown: true,
          header: WaterDropHeader(
            complete:Icon(Icons.check, color: Colors.blue[400],),
            waterDropColor: Colors.blue, 
            ),
          controller: _refreshController,
          child: _listViewUsuarios(),) 
        );
  }

  ListView _listViewUsuarios() {
    return ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (_, int i) => _usuarioListTile(usuarios[i]),
        separatorBuilder: (_, int i) => Divider(),
        itemCount: usuarios.length,
      );
  }

  ListTile _usuarioListTile(Usuario usuario) {
    return ListTile(
      title: Text(usuario.nombre),
      subtitle: Text(usuario.email),
      leading: CircleAvatar(
        child: Text(usuario.nombre.substring(0, 2)),
        backgroundColor: Colors.blue[100],
      ),
      trailing: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
            color: usuario.online ? Colors.green[300] : Colors.red,
            borderRadius: BorderRadius.circular(100)),
      ),
    );
  }


_cargarUsuarios()async{
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }
}



