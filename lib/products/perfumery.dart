import 'package:flutter/material.dart';
import 'package:beauty_online_shop/props/countries.dart';
import 'package:beauty_online_shop/props/Brands.dart';

class Perfumery {
  final String image, title, description;
  final int id, price, volume;
  final Country country;
  final Brand brand;
  Perfumery({
    required this.id,
    required this.title,
    required this.image,
    required this.description,
    required this.price,
    required this.volume,
    required this.country,
    required this.brand,
  });
}

List<Perfumery> PerfumeryProducts = [
  Perfumery(
      id: 0,
      title: 'Creed Aventus for Him Парфюмированная вода 100 мл',
      image:
          'https://camilladeluxe.ru/upload/resize_cache/iblock/5d0/450_450_140cd750bba9870f18aada2478b24840a/5d0526d7f31c11222327de358f4c44cd.jpg',
      description:
          'Aventus («Крид Авентус») – это аромат для стильных и модных мужчин. Аромат был создан сравнительно недавно, в 2010 году. Парфюмерами его являются: Olivier Creed, Erwin Creed.\n Парфюм принадлежит к группе ароматов шипровые фруктовые. Парфюм Aventus Creed создан под вдохновением от истории жизни Наполеона. В композиции аромата необычно звучат элегантные цветочные компоненты, ненавязчивые фруктовые оттенки и богатая древесная составляющая. Аромат смелый, необыкновенный, оптимистичный, мужественный. Это привлекательный для противоположного пола и вдохновляющий парфюм.\n\nКомпозиция Creed Aventus звучит нотами индийского ананаса, красного яблока, черной смородины и бергамота. Средние ноты представлены розой, листьями пачули, березой и жасмином. Базовые ноты наполнены ванилью, амброй, дубовым мхом и мускусом.',
      price: 24600,
      volume: 75,
      country: Country.fromID(1),
      brand: Brand.fromID(0)),
  Perfumery(
      id: 1,
      title: 'Creed Aventus for Him Парфюмированная вода 75 мл',
      image:
          'https://camilladeluxe.ru/upload/resize_cache/iblock/5d0/450_450_140cd750bba9870f18aada2478b24840a/5d0526d7f31c11222327de358f4c44cd.jpg',
      description:
          'Aventus («Крид Авентус») – это аромат для стильных и модных мужчин. Аромат был создан сравнительно недавно, в 2010 году. Парфюмерами его являются: Olivier Creed, Erwin Creed.\n Парфюм принадлежит к группе ароматов шипровые фруктовые. Парфюм Aventus Creed создан под вдохновением от истории жизни Наполеона. В композиции аромата необычно звучат элегантные цветочные компоненты, ненавязчивые фруктовые оттенки и богатая древесная составляющая. Аромат смелый, необыкновенный, оптимистичный, мужественный. Это привлекательный для противоположного пола и вдохновляющий парфюм.\n\nКомпозиция Creed Aventus звучит нотами индийского ананаса, красного яблока, черной смородины и бергамота. Средние ноты представлены розой, листьями пачули, березой и жасмином. Базовые ноты наполнены ванилью, амброй, дубовым мхом и мускусом.',
      price: 24600,
      volume: 75,
      country: Country.fromID(1),
      brand: Brand.fromID(0)),
];
