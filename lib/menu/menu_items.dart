import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem({
      required this.title,
      required this.subTitle,
      required this.link,
      required this.icon
  });
}

const List<MenuItem> appMenuitems = [
   MenuItem(
    title: 'Riverpord Counter',
    subTitle: 'Introducción a riverpod', 
    link: '/counter-screen', 
    icon: Icons.add 
  ),
  MenuItem(
    title: 'Botones',
    subTitle: 'Varios botones en Flutter', 
    link: '/buttons', 
    icon: Icons.smart_button_outlined  
  ),
  MenuItem(
    title: 'Tarjetas',
    subTitle: 'Un contenedor utilizado', 
    link: '/cards', 
    icon: Icons.credit_card 
  ),
  MenuItem(
    title: 'ProgressIndicators',
    subTitle: 'Generales y controlados', 
    link: '/progress', 
    icon: Icons.refresh_rounded 
  ),
  MenuItem(
    title: 'Snackbars y diálogos',
    subTitle: 'Indicadores en pantalla', 
    link: '/snackbars', 
    icon: Icons.info_outline 
  ),
   MenuItem(
    title: 'Animated Container',
    subTitle: 'Stateful widget animado', 
    link: '/animated', 
    icon: Icons.check_box_outline_blank_outlined 
  ),
   MenuItem(
    title: 'UI Controls + Tiles',
    subTitle: 'Una serie de controles de Flutter', 
    link: '/ui-controls', 
    icon: Icons.car_rental_outlined 
  ),
   MenuItem(
    title: 'Introducción a la aplicación',
    subTitle: 'Pequeño tutorial introductorio', 
    link: '/tutorial', 
    icon: Icons.accessible_rounded 
  ),
  MenuItem(
    title: 'InfiniteScroll y Pull',
    subTitle: 'Listas infinitas y pull to refresh', 
    link: '/infinite', 
    icon: Icons.list_alt_rounded 
  ),
  MenuItem(
    title: 'Cambiar tema',
    subTitle: 'Cambiar tema de la aplicación', 
    link: '/theme-changer', 
    icon: Icons.list_alt_rounded 
  ) 
];
