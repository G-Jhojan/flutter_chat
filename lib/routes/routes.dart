import 'package:flutter/cupertino.dart';
import 'package:flutter_ecommerce/pages/chat_page.dart';
import 'package:flutter_ecommerce/pages/loading_page.dart';
import 'package:flutter_ecommerce/pages/login_page.dart';
import 'package:flutter_ecommerce/pages/register_page.dart';
import 'package:flutter_ecommerce/pages/usuarios_pages.dart';

final Map<String, Widget Function (BuildContext)> appRoutes = {

'usuarios':(_) => UsuariosPage(),
'chat'    :(_) => ChatPage(),
'login'   :(_) => LoginPage(),
'register':(_) => RegisterPage(),
'loading' :(_) => LoadingPage(),




};
