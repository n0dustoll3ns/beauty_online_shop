import 'package:flutter/material.dart';
import 'package:beauty_online_shop/props/countries.dart';
import 'package:beauty_online_shop/props/brands.dart';

class Perfumery {
  final String image, title, description;
  final int id, price, volume, count;
  final Color color;
  final Country country;
  final Brand brand;
  Perfumery({
    required this.id,
    required this.title,
    required this.image,
    required this.description,
    required this.price,
    required this.volume,
    required this.count,
    required this.color,
    required this.country,
    required this.brand,
  });
}

List<Perfumery> perfumery = [
  Perfumery(
      id: 0,
      title: 'Creed Aventus for Him 100 ml',
      image: 'assets/images/0.png',
      description:
          'Aventus («Крид Авентус») – это аромат для стильных и модных мужчин. Аромат был создан сравнительно недавно, в 2010 году. Парфюмерами его являются: Olivier Creed, Erwin Creed.\n Парфюм принадлежит к группе ароматов шипровые фруктовые. Парфюм Aventus Creed создан под вдохновением от истории жизни Наполеона. В композиции аромата необычно звучат элегантные цветочные компоненты, ненавязчивые фруктовые оттенки и богатая древесная составляющая. Аромат смелый, необыкновенный, оптимистичный, мужественный. Это привлекательный для противоположного пола и вдохновляющий парфюм.\n\nКомпозиция Creed Aventus звучит нотами индийского ананаса, красного яблока, черной смородины и бергамота. Средние ноты представлены розой, листьями пачули, березой и жасмином. Базовые ноты наполнены ванилью, амброй, дубовым мхом и мускусом.',
      price: 24600,
      volume: 100,
      count: 3,
      color: Color(0XFFcccccc),
      country: Country.fromID(1),
      brand: Brand.fromID(0)),
  Perfumery(
      id: 1,
      title: 'Creed Aventus for Him 50 ml',
      image: 'assets/images/1.png',
      description:
          'Aventus («Крид Авентус») – это аромат для стильных и модных мужчин. Аромат был создан сравнительно недавно, в 2010 году. Парфюмерами его являются: Olivier Creed, Erwin Creed.\n Парфюм принадлежит к группе ароматов шипровые фруктовые. Парфюм Aventus Creed создан под вдохновением от истории жизни Наполеона. В композиции аромата необычно звучат элегантные цветочные компоненты, ненавязчивые фруктовые оттенки и богатая древесная составляющая. Аромат смелый, необыкновенный, оптимистичный, мужественный. Это привлекательный для противоположного пола и вдохновляющий парфюм.\n\nКомпозиция Creed Aventus звучит нотами индийского ананаса, красного яблока, черной смородины и бергамота. Средние ноты представлены розой, листьями пачули, березой и жасмином. Базовые ноты наполнены ванилью, амброй, дубовым мхом и мускусом.',
      price: 18600,
      volume: 50,
      count: 4,
      color: Color(0XFFcccccc),
      country: Country.fromID(1),
      brand: Brand.fromID(0)),
  Perfumery(
      id: 2,
      title: 'Creed Viking 100 ml',
      image: 'assets/images/2.png',
      description:
          'Creed Viking представляет собой цитрусово-древесную композицию с традиционными вкраплениями пикантных перечных нот. Это по-настоящему огненный аромат, раскрывающий целеустремленный и бесстрашный мужской характер, который помогает двигаться против течения. Вдохновением для этой композиции послужили длинные и невероятно маневренные корабли викингов, о которых ходили легенды еще с IX века нашей эры. Управлять ими могли только, без сомнения, опытные моряки, воплотившие в себе неукротимую решимость и стремление к победе.\nПирамидка открывается свежим всплеском цитрусов – каламбрийского бергамота и сицилийского лимона, приправленных жгучими аккордами розового перца. В сердце парфюма также представлены перечные тона в объемной комбинации с чувственной болгарской розой и холодным мятным бризом. База парфюма соткана из нюансов древесины индийского сандала, гаитянского ветивера, пачулей и абсолюта лавандина.',
      price: 29600,
      volume: 50,
      count: 5,
      color: Color.fromARGB(255, 233, 171, 189),
      country: Country.fromID(1),
      brand: Brand.fromID(0)),
  Perfumery(
      id: 3,
      title: 'Creed Viking 50 ml',
      image: 'assets/images/3.png',
      description:
          'Creed Viking представляет собой цитрусово-древесную композицию с традиционными вкраплениями пикантных перечных нот. Это по-настоящему огненный аромат, раскрывающий целеустремленный и бесстрашный мужской характер, который помогает двигаться против течения. Вдохновением для этой композиции послужили длинные и невероятно маневренные корабли викингов, о которых ходили легенды еще с IX века нашей эры. Управлять ими могли только, без сомнения, опытные моряки, воплотившие в себе неукротимую решимость и стремление к победе.\nПирамидка открывается свежим всплеском цитрусов – каламбрийского бергамота и сицилийского лимона, приправленных жгучими аккордами розового перца. В сердце парфюма также представлены перечные тона в объемной комбинации с чувственной болгарской розой и холодным мятным бризом. База парфюма соткана из нюансов древесины индийского сандала, гаитянского ветивера, пачулей и абсолюта лавандина.',
      price: 16600,
      volume: 50,
      count: 6,
      color: Color.fromARGB(255, 233, 171, 189),
      country: Country.fromID(1),
      brand: Brand.fromID(0)),
  Perfumery(
      id: 4,
      title: 'Creed Acqua Originale Citrus Bigarade 100 ml',
      image: 'assets/images/4.png',
      description:
          'Citrus Bigarade - рецепт изысканного коктейля перенесённый во флакон, воплощение нежного тепла средиземноморского солнца. Сицилийский мартини – один из любимых напитков герцога Виндзорского (Эдуарда VIII).\nЛучший сухой мартини смешайте со свежим соком горького апельсина из окрестностей Палермо, мелко порежьте мяту, добавьте свежий имбирь, немного водки и много измельчённого льда. И как главную изюминку – дольку сицилийского лимона приправленную белым перцом.\nКомпоненты\nВерхние ноты: лимон, петигрейн\nНоты сердца:мандарин,\nБазовые ноты: цветок апельсина, пачули, петигрейн\n',
      price: 24600,
      volume: 100,
      count: 22,
      color: Color.fromARGB(255, 221, 206, 157),
      country: Country.fromID(1),
      brand: Brand.fromID(0)),
  Perfumery(
      id: 5,
      title: 'Memo French Leather 75 ml',
      image: 'assets/images/5.png',
      description:
          'French Leather представлен в 2014 году, относится к семейству цветочных кожаных нектаров. Новинка пополнила коллекцию Cuirs Nomades известного парфюмерного бренда Memo. Аромат олицетворяет собой роскошь дурманящей розы и чувственной замши, дуэт которых приглашает в увлекательное эйфорическое путешествие по романтической Франции.\n\nГлубокое и многогранное звучание композиции переливается нотами освежающего лайма, драгоценной смолы и тёплого можжевельника.\n\nВихрь из глубоких замшевых нот звучит тонко и легкомысленно, а воздушный мускус и роскошный шалфей уносят в мир чарующих грёз и воспоминаний. Характер аромата – смелый, дерзкий, страстный, проникновенный.',
      price: 27500,
      volume: 75,
      count: 12,
      color: Color(0XFFcccc99),
      country: Country.fromID(1),
      brand: Brand.fromID(3)),
  Perfumery(
      id: 6,
      title: 'Memo Sicilian Leather 75 ml',
      image: 'assets/images/6.png',
      description:
          'Sicilian Leather Memo Paris — это аромат для мужчин и женщин, он принадлежит к группе кожаные. Это новое издание: Sicilian Leather выпущен в 2021 году. Верхние ноты: Кожа, Лимон, Кедр и Горький апельсин; средние ноты: Лайм, Бергамот, Кориандр, Кардамон и Лист фиалки; базовые ноты: Пихтовый бальзам, Гваяк, Akigalawood и Пачули.',
      price: 22917,
      volume: 75,
      count: 8,
      color: Color(0XFFcccc99),
      country: Country.fromID(1),
      brand: Brand.fromID(3)),
  Perfumery(
      id: 7,
      title: 'Amouage Imitation Man 100 ml',
      image: 'assets/images/7.png',
      description:
          'Portrayal Woman — стильный мужской древесно-ароматический аромат.\nПарфюм задуман, как отражение уникальной личности человека и освобождение от одиночества, которые общество устанавливает вокруг людей,  отличающихся от общей массы. Это парфюм для дерзких людей, которые осмеливаются бросить вызов нормам своего общества.\nСозданная парфюмером Пьер Негрином ароматическая композиция источает атмосферу изысканной смелости. С влажно-древесным, чуть землистым ветивером в сердце и пряной свежестью хрустящих листьев фиалки в верхних нотах парфюм производит роскошное, но при этом истинно мужское впечатление. Его легкая пряная грань обогащает древесно-хвойную можжевельковую базу, позволяя аромату отразить незабываемую просветляющую энергию.\nФирменный хрустальный флакон Amouage на этот раз представлен в переливающемся жемчужном цвете и  украшен голубым кристаллом Сваровски.',
      price: 31000,
      volume: 100,
      count: 3,
      color: Color(0XFFccccff),
      country: Country.fromID(2),
      brand: Brand.fromID(1)),
];

List<Perfumery> associated_perfum1 = [perfumery[0], perfumery[1]];

List<Perfumery> associated_perfum2 = [perfumery[2], perfumery[3]];