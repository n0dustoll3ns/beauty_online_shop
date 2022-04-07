import 'package:flutter/material.dart';
import '../props/brands.dart';
import '../props/countries.dart';

class ProductInCart {
  final Perfumery fragrance;
  final int selectedVolume;
  ProductInCart({
    required this.fragrance,
    required this.selectedVolume,
  });
}

class Perfumery {
  final String title, description;
  final Color color;
  final Country country;
  final Brand brand;
  Map<int, PerfumeryProperties> properties;
  Perfumery({
    required this.properties,
    required this.title,
    required this.description,
    required this.color,
    required this.country,
    required this.brand,
  });
}

class PerfumeryProperties {
  final String volume, image;
  final int count, price, id;
  PerfumeryProperties({
    required this.volume,
    required this.price,
    required this.id,
    required this.count,
  }) : image = 'assets/images/$id.png';

  Map toJson() => {
        'volume': volume,
        'image': image,
        'count': count,
        'price': price,
        'id': id,
      };

  PerfumeryProperties.fromJson(Map input)
      : volume = input['volume'],
        image = input['image'],
        count = input['count'],
        price = input['price'],
        id = input['id'];
}

final Map<int, PerfumeryProperties> overallProperties = {
  0: PerfumeryProperties(
    id: 0,
    count: 12,
    price: 49800,
    volume: '100',
  ),
  1: PerfumeryProperties(
    count: 8,
    id: 1,
    price: 38400,
    volume: '50',
  ),
  2: PerfumeryProperties(
    count: 15,
    id: 2,
    price: 32400,
    volume: '100',
  ),
  3: PerfumeryProperties(
    count: 4,
    id: 3,
    price: 24050,
    volume: '50',
  ),
  4: PerfumeryProperties(
    count: 3,
    id: 4,
    price: 27500,
    volume: '100',
  ),
  5: PerfumeryProperties(
    count: 6,
    id: 5,
    price: 24600,
    volume: '100',
  ),
  6: PerfumeryProperties(
    count: 12,
    id: 6,
    price: 22917,
    volume: '100',
  ),
  7: PerfumeryProperties(
    count: 7,
    id: 7,
    price: 31000,
    volume: '100',
  ),
  8: PerfumeryProperties(
    count: 2,
    id: 8,
    price: 30280,
    volume: '3×10',
  ),
};

final List<Perfumery> perfumery = [
  Perfumery(
    properties: {
      0: overallProperties[0]!,
      1: overallProperties[1]!,
      8: overallProperties[8]!
    },
    title: 'Creed Aventus for Him',
    description:
        'Aventus («Крид Авентус») – это аромат для стильных и модных мужчин. Аромат был создан сравнительно недавно, в 2010 году. Парфюмерами его являются: Olivier Creed, Erwin Creed.\n Парфюм принадлежит к группе ароматов шипровые фруктовые. Парфюм Aventus Creed создан под вдохновением от истории жизни Наполеона. В композиции аромата необычно звучат элегантные цветочные компоненты, ненавязчивые фруктовые оттенки и богатая древесная составляющая. Аромат смелый, необыкновенный, оптимистичный, мужественный. Это привлекательный для противоположного пола и вдохновляющий парфюм.\n\nКомпозиция Creed Aventus звучит нотами индийского ананаса, красного яблока, черной смородины и бергамота. Средние ноты представлены розой, листьями пачули, березой и жасмином. Базовые ноты наполнены ванилью, амброй, дубовым мхом и мускусом.',
    color: Color(0XFFcccccc),
    country: Country.fromID(1),
    brand: Brand.fromID(0),
  ),
  Perfumery(
    properties: {
      2: overallProperties[2]!,
      3: overallProperties[3]!,
    },
    title: 'Creed Viking',
    description:
        'Creed Viking представляет собой цитрусово-древесную композицию с традиционными вкраплениями пикантных перечных нот. Это по-настоящему огненный аромат, раскрывающий целеустремленный и бесстрашный мужской характер, который помогает двигаться против течения. Вдохновением для этой композиции послужили длинные и невероятно маневренные корабли викингов, о которых ходили легенды еще с IX века нашей эры. Управлять ими могли только, без сомнения, опытные моряки, воплотившие в себе неукротимую решимость и стремление к победе.\nПирамидка открывается свежим всплеском цитрусов – каламбрийского бергамота и сицилийского лимона, приправленных жгучими аккордами розового перца. В сердце парфюма также представлены перечные тона в объемной комбинации с чувственной болгарской розой и холодным мятным бризом. База парфюма соткана из нюансов древесины индийского сандала, гаитянского ветивера, пачулей и абсолюта лавандина.',
    color: Color.fromARGB(255, 233, 171, 189),
    country: Country.fromID(1),
    brand: Brand.fromID(0),
  ),
  Perfumery(
    properties: {4: overallProperties[4]!},
    title: 'Creed Acqua Originale Citrus Bigarade',
    description:
        'Citrus Bigarade - рецепт изысканного коктейля перенесённый во флакон, воплощение нежного тепла средиземноморского солнца. Сицилийский мартини – один из любимых напитков герцога Виндзорского (Эдуарда VIII).\nЛучший сухой мартини смешайте со свежим соком горького апельсина из окрестностей Палермо, мелко порежьте мяту, добавьте свежий имбирь, немного водки и много измельчённого льда. И как главную изюминку – дольку сицилийского лимона приправленную белым перцом.\nКомпоненты\nВерхние ноты: лимон, петигрейн\nНоты сердца:мандарин,\nБазовые ноты: цветок апельсина, пачули, петигрейн.',
    color: Color.fromARGB(255, 221, 206, 157),
    country: Country.fromID(1),
    brand: Brand.fromID(0),
  ),
  Perfumery(
    properties: {5: overallProperties[5]!},
    title: 'Memo French Leather',
    description:
        'French Leather представлен в 2014 году, относится к семейству цветочных кожаных нектаров. Новинка пополнила коллекцию Cuirs Nomades известного парфюмерного бренда Memo. Аромат олицетворяет собой роскошь дурманящей розы и чувственной замши, дуэт которых приглашает в увлекательное эйфорическое путешествие по романтической Франции.\n\nГлубокое и многогранное звучание композиции переливается нотами освежающего лайма, драгоценной смолы и тёплого можжевельника.\n\nВихрь из глубоких замшевых нот звучит тонко и легкомысленно, а воздушный мускус и роскошный шалфей уносят в мир чарующих грёз и воспоминаний. Характер аромата – смелый, дерзкий, страстный, проникновенный.',
    color: Color.fromARGB(255, 221, 206, 157),
    country: Country.fromID(1),
    brand: Brand.fromID(3),
  ),
  Perfumery(
    properties: {6: overallProperties[6]!},
    title: 'Memo Sicilian Leather',
    description:
        'Sicilian Leather Memo Paris — это аромат для мужчин и женщин, он принадлежит к группе кожаные. Это новое издание: Sicilian Leather выпущен в 2021 году. Верхние ноты: Кожа, Лимон, Кедр и Горький апельсин; средние ноты: Лайм, Бергамот, Кориандр, Кардамон и Лист фиалки; базовые ноты: Пихтовый бальзам, Гваяк, Akigalawood и Пачули.',
    color: Color(0XFFcccc99),
    country: Country.fromID(1),
    brand: Brand.fromID(3),
  ),
  Perfumery(
    properties: {7: overallProperties[7]!},
    title: 'Amouage Imitation Man',
    description:
        'Portrayal Woman — стильный мужской древесно-ароматический аромат.\nПарфюм задуман, как отражение уникальной личности человека и освобождение от одиночества, которые общество устанавливает вокруг людей,  отличающихся от общей массы. Это парфюм для дерзких людей, которые осмеливаются бросить вызов нормам своего общества.\nСозданная парфюмером Пьер Негрином ароматическая композиция источает атмосферу изысканной смелости. С влажно-древесным, чуть землистым ветивером в сердце и пряной свежестью хрустящих листьев фиалки в верхних нотах парфюм производит роскошное, но при этом истинно мужское впечатление. Его легкая пряная грань обогащает древесно-хвойную можжевельковую базу, позволяя аромату отразить незабываемую просветляющую энергию.\nФирменный хрустальный флакон Amouage на этот раз представлен в переливающемся жемчужном цвете и  украшен голубым кристаллом Сваровски.',
    color: Color(0XFFccccff),
    country: Country.fromID(2),
    brand: Brand.fromID(1),
  ),
];

Perfumery? searchByID(int id) {
  Perfumery onSearchProduct = perfumery[0];
  for (var product in perfumery) {
    if (product.properties.keys.contains(id)) {
      return product;
    }
  }
  ;
}
