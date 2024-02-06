// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';

import 'package:signs_app/core/models/sign/sign.dart';

const baseUrl = 'https:';

void main() async {
  final json = jsonDecode(File('./merge.json').readAsStringSync()) as List;
  List<Sign> merge = [];
  for (int i = 0; i < json.length; i++) {
    merge.add(Sign.fromJson(json[i]));
  }

  String temp = 'const uploads = [';

  for (var i in merge) {
    temp +=
        'Sign(name: "${i.name}", image: "${i.image}", type: "${i.type}", description: "${i.description}"),';
  }

  temp += '];';

  File('class.dart').writeAsStringSync(temp);
}

class DataSign {
  final String image;
  final String name;
  final String type;
  final String description;

  const DataSign({
    required this.image,
    required this.name,
    required this.type,
    required this.description,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'image': image,
      'name': name,
      'type': type,
      'description': description,
    };
  }

  factory DataSign.fromMap(Map<String, dynamic> map) {
    return DataSign(
      image: map['image'] as String,
      name: map['name'] as String,
      type: map['type'] as String,
      description: map['description'] as String,
    );
  }

  factory DataSign.fromJson(String source) =>
      DataSign.fromMap(json.decode(source) as Map<String, dynamic>);
}

const html = '''
<ul class="gallery mw-gallery-traditional" style="float: center">
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesia_New_Road_Sign_1a.png" class="mw-file-description" title="Tikungan ke kiri"><img alt="Tikungan ke kiri" src="//upload.wikimedia.org/wikipedia/commons/thumb/6/6f/Indonesia_New_Road_Sign_1a.png/120px-Indonesia_New_Road_Sign_1a.png" decoding="async" width="120" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/6/6f/Indonesia_New_Road_Sign_1a.png/180px-Indonesia_New_Road_Sign_1a.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/6/6f/Indonesia_New_Road_Sign_1a.png/240px-Indonesia_New_Road_Sign_1a.png 2x" data-file-width="1141" data-file-height="1142"></a></span></div>
    <div class="gallerytext">
<p>Tikungan ke kiri
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesia_New_Road_Sign_1b.png" class="mw-file-description" title="Tikungan ke kanan"><img alt="Tikungan ke kanan" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/bb/Indonesia_New_Road_Sign_1b.png/120px-Indonesia_New_Road_Sign_1b.png" decoding="async" width="120" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/bb/Indonesia_New_Road_Sign_1b.png/180px-Indonesia_New_Road_Sign_1b.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/bb/Indonesia_New_Road_Sign_1b.png/240px-Indonesia_New_Road_Sign_1b.png 2x" data-file-width="1141" data-file-height="1142"></a></span></div>
    <div class="gallerytext">
<p>Tikungan ke kanan
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesia_New_Road_Sign_1c.png" class="mw-file-description" title="Tikungan ganda"><img alt="Tikungan ganda" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b4/Indonesia_New_Road_Sign_1c.png/120px-Indonesia_New_Road_Sign_1c.png" decoding="async" width="120" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b4/Indonesia_New_Road_Sign_1c.png/180px-Indonesia_New_Road_Sign_1c.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b4/Indonesia_New_Road_Sign_1c.png/240px-Indonesia_New_Road_Sign_1c.png 2x" data-file-width="1141" data-file-height="1142"></a></span></div>
    <div class="gallerytext">
<p>Tikungan ganda
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesia_New_Road_Sign_1d.png" class="mw-file-description" title="Tikungan ganda"><img alt="Tikungan ganda" src="//upload.wikimedia.org/wikipedia/commons/thumb/e/eb/Indonesia_New_Road_Sign_1d.png/120px-Indonesia_New_Road_Sign_1d.png" decoding="async" width="120" height="118" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/e/eb/Indonesia_New_Road_Sign_1d.png/180px-Indonesia_New_Road_Sign_1d.png 1.5x, //upload.wikimedia.org/wikipedia/commons/e/eb/Indonesia_New_Road_Sign_1d.png 2x" data-file-width="209" data-file-height="206"></a></span></div>
    <div class="gallerytext">
<p>Tikungan ganda
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesia_New_Road_Sign_1e.png" class="mw-file-description" title="Tikungan tajam"><img alt="Tikungan tajam" src="//upload.wikimedia.org/wikipedia/commons/thumb/0/05/Indonesia_New_Road_Sign_1e.png/120px-Indonesia_New_Road_Sign_1e.png" decoding="async" width="120" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/0/05/Indonesia_New_Road_Sign_1e.png/180px-Indonesia_New_Road_Sign_1e.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/0/05/Indonesia_New_Road_Sign_1e.png/240px-Indonesia_New_Road_Sign_1e.png 2x" data-file-width="1141" data-file-height="1142"></a></span></div>
    <div class="gallerytext">
<p>Tikungan tajam
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesia_New_Road_Sign_1f.png" class="mw-file-description" title="Tikungan tajam"><img alt="Tikungan tajam" src="//upload.wikimedia.org/wikipedia/commons/thumb/8/87/Indonesia_New_Road_Sign_1f.png/120px-Indonesia_New_Road_Sign_1f.png" decoding="async" width="120" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/8/87/Indonesia_New_Road_Sign_1f.png/180px-Indonesia_New_Road_Sign_1f.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/8/87/Indonesia_New_Road_Sign_1f.png/240px-Indonesia_New_Road_Sign_1f.png 2x" data-file-width="264" data-file-height="264"></a></span></div>
    <div class="gallerytext">
<p>Tikungan tajam
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesia_New_Road_Sign_1g.png" class="mw-file-description" title="Tikungan tajam ganda"><img alt="Tikungan tajam ganda" src="//upload.wikimedia.org/wikipedia/commons/thumb/f/f2/Indonesia_New_Road_Sign_1g.png/120px-Indonesia_New_Road_Sign_1g.png" decoding="async" width="120" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/f/f2/Indonesia_New_Road_Sign_1g.png/180px-Indonesia_New_Road_Sign_1g.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/f/f2/Indonesia_New_Road_Sign_1g.png/240px-Indonesia_New_Road_Sign_1g.png 2x" data-file-width="1141" data-file-height="1142"></a></span></div>
    <div class="gallerytext">
<p>Tikungan tajam ganda
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesia_New_Road_Sign_1h.png" class="mw-file-description" title="Tikungan tajam ganda"><img alt="Tikungan tajam ganda" src="//upload.wikimedia.org/wikipedia/commons/thumb/d/df/Indonesia_New_Road_Sign_1h.png/120px-Indonesia_New_Road_Sign_1h.png" decoding="async" width="120" height="118" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/d/df/Indonesia_New_Road_Sign_1h.png/180px-Indonesia_New_Road_Sign_1h.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/d/df/Indonesia_New_Road_Sign_1h.png/240px-Indonesia_New_Road_Sign_1h.png 2x" data-file-width="265" data-file-height="260"></a></span></div>
    <div class="gallerytext">
<p>Tikungan tajam ganda
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesia_New_Road_Sign_1i.png" class="mw-file-description" title="Banyak tikungan"><img alt="Banyak tikungan" src="//upload.wikimedia.org/wikipedia/commons/thumb/d/d0/Indonesia_New_Road_Sign_1i.png/120px-Indonesia_New_Road_Sign_1i.png" decoding="async" width="120" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/d/d0/Indonesia_New_Road_Sign_1i.png/180px-Indonesia_New_Road_Sign_1i.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/d/d0/Indonesia_New_Road_Sign_1i.png/240px-Indonesia_New_Road_Sign_1i.png 2x" data-file-width="268" data-file-height="268"></a></span></div>
    <div class="gallerytext">
<p>Banyak tikungan
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesia_New_Road_Sign_1j.png" class="mw-file-description" title="Banyak tikungan"><img alt="Banyak tikungan" src="//upload.wikimedia.org/wikipedia/commons/thumb/0/0d/Indonesia_New_Road_Sign_1j.png/120px-Indonesia_New_Road_Sign_1j.png" decoding="async" width="120" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/0/0d/Indonesia_New_Road_Sign_1j.png/180px-Indonesia_New_Road_Sign_1j.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/0/0d/Indonesia_New_Road_Sign_1j.png/240px-Indonesia_New_Road_Sign_1j.png 2x" data-file-width="1141" data-file-height="1142"></a></span></div>
    <div class="gallerytext">
<p>Banyak tikungan
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesia_New_Road_Sign_1k.png" class="mw-file-description" title="Tikungan memutar"><img alt="Tikungan memutar" src="//upload.wikimedia.org/wikipedia/commons/thumb/5/53/Indonesia_New_Road_Sign_1k.png/120px-Indonesia_New_Road_Sign_1k.png" decoding="async" width="120" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/5/53/Indonesia_New_Road_Sign_1k.png/180px-Indonesia_New_Road_Sign_1k.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/5/53/Indonesia_New_Road_Sign_1k.png/240px-Indonesia_New_Road_Sign_1k.png 2x" data-file-width="1141" data-file-height="1142"></a></span></div>
    <div class="gallerytext">
<p>Tikungan memutar
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesia_New_Road_Sign_1l.png" class="mw-file-description" title="Tikungan memutar"><img alt="Tikungan memutar" src="//upload.wikimedia.org/wikipedia/commons/thumb/7/7a/Indonesia_New_Road_Sign_1l.png/120px-Indonesia_New_Road_Sign_1l.png" decoding="async" width="120" height="117" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/7/7a/Indonesia_New_Road_Sign_1l.png/180px-Indonesia_New_Road_Sign_1l.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/7/7a/Indonesia_New_Road_Sign_1l.png/240px-Indonesia_New_Road_Sign_1l.png 2x" data-file-width="270" data-file-height="263"></a></span></div>
    <div class="gallerytext">
<p>Tikungan memutar
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesia_New_Road_Sign_1m.png" class="mw-file-description" title="Pelebaran badan jalan"><img alt="Pelebaran badan jalan" src="//upload.wikimedia.org/wikipedia/commons/thumb/9/99/Indonesia_New_Road_Sign_1m.png/120px-Indonesia_New_Road_Sign_1m.png" decoding="async" width="120" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/9/99/Indonesia_New_Road_Sign_1m.png/180px-Indonesia_New_Road_Sign_1m.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/9/99/Indonesia_New_Road_Sign_1m.png/240px-Indonesia_New_Road_Sign_1m.png 2x" data-file-width="1141" data-file-height="1142"></a></span></div>
    <div class="gallerytext">
<p>Pelebaran badan jalan
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesia_New_Road_Sign_1p.png" class="mw-file-description" title="Penyempitan badan Jalan di bagian kanan"><img alt="Penyempitan badan Jalan di bagian kanan" src="//upload.wikimedia.org/wikipedia/commons/thumb/f/f2/Indonesia_New_Road_Sign_1p.png/116px-Indonesia_New_Road_Sign_1p.png" decoding="async" width="116" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/f/f2/Indonesia_New_Road_Sign_1p.png/174px-Indonesia_New_Road_Sign_1p.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/f/f2/Indonesia_New_Road_Sign_1p.png/232px-Indonesia_New_Road_Sign_1p.png 2x" data-file-width="1141" data-file-height="1179"></a></span></div>
    <div class="gallerytext">
<p>Penyempitan badan Jalan di bagian kanan
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesia_New_Road_Sign_1w.png" class="mw-file-description" title="Jembatan"><img alt="Jembatan" src="//upload.wikimedia.org/wikipedia/commons/thumb/d/da/Indonesia_New_Road_Sign_1w.png/120px-Indonesia_New_Road_Sign_1w.png" decoding="async" width="120" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/d/da/Indonesia_New_Road_Sign_1w.png/180px-Indonesia_New_Road_Sign_1w.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/d/da/Indonesia_New_Road_Sign_1w.png/240px-Indonesia_New_Road_Sign_1w.png 2x" data-file-width="1141" data-file-height="1142"></a></span></div>
    <div class="gallerytext">
<p>Jembatan
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesia_New_Road_Sign_2a.png" class="mw-file-description" title="Jalan menurun landai"><img alt="Jalan menurun landai" src="//upload.wikimedia.org/wikipedia/commons/thumb/f/f2/Indonesia_New_Road_Sign_2a.png/120px-Indonesia_New_Road_Sign_2a.png" decoding="async" width="120" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/f/f2/Indonesia_New_Road_Sign_2a.png/180px-Indonesia_New_Road_Sign_2a.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/f/f2/Indonesia_New_Road_Sign_2a.png/240px-Indonesia_New_Road_Sign_2a.png 2x" data-file-width="1141" data-file-height="1142"></a></span></div>
    <div class="gallerytext">
<p>Jalan menurun landai
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesian_New_Road_sign_2B.png" class="mw-file-description" title="Jalan menurun curam"><img alt="Jalan menurun curam" src="//upload.wikimedia.org/wikipedia/commons/thumb/1/12/Indonesian_New_Road_sign_2B.png/120px-Indonesian_New_Road_sign_2B.png" decoding="async" width="120" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/1/12/Indonesian_New_Road_sign_2B.png/180px-Indonesian_New_Road_sign_2B.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/1/12/Indonesian_New_Road_sign_2B.png/240px-Indonesian_New_Road_sign_2B.png 2x" data-file-width="1141" data-file-height="1142"></a></span></div>
    <div class="gallerytext">
<p>Jalan menurun curam
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesia_New_Road_Sign_2c.png" class="mw-file-description" title="Jalan memanjak landai"><img alt="Jalan memanjak landai" src="//upload.wikimedia.org/wikipedia/commons/thumb/9/98/Indonesia_New_Road_Sign_2c.png/117px-Indonesia_New_Road_Sign_2c.png" decoding="async" width="117" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/9/98/Indonesia_New_Road_Sign_2c.png/176px-Indonesia_New_Road_Sign_2c.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/9/98/Indonesia_New_Road_Sign_2c.png/235px-Indonesia_New_Road_Sign_2c.png 2x" data-file-width="1141" data-file-height="1166"></a></span></div>
    <div class="gallerytext">
<p>Jalan memanjak landai
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesian_New_Road_Sign_2d.png" class="mw-file-description" title="Jalan memanjak curam"><img alt="Jalan memanjak curam" src="//upload.wikimedia.org/wikipedia/commons/thumb/1/17/Indonesian_New_Road_Sign_2d.png/120px-Indonesian_New_Road_Sign_2d.png" decoding="async" width="120" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/1/17/Indonesian_New_Road_Sign_2d.png/180px-Indonesian_New_Road_Sign_2d.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/1/17/Indonesian_New_Road_Sign_2d.png/240px-Indonesian_New_Road_Sign_2d.png 2x" data-file-width="1141" data-file-height="1142"></a></span></div>
    <div class="gallerytext">
<p>Jalan memanjak curam
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesian_Road_Sign_7.png" class="mw-file-description" title="Jalan licin"><img alt="Jalan licin" src="//upload.wikimedia.org/wikipedia/commons/thumb/5/5f/Indonesian_Road_Sign_7.png/120px-Indonesian_Road_Sign_7.png" decoding="async" width="120" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/5/5f/Indonesian_Road_Sign_7.png/180px-Indonesian_Road_Sign_7.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/5/5f/Indonesian_Road_Sign_7.png/240px-Indonesian_Road_Sign_7.png 2x" data-file-width="1126" data-file-height="1125"></a></span></div>
    <div class="gallerytext">
<p>Jalan licin
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesia_New_Road_Sign_3e.png" class="mw-file-description" title="Cekungan"><img alt="Cekungan" src="//upload.wikimedia.org/wikipedia/commons/thumb/3/3b/Indonesia_New_Road_Sign_3e.png/120px-Indonesia_New_Road_Sign_3e.png" decoding="async" width="120" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/3/3b/Indonesia_New_Road_Sign_3e.png/180px-Indonesia_New_Road_Sign_3e.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/3/3b/Indonesia_New_Road_Sign_3e.png/240px-Indonesia_New_Road_Sign_3e.png 2x" data-file-width="1141" data-file-height="1142"></a></span></div>
    <div class="gallerytext">
<p>Cekungan
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesia_New_Road_Sign_3f.png" class="mw-file-description" title="Jalan cembung Alat pembatas/Kecepatan"><img alt="Jalan cembung Alat pembatas/Kecepatan" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/bb/Indonesia_New_Road_Sign_3f.png/120px-Indonesia_New_Road_Sign_3f.png" decoding="async" width="120" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/bb/Indonesia_New_Road_Sign_3f.png/180px-Indonesia_New_Road_Sign_3f.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/bb/Indonesia_New_Road_Sign_3f.png/240px-Indonesia_New_Road_Sign_3f.png 2x" data-file-width="1141" data-file-height="1142"></a></span></div>
    <div class="gallerytext">
<p>Jalan cembung Alat pembatas/Kecepatan
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesia_New_Road_Sign_3g.png" class="mw-file-description" title="Jalan bergelombang"><img alt="Jalan bergelombang" src="//upload.wikimedia.org/wikipedia/commons/thumb/e/e7/Indonesia_New_Road_Sign_3g.png/120px-Indonesia_New_Road_Sign_3g.png" decoding="async" width="120" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/e/e7/Indonesia_New_Road_Sign_3g.png/180px-Indonesia_New_Road_Sign_3g.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/e/e7/Indonesia_New_Road_Sign_3g.png/240px-Indonesia_New_Road_Sign_3g.png 2x" data-file-width="1141" data-file-height="1142"></a></span></div>
    <div class="gallerytext">
<p>Jalan bergelombang
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesian_Road_Sign_8.png" class="mw-file-description" title="Lontaran kerikil"><img alt="Lontaran kerikil" src="//upload.wikimedia.org/wikipedia/commons/thumb/9/92/Indonesian_Road_Sign_8.png/117px-Indonesian_Road_Sign_8.png" decoding="async" width="117" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/9/92/Indonesian_Road_Sign_8.png/175px-Indonesian_Road_Sign_8.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/9/92/Indonesian_Road_Sign_8.png/234px-Indonesian_Road_Sign_8.png 2x" data-file-width="1126" data-file-height="1155"></a></span></div>
    <div class="gallerytext">
<p>Lontaran kerikil
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesia_New_Road_Sign_3i.png" class="mw-file-description" title="Bagian tepi Rawan runtuh (Longsor)"><img alt="Bagian tepi Rawan runtuh (Longsor)" src="//upload.wikimedia.org/wikipedia/commons/thumb/3/3b/Indonesia_New_Road_Sign_3i.png/120px-Indonesia_New_Road_Sign_3i.png" decoding="async" width="120" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/3/3b/Indonesia_New_Road_Sign_3i.png/180px-Indonesia_New_Road_Sign_3i.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/3/3b/Indonesia_New_Road_Sign_3i.png/240px-Indonesia_New_Road_Sign_3i.png 2x" data-file-width="1145" data-file-height="1146"></a></span></div>
    <div class="gallerytext">
<p>Bagian tepi Rawan runtuh (Longsor)
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesia_New_Road_Sign_4a1.png" class="mw-file-description" title="Lampu lalu Lintas"><img alt="Lampu lalu Lintas" src="//upload.wikimedia.org/wikipedia/commons/thumb/e/e2/Indonesia_New_Road_Sign_4a1.png/120px-Indonesia_New_Road_Sign_4a1.png" decoding="async" width="120" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/e/e2/Indonesia_New_Road_Sign_4a1.png/180px-Indonesia_New_Road_Sign_4a1.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/e/e2/Indonesia_New_Road_Sign_4a1.png/240px-Indonesia_New_Road_Sign_4a1.png 2x" data-file-width="1141" data-file-height="1142"></a></span></div>
    <div class="gallerytext">
<p>Lampu lalu Lintas
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesia_New_Road_Sign_4b1.png" class="mw-file-description" title="Persimpangan 4 arah"><img alt="Persimpangan 4 arah" src="//upload.wikimedia.org/wikipedia/commons/thumb/9/92/Indonesia_New_Road_Sign_4b1.png/117px-Indonesia_New_Road_Sign_4b1.png" decoding="async" width="117" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/9/92/Indonesia_New_Road_Sign_4b1.png/175px-Indonesia_New_Road_Sign_4b1.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/9/92/Indonesia_New_Road_Sign_4b1.png/233px-Indonesia_New_Road_Sign_4b1.png 2x" data-file-width="1144" data-file-height="1178"></a></span></div>
    <div class="gallerytext">
<p>Persimpangan 4 arah
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesia_New_Road_Sign_4b10.png" class="mw-file-description" title="Persimpangan tiga berganda"><img alt="Persimpangan tiga berganda" src="//upload.wikimedia.org/wikipedia/commons/thumb/2/26/Indonesia_New_Road_Sign_4b10.png/120px-Indonesia_New_Road_Sign_4b10.png" decoding="async" width="120" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/2/26/Indonesia_New_Road_Sign_4b10.png/180px-Indonesia_New_Road_Sign_4b10.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/2/26/Indonesia_New_Road_Sign_4b10.png/240px-Indonesia_New_Road_Sign_4b10.png 2x" data-file-width="1141" data-file-height="1141"></a></span></div>
    <div class="gallerytext">
<p>Persimpangan tiga berganda
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesia_New_Road_Sign_4b11.png" class="mw-file-description" title="Persimpangan tiga berganda"><img alt="Persimpangan tiga berganda" src="//upload.wikimedia.org/wikipedia/commons/thumb/f/f5/Indonesia_New_Road_Sign_4b11.png/120px-Indonesia_New_Road_Sign_4b11.png" decoding="async" width="120" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/f/f5/Indonesia_New_Road_Sign_4b11.png/180px-Indonesia_New_Road_Sign_4b11.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/f/f5/Indonesia_New_Road_Sign_4b11.png/240px-Indonesia_New_Road_Sign_4b11.png 2x" data-file-width="1141" data-file-height="1142"></a></span></div>
    <div class="gallerytext">
<p>Persimpangan tiga berganda
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesia_New_Road_Sign_4b13.png" class="mw-file-description" title="Persimpangan tiga serong"><img alt="Persimpangan tiga serong" src="//upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Indonesia_New_Road_Sign_4b13.png/111px-Indonesia_New_Road_Sign_4b13.png" decoding="async" width="111" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Indonesia_New_Road_Sign_4b13.png/166px-Indonesia_New_Road_Sign_4b13.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Indonesia_New_Road_Sign_4b13.png/221px-Indonesia_New_Road_Sign_4b13.png 2x" data-file-width="1141" data-file-height="1238"></a></span></div>
    <div class="gallerytext">
<p>Persimpangan tiga serong
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesia_New_Road_Sign_4b17.png" class="mw-file-description" title="Persimpangan tiga"><img alt="Persimpangan tiga" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/bd/Indonesia_New_Road_Sign_4b17.png/120px-Indonesia_New_Road_Sign_4b17.png" decoding="async" width="120" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/bd/Indonesia_New_Road_Sign_4b17.png/180px-Indonesia_New_Road_Sign_4b17.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/bd/Indonesia_New_Road_Sign_4b17.png/240px-Indonesia_New_Road_Sign_4b17.png 2x" data-file-width="1141" data-file-height="1142"></a></span></div>
    <div class="gallerytext">
<p>Persimpangan tiga
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesia_New_Road_Sign_4b18.png" class="mw-file-description" title="Persimpangan tiga"><img alt="Persimpangan tiga" src="//upload.wikimedia.org/wikipedia/commons/thumb/2/25/Indonesia_New_Road_Sign_4b18.png/110px-Indonesia_New_Road_Sign_4b18.png" decoding="async" width="110" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/2/25/Indonesia_New_Road_Sign_4b18.png/165px-Indonesia_New_Road_Sign_4b18.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/2/25/Indonesia_New_Road_Sign_4b18.png/220px-Indonesia_New_Road_Sign_4b18.png 2x" data-file-width="1141" data-file-height="1245"></a></span></div>
    <div class="gallerytext">
<p>Persimpangan tiga
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesia_New_Road_Sign_4b19.png" class="mw-file-description" title="Persimpangan tiga serong"><img alt="Persimpangan tiga serong" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b1/Indonesia_New_Road_Sign_4b19.png/120px-Indonesia_New_Road_Sign_4b19.png" decoding="async" width="120" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b1/Indonesia_New_Road_Sign_4b19.png/180px-Indonesia_New_Road_Sign_4b19.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b1/Indonesia_New_Road_Sign_4b19.png/240px-Indonesia_New_Road_Sign_4b19.png 2x" data-file-width="1141" data-file-height="1142"></a></span></div>
    <div class="gallerytext">
<p>Persimpangan tiga serong
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesia_New_Road_Sign_4b2.png" class="mw-file-description" title="Persimpangan 4 arah"><img alt="Persimpangan 4 arah" src="//upload.wikimedia.org/wikipedia/commons/thumb/3/33/Indonesia_New_Road_Sign_4b2.png/118px-Indonesia_New_Road_Sign_4b2.png" decoding="async" width="118" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/3/33/Indonesia_New_Road_Sign_4b2.png/177px-Indonesia_New_Road_Sign_4b2.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/3/33/Indonesia_New_Road_Sign_4b2.png/236px-Indonesia_New_Road_Sign_4b2.png 2x" data-file-width="1141" data-file-height="1160"></a></span></div>
    <div class="gallerytext">
<p>Persimpangan 4 arah
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesia_New_Road_Sign_4b3.png" class="mw-file-description" title="Bundaran"><img alt="Bundaran" src="//upload.wikimedia.org/wikipedia/commons/thumb/8/85/Indonesia_New_Road_Sign_4b3.png/120px-Indonesia_New_Road_Sign_4b3.png" decoding="async" width="120" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/8/85/Indonesia_New_Road_Sign_4b3.png/180px-Indonesia_New_Road_Sign_4b3.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/8/85/Indonesia_New_Road_Sign_4b3.png/240px-Indonesia_New_Road_Sign_4b3.png 2x" data-file-width="1141" data-file-height="1142"></a></span></div>
    <div class="gallerytext">
<p>Bundaran
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesia_New_Road_Sign_4b5.png" class="mw-file-description" title="Persimpangan tiga lengan serong"><img alt="Persimpangan tiga lengan serong" src="//upload.wikimedia.org/wikipedia/commons/thumb/1/1c/Indonesia_New_Road_Sign_4b5.png/111px-Indonesia_New_Road_Sign_4b5.png" decoding="async" width="111" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/1/1c/Indonesia_New_Road_Sign_4b5.png/166px-Indonesia_New_Road_Sign_4b5.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/1/1c/Indonesia_New_Road_Sign_4b5.png/221px-Indonesia_New_Road_Sign_4b5.png 2x" data-file-width="1141" data-file-height="1238"></a></span></div>
    <div class="gallerytext">
<p>Persimpangan tiga lengan serong
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesia_New_Road_Sign_4b6.png" class="mw-file-description" title="Penggabungan jalan"><img alt="Penggabungan jalan" src="//upload.wikimedia.org/wikipedia/commons/thumb/f/fd/Indonesia_New_Road_Sign_4b6.png/120px-Indonesia_New_Road_Sign_4b6.png" decoding="async" width="120" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/f/fd/Indonesia_New_Road_Sign_4b6.png/180px-Indonesia_New_Road_Sign_4b6.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/f/fd/Indonesia_New_Road_Sign_4b6.png/240px-Indonesia_New_Road_Sign_4b6.png 2x" data-file-width="1141" data-file-height="1142"></a></span></div>
    <div class="gallerytext">
<p>Penggabungan jalan
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesia_New_Road_Sign_4b7.png" class="mw-file-description" title="Penggabungan jalan"><img alt="Penggabungan jalan" src="//upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Indonesia_New_Road_Sign_4b7.png/120px-Indonesia_New_Road_Sign_4b7.png" decoding="async" width="120" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Indonesia_New_Road_Sign_4b7.png/180px-Indonesia_New_Road_Sign_4b7.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Indonesia_New_Road_Sign_4b7.png/240px-Indonesia_New_Road_Sign_4b7.png 2x" data-file-width="1141" data-file-height="1142"></a></span></div>
    <div class="gallerytext">
<p>Penggabungan jalan
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesia_New_Road_Sign_4b8.png" class="mw-file-description" title="Persimpangan 3 arah"><img alt="Persimpangan 3 arah" src="//upload.wikimedia.org/wikipedia/commons/thumb/d/d6/Indonesia_New_Road_Sign_4b8.png/116px-Indonesia_New_Road_Sign_4b8.png" decoding="async" width="116" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/d/d6/Indonesia_New_Road_Sign_4b8.png/174px-Indonesia_New_Road_Sign_4b8.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/d/d6/Indonesia_New_Road_Sign_4b8.png/232px-Indonesia_New_Road_Sign_4b8.png 2x" data-file-width="1141" data-file-height="1178"></a></span></div>
    <div class="gallerytext">
<p>Persimpangan 3 arah
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesia_New_Road_Sign_4b9.png" class="mw-file-description" title="Persimpangan 3 arah"><img alt="Persimpangan 3 arah" src="//upload.wikimedia.org/wikipedia/commons/thumb/9/96/Indonesia_New_Road_Sign_4b9.png/111px-Indonesia_New_Road_Sign_4b9.png" decoding="async" width="111" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/9/96/Indonesia_New_Road_Sign_4b9.png/166px-Indonesia_New_Road_Sign_4b9.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/9/96/Indonesia_New_Road_Sign_4b9.png/221px-Indonesia_New_Road_Sign_4b9.png 2x" data-file-width="1141" data-file-height="1238"></a></span></div>
    <div class="gallerytext">
<p>Persimpangan 3 arah
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesia_New_Road_Sign_4c1.png" class="mw-file-description" title="Awal bangunan pemisah untuk lalulintas dua arah"><img alt="Awal bangunan pemisah untuk lalulintas dua arah" src="//upload.wikimedia.org/wikipedia/commons/thumb/9/92/Indonesia_New_Road_Sign_4c1.png/120px-Indonesia_New_Road_Sign_4c1.png" decoding="async" width="120" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/9/92/Indonesia_New_Road_Sign_4c1.png/180px-Indonesia_New_Road_Sign_4c1.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/9/92/Indonesia_New_Road_Sign_4c1.png/240px-Indonesia_New_Road_Sign_4c1.png 2x" data-file-width="1141" data-file-height="1142"></a></span></div>
    <div class="gallerytext">
<p>Awal bangunan pemisah untuk lalulintas dua arah
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesia_New_Road_Sign_4c2.png" class="mw-file-description" title="Akhir bangunan pemisah untuk lalulintas dua arah"><img alt="Akhir bangunan pemisah untuk lalulintas dua arah" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/bf/Indonesia_New_Road_Sign_4c2.png/120px-Indonesia_New_Road_Sign_4c2.png" decoding="async" width="120" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/bf/Indonesia_New_Road_Sign_4c2.png/180px-Indonesia_New_Road_Sign_4c2.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/bf/Indonesia_New_Road_Sign_4c2.png/240px-Indonesia_New_Road_Sign_4c2.png 2x" data-file-width="1141" data-file-height="1142"></a></span></div>
    <div class="gallerytext">
<p>Akhir bangunan pemisah untuk lalulintas dua arah
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesia_New_Road_Sign_4c3.png" class="mw-file-description" title="Awal bangunan pemisah untuk lalulintas satu arah"><img alt="Awal bangunan pemisah untuk lalulintas satu arah" src="//upload.wikimedia.org/wikipedia/commons/thumb/2/28/Indonesia_New_Road_Sign_4c3.png/120px-Indonesia_New_Road_Sign_4c3.png" decoding="async" width="120" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/2/28/Indonesia_New_Road_Sign_4c3.png/179px-Indonesia_New_Road_Sign_4c3.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/2/28/Indonesia_New_Road_Sign_4c3.png/239px-Indonesia_New_Road_Sign_4c3.png 2x" data-file-width="1141" data-file-height="1145"></a></span></div>
    <div class="gallerytext">
<p>Awal bangunan pemisah untuk lalulintas satu arah
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesia_New_Road_Sign_6a.png" class="mw-file-description" title="Penyebrangan pejalan kaki"><img alt="Penyebrangan pejalan kaki" src="//upload.wikimedia.org/wikipedia/commons/thumb/a/a1/Indonesia_New_Road_Sign_6a.png/120px-Indonesia_New_Road_Sign_6a.png" decoding="async" width="120" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/a/a1/Indonesia_New_Road_Sign_6a.png/180px-Indonesia_New_Road_Sign_6a.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/a/a1/Indonesia_New_Road_Sign_6a.png/240px-Indonesia_New_Road_Sign_6a.png 2x" data-file-width="1141" data-file-height="1142"></a></span></div>
    <div class="gallerytext">
<p>Penyebrangan pejalan kaki
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesia_New_Road_Sign_6b.png" class="mw-file-description" title="Area banyak pejalan kaki"><img alt="Area banyak pejalan kaki" src="//upload.wikimedia.org/wikipedia/commons/thumb/6/65/Indonesia_New_Road_Sign_6b.png/120px-Indonesia_New_Road_Sign_6b.png" decoding="async" width="120" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/6/65/Indonesia_New_Road_Sign_6b.png/180px-Indonesia_New_Road_Sign_6b.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/6/65/Indonesia_New_Road_Sign_6b.png/240px-Indonesia_New_Road_Sign_6b.png 2x" data-file-width="1141" data-file-height="1142"></a></span></div>
    <div class="gallerytext">
<p>Area banyak pejalan kaki
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesia_New_Road_Sign_6c.png" class="mw-file-description" title="Area pejalan kaki anak-anak"><img alt="Area pejalan kaki anak-anak" src="//upload.wikimedia.org/wikipedia/commons/thumb/f/f5/Indonesia_New_Road_Sign_6c.png/120px-Indonesia_New_Road_Sign_6c.png" decoding="async" width="120" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/f/f5/Indonesia_New_Road_Sign_6c.png/180px-Indonesia_New_Road_Sign_6c.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/f/f5/Indonesia_New_Road_Sign_6c.png/240px-Indonesia_New_Road_Sign_6c.png 2x" data-file-width="1141" data-file-height="1142"></a></span></div>
    <div class="gallerytext">
<p>Area pejalan kaki anak-anak
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesia_New_Road_Sign_6e.png" class="mw-file-description" title="Pesepeda"><img alt="Pesepeda" src="//upload.wikimedia.org/wikipedia/commons/thumb/7/7c/Indonesia_New_Road_Sign_6e.png/106px-Indonesia_New_Road_Sign_6e.png" decoding="async" width="106" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/7/7c/Indonesia_New_Road_Sign_6e.png/159px-Indonesia_New_Road_Sign_6e.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/7/7c/Indonesia_New_Road_Sign_6e.png/211px-Indonesia_New_Road_Sign_6e.png 2x" data-file-width="1145" data-file-height="1299"></a></span></div>
    <div class="gallerytext">
<p>Pesepeda
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesia_New_Road_Sign_6f.png" class="mw-file-description" title="Binatang ternak"><img alt="Binatang ternak" src="//upload.wikimedia.org/wikipedia/commons/thumb/a/a7/Indonesia_New_Road_Sign_6f.png/120px-Indonesia_New_Road_Sign_6f.png" decoding="async" width="120" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/a/a7/Indonesia_New_Road_Sign_6f.png/180px-Indonesia_New_Road_Sign_6f.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/a/a7/Indonesia_New_Road_Sign_6f.png/240px-Indonesia_New_Road_Sign_6f.png 2x" data-file-width="1141" data-file-height="1142"></a></span></div>
    <div class="gallerytext">
<p>Binatang ternak
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesia_New_Road_Sign_6g.png" class="mw-file-description" title="Binatang liar"><img alt="Binatang liar" src="//upload.wikimedia.org/wikipedia/commons/thumb/9/9c/Indonesia_New_Road_Sign_6g.png/120px-Indonesia_New_Road_Sign_6g.png" decoding="async" width="120" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/9/9c/Indonesia_New_Road_Sign_6g.png/180px-Indonesia_New_Road_Sign_6g.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/9/9c/Indonesia_New_Road_Sign_6g.png/240px-Indonesia_New_Road_Sign_6g.png 2x" data-file-width="1141" data-file-height="1142"></a></span></div>
    <div class="gallerytext">
<p>Binatang liar
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesia_New_Road_Sign_8a.png" class="mw-file-description" title="Hati-hati"><img alt="Hati-hati" src="//upload.wikimedia.org/wikipedia/commons/thumb/8/82/Indonesia_New_Road_Sign_8a.png/107px-Indonesia_New_Road_Sign_8a.png" decoding="async" width="107" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/8/82/Indonesia_New_Road_Sign_8a.png/161px-Indonesia_New_Road_Sign_8a.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/8/82/Indonesia_New_Road_Sign_8a.png/214px-Indonesia_New_Road_Sign_8a.png 2x" data-file-width="1141" data-file-height="1277"></a></span></div>
    <div class="gallerytext">
<p>Hati-hati
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesia_New_Road_Sign_8b.png" class="mw-file-description" title="Pekerjaan di depan"><img alt="Pekerjaan di depan" src="//upload.wikimedia.org/wikipedia/commons/thumb/9/9c/Indonesia_New_Road_Sign_8b.png/110px-Indonesia_New_Road_Sign_8b.png" decoding="async" width="110" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/9/9c/Indonesia_New_Road_Sign_8b.png/165px-Indonesia_New_Road_Sign_8b.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/9/9c/Indonesia_New_Road_Sign_8b.png/220px-Indonesia_New_Road_Sign_8b.png 2x" data-file-width="1141" data-file-height="1247"></a></span></div>
    <div class="gallerytext">
<p>Pekerjaan di depan
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesia_New_Road_Sign_8c.png" class="mw-file-description" title="Batas tinggi ruang bebas"><img alt="Batas tinggi ruang bebas" src="//upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Indonesia_New_Road_Sign_8c.png/120px-Indonesia_New_Road_Sign_8c.png" decoding="async" width="120" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Indonesia_New_Road_Sign_8c.png/180px-Indonesia_New_Road_Sign_8c.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Indonesia_New_Road_Sign_8c.png/240px-Indonesia_New_Road_Sign_8c.png 2x" data-file-width="1146" data-file-height="1146"></a></span></div>
    <div class="gallerytext">
<p>Batas tinggi ruang bebas
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesia_New_Road_Sign_8d.png" class="mw-file-description" title="Batas lebar ruang bebas"><img alt="Batas lebar ruang bebas" src="//upload.wikimedia.org/wikipedia/commons/thumb/f/fb/Indonesia_New_Road_Sign_8d.png/120px-Indonesia_New_Road_Sign_8d.png" decoding="async" width="120" height="119" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/f/fb/Indonesia_New_Road_Sign_8d.png/180px-Indonesia_New_Road_Sign_8d.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/f/fb/Indonesia_New_Road_Sign_8d.png/240px-Indonesia_New_Road_Sign_8d.png 2x" data-file-width="1147" data-file-height="1142"></a></span></div>
    <div class="gallerytext">
<p>Batas lebar ruang bebas
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesia_New_Road_Sign_8g.png" class="mw-file-description" title="Daerah pesawat terbang rendah"><img alt="Daerah pesawat terbang rendah" src="//upload.wikimedia.org/wikipedia/commons/thumb/d/d7/Indonesia_New_Road_Sign_8g.png/120px-Indonesia_New_Road_Sign_8g.png" decoding="async" width="120" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/d/d7/Indonesia_New_Road_Sign_8g.png/180px-Indonesia_New_Road_Sign_8g.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/d/d7/Indonesia_New_Road_Sign_8g.png/240px-Indonesia_New_Road_Sign_8g.png 2x" data-file-width="1169" data-file-height="1169"></a></span></div>
    <div class="gallerytext">
<p>Daerah pesawat terbang rendah
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesia_New_Road_Sign_8h.png" class="mw-file-description" title="Angin samping"><img alt="Angin samping" src="//upload.wikimedia.org/wikipedia/commons/thumb/a/a8/Indonesia_New_Road_Sign_8h.png/120px-Indonesia_New_Road_Sign_8h.png" decoding="async" width="120" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/a/a8/Indonesia_New_Road_Sign_8h.png/180px-Indonesia_New_Road_Sign_8h.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/a/a8/Indonesia_New_Road_Sign_8h.png/240px-Indonesia_New_Road_Sign_8h.png 2x" data-file-width="1141" data-file-height="1142"></a></span></div>
    <div class="gallerytext">
<p>Angin samping
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesia_New_Road_Sign_8i.png" class="mw-file-description" title="Lalu lintas dua arah"><img alt="Lalu lintas dua arah" src="//upload.wikimedia.org/wikipedia/commons/thumb/3/30/Indonesia_New_Road_Sign_8i.png/120px-Indonesia_New_Road_Sign_8i.png" decoding="async" width="120" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/3/30/Indonesia_New_Road_Sign_8i.png/180px-Indonesia_New_Road_Sign_8i.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/3/30/Indonesia_New_Road_Sign_8i.png/240px-Indonesia_New_Road_Sign_8i.png 2x" data-file-width="1133" data-file-height="1133"></a></span></div>
    <div class="gallerytext">
<p>Lalu lintas dua arah
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesia_New_Road_Sign_8j.png" class="mw-file-description" title="Jembatan angkat"><img alt="Jembatan angkat" src="//upload.wikimedia.org/wikipedia/commons/thumb/e/e5/Indonesia_New_Road_Sign_8j.png/120px-Indonesia_New_Road_Sign_8j.png" decoding="async" width="120" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/e/e5/Indonesia_New_Road_Sign_8j.png/180px-Indonesia_New_Road_Sign_8j.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/e/e5/Indonesia_New_Road_Sign_8j.png/240px-Indonesia_New_Road_Sign_8j.png 2x" data-file-width="1145" data-file-height="1146"></a></span></div>
    <div class="gallerytext">
<p>Jembatan angkat
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesia_New_Road_Sign_8e.png" class="mw-file-description" title="Perlintasan kereta api dengan palang pintu"><img alt="Perlintasan kereta api dengan palang pintu" src="//upload.wikimedia.org/wikipedia/commons/thumb/3/3d/Indonesia_New_Road_Sign_8e.png/120px-Indonesia_New_Road_Sign_8e.png" decoding="async" width="120" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/3/3d/Indonesia_New_Road_Sign_8e.png/180px-Indonesia_New_Road_Sign_8e.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/3/3d/Indonesia_New_Road_Sign_8e.png/240px-Indonesia_New_Road_Sign_8e.png 2x" data-file-width="1142" data-file-height="1142"></a></span></div>
    <div class="gallerytext">
<p>Perlintasan kereta api dengan palang pintu
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesia_New_Road_Sign_8f.png" class="mw-file-description" title="Perlintasan kereta api tanpa palang pintu"><img alt="Perlintasan kereta api tanpa palang pintu" src="//upload.wikimedia.org/wikipedia/commons/thumb/9/91/Indonesia_New_Road_Sign_8f.png/120px-Indonesia_New_Road_Sign_8f.png" decoding="async" width="120" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/9/91/Indonesia_New_Road_Sign_8f.png/180px-Indonesia_New_Road_Sign_8f.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/9/91/Indonesia_New_Road_Sign_8f.png/240px-Indonesia_New_Road_Sign_8f.png 2x" data-file-width="1142" data-file-height="1142"></a></span></div>
    <div class="gallerytext">
<p>Perlintasan kereta api tanpa palang pintu
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesia_Road_Sign_Toll_Road_fog.svg" class="mw-file-description" title="Hati-hati terjadi kabut"><img alt="Hati-hati terjadi kabut" src="//upload.wikimedia.org/wikipedia/commons/thumb/3/3d/Indonesia_Road_Sign_Toll_Road_fog.svg/120px-Indonesia_Road_Sign_Toll_Road_fog.svg.png" decoding="async" width="120" height="39" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/3/3d/Indonesia_Road_Sign_Toll_Road_fog.svg/180px-Indonesia_Road_Sign_Toll_Road_fog.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/3/3d/Indonesia_Road_Sign_Toll_Road_fog.svg/240px-Indonesia_Road_Sign_Toll_Road_fog.svg.png 2x" data-file-width="592" data-file-height="193"></a></span></div>
    <div class="gallerytext">
<p>Hati-hati terjadi kabut
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesia_Road_Sign_Toll_Road_tailwind.png" class="mw-file-description" title="Hati-hati angin kencang dari samping"><img alt="Hati-hati angin kencang dari samping" src="//upload.wikimedia.org/wikipedia/commons/thumb/e/ee/Indonesia_Road_Sign_Toll_Road_tailwind.png/120px-Indonesia_Road_Sign_Toll_Road_tailwind.png" decoding="async" width="120" height="58" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/e/ee/Indonesia_Road_Sign_Toll_Road_tailwind.png/180px-Indonesia_Road_Sign_Toll_Road_tailwind.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/e/ee/Indonesia_Road_Sign_Toll_Road_tailwind.png/240px-Indonesia_Road_Sign_Toll_Road_tailwind.png 2x" data-file-width="925" data-file-height="447"></a></span></div>
    <div class="gallerytext">
<p>Hati-hati angin kencang dari samping
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Arahbelok.png" class="mw-file-description" title="Pengarah tikungan ke kiri atau ke kanan"><img alt="Pengarah tikungan ke kiri atau ke kanan" src="//upload.wikimedia.org/wikipedia/id/thumb/b/bd/Arahbelok.png/120px-Arahbelok.png" decoding="async" width="120" height="79" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/id/thumb/b/bd/Arahbelok.png/180px-Arahbelok.png 1.5x, //upload.wikimedia.org/wikipedia/id/thumb/b/bd/Arahbelok.png/240px-Arahbelok.png 2x" data-file-width="557" data-file-height="368"></a></span></div>
    <div class="gallerytext">
<p>Pengarah tikungan ke kiri atau ke kanan
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Ramburintang.png" class="mw-file-description" title="Rambu peringatan rintangan atau objek berbahaya di sisi kiri jalan (rambu kiri) atau sisi kanan jalan (rambu kanan)"><img alt="Rambu peringatan rintangan atau objek berbahaya di sisi kiri jalan (rambu kiri) atau sisi kanan jalan (rambu kanan)" src="//upload.wikimedia.org/wikipedia/id/thumb/4/4c/Ramburintang.png/94px-Ramburintang.png" decoding="async" width="94" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/id/thumb/4/4c/Ramburintang.png/140px-Ramburintang.png 1.5x, //upload.wikimedia.org/wikipedia/id/thumb/4/4c/Ramburintang.png/187px-Ramburintang.png 2x" data-file-width="199" data-file-height="255"></a></span></div>
    <div class="gallerytext">
<p>Rambu peringatan rintangan atau objek berbahaya di sisi kiri jalan (rambu kiri) atau sisi kanan jalan (rambu kanan)
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Ramburintang2.png" class="mw-file-description" title="Rambu peringatan rintangan atau objek berbahaya pada pemisal lajur atau jalur"><img alt="Rambu peringatan rintangan atau objek berbahaya pada pemisal lajur atau jalur" src="//upload.wikimedia.org/wikipedia/id/thumb/3/38/Ramburintang2.png/45px-Ramburintang2.png" decoding="async" width="45" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/id/thumb/3/38/Ramburintang2.png/67px-Ramburintang2.png 1.5x, //upload.wikimedia.org/wikipedia/id/thumb/3/38/Ramburintang2.png/90px-Ramburintang2.png 2x" data-file-width="200" data-file-height="531"></a></span></div>
    <div class="gallerytext">
<p>Rambu peringatan rintangan atau objek berbahaya pada pemisal lajur atau jalur
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="height: 150px;"><span typeof="mw:Error mw:File"><a href="/w/index.php?title=Istimewa:Pengunggahan&amp;wpDestFile=Indonesia_New_Road_Sign_Pro_2a1._svg" class="new" title="Berkas:Indonesia New Road Sign Pro 2a1. svg"><span class="mw-file-element mw-broken-media" data-width="120" data-height="120">Larangan masuk bagi kendaraan bermotor dan tidak bermotor</span></a></span></div>
    <div class="gallerytext">
<p>Larangan masuk bagi kendaraan bermotor dan tidak bermotor
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesian_Road_Sign_b3c.png" class="mw-file-description" title="Sepeda motor dilarang masuk"><img alt="Sepeda motor dilarang masuk" src="//upload.wikimedia.org/wikipedia/commons/thumb/6/69/Indonesian_Road_Sign_b3c.png/117px-Indonesian_Road_Sign_b3c.png" decoding="async" width="117" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/6/69/Indonesian_Road_Sign_b3c.png/176px-Indonesian_Road_Sign_b3c.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/6/69/Indonesian_Road_Sign_b3c.png/235px-Indonesian_Road_Sign_b3c.png 2x" data-file-width="1128" data-file-height="1152"></a></span></div>
    <div class="gallerytext">
<p>Sepeda motor dilarang masuk
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesian_Road_Sign_b3a.png" class="mw-file-description" title="Mobil dilarang masuk"><img alt="Mobil dilarang masuk" src="//upload.wikimedia.org/wikipedia/commons/thumb/6/60/Indonesian_Road_Sign_b3a.png/120px-Indonesian_Road_Sign_b3a.png" decoding="async" width="120" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/6/60/Indonesian_Road_Sign_b3a.png/180px-Indonesian_Road_Sign_b3a.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/6/60/Indonesian_Road_Sign_b3a.png/240px-Indonesian_Road_Sign_b3a.png 2x" data-file-width="1128" data-file-height="1127"></a></span></div>
    <div class="gallerytext">
<p>Mobil dilarang masuk
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesian_Road_Sign_b3d.png" class="mw-file-description" title="Kendaraan bermotor dilarang masuk"><img alt="Kendaraan bermotor dilarang masuk" src="//upload.wikimedia.org/wikipedia/commons/thumb/2/2e/Indonesian_Road_Sign_b3d.png/120px-Indonesian_Road_Sign_b3d.png" decoding="async" width="120" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/2/2e/Indonesian_Road_Sign_b3d.png/180px-Indonesian_Road_Sign_b3d.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/2/2e/Indonesian_Road_Sign_b3d.png/240px-Indonesian_Road_Sign_b3d.png 2x" data-file-width="1128" data-file-height="1127"></a></span></div>
    <div class="gallerytext">
<p>Kendaraan bermotor dilarang masuk
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesia_New_Road_Sign_Pro_2c3.png" class="mw-file-description" title="Sepeda dilarang masuk"><img alt="Sepeda dilarang masuk" src="//upload.wikimedia.org/wikipedia/commons/thumb/9/99/Indonesia_New_Road_Sign_Pro_2c3.png/105px-Indonesia_New_Road_Sign_Pro_2c3.png" decoding="async" width="105" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/9/99/Indonesia_New_Road_Sign_Pro_2c3.png/158px-Indonesia_New_Road_Sign_Pro_2c3.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/9/99/Indonesia_New_Road_Sign_Pro_2c3.png/210px-Indonesia_New_Road_Sign_Pro_2c3.png 2x" data-file-width="1128" data-file-height="1288"></a></span></div>
    <div class="gallerytext">
<p>Sepeda dilarang masuk
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesia_New_Road_Sign_Pro_2d1.png" class="mw-file-description" title="Larangan untuk truk dengan panjang tertentu"><img alt="Larangan untuk truk dengan panjang tertentu" src="//upload.wikimedia.org/wikipedia/commons/thumb/4/4d/Indonesia_New_Road_Sign_Pro_2d1.png/120px-Indonesia_New_Road_Sign_Pro_2d1.png" decoding="async" width="120" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/4/4d/Indonesia_New_Road_Sign_Pro_2d1.png/180px-Indonesia_New_Road_Sign_Pro_2d1.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/4/4d/Indonesia_New_Road_Sign_Pro_2d1.png/240px-Indonesia_New_Road_Sign_Pro_2d1.png 2x" data-file-width="1128" data-file-height="1127"></a></span></div>
    <div class="gallerytext">
<p>Larangan untuk truk dengan panjang tertentu
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesia_New_Road_Sign_Pro_2d2.png" class="mw-file-description" title="Batas ketinggian"><img alt="Batas ketinggian" src="//upload.wikimedia.org/wikipedia/commons/thumb/5/57/Indonesia_New_Road_Sign_Pro_2d2.png/120px-Indonesia_New_Road_Sign_Pro_2d2.png" decoding="async" width="120" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/5/57/Indonesia_New_Road_Sign_Pro_2d2.png/180px-Indonesia_New_Road_Sign_Pro_2d2.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/5/57/Indonesia_New_Road_Sign_Pro_2d2.png/240px-Indonesia_New_Road_Sign_Pro_2d2.png 2x" data-file-width="1128" data-file-height="1127"></a></span></div>
    <div class="gallerytext">
<p>Batas ketinggian
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesia_New_Road_Sign_Pro_2d3.png" class="mw-file-description" title="Batas ruang lebar"><img alt="Batas ruang lebar" src="//upload.wikimedia.org/wikipedia/commons/thumb/0/0f/Indonesia_New_Road_Sign_Pro_2d3.png/120px-Indonesia_New_Road_Sign_Pro_2d3.png" decoding="async" width="120" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/0/0f/Indonesia_New_Road_Sign_Pro_2d3.png/180px-Indonesia_New_Road_Sign_Pro_2d3.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/0/0f/Indonesia_New_Road_Sign_Pro_2d3.png/240px-Indonesia_New_Road_Sign_Pro_2d3.png 2x" data-file-width="1128" data-file-height="1127"></a></span></div>
    <div class="gallerytext">
<p>Batas ruang lebar
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesia_New_Road_Sign_Pro_2d5.png" class="mw-file-description" title="Batas tonase"><img alt="Batas tonase" src="//upload.wikimedia.org/wikipedia/commons/thumb/d/de/Indonesia_New_Road_Sign_Pro_2d5.png/120px-Indonesia_New_Road_Sign_Pro_2d5.png" decoding="async" width="120" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/d/de/Indonesia_New_Road_Sign_Pro_2d5.png/180px-Indonesia_New_Road_Sign_Pro_2d5.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/d/de/Indonesia_New_Road_Sign_Pro_2d5.png/240px-Indonesia_New_Road_Sign_Pro_2d5.png 2x" data-file-width="1128" data-file-height="1127"></a></span></div>
    <div class="gallerytext">
<p>Batas tonase
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesia_New_Road_Sign_Pro_2d6.png" class="mw-file-description" title="Batas tonase sumbu muatan"><img alt="Batas tonase sumbu muatan" src="//upload.wikimedia.org/wikipedia/commons/thumb/4/4e/Indonesia_New_Road_Sign_Pro_2d6.png/120px-Indonesia_New_Road_Sign_Pro_2d6.png" decoding="async" width="120" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/4/4e/Indonesia_New_Road_Sign_Pro_2d6.png/180px-Indonesia_New_Road_Sign_Pro_2d6.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/4/4e/Indonesia_New_Road_Sign_Pro_2d6.png/240px-Indonesia_New_Road_Sign_Pro_2d6.png 2x" data-file-width="1128" data-file-height="1127"></a></span></div>
    <div class="gallerytext">
<p>Batas tonase sumbu muatan
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesia_New_Road_Sign_Pro_3a.png" class="mw-file-description" title="Dilarang berhenti"><img alt="Dilarang berhenti" src="//upload.wikimedia.org/wikipedia/commons/thumb/5/57/Indonesia_New_Road_Sign_Pro_3a.png/120px-Indonesia_New_Road_Sign_Pro_3a.png" decoding="async" width="120" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/5/57/Indonesia_New_Road_Sign_Pro_3a.png/180px-Indonesia_New_Road_Sign_Pro_3a.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/5/57/Indonesia_New_Road_Sign_Pro_3a.png/240px-Indonesia_New_Road_Sign_Pro_3a.png 2x" data-file-width="1128" data-file-height="1127"></a></span></div>
    <div class="gallerytext">
<p>Dilarang berhenti
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesia_New_Road_Sign_Pro_3b.png" class="mw-file-description" title="Dilarang parkir"><img alt="Dilarang parkir" src="//upload.wikimedia.org/wikipedia/commons/thumb/9/9d/Indonesia_New_Road_Sign_Pro_3b.png/120px-Indonesia_New_Road_Sign_Pro_3b.png" decoding="async" width="120" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/9/9d/Indonesia_New_Road_Sign_Pro_3b.png/180px-Indonesia_New_Road_Sign_Pro_3b.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/9/9d/Indonesia_New_Road_Sign_Pro_3b.png/240px-Indonesia_New_Road_Sign_Pro_3b.png 2x" data-file-width="1128" data-file-height="1127"></a></span></div>
    <div class="gallerytext">
<p>Dilarang parkir
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesia_New_Road_Sign_Pro_4h.png" class="mw-file-description" title="Batas maksimal kecepatan"><img alt="Batas maksimal kecepatan" src="//upload.wikimedia.org/wikipedia/commons/thumb/f/f9/Indonesia_New_Road_Sign_Pro_4h.png/120px-Indonesia_New_Road_Sign_Pro_4h.png" decoding="async" width="120" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/f/f9/Indonesia_New_Road_Sign_Pro_4h.png/180px-Indonesia_New_Road_Sign_Pro_4h.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/f/f9/Indonesia_New_Road_Sign_Pro_4h.png/240px-Indonesia_New_Road_Sign_Pro_4h.png 2x" data-file-width="1127" data-file-height="1128"></a></span></div>
    <div class="gallerytext">
<p>Batas maksimal kecepatan
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesia_new_road_sign_pro_4g.png" class="mw-file-description" title="Batas jarak antar kendaraan"><img alt="Batas jarak antar kendaraan" src="//upload.wikimedia.org/wikipedia/commons/thumb/0/09/Indonesia_new_road_sign_pro_4g.png/120px-Indonesia_new_road_sign_pro_4g.png" decoding="async" width="120" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/0/09/Indonesia_new_road_sign_pro_4g.png/180px-Indonesia_new_road_sign_pro_4g.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/0/09/Indonesia_new_road_sign_pro_4g.png/240px-Indonesia_new_road_sign_pro_4g.png 2x" data-file-width="1128" data-file-height="1127"></a></span></div>
    <div class="gallerytext">
<p>Batas jarak antar kendaraan
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="height: 150px;"><span typeof="mw:Error mw:File"><a href="/w/index.php?title=Istimewa:Pengunggahan&amp;wpDestFile=Indonesia_New_Road_Sign_Pro_b5a.png" class="new" title="Berkas:Indonesia New Road Sign Pro b5a.png"><span class="mw-file-element mw-broken-media" data-width="120" data-height="120">Larangan berbelok ke kiri bagi kendaaran bermotor maupun tidak bermotor</span></a></span></div>
    <div class="gallerytext">
<p>Larangan berbelok ke kiri bagi kendaaran bermotor maupun tidak bermotor
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="height: 150px;"><span typeof="mw:Error mw:File"><a href="/w/index.php?title=Istimewa:Pengunggahan&amp;wpDestFile=Indonesia_New_Road_Sign_Pro_b5b.png" class="new" title="Berkas:Indonesia New Road Sign Pro b5b.png"><span class="mw-file-element mw-broken-media" data-width="120" data-height="120">Larangan berbelok ke kanan bagi kendaraan bermotor maupun tidak bermotor</span></a></span></div>
    <div class="gallerytext">
<p>Larangan berbelok ke kanan bagi kendaraan bermotor maupun tidak bermotor
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="height: 150px;"><span typeof="mw:Error mw:File"><a href="/w/index.php?title=Istimewa:Pengunggahan&amp;wpDestFile=Indonesia_New_Road_Sign_Pro_b5c.png" class="new" title="Berkas:Indonesia New Road Sign Pro b5c.png"><span class="mw-file-element mw-broken-media" data-width="120" data-height="120">Larangan berbalik arah bagi kendaraan bermotor maupun tidak bermotor</span></a></span></div>
    <div class="gallerytext">
<p>Larangan berbalik arah bagi kendaraan bermotor maupun tidak bermotor
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="height: 150px;"><span typeof="mw:Error mw:File"><a href="/w/index.php?title=Istimewa:Pengunggahan&amp;wpDestFile=Indonesia_New_Road_Sign_Pro_b6.png" class="new" title="Berkas:Indonesia New Road Sign Pro b6.png"><span class="mw-file-element mw-broken-media" data-width="120" data-height="120">Larangan mendahului kendaraan lain yang berjalan di depan</span></a></span></div>
    <div class="gallerytext">
<p>Larangan mendahului kendaraan lain yang berjalan di depan
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="height: 150px;"><span typeof="mw:Error mw:File"><a href="/w/index.php?title=Istimewa:Pengunggahan&amp;wpDestFile=Indonesia_New_Road_Sign_Pro_5.svg" class="new" title="Berkas:Indonesia New Road Sign Pro 5.svg"><span class="mw-file-element mw-broken-media" data-width="120" data-height="120">Larangan menggunakan isyarat suara</span></a></span></div>
    <div class="gallerytext">
<p>Larangan menggunakan isyarat suara
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="height: 150px;"><span typeof="mw:Error mw:File"><a href="/w/index.php?title=Istimewa:Pengunggahan&amp;wpDestFile=Indonesia_New_Road_Sign_Pro_b11c.png" class="new" title="Berkas:Indonesia New Road Sign Pro b11c.png"><span class="mw-file-element mw-broken-media" data-width="120" data-height="120">Batas akhir seluruh larangan</span></a></span></div>
    <div class="gallerytext">
<p>Batas akhir seluruh larangan
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesia_New_Road_Sign_Pro_1a.png" class="mw-file-description" title="Berhenti"><img alt="Berhenti" src="//upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Indonesia_New_Road_Sign_Pro_1a.png/119px-Indonesia_New_Road_Sign_Pro_1a.png" decoding="async" width="119" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Indonesia_New_Road_Sign_Pro_1a.png/179px-Indonesia_New_Road_Sign_Pro_1a.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Indonesia_New_Road_Sign_Pro_1a.png/239px-Indonesia_New_Road_Sign_Pro_1a.png 2x" data-file-width="1324" data-file-height="1330"></a></span></div>
    <div class="gallerytext">
<p>Berhenti
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesia_New_Road_Sign_Pro_1b.png" class="mw-file-description" title="Beri jalan"><img alt="Beri jalan" src="//upload.wikimedia.org/wikipedia/commons/thumb/0/02/Indonesia_New_Road_Sign_Pro_1b.png/120px-Indonesia_New_Road_Sign_Pro_1b.png" decoding="async" width="120" height="98" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/0/02/Indonesia_New_Road_Sign_Pro_1b.png/180px-Indonesia_New_Road_Sign_Pro_1b.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/0/02/Indonesia_New_Road_Sign_Pro_1b.png/240px-Indonesia_New_Road_Sign_Pro_1b.png 2x" data-file-width="1337" data-file-height="1095"></a></span></div>
    <div class="gallerytext">
<p>Beri jalan
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="height: 150px;"><span typeof="mw:Error mw:File"><a href="/w/index.php?title=Istimewa:Pengunggahan&amp;wpDestFile=Indonesia_New_Road_Sign_Mandatory_1a.png" class="new" title="Berkas:Indonesia New Road Sign Mandatory 1a.png"><span class="mw-file-element mw-broken-media" data-width="120" data-height="120">Wajib membelok ke kiri</span></a></span></div>
    <div class="gallerytext">
<p>Wajib membelok ke kiri
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="height: 150px;"><span typeof="mw:Error mw:File"><a href="/w/index.php?title=Istimewa:Pengunggahan&amp;wpDestFile=Indonesia_New_Road_Sign_Mandatory_1b.png" class="new" title="Berkas:Indonesia New Road Sign Mandatory 1b.png"><span class="mw-file-element mw-broken-media" data-width="120" data-height="120">Wajib membelok ke kanan</span></a></span></div>
    <div class="gallerytext">
<p>Wajib membelok ke kanan
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="height: 150px;"><span typeof="mw:Error mw:File"><a href="/w/index.php?title=Istimewa:Pengunggahan&amp;wpDestFile=Indonesia_New_Road_Sign_Mandatory_1c.png" class="new" title="Berkas:Indonesia New Road Sign Mandatory 1c.png"><span class="mw-file-element mw-broken-media" data-width="120" data-height="120">Wajib membelok ke kiri</span></a></span></div>
    <div class="gallerytext">
<p>Wajib membelok ke kiri
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="height: 150px;"><span typeof="mw:Error mw:File"><a href="/w/index.php?title=Istimewa:Pengunggahan&amp;wpDestFile=Indonesia_New_Road_Sign_Mandatory_1d.png" class="new" title="Berkas:Indonesia New Road Sign Mandatory 1d.png"><span class="mw-file-element mw-broken-media" data-width="120" data-height="120">Wajib membelok ke kanan</span></a></span></div>
    <div class="gallerytext">
<p>Wajib membelok ke kanan
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="height: 150px;"><span typeof="mw:Error mw:File"><a href="/w/index.php?title=Istimewa:Pengunggahan&amp;wpDestFile=Indonesia_New_Road_Sign_Mandatory_1e.png" class="new" title="Berkas:Indonesia New Road Sign Mandatory 1e.png"><span class="mw-file-element mw-broken-media" data-width="120" data-height="120">Wajib lurus</span></a></span></div>
    <div class="gallerytext">
<p>Wajib lurus
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="height: 150px;"><span typeof="mw:Error mw:File"><a href="/w/index.php?title=Istimewa:Pengunggahan&amp;wpDestFile=Indonesia_New_Road_Sign_Mandatory_1f.png" class="new" title="Berkas:Indonesia New Road Sign Mandatory 1f.png"><span class="mw-file-element mw-broken-media" data-width="120" data-height="120">Wajib mengitari bundaran</span></a></span></div>
    <div class="gallerytext">
<p>Wajib mengitari bundaran
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="height: 150px;"><span typeof="mw:Error mw:File"><a href="/w/index.php?title=Istimewa:Pengunggahan&amp;wpDestFile=Indonesia_New_Road_Sign_Mandatory_3a.png" class="new" title="Berkas:Indonesia New Road Sign Mandatory 3a.png"><span class="mw-file-element mw-broken-media" data-width="120" data-height="120">Wajib memasuki lajur kiri</span></a></span></div>
    <div class="gallerytext">
<p>Wajib memasuki lajur kiri
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="height: 150px;"><span typeof="mw:Error mw:File"><a href="/w/index.php?title=Istimewa:Pengunggahan&amp;wpDestFile=Indonesia_New_Road_Sign_Mandatory_3b.png" class="new" title="Berkas:Indonesia New Road Sign Mandatory 3b.png"><span class="mw-file-element mw-broken-media" data-width="120" data-height="120">Wajib memasuki lajur kanan</span></a></span></div>
    <div class="gallerytext">
<p>Wajib memasuki lajur kanan
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="height: 150px;"><span typeof="mw:Error mw:File"><a href="/w/index.php?title=Istimewa:Pengunggahan&amp;wpDestFile=Indonesia_New_Road_Sign_Mandatory_3c.png" class="new" title="Berkas:Indonesia New Road Sign Mandatory 3c.png"><span class="mw-file-element mw-broken-media" data-width="120" data-height="120">Wajib memasuki lajur yang ditunjuk</span></a></span></div>
    <div class="gallerytext">
<p>Wajib memasuki lajur yang ditunjuk
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="height: 150px;"><span typeof="mw:Error mw:File"><a href="/w/index.php?title=Istimewa:Pengunggahan&amp;wpDestFile=Indonesia_New_Road_Sign_Mandatory_44.png" class="new" title="Berkas:Indonesia New Road Sign Mandatory 44.png"><span class="mw-file-element mw-broken-media" data-width="120" data-height="120">Batas minimum kecepatan</span></a></span></div>
    <div class="gallerytext">
<p>Batas minimum kecepatan
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="height: 150px;"><span typeof="mw:Error mw:File"><a href="/w/index.php?title=Istimewa:Pengunggahan&amp;wpDestFile=Indonesia_New_Road_Sign_Mandatory_6a1.png" class="new" title="Berkas:Indonesia New Road Sign Mandatory 6a1.png"><span class="mw-file-element mw-broken-media" data-width="120" data-height="120">Jalur pesepeda motor</span></a></span></div>
    <div class="gallerytext">
<p>Jalur pesepeda motor
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="height: 150px;"><span typeof="mw:Error mw:File"><a href="/w/index.php?title=Istimewa:Pengunggahan&amp;wpDestFile=Indonesia_New_Road_Sign_Mandatory_6a2.png" class="new" title="Berkas:Indonesia New Road Sign Mandatory 6a2.png"><span class="mw-file-element mw-broken-media" data-width="120" data-height="120">Jalur khusus angkutan umum</span></a></span></div>
    <div class="gallerytext">
<p>Jalur khusus angkutan umum
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="height: 150px;"><span typeof="mw:Error mw:File"><a href="/w/index.php?title=Istimewa:Pengunggahan&amp;wpDestFile=Indonesia_New_Road_Sign_Mandatory_6b1.png" class="new" title="Berkas:Indonesia New Road Sign Mandatory 6b1.png"><span class="mw-file-element mw-broken-media" data-width="120" data-height="120">Jalur pejalan kaki</span></a></span></div>
    <div class="gallerytext">
<p>Jalur pejalan kaki
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="height: 150px;"><span typeof="mw:Error mw:File"><a href="/w/index.php?title=Istimewa:Pengunggahan&amp;wpDestFile=Indonesia_New_Road_Sign_Mandatory_6b3.png" class="new" title="Berkas:Indonesia New Road Sign Mandatory 6b3.png"><span class="mw-file-element mw-broken-media" data-width="120" data-height="120">Jalur pesepeda</span></a></span></div>
    <div class="gallerytext">
<p>Jalur pesepeda
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesia_Road_Sign_Mandatory_5.png" class="mw-file-description" title="Wajib memakai rantai pada ban"><img alt="Wajib memakai rantai pada ban" src="//upload.wikimedia.org/wikipedia/commons/thumb/0/0a/Indonesia_Road_Sign_Mandatory_5.png/120px-Indonesia_Road_Sign_Mandatory_5.png" decoding="async" width="120" height="119" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/0/0a/Indonesia_Road_Sign_Mandatory_5.png/180px-Indonesia_Road_Sign_Mandatory_5.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/0/0a/Indonesia_Road_Sign_Mandatory_5.png/240px-Indonesia_Road_Sign_Mandatory_5.png 2x" data-file-width="1100" data-file-height="1089"></a></span></div>
    <div class="gallerytext">
<p>Wajib memakai rantai pada ban
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesia_Road_Sign_Mandatory_7B.png" class="mw-file-description" title="Batas akhir wajib memakai rantai pada ban"><img alt="Batas akhir wajib memakai rantai pada ban" src="//upload.wikimedia.org/wikipedia/commons/thumb/9/98/Indonesia_Road_Sign_Mandatory_7B.png/120px-Indonesia_Road_Sign_Mandatory_7B.png" decoding="async" width="120" height="119" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/9/98/Indonesia_Road_Sign_Mandatory_7B.png/180px-Indonesia_Road_Sign_Mandatory_7B.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/9/98/Indonesia_Road_Sign_Mandatory_7B.png/240px-Indonesia_Road_Sign_Mandatory_7B.png 2x" data-file-width="1100" data-file-height="1089"></a></span></div>
    <div class="gallerytext">
<p>Batas akhir wajib memakai rantai pada ban
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesian_Road_sign_info_3a.png" class="mw-file-description" title="Awal batas wilayah kota ubud"><img alt="Awal batas wilayah kota ubud" src="//upload.wikimedia.org/wikipedia/commons/thumb/e/e4/Indonesian_Road_sign_info_3a.png/120px-Indonesian_Road_sign_info_3a.png" decoding="async" width="120" height="58" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/e/e4/Indonesian_Road_sign_info_3a.png/180px-Indonesian_Road_sign_info_3a.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/e/e4/Indonesian_Road_sign_info_3a.png/240px-Indonesian_Road_sign_info_3a.png 2x" data-file-width="1414" data-file-height="679"></a></span></div>
    <div class="gallerytext">
<p>Awal batas wilayah kota ubud
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesian_Road_Sign_info_3b.png" class="mw-file-description" title="Keluar batas wilayah kota ubud"><img alt="Keluar batas wilayah kota ubud" src="//upload.wikimedia.org/wikipedia/commons/thumb/e/ea/Indonesian_Road_Sign_info_3b.png/120px-Indonesian_Road_Sign_info_3b.png" decoding="async" width="120" height="58" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/e/ea/Indonesian_Road_Sign_info_3b.png/180px-Indonesian_Road_Sign_info_3b.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/e/ea/Indonesian_Road_Sign_info_3b.png/240px-Indonesian_Road_Sign_info_3b.png 2x" data-file-width="1414" data-file-height="679"></a></span></div>
    <div class="gallerytext">
<p>Keluar batas wilayah kota ubud
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesia_New_Road_Sign_Info_4a.png" class="mw-file-description" title="Jalan tol"><img alt="Jalan tol" src="//upload.wikimedia.org/wikipedia/commons/thumb/d/d0/Indonesia_New_Road_Sign_Info_4a.png/93px-Indonesia_New_Road_Sign_Info_4a.png" decoding="async" width="93" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/d/d0/Indonesia_New_Road_Sign_Info_4a.png/140px-Indonesia_New_Road_Sign_Info_4a.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/d/d0/Indonesia_New_Road_Sign_Info_4a.png/186px-Indonesia_New_Road_Sign_Info_4a.png 2x" data-file-width="955" data-file-height="1229"></a></span></div>
    <div class="gallerytext">
<p>Jalan tol
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="height: 150px;"><span typeof="mw:Error mw:File"><a href="/w/index.php?title=Istimewa:Pengunggahan&amp;wpDestFile=Indonesia_New_Road_Sign_Info_4b.svg" class="new" title="Berkas:Indonesia New Road Sign Info 4b.svg"><span class="mw-file-element mw-broken-media" data-width="120" data-height="120">Batas akhir jalan tol</span></a></span></div>
    <div class="gallerytext">
<p>Batas akhir jalan tol
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesian_road_sign_info_4c.png" class="mw-file-description" title="Nama Jalan tol (bermula)"><img alt="Nama Jalan tol (bermula)" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b7/Indonesian_road_sign_info_4c.png/120px-Indonesian_road_sign_info_4c.png" decoding="async" width="120" height="30" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b7/Indonesian_road_sign_info_4c.png/180px-Indonesian_road_sign_info_4c.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b7/Indonesian_road_sign_info_4c.png/240px-Indonesian_road_sign_info_4c.png 2x" data-file-width="2782" data-file-height="706"></a></span></div>
    <div class="gallerytext">
<p>Nama Jalan tol (bermula)
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesian_road_sign_info_4d.png" class="mw-file-description" title="Nama Jalan tol (berakhir)"><img alt="Nama Jalan tol (berakhir)" src="//upload.wikimedia.org/wikipedia/commons/thumb/8/8e/Indonesian_road_sign_info_4d.png/120px-Indonesian_road_sign_info_4d.png" decoding="async" width="120" height="30" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/8/8e/Indonesian_road_sign_info_4d.png/180px-Indonesian_road_sign_info_4d.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/8/8e/Indonesian_road_sign_info_4d.png/240px-Indonesian_road_sign_info_4d.png 2x" data-file-width="2782" data-file-height="707"></a></span></div>
    <div class="gallerytext">
<p>Nama Jalan tol  (berakhir)
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesian_Road_Sign_Info_5a1.png" class="mw-file-description" title="Terminal bus"><img alt="Terminal bus" src="//upload.wikimedia.org/wikipedia/commons/thumb/5/56/Indonesian_Road_Sign_Info_5a1.png/90px-Indonesian_Road_Sign_Info_5a1.png" decoding="async" width="90" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/5/56/Indonesian_Road_Sign_Info_5a1.png/135px-Indonesian_Road_Sign_Info_5a1.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/5/56/Indonesian_Road_Sign_Info_5a1.png/180px-Indonesian_Road_Sign_Info_5a1.png 2x" data-file-width="888" data-file-height="1180"></a></span></div>
    <div class="gallerytext">
<p>Terminal bus
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesia_New_Road_Sign_Info_5A2.png" class="mw-file-description" title="Stasiun kereta api"><img alt="Stasiun kereta api" src="//upload.wikimedia.org/wikipedia/commons/thumb/4/45/Indonesia_New_Road_Sign_Info_5A2.png/90px-Indonesia_New_Road_Sign_Info_5A2.png" decoding="async" width="90" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/4/45/Indonesia_New_Road_Sign_Info_5A2.png/135px-Indonesia_New_Road_Sign_Info_5A2.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/4/45/Indonesia_New_Road_Sign_Info_5A2.png/180px-Indonesia_New_Road_Sign_Info_5A2.png 2x" data-file-width="888" data-file-height="1180"></a></span></div>
    <div class="gallerytext">
<p>Stasiun kereta api
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesian_Road_Sign_Info_5a3.png" class="mw-file-description" title="Pelabuhan"><img alt="Pelabuhan" src="//upload.wikimedia.org/wikipedia/commons/thumb/e/e9/Indonesian_Road_Sign_Info_5a3.png/90px-Indonesian_Road_Sign_Info_5a3.png" decoding="async" width="90" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/e/e9/Indonesian_Road_Sign_Info_5a3.png/135px-Indonesian_Road_Sign_Info_5a3.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/e/e9/Indonesian_Road_Sign_Info_5a3.png/180px-Indonesian_Road_Sign_Info_5a3.png 2x" data-file-width="888" data-file-height="1180"></a></span></div>
    <div class="gallerytext">
<p>Pelabuhan
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesia_New_Road_Sign_Info_5a4.svg" class="mw-file-description" title="Bandara udara"><img alt="Bandara udara" src="//upload.wikimedia.org/wikipedia/commons/thumb/a/a3/Indonesia_New_Road_Sign_Info_5a4.svg/90px-Indonesia_New_Road_Sign_Info_5a4.svg.png" decoding="async" width="90" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/a/a3/Indonesia_New_Road_Sign_Info_5a4.svg/135px-Indonesia_New_Road_Sign_Info_5a4.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/a/a3/Indonesia_New_Road_Sign_Info_5a4.svg/180px-Indonesia_New_Road_Sign_Info_5a4.svg.png 2x" data-file-width="223" data-file-height="297"></a></span></div>
    <div class="gallerytext">
<p>Bandara udara
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesian_Road_Sign_Info_5b1.png" class="mw-file-description" title="Tempat pembuangan Sementara"><img alt="Tempat pembuangan Sementara" src="//upload.wikimedia.org/wikipedia/commons/thumb/1/1a/Indonesian_Road_Sign_Info_5b1.png/90px-Indonesian_Road_Sign_Info_5b1.png" decoding="async" width="90" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/1/1a/Indonesian_Road_Sign_Info_5b1.png/135px-Indonesian_Road_Sign_Info_5b1.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/1/1a/Indonesian_Road_Sign_Info_5b1.png/180px-Indonesian_Road_Sign_Info_5b1.png 2x" data-file-width="888" data-file-height="1180"></a></span></div>
    <div class="gallerytext">
<p>Tempat pembuangan Sementara
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesian_Road_Sign_Info_5b2.png" class="mw-file-description" title="Tempat Pembuangan Akhir"><img alt="Tempat Pembuangan Akhir" src="//upload.wikimedia.org/wikipedia/commons/thumb/f/f9/Indonesian_Road_Sign_Info_5b2.png/90px-Indonesian_Road_Sign_Info_5b2.png" decoding="async" width="90" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/f/f9/Indonesian_Road_Sign_Info_5b2.png/135px-Indonesian_Road_Sign_Info_5b2.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/f/f9/Indonesian_Road_Sign_Info_5b2.png/180px-Indonesian_Road_Sign_Info_5b2.png 2x" data-file-width="888" data-file-height="1180"></a></span></div>
    <div class="gallerytext">
<p>Tempat Pembuangan Akhir
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesian_Road_Sign_Info_5c1.png" class="mw-file-description" title="Kantor pos"><img alt="Kantor pos" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Indonesian_Road_Sign_Info_5c1.png/90px-Indonesian_Road_Sign_Info_5c1.png" decoding="async" width="90" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Indonesian_Road_Sign_Info_5c1.png/135px-Indonesian_Road_Sign_Info_5c1.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Indonesian_Road_Sign_Info_5c1.png/180px-Indonesian_Road_Sign_Info_5c1.png 2x" data-file-width="888" data-file-height="1180"></a></span></div>
    <div class="gallerytext">
<p>Kantor pos
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesian_Road_Sign_Info_5c2.png" class="mw-file-description" title="Telepon umum"><img alt="Telepon umum" src="//upload.wikimedia.org/wikipedia/commons/thumb/c/c2/Indonesian_Road_Sign_Info_5c2.png/90px-Indonesian_Road_Sign_Info_5c2.png" decoding="async" width="90" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/c/c2/Indonesian_Road_Sign_Info_5c2.png/135px-Indonesian_Road_Sign_Info_5c2.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/c/c2/Indonesian_Road_Sign_Info_5c2.png/180px-Indonesian_Road_Sign_Info_5c2.png 2x" data-file-width="888" data-file-height="1180"></a></span></div>
    <div class="gallerytext">
<p>Telepon umum
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesia_New_Road_Sign_Info_5d1.png" class="mw-file-description" title="Halte bus"><img alt="Halte bus" src="//upload.wikimedia.org/wikipedia/commons/thumb/c/c5/Indonesia_New_Road_Sign_Info_5d1.png/90px-Indonesia_New_Road_Sign_Info_5d1.png" decoding="async" width="90" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/c/c5/Indonesia_New_Road_Sign_Info_5d1.png/135px-Indonesia_New_Road_Sign_Info_5d1.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/c/c5/Indonesia_New_Road_Sign_Info_5d1.png/180px-Indonesia_New_Road_Sign_Info_5d1.png 2x" data-file-width="888" data-file-height="1180"></a></span></div>
    <div class="gallerytext">
<p>Halte bus
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesia_New_Road_Sign_Info_5d2.png" class="mw-file-description" title="Stand taksi"><img alt="Stand taksi" src="//upload.wikimedia.org/wikipedia/commons/thumb/9/9d/Indonesia_New_Road_Sign_Info_5d2.png/90px-Indonesia_New_Road_Sign_Info_5d2.png" decoding="async" width="90" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/9/9d/Indonesia_New_Road_Sign_Info_5d2.png/135px-Indonesia_New_Road_Sign_Info_5d2.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/9/9d/Indonesia_New_Road_Sign_Info_5d2.png/180px-Indonesia_New_Road_Sign_Info_5d2.png 2x" data-file-width="888" data-file-height="1180"></a></span></div>
    <div class="gallerytext">
<p>Stand taksi
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesian_Road_Sign_Info_5d3.png" class="mw-file-description" title="Kendaraan umum selain bus dan taksi"><img alt="Kendaraan umum selain bus dan taksi" src="//upload.wikimedia.org/wikipedia/commons/thumb/d/db/Indonesian_Road_Sign_Info_5d3.png/90px-Indonesian_Road_Sign_Info_5d3.png" decoding="async" width="90" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/d/db/Indonesian_Road_Sign_Info_5d3.png/135px-Indonesian_Road_Sign_Info_5d3.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/d/db/Indonesian_Road_Sign_Info_5d3.png/180px-Indonesian_Road_Sign_Info_5d3.png 2x" data-file-width="888" data-file-height="1180"></a></span></div>
    <div class="gallerytext">
<p>Kendaraan umum selain bus dan taksi
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesian_Road_Sign_Info_5e.png" class="mw-file-description" title="Penyebrangan pejalan kaki"><img alt="Penyebrangan pejalan kaki" src="//upload.wikimedia.org/wikipedia/commons/thumb/1/12/Indonesian_Road_Sign_Info_5e.png/90px-Indonesian_Road_Sign_Info_5e.png" decoding="async" width="90" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/1/12/Indonesian_Road_Sign_Info_5e.png/135px-Indonesian_Road_Sign_Info_5e.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/1/12/Indonesian_Road_Sign_Info_5e.png/180px-Indonesian_Road_Sign_Info_5e.png 2x" data-file-width="888" data-file-height="1180"></a></span></div>
    <div class="gallerytext">
<p>Penyebrangan pejalan kaki
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesian_Road_Sign_Info_5F1.png" class="mw-file-description" title="Zona parkir"><img alt="Zona parkir" src="//upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Indonesian_Road_Sign_Info_5F1.png/89px-Indonesian_Road_Sign_Info_5F1.png" decoding="async" width="89" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Indonesian_Road_Sign_Info_5F1.png/133px-Indonesian_Road_Sign_Info_5F1.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Indonesian_Road_Sign_Info_5F1.png/178px-Indonesian_Road_Sign_Info_5F1.png 2x" data-file-width="888" data-file-height="1197"></a></span></div>
    <div class="gallerytext">
<p>Zona parkir
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesian_Road_Sign_Info_5f2.png" class="mw-file-description" title="Zona parkir untuk penyadangan cacat"><img alt="Zona parkir untuk penyadangan cacat" src="//upload.wikimedia.org/wikipedia/commons/thumb/6/68/Indonesian_Road_Sign_Info_5f2.png/90px-Indonesian_Road_Sign_Info_5f2.png" decoding="async" width="90" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/6/68/Indonesian_Road_Sign_Info_5f2.png/135px-Indonesian_Road_Sign_Info_5f2.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/6/68/Indonesian_Road_Sign_Info_5f2.png/180px-Indonesian_Road_Sign_Info_5f2.png 2x" data-file-width="888" data-file-height="1180"></a></span></div>
    <div class="gallerytext">
<p>Zona parkir untuk penyadangan cacat
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesia_New_Road_Sign_Info_5g1.png" class="mw-file-description" title="Terowongan bermula"><img alt="Terowongan bermula" src="//upload.wikimedia.org/wikipedia/commons/thumb/7/77/Indonesia_New_Road_Sign_Info_5g1.png/90px-Indonesia_New_Road_Sign_Info_5g1.png" decoding="async" width="90" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/7/77/Indonesia_New_Road_Sign_Info_5g1.png/135px-Indonesia_New_Road_Sign_Info_5g1.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/7/77/Indonesia_New_Road_Sign_Info_5g1.png/180px-Indonesia_New_Road_Sign_Info_5g1.png 2x" data-file-width="888" data-file-height="1180"></a></span></div>
    <div class="gallerytext">
<p>Terowongan bermula
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesian_Road_Sign_Info_5g2.png" class="mw-file-description" title="Terowongan berakhir"><img alt="Terowongan berakhir" src="//upload.wikimedia.org/wikipedia/commons/thumb/0/08/Indonesian_Road_Sign_Info_5g2.png/90px-Indonesian_Road_Sign_Info_5g2.png" decoding="async" width="90" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/0/08/Indonesian_Road_Sign_Info_5g2.png/135px-Indonesian_Road_Sign_Info_5g2.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/0/08/Indonesian_Road_Sign_Info_5g2.png/180px-Indonesian_Road_Sign_Info_5g2.png 2x" data-file-width="888" data-file-height="1180"></a></span></div>
    <div class="gallerytext">
<p>Terowongan berakhir
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesian_Road_Sign_Info_5h1.png" class="mw-file-description" title="Rute evakuasi tsunami"><img alt="Rute evakuasi tsunami" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b4/Indonesian_Road_Sign_Info_5h1.png/90px-Indonesian_Road_Sign_Info_5h1.png" decoding="async" width="90" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b4/Indonesian_Road_Sign_Info_5h1.png/135px-Indonesian_Road_Sign_Info_5h1.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b4/Indonesian_Road_Sign_Info_5h1.png/180px-Indonesian_Road_Sign_Info_5h1.png 2x" data-file-width="888" data-file-height="1180"></a></span></div>
    <div class="gallerytext">
<p>Rute evakuasi tsunami
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesian_Road_Sign_Info_5h2.png" class="mw-file-description" title="Rute evakuasi gempabumi"><img alt="Rute evakuasi gempabumi" src="//upload.wikimedia.org/wikipedia/commons/thumb/0/0c/Indonesian_Road_Sign_Info_5h2.png/90px-Indonesian_Road_Sign_Info_5h2.png" decoding="async" width="90" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/0/0c/Indonesian_Road_Sign_Info_5h2.png/135px-Indonesian_Road_Sign_Info_5h2.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/0/0c/Indonesian_Road_Sign_Info_5h2.png/180px-Indonesian_Road_Sign_Info_5h2.png 2x" data-file-width="888" data-file-height="1180"></a></span></div>
    <div class="gallerytext">
<p>Rute evakuasi gempabumi
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesian_Road_Sign_Info_5h3.png" class="mw-file-description" title="Rute evakuasi letusan gunungapi"><img alt="Rute evakuasi letusan gunungapi" src="//upload.wikimedia.org/wikipedia/commons/thumb/6/60/Indonesian_Road_Sign_Info_5h3.png/90px-Indonesian_Road_Sign_Info_5h3.png" decoding="async" width="90" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/6/60/Indonesian_Road_Sign_Info_5h3.png/135px-Indonesian_Road_Sign_Info_5h3.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/6/60/Indonesian_Road_Sign_Info_5h3.png/180px-Indonesian_Road_Sign_Info_5h3.png 2x" data-file-width="888" data-file-height="1180"></a></span></div>
    <div class="gallerytext">
<p>Rute evakuasi letusan gunungapi
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesian_Road_Sign_Info_5h4.png" class="mw-file-description" title="Lokasi berkumpul darurat"><img alt="Lokasi berkumpul darurat" src="//upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Indonesian_Road_Sign_Info_5h4.png/90px-Indonesian_Road_Sign_Info_5h4.png" decoding="async" width="90" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Indonesian_Road_Sign_Info_5h4.png/135px-Indonesian_Road_Sign_Info_5h4.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Indonesian_Road_Sign_Info_5h4.png/180px-Indonesian_Road_Sign_Info_5h4.png 2x" data-file-width="888" data-file-height="1180"></a></span></div>
    <div class="gallerytext">
<p>Lokasi berkumpul darurat
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesian_Road_Sign_Info_5h5.png" class="mw-file-description" title="Kamp pengungsian"><img alt="Kamp pengungsian" src="//upload.wikimedia.org/wikipedia/commons/thumb/f/ff/Indonesian_Road_Sign_Info_5h5.png/90px-Indonesian_Road_Sign_Info_5h5.png" decoding="async" width="90" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/f/ff/Indonesian_Road_Sign_Info_5h5.png/135px-Indonesian_Road_Sign_Info_5h5.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/f/ff/Indonesian_Road_Sign_Info_5h5.png/180px-Indonesian_Road_Sign_Info_5h5.png 2x" data-file-width="888" data-file-height="1180"></a></span></div>
    <div class="gallerytext">
<p>Kamp pengungsian
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesian_Road_Sign_Info_5h6.png" class="mw-file-description" title="Pusat pengungsian"><img alt="Pusat pengungsian" src="//upload.wikimedia.org/wikipedia/commons/thumb/5/59/Indonesian_Road_Sign_Info_5h6.png/90px-Indonesian_Road_Sign_Info_5h6.png" decoding="async" width="90" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/5/59/Indonesian_Road_Sign_Info_5h6.png/135px-Indonesian_Road_Sign_Info_5h6.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/5/59/Indonesian_Road_Sign_Info_5h6.png/180px-Indonesian_Road_Sign_Info_5h6.png 2x" data-file-width="888" data-file-height="1180"></a></span></div>
    <div class="gallerytext">
<p>Pusat pengungsian
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesian_Road_Sign_Info_6a1.png" class="mw-file-description" title="Masjid"><img alt="Masjid" src="//upload.wikimedia.org/wikipedia/commons/thumb/8/84/Indonesian_Road_Sign_Info_6a1.png/90px-Indonesian_Road_Sign_Info_6a1.png" decoding="async" width="90" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/8/84/Indonesian_Road_Sign_Info_6a1.png/135px-Indonesian_Road_Sign_Info_6a1.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/8/84/Indonesian_Road_Sign_Info_6a1.png/180px-Indonesian_Road_Sign_Info_6a1.png 2x" data-file-width="888" data-file-height="1180"></a></span></div>
    <div class="gallerytext">
<p><a href="/wiki/Masjid" title="Masjid">Masjid</a>
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesian_Road_Sign_Info_6a2.png" class="mw-file-description" title="Gereja"><img alt="Gereja" src="//upload.wikimedia.org/wikipedia/commons/thumb/c/c6/Indonesian_Road_Sign_Info_6a2.png/90px-Indonesian_Road_Sign_Info_6a2.png" decoding="async" width="90" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/c/c6/Indonesian_Road_Sign_Info_6a2.png/135px-Indonesian_Road_Sign_Info_6a2.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/c/c6/Indonesian_Road_Sign_Info_6a2.png/180px-Indonesian_Road_Sign_Info_6a2.png 2x" data-file-width="888" data-file-height="1180"></a></span></div>
    <div class="gallerytext">
<p><a href="/wiki/Gereja" title="Gereja">Gereja</a>
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesian_Road_Sign_Info_6a3.png" class="mw-file-description" title="Wihara"><img alt="Wihara" src="//upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Indonesian_Road_Sign_Info_6a3.png/90px-Indonesian_Road_Sign_Info_6a3.png" decoding="async" width="90" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Indonesian_Road_Sign_Info_6a3.png/135px-Indonesian_Road_Sign_Info_6a3.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Indonesian_Road_Sign_Info_6a3.png/180px-Indonesian_Road_Sign_Info_6a3.png 2x" data-file-width="888" data-file-height="1180"></a></span></div>
    <div class="gallerytext">
<p><a href="/wiki/Wihara" title="Wihara">Wihara</a>
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesian_Road_Sign_Info_6a4.png" class="mw-file-description" title="Pura"><img alt="Pura" src="//upload.wikimedia.org/wikipedia/commons/thumb/2/22/Indonesian_Road_Sign_Info_6a4.png/90px-Indonesian_Road_Sign_Info_6a4.png" decoding="async" width="90" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/2/22/Indonesian_Road_Sign_Info_6a4.png/135px-Indonesian_Road_Sign_Info_6a4.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/2/22/Indonesian_Road_Sign_Info_6a4.png/180px-Indonesian_Road_Sign_Info_6a4.png 2x" data-file-width="888" data-file-height="1180"></a></span></div>
    <div class="gallerytext">
<p><a href="/wiki/Pura" title="Pura">Pura</a>
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesian_Road_Sign_Info_6b1.png" class="mw-file-description" title="Rumah Sakit"><img alt="Rumah Sakit" src="//upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Indonesian_Road_Sign_Info_6b1.png/90px-Indonesian_Road_Sign_Info_6b1.png" decoding="async" width="90" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Indonesian_Road_Sign_Info_6b1.png/135px-Indonesian_Road_Sign_Info_6b1.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Indonesian_Road_Sign_Info_6b1.png/180px-Indonesian_Road_Sign_Info_6b1.png 2x" data-file-width="888" data-file-height="1181"></a></span></div>
    <div class="gallerytext">
<p>Rumah Sakit
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesian_Road_Sign_Info_6b2.png" class="mw-file-description" title="Klinik/Puskesmas"><img alt="Klinik/Puskesmas" src="//upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Indonesian_Road_Sign_Info_6b2.png/90px-Indonesian_Road_Sign_Info_6b2.png" decoding="async" width="90" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Indonesian_Road_Sign_Info_6b2.png/135px-Indonesian_Road_Sign_Info_6b2.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Indonesian_Road_Sign_Info_6b2.png/180px-Indonesian_Road_Sign_Info_6b2.png 2x" data-file-width="888" data-file-height="1180"></a></span></div>
    <div class="gallerytext">
<p>Klinik/Puskesmas
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesian_Road_Sign_Info_6b3.png" class="mw-file-description" title="Apotek"><img alt="Apotek" src="//upload.wikimedia.org/wikipedia/commons/thumb/6/68/Indonesian_Road_Sign_Info_6b3.png/90px-Indonesian_Road_Sign_Info_6b3.png" decoding="async" width="90" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/6/68/Indonesian_Road_Sign_Info_6b3.png/135px-Indonesian_Road_Sign_Info_6b3.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/6/68/Indonesian_Road_Sign_Info_6b3.png/180px-Indonesian_Road_Sign_Info_6b3.png 2x" data-file-width="888" data-file-height="1180"></a></span></div>
    <div class="gallerytext">
<p>Apotek
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesian_Road_Sign_Info_6b4.png" class="mw-file-description" title="Pompa Bahan Bakar"><img alt="Pompa Bahan Bakar" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b5/Indonesian_Road_Sign_Info_6b4.png/90px-Indonesian_Road_Sign_Info_6b4.png" decoding="async" width="90" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b5/Indonesian_Road_Sign_Info_6b4.png/135px-Indonesian_Road_Sign_Info_6b4.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b5/Indonesian_Road_Sign_Info_6b4.png/180px-Indonesian_Road_Sign_Info_6b4.png 2x" data-file-width="888" data-file-height="1180"></a></span></div>
    <div class="gallerytext">
<p>Pompa Bahan Bakar
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesia_New_Road_Sign_Info_6b5.png" class="mw-file-description" title="Stasiun uji berkala"><img alt="Stasiun uji berkala" src="//upload.wikimedia.org/wikipedia/commons/thumb/5/55/Indonesia_New_Road_Sign_Info_6b5.png/90px-Indonesia_New_Road_Sign_Info_6b5.png" decoding="async" width="90" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/5/55/Indonesia_New_Road_Sign_Info_6b5.png/135px-Indonesia_New_Road_Sign_Info_6b5.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/5/55/Indonesia_New_Road_Sign_Info_6b5.png/180px-Indonesia_New_Road_Sign_Info_6b5.png 2x" data-file-width="888" data-file-height="1180"></a></span></div>
    <div class="gallerytext">
<p>Stasiun uji berkala
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesia_New_Road_Sign_Info_6b6.png" class="mw-file-description" title="Stasiun uji emisi"><img alt="Stasiun uji emisi" src="//upload.wikimedia.org/wikipedia/commons/thumb/8/85/Indonesia_New_Road_Sign_Info_6b6.png/90px-Indonesia_New_Road_Sign_Info_6b6.png" decoding="async" width="90" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/8/85/Indonesia_New_Road_Sign_Info_6b6.png/135px-Indonesia_New_Road_Sign_Info_6b6.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/8/85/Indonesia_New_Road_Sign_Info_6b6.png/180px-Indonesia_New_Road_Sign_Info_6b6.png 2x" data-file-width="888" data-file-height="1185"></a></span></div>
    <div class="gallerytext">
<p>Stasiun uji emisi
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesian_Road_Sign_Info_6b7.png" class="mw-file-description" title="Jembatan timbang"><img alt="Jembatan timbang" src="//upload.wikimedia.org/wikipedia/commons/thumb/d/d4/Indonesian_Road_Sign_Info_6b7.png/90px-Indonesian_Road_Sign_Info_6b7.png" decoding="async" width="90" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/d/d4/Indonesian_Road_Sign_Info_6b7.png/135px-Indonesian_Road_Sign_Info_6b7.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/d/d4/Indonesian_Road_Sign_Info_6b7.png/180px-Indonesian_Road_Sign_Info_6b7.png 2x" data-file-width="888" data-file-height="1180"></a></span></div>
    <div class="gallerytext">
<p>Jembatan timbang
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesian_Road_Sign_Info_6b8.png" class="mw-file-description" title="Museum"><img alt="Museum" src="//upload.wikimedia.org/wikipedia/commons/thumb/1/1c/Indonesian_Road_Sign_Info_6b8.png/90px-Indonesian_Road_Sign_Info_6b8.png" decoding="async" width="90" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/1/1c/Indonesian_Road_Sign_Info_6b8.png/135px-Indonesian_Road_Sign_Info_6b8.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/1/1c/Indonesian_Road_Sign_Info_6b8.png/180px-Indonesian_Road_Sign_Info_6b8.png 2x" data-file-width="888" data-file-height="1180"></a></span></div>
    <div class="gallerytext">
<p>Museum
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesian_Road_Sign_Info_6c1.png" class="mw-file-description" title="Pasar"><img alt="Pasar" src="//upload.wikimedia.org/wikipedia/commons/thumb/6/62/Indonesian_Road_Sign_Info_6c1.png/90px-Indonesian_Road_Sign_Info_6c1.png" decoding="async" width="90" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/6/62/Indonesian_Road_Sign_Info_6c1.png/135px-Indonesian_Road_Sign_Info_6c1.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/6/62/Indonesian_Road_Sign_Info_6c1.png/180px-Indonesian_Road_Sign_Info_6c1.png 2x" data-file-width="888" data-file-height="1180"></a></span></div>
    <div class="gallerytext">
<p>Pasar
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesia_Road_Sign_Info_6c2.png" class="mw-file-description" title="Toko restoran"><img alt="Toko restoran" src="//upload.wikimedia.org/wikipedia/commons/thumb/8/87/Indonesia_Road_Sign_Info_6c2.png/90px-Indonesia_Road_Sign_Info_6c2.png" decoding="async" width="90" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/8/87/Indonesia_Road_Sign_Info_6c2.png/135px-Indonesia_Road_Sign_Info_6c2.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/8/87/Indonesia_Road_Sign_Info_6c2.png/180px-Indonesia_Road_Sign_Info_6c2.png 2x" data-file-width="888" data-file-height="1180"></a></span></div>
    <div class="gallerytext">
<p>Toko restoran
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesian_Road_Sign_Info_6c3.png" class="mw-file-description" title="Toko kafe"><img alt="Toko kafe" src="//upload.wikimedia.org/wikipedia/commons/thumb/3/3d/Indonesian_Road_Sign_Info_6c3.png/90px-Indonesian_Road_Sign_Info_6c3.png" decoding="async" width="90" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/3/3d/Indonesian_Road_Sign_Info_6c3.png/135px-Indonesian_Road_Sign_Info_6c3.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/3/3d/Indonesian_Road_Sign_Info_6c3.png/180px-Indonesian_Road_Sign_Info_6c3.png 2x" data-file-width="888" data-file-height="1180"></a></span></div>
    <div class="gallerytext">
<p>Toko kafe
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesian_Road_Sign_Info_6c4.png" class="mw-file-description" title="Penginapan"><img alt="Penginapan" src="//upload.wikimedia.org/wikipedia/commons/thumb/6/6a/Indonesian_Road_Sign_Info_6c4.png/90px-Indonesian_Road_Sign_Info_6c4.png" decoding="async" width="90" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/6/6a/Indonesian_Road_Sign_Info_6c4.png/135px-Indonesian_Road_Sign_Info_6c4.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/6/6a/Indonesian_Road_Sign_Info_6c4.png/180px-Indonesian_Road_Sign_Info_6c4.png 2x" data-file-width="888" data-file-height="1180"></a></span></div>
    <div class="gallerytext">
<p>Penginapan
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesian_Road_Sign_Info_6c5.png" class="mw-file-description" title="Bengkel"><img alt="Bengkel" src="//upload.wikimedia.org/wikipedia/commons/thumb/1/14/Indonesian_Road_Sign_Info_6c5.png/90px-Indonesian_Road_Sign_Info_6c5.png" decoding="async" width="90" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/1/14/Indonesian_Road_Sign_Info_6c5.png/135px-Indonesian_Road_Sign_Info_6c5.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/1/14/Indonesian_Road_Sign_Info_6c5.png/180px-Indonesian_Road_Sign_Info_6c5.png 2x" data-file-width="888" data-file-height="1180"></a></span></div>
    <div class="gallerytext">
<p>Bengkel
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesian_Road_Sign_Info_6d1.png" class="mw-file-description" title="Taman"><img alt="Taman" src="//upload.wikimedia.org/wikipedia/commons/thumb/e/e7/Indonesian_Road_Sign_Info_6d1.png/90px-Indonesian_Road_Sign_Info_6d1.png" decoding="async" width="90" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/e/e7/Indonesian_Road_Sign_Info_6d1.png/135px-Indonesian_Road_Sign_Info_6d1.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/e/e7/Indonesian_Road_Sign_Info_6d1.png/180px-Indonesian_Road_Sign_Info_6d1.png 2x" data-file-width="888" data-file-height="1180"></a></span></div>
    <div class="gallerytext">
<p>Taman
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesian_Road_Sign_Info_6d2.png" class="mw-file-description" title="Rute jelajahi alam"><img alt="Rute jelajahi alam" src="//upload.wikimedia.org/wikipedia/commons/thumb/a/ae/Indonesian_Road_Sign_Info_6d2.png/90px-Indonesian_Road_Sign_Info_6d2.png" decoding="async" width="90" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/a/ae/Indonesian_Road_Sign_Info_6d2.png/135px-Indonesian_Road_Sign_Info_6d2.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/a/ae/Indonesian_Road_Sign_Info_6d2.png/180px-Indonesian_Road_Sign_Info_6d2.png 2x" data-file-width="888" data-file-height="1180"></a></span></div>
    <div class="gallerytext">
<p>Rute jelajahi alam
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesian_Road_Sign_Info_6d3.png" class="mw-file-description" title="Kemah tenda"><img alt="Kemah tenda" src="//upload.wikimedia.org/wikipedia/commons/thumb/0/07/Indonesian_Road_Sign_Info_6d3.png/90px-Indonesian_Road_Sign_Info_6d3.png" decoding="async" width="90" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/0/07/Indonesian_Road_Sign_Info_6d3.png/135px-Indonesian_Road_Sign_Info_6d3.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/0/07/Indonesian_Road_Sign_Info_6d3.png/180px-Indonesian_Road_Sign_Info_6d3.png 2x" data-file-width="888" data-file-height="1180"></a></span></div>
    <div class="gallerytext">
<p>Kemah tenda
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesian_Road_Sign_Info_6d4.png" class="mw-file-description" title="Kemah karvan"><img alt="Kemah karvan" src="//upload.wikimedia.org/wikipedia/commons/thumb/d/d2/Indonesian_Road_Sign_Info_6d4.png/90px-Indonesian_Road_Sign_Info_6d4.png" decoding="async" width="90" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/d/d2/Indonesian_Road_Sign_Info_6d4.png/135px-Indonesian_Road_Sign_Info_6d4.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/d/d2/Indonesian_Road_Sign_Info_6d4.png/180px-Indonesian_Road_Sign_Info_6d4.png 2x" data-file-width="888" data-file-height="1180"></a></span></div>
    <div class="gallerytext">
<p>Kemah karvan
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesian_Road_Sign_Info_6d5.png" class="mw-file-description" title="Perkemahan"><img alt="Perkemahan" src="//upload.wikimedia.org/wikipedia/commons/thumb/e/e7/Indonesian_Road_Sign_Info_6d5.png/90px-Indonesian_Road_Sign_Info_6d5.png" decoding="async" width="90" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/e/e7/Indonesian_Road_Sign_Info_6d5.png/135px-Indonesian_Road_Sign_Info_6d5.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/e/e7/Indonesian_Road_Sign_Info_6d5.png/180px-Indonesian_Road_Sign_Info_6d5.png 2x" data-file-width="888" data-file-height="1180"></a></span></div>
    <div class="gallerytext">
<p>Perkemahan
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesian_Road_Sign_Info_6d6.png" class="mw-file-description" title="Vila"><img alt="Vila" src="//upload.wikimedia.org/wikipedia/commons/thumb/a/af/Indonesian_Road_Sign_Info_6d6.png/90px-Indonesian_Road_Sign_Info_6d6.png" decoding="async" width="90" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/a/af/Indonesian_Road_Sign_Info_6d6.png/135px-Indonesian_Road_Sign_Info_6d6.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/a/af/Indonesian_Road_Sign_Info_6d6.png/180px-Indonesian_Road_Sign_Info_6d6.png 2x" data-file-width="888" data-file-height="1180"></a></span></div>
    <div class="gallerytext">
<p>Vila
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesian_Road_Sign_Info_6d7.png" class="mw-file-description" title="Pantai"><img alt="Pantai" src="//upload.wikimedia.org/wikipedia/commons/thumb/a/a7/Indonesian_Road_Sign_Info_6d7.png/90px-Indonesian_Road_Sign_Info_6d7.png" decoding="async" width="90" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/a/a7/Indonesian_Road_Sign_Info_6d7.png/135px-Indonesian_Road_Sign_Info_6d7.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/a/a7/Indonesian_Road_Sign_Info_6d7.png/180px-Indonesian_Road_Sign_Info_6d7.png 2x" data-file-width="888" data-file-height="1180"></a></span></div>
    <div class="gallerytext">
<p>Pantai
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesian_Road_Sign_Info_6e1.png" class="mw-file-description" title="Lapangan olahraga terbuka"><img alt="Lapangan olahraga terbuka" src="//upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Indonesian_Road_Sign_Info_6e1.png/90px-Indonesian_Road_Sign_Info_6e1.png" decoding="async" width="90" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Indonesian_Road_Sign_Info_6e1.png/135px-Indonesian_Road_Sign_Info_6e1.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Indonesian_Road_Sign_Info_6e1.png/180px-Indonesian_Road_Sign_Info_6e1.png 2x" data-file-width="888" data-file-height="1180"></a></span></div>
    <div class="gallerytext">
<p>Lapangan olahraga terbuka
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesian_Road_Sign_Info_6e2.png" class="mw-file-description" title="Gelanggang olahraga"><img alt="Gelanggang olahraga" src="//upload.wikimedia.org/wikipedia/commons/thumb/f/f1/Indonesian_Road_Sign_Info_6e2.png/90px-Indonesian_Road_Sign_Info_6e2.png" decoding="async" width="90" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/f/f1/Indonesian_Road_Sign_Info_6e2.png/135px-Indonesian_Road_Sign_Info_6e2.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/f/f1/Indonesian_Road_Sign_Info_6e2.png/180px-Indonesian_Road_Sign_Info_6e2.png 2x" data-file-width="888" data-file-height="1180"></a></span></div>
    <div class="gallerytext">
<p>Gelanggang olahraga
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesian_Road_Sign_Info_6e3.png" class="mw-file-description" title="Kolam renang"><img alt="Kolam renang" src="//upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Indonesian_Road_Sign_Info_6e3.png/90px-Indonesian_Road_Sign_Info_6e3.png" decoding="async" width="90" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Indonesian_Road_Sign_Info_6e3.png/135px-Indonesian_Road_Sign_Info_6e3.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Indonesian_Road_Sign_Info_6e3.png/180px-Indonesian_Road_Sign_Info_6e3.png 2x" data-file-width="888" data-file-height="1180"></a></span></div>
    <div class="gallerytext">
<p>Kolam renang
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesian_Road_Sign_Info_6e4.png" class="mw-file-description" title="Stadion"><img alt="Stadion" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/bc/Indonesian_Road_Sign_Info_6e4.png/90px-Indonesian_Road_Sign_Info_6e4.png" decoding="async" width="90" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/bc/Indonesian_Road_Sign_Info_6e4.png/135px-Indonesian_Road_Sign_Info_6e4.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/bc/Indonesian_Road_Sign_Info_6e4.png/180px-Indonesian_Road_Sign_Info_6e4.png 2x" data-file-width="888" data-file-height="1180"></a></span></div>
    <div class="gallerytext">
<p>Stadion
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesian_Road_Sign_Info_6f1.png" class="mw-file-description" title="Sekolah"><img alt="Sekolah" src="//upload.wikimedia.org/wikipedia/commons/thumb/7/79/Indonesian_Road_Sign_Info_6f1.png/90px-Indonesian_Road_Sign_Info_6f1.png" decoding="async" width="90" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/7/79/Indonesian_Road_Sign_Info_6f1.png/135px-Indonesian_Road_Sign_Info_6f1.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/7/79/Indonesian_Road_Sign_Info_6f1.png/180px-Indonesian_Road_Sign_Info_6f1.png 2x" data-file-width="888" data-file-height="1180"></a></span></div>
    <div class="gallerytext">
<p>Sekolah
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesian_Road_Sign_Info_6f2.png" class="mw-file-description" title="Perpustakaan"><img alt="Perpustakaan" src="//upload.wikimedia.org/wikipedia/commons/thumb/2/2e/Indonesian_Road_Sign_Info_6f2.png/90px-Indonesian_Road_Sign_Info_6f2.png" decoding="async" width="90" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/2/2e/Indonesian_Road_Sign_Info_6f2.png/135px-Indonesian_Road_Sign_Info_6f2.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/2/2e/Indonesian_Road_Sign_Info_6f2.png/180px-Indonesian_Road_Sign_Info_6f2.png 2x" data-file-width="888" data-file-height="1180"></a></span></div>
    <div class="gallerytext">
<p>Perpustakaan
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesia_New_Road_Sign_Info_7b.png" class="mw-file-description" title="Satu arah"><img alt="Satu arah" src="//upload.wikimedia.org/wikipedia/commons/thumb/3/39/Indonesia_New_Road_Sign_Info_7b.png/120px-Indonesia_New_Road_Sign_Info_7b.png" decoding="async" width="120" height="58" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/3/39/Indonesia_New_Road_Sign_Info_7b.png/180px-Indonesia_New_Road_Sign_Info_7b.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/3/39/Indonesia_New_Road_Sign_Info_7b.png/240px-Indonesia_New_Road_Sign_Info_7b.png 2x" data-file-width="1414" data-file-height="679"></a></span></div>
    <div class="gallerytext">
<p>Satu arah
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesia_New_Road_Sign_Info_7d.png" class="mw-file-description" title="Buntu"><img alt="Buntu" src="//upload.wikimedia.org/wikipedia/commons/thumb/2/21/Indonesia_New_Road_Sign_Info_7d.png/92px-Indonesia_New_Road_Sign_Info_7d.png" decoding="async" width="92" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/2/21/Indonesia_New_Road_Sign_Info_7d.png/138px-Indonesia_New_Road_Sign_Info_7d.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/2/21/Indonesia_New_Road_Sign_Info_7d.png/184px-Indonesia_New_Road_Sign_Info_7d.png 2x" data-file-width="945" data-file-height="1229"></a></span></div>
    <div class="gallerytext">
<p>Buntu
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesia_New_Road_Sign_Info_7g.png" class="mw-file-description" title="Area putaran"><img alt="Area putaran" src="//upload.wikimedia.org/wikipedia/commons/thumb/c/ca/Indonesia_New_Road_Sign_Info_7g.png/80px-Indonesia_New_Road_Sign_Info_7g.png" decoding="async" width="80" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/c/ca/Indonesia_New_Road_Sign_Info_7g.png/120px-Indonesia_New_Road_Sign_Info_7g.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/c/ca/Indonesia_New_Road_Sign_Info_7g.png/160px-Indonesia_New_Road_Sign_Info_7g.png 2x" data-file-width="945" data-file-height="1413"></a></span></div>
    <div class="gallerytext">
<p>Area putaran
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesia_New_Road_Sign_Info_7h.png" class="mw-file-description" title="Jalan kendaraan bermotor"><img alt="Jalan kendaraan bermotor" src="//upload.wikimedia.org/wikipedia/commons/thumb/6/6d/Indonesia_New_Road_Sign_Info_7h.png/92px-Indonesia_New_Road_Sign_Info_7h.png" decoding="async" width="92" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/6/6d/Indonesia_New_Road_Sign_Info_7h.png/138px-Indonesia_New_Road_Sign_Info_7h.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/6/6d/Indonesia_New_Road_Sign_Info_7h.png/184px-Indonesia_New_Road_Sign_Info_7h.png 2x" data-file-width="941" data-file-height="1229"></a></span></div>
    <div class="gallerytext">
<p>Jalan kendaraan bermotor
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesian_Directional_Sign_-_6.png" class="mw-file-description" title="Rambu petunjuk 1 (Kode warna coklat untuk tunjuan wisata)"><img alt="Rambu petunjuk 1 (Kode warna coklat untuk tunjuan wisata)" src="//upload.wikimedia.org/wikipedia/commons/thumb/1/18/Indonesian_Directional_Sign_-_6.png/120px-Indonesian_Directional_Sign_-_6.png" decoding="async" width="120" height="62" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/1/18/Indonesian_Directional_Sign_-_6.png/180px-Indonesian_Directional_Sign_-_6.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/1/18/Indonesian_Directional_Sign_-_6.png/240px-Indonesian_Directional_Sign_-_6.png 2x" data-file-width="1749" data-file-height="901"></a></span></div>
    <div class="gallerytext">
<p>Rambu petunjuk 1 (Kode warna coklat untuk tunjuan wisata)
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesian_Directional_Sign_-_7.png" class="mw-file-description" title="Rambu petunjuk 2 (Kode warna putih untuk Jalan tol &amp; biru untuk fasilitas umum )"><img alt="Rambu petunjuk 2 (Kode warna putih untuk Jalan tol &amp; biru untuk fasilitas umum )" src="//upload.wikimedia.org/wikipedia/commons/thumb/f/ff/Indonesian_Directional_Sign_-_7.png/120px-Indonesian_Directional_Sign_-_7.png" decoding="async" width="120" height="81" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/f/ff/Indonesian_Directional_Sign_-_7.png/180px-Indonesian_Directional_Sign_-_7.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/f/ff/Indonesian_Directional_Sign_-_7.png/240px-Indonesian_Directional_Sign_-_7.png 2x" data-file-width="1992" data-file-height="1343"></a></span></div>
    <div class="gallerytext">
<p>Rambu petunjuk 2 (Kode warna putih untuk Jalan tol &amp; biru untuk fasilitas umum )
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesian_Directional_Sign_-_4.png" class="mw-file-description" title="Pemanda jarak"><img alt="Pemanda jarak" src="//upload.wikimedia.org/wikipedia/commons/thumb/8/80/Indonesian_Directional_Sign_-_4.png/120px-Indonesian_Directional_Sign_-_4.png" decoding="async" width="120" height="59" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/8/80/Indonesian_Directional_Sign_-_4.png/180px-Indonesian_Directional_Sign_-_4.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/8/80/Indonesian_Directional_Sign_-_4.png/240px-Indonesian_Directional_Sign_-_4.png 2x" data-file-width="2083" data-file-height="1026"></a></span></div>
    <div class="gallerytext">
<p>Pemanda jarak
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesian_Directional_Sign_-_1.png" class="mw-file-description" title="Rambu petunjuk rute Jalan nasional"><img alt="Rambu petunjuk rute Jalan nasional" src="//upload.wikimedia.org/wikipedia/commons/thumb/f/f2/Indonesian_Directional_Sign_-_1.png/120px-Indonesian_Directional_Sign_-_1.png" decoding="async" width="120" height="56" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/f/f2/Indonesian_Directional_Sign_-_1.png/180px-Indonesian_Directional_Sign_-_1.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/f/f2/Indonesian_Directional_Sign_-_1.png/240px-Indonesian_Directional_Sign_-_1.png 2x" data-file-width="1964" data-file-height="923"></a></span></div>
    <div class="gallerytext">
<p>Rambu petunjuk rute Jalan nasional
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesian_Directional_Sign_-_5.svg" class="mw-file-description" title="Masuk tol"><img alt="Masuk tol" src="//upload.wikimedia.org/wikipedia/commons/thumb/3/39/Indonesian_Directional_Sign_-_5.svg/120px-Indonesian_Directional_Sign_-_5.svg.png" decoding="async" width="120" height="55" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/3/39/Indonesian_Directional_Sign_-_5.svg/180px-Indonesian_Directional_Sign_-_5.svg.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/3/39/Indonesian_Directional_Sign_-_5.svg/240px-Indonesian_Directional_Sign_-_5.svg.png 2x" data-file-width="551" data-file-height="253"></a></span></div>
    <div class="gallerytext">
<p>Masuk tol
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesian_Directional_Sign_-_3.png" class="mw-file-description" title="Keluar tol"><img alt="Keluar tol" src="//upload.wikimedia.org/wikipedia/commons/thumb/8/83/Indonesian_Directional_Sign_-_3.png/120px-Indonesian_Directional_Sign_-_3.png" decoding="async" width="120" height="74" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/8/83/Indonesian_Directional_Sign_-_3.png/180px-Indonesian_Directional_Sign_-_3.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/8/83/Indonesian_Directional_Sign_-_3.png/240px-Indonesian_Directional_Sign_-_3.png 2x" data-file-width="1767" data-file-height="1097"></a></span></div>
    <div class="gallerytext">
<p>Keluar tol
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesian_Directional_Sign_-_2.png" class="mw-file-description" title="Simpang susun dengan jalan tol lain"><img alt="Simpang susun dengan jalan tol lain" src="//upload.wikimedia.org/wikipedia/commons/thumb/d/d8/Indonesian_Directional_Sign_-_2.png/120px-Indonesian_Directional_Sign_-_2.png" decoding="async" width="120" height="55" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/d/d8/Indonesian_Directional_Sign_-_2.png/180px-Indonesian_Directional_Sign_-_2.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/d/d8/Indonesian_Directional_Sign_-_2.png/240px-Indonesian_Directional_Sign_-_2.png 2x" data-file-width="2178" data-file-height="998"></a></span></div>
    <div class="gallerytext">
<p>Simpang susun dengan jalan tol lain
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesian_Road_Sign_temp_1a.png" class="mw-file-description" title="Tikungan kiri"><img alt="Tikungan kiri" src="//upload.wikimedia.org/wikipedia/commons/thumb/8/84/Indonesian_Road_Sign_temp_1a.png/120px-Indonesian_Road_Sign_temp_1a.png" decoding="async" width="120" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/8/84/Indonesian_Road_Sign_temp_1a.png/180px-Indonesian_Road_Sign_temp_1a.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/8/84/Indonesian_Road_Sign_temp_1a.png/240px-Indonesian_Road_Sign_temp_1a.png 2x" data-file-width="1141" data-file-height="1142"></a></span></div>
    <div class="gallerytext">
<p>Tikungan kiri
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesian_Road_Sign_temp_1b.png" class="mw-file-description" title="Tikungan kanan"><img alt="Tikungan kanan" src="//upload.wikimedia.org/wikipedia/commons/thumb/c/c8/Indonesian_Road_Sign_temp_1b.png/120px-Indonesian_Road_Sign_temp_1b.png" decoding="async" width="120" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/c/c8/Indonesian_Road_Sign_temp_1b.png/180px-Indonesian_Road_Sign_temp_1b.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/c/c8/Indonesian_Road_Sign_temp_1b.png/240px-Indonesian_Road_Sign_temp_1b.png 2x" data-file-width="1141" data-file-height="1142"></a></span></div>
    <div class="gallerytext">
<p>Tikungan kanan
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesian_Road_Sign_temp_1c.png" class="mw-file-description" title="Jalan menyempit"><img alt="Jalan menyempit" src="//upload.wikimedia.org/wikipedia/commons/thumb/f/ff/Indonesian_Road_Sign_temp_1c.png/117px-Indonesian_Road_Sign_temp_1c.png" decoding="async" width="117" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/f/ff/Indonesian_Road_Sign_temp_1c.png/175px-Indonesian_Road_Sign_temp_1c.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/f/ff/Indonesian_Road_Sign_temp_1c.png/233px-Indonesian_Road_Sign_temp_1c.png 2x" data-file-width="1141" data-file-height="1175"></a></span></div>
    <div class="gallerytext">
<p>Jalan menyempit
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesian_Road_Sign_temp_1d.png" class="mw-file-description" title="Jalan melebar"><img alt="Jalan melebar" src="//upload.wikimedia.org/wikipedia/commons/thumb/9/94/Indonesian_Road_Sign_temp_1d.png/120px-Indonesian_Road_Sign_temp_1d.png" decoding="async" width="120" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/9/94/Indonesian_Road_Sign_temp_1d.png/180px-Indonesian_Road_Sign_temp_1d.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/9/94/Indonesian_Road_Sign_temp_1d.png/240px-Indonesian_Road_Sign_temp_1d.png 2x" data-file-width="1141" data-file-height="1142"></a></span></div>
    <div class="gallerytext">
<p>Jalan melebar
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesian_Road_Sign_temp_1e.png" class="mw-file-description" title="Penyempitan sisi kiri"><img alt="Penyempitan sisi kiri" src="//upload.wikimedia.org/wikipedia/commons/thumb/d/d4/Indonesian_Road_Sign_temp_1e.png/116px-Indonesian_Road_Sign_temp_1e.png" decoding="async" width="116" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/d/d4/Indonesian_Road_Sign_temp_1e.png/174px-Indonesian_Road_Sign_temp_1e.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/d/d4/Indonesian_Road_Sign_temp_1e.png/232px-Indonesian_Road_Sign_temp_1e.png 2x" data-file-width="1141" data-file-height="1179"></a></span></div>
    <div class="gallerytext">
<p>Penyempitan sisi kiri
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesian_Road_Sign_temp_1g.png" class="mw-file-description" title="Pelebaran di sisi kiri"><img alt="Pelebaran di sisi kiri" src="//upload.wikimedia.org/wikipedia/commons/thumb/4/46/Indonesian_Road_Sign_temp_1g.png/116px-Indonesian_Road_Sign_temp_1g.png" decoding="async" width="116" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/4/46/Indonesian_Road_Sign_temp_1g.png/174px-Indonesian_Road_Sign_temp_1g.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/4/46/Indonesian_Road_Sign_temp_1g.png/232px-Indonesian_Road_Sign_temp_1g.png 2x" data-file-width="1147" data-file-height="1185"></a></span></div>
    <div class="gallerytext">
<p>Pelebaran di sisi kiri
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesian_Road_Sign_temp_1h.png" class="mw-file-description" title="Pelebaran di sisi kanan"><img alt="Pelebaran di sisi kanan" src="//upload.wikimedia.org/wikipedia/commons/thumb/0/0f/Indonesian_Road_Sign_temp_1h.png/116px-Indonesian_Road_Sign_temp_1h.png" decoding="async" width="116" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/0/0f/Indonesian_Road_Sign_temp_1h.png/173px-Indonesian_Road_Sign_temp_1h.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/0/0f/Indonesian_Road_Sign_temp_1h.png/231px-Indonesian_Road_Sign_temp_1h.png 2x" data-file-width="1141" data-file-height="1185"></a></span></div>
    <div class="gallerytext">
<p>Pelebaran di sisi kanan
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesian_Road_Sign_temp_1i.png" class="mw-file-description" title="Pengurangan lajur sisi kiri"><img alt="Pengurangan lajur sisi kiri" src="//upload.wikimedia.org/wikipedia/commons/thumb/7/73/Indonesian_Road_Sign_temp_1i.png/116px-Indonesian_Road_Sign_temp_1i.png" decoding="async" width="116" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/7/73/Indonesian_Road_Sign_temp_1i.png/174px-Indonesian_Road_Sign_temp_1i.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/7/73/Indonesian_Road_Sign_temp_1i.png/232px-Indonesian_Road_Sign_temp_1i.png 2x" data-file-width="1141" data-file-height="1179"></a></span></div>
    <div class="gallerytext">
<p>Pengurangan lajur sisi kiri
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesian_Road_Sign_temp_1j.png" class="mw-file-description" title="Pengurangan lajur sisi kiri"><img alt="Pengurangan lajur sisi kiri" src="//upload.wikimedia.org/wikipedia/commons/thumb/6/67/Indonesian_Road_Sign_temp_1j.png/116px-Indonesian_Road_Sign_temp_1j.png" decoding="async" width="116" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/6/67/Indonesian_Road_Sign_temp_1j.png/174px-Indonesian_Road_Sign_temp_1j.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/6/67/Indonesian_Road_Sign_temp_1j.png/232px-Indonesian_Road_Sign_temp_1j.png 2x" data-file-width="1141" data-file-height="1179"></a></span></div>
    <div class="gallerytext">
<p>Pengurangan lajur sisi kiri
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesian_Road_Sign_temp_1k.png" class="mw-file-description" title="Penambahan lajur di kiri"><img alt="Penambahan lajur di kiri" src="//upload.wikimedia.org/wikipedia/commons/thumb/1/12/Indonesian_Road_Sign_temp_1k.png/116px-Indonesian_Road_Sign_temp_1k.png" decoding="async" width="116" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/1/12/Indonesian_Road_Sign_temp_1k.png/174px-Indonesian_Road_Sign_temp_1k.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/1/12/Indonesian_Road_Sign_temp_1k.png/232px-Indonesian_Road_Sign_temp_1k.png 2x" data-file-width="1147" data-file-height="1185"></a></span></div>
    <div class="gallerytext">
<p>Penambahan  lajur di kiri
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesian_Road_Sign_temp_1l.png" class="mw-file-description" title="Penambahan lajur di kanan"><img alt="Penambahan lajur di kanan" src="//upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Indonesian_Road_Sign_temp_1l.png/116px-Indonesian_Road_Sign_temp_1l.png" decoding="async" width="116" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Indonesian_Road_Sign_temp_1l.png/173px-Indonesian_Road_Sign_temp_1l.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Indonesian_Road_Sign_temp_1l.png/231px-Indonesian_Road_Sign_temp_1l.png 2x" data-file-width="1141" data-file-height="1185"></a></span></div>
    <div class="gallerytext">
<p>Penambahan lajur di kanan
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesian_Road_Sign_temp_1m.png" class="mw-file-description" title="Penyempitan jalan tertentu"><img alt="Penyempitan jalan tertentu" src="//upload.wikimedia.org/wikipedia/commons/thumb/7/7e/Indonesian_Road_Sign_temp_1m.png/120px-Indonesian_Road_Sign_temp_1m.png" decoding="async" width="120" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/7/7e/Indonesian_Road_Sign_temp_1m.png/180px-Indonesian_Road_Sign_temp_1m.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/7/7e/Indonesian_Road_Sign_temp_1m.png/240px-Indonesian_Road_Sign_temp_1m.png 2x" data-file-width="1141" data-file-height="1142"></a></span></div>
    <div class="gallerytext">
<p>Penyempitan jalan tertentu
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesian_Road_Sign_temp_2a.png" class="mw-file-description" title="Jalan licin"><img alt="Jalan licin" src="//upload.wikimedia.org/wikipedia/commons/thumb/3/38/Indonesian_Road_Sign_temp_2a.png/120px-Indonesian_Road_Sign_temp_2a.png" decoding="async" width="120" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/3/38/Indonesian_Road_Sign_temp_2a.png/180px-Indonesian_Road_Sign_temp_2a.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/3/38/Indonesian_Road_Sign_temp_2a.png/240px-Indonesian_Road_Sign_temp_2a.png 2x" data-file-width="1141" data-file-height="1142"></a></span></div>
    <div class="gallerytext">
<p>Jalan licin
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesian_Road_Sign_temp_2b.png" class="mw-file-description" title="Permukaan jalan tidak rata"><img alt="Permukaan jalan tidak rata" src="//upload.wikimedia.org/wikipedia/commons/thumb/3/31/Indonesian_Road_Sign_temp_2b.png/120px-Indonesian_Road_Sign_temp_2b.png" decoding="async" width="120" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/3/31/Indonesian_Road_Sign_temp_2b.png/180px-Indonesian_Road_Sign_temp_2b.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/3/31/Indonesian_Road_Sign_temp_2b.png/240px-Indonesian_Road_Sign_temp_2b.png 2x" data-file-width="1141" data-file-height="1142"></a></span></div>
    <div class="gallerytext">
<p>Permukaan jalan tidak rata
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesian_Road_Sign_temp_2c.png" class="mw-file-description" title="Lontaran kerikil"><img alt="Lontaran kerikil" src="//upload.wikimedia.org/wikipedia/commons/thumb/c/ce/Indonesian_Road_Sign_temp_2c.png/118px-Indonesian_Road_Sign_temp_2c.png" decoding="async" width="118" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/c/ce/Indonesian_Road_Sign_temp_2c.png/177px-Indonesian_Road_Sign_temp_2c.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/c/ce/Indonesian_Road_Sign_temp_2c.png/236px-Indonesian_Road_Sign_temp_2c.png 2x" data-file-width="1141" data-file-height="1162"></a></span></div>
    <div class="gallerytext">
<p>Lontaran kerikil
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesian_Road_Sign_temp_3a.png" class="mw-file-description" title="Pengalihan ke kiri"><img alt="Pengalihan ke kiri" src="//upload.wikimedia.org/wikipedia/commons/thumb/8/8d/Indonesian_Road_Sign_temp_3a.png/120px-Indonesian_Road_Sign_temp_3a.png" decoding="async" width="120" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/8/8d/Indonesian_Road_Sign_temp_3a.png/180px-Indonesian_Road_Sign_temp_3a.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/8/8d/Indonesian_Road_Sign_temp_3a.png/240px-Indonesian_Road_Sign_temp_3a.png 2x" data-file-width="1141" data-file-height="1142"></a></span></div>
    <div class="gallerytext">
<p>Pengalihan ke kiri
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesian_Road_Sign_temp_3b.png" class="mw-file-description" title="Pengalihan ke kanan"><img alt="Pengalihan ke kanan" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b2/Indonesian_Road_Sign_temp_3b.png/120px-Indonesian_Road_Sign_temp_3b.png" decoding="async" width="120" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b2/Indonesian_Road_Sign_temp_3b.png/180px-Indonesian_Road_Sign_temp_3b.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b2/Indonesian_Road_Sign_temp_3b.png/240px-Indonesian_Road_Sign_temp_3b.png 2x" data-file-width="1141" data-file-height="1142"></a></span></div>
    <div class="gallerytext">
<p>Pengalihan ke kanan
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesian_Road_Sign_temp_3c.png" class="mw-file-description" title="Pengalihan habis di kiri"><img alt="Pengalihan habis di kiri" src="//upload.wikimedia.org/wikipedia/commons/thumb/a/a7/Indonesian_Road_Sign_temp_3c.png/120px-Indonesian_Road_Sign_temp_3c.png" decoding="async" width="120" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/a/a7/Indonesian_Road_Sign_temp_3c.png/180px-Indonesian_Road_Sign_temp_3c.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/a/a7/Indonesian_Road_Sign_temp_3c.png/240px-Indonesian_Road_Sign_temp_3c.png 2x" data-file-width="1141" data-file-height="1142"></a></span></div>
    <div class="gallerytext">
<p>Pengalihan habis di kiri
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesian_Road_Sign_temp_3d.png" class="mw-file-description" title="Pengalihan habis di kanan"><img alt="Pengalihan habis di kanan" src="//upload.wikimedia.org/wikipedia/commons/thumb/5/56/Indonesian_Road_Sign_temp_3d.png/120px-Indonesian_Road_Sign_temp_3d.png" decoding="async" width="120" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/5/56/Indonesian_Road_Sign_temp_3d.png/180px-Indonesian_Road_Sign_temp_3d.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/5/56/Indonesian_Road_Sign_temp_3d.png/240px-Indonesian_Road_Sign_temp_3d.png 2x" data-file-width="1141" data-file-height="1142"></a></span></div>
    <div class="gallerytext">
<p>Pengalihan habis di kanan
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesian_Road_Sign_temp_3e.png" class="mw-file-description" title="Pengalihan dengan pembelahan arus"><img alt="Pengalihan dengan pembelahan arus" src="//upload.wikimedia.org/wikipedia/commons/thumb/1/16/Indonesian_Road_Sign_temp_3e.png/120px-Indonesian_Road_Sign_temp_3e.png" decoding="async" width="120" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/1/16/Indonesian_Road_Sign_temp_3e.png/180px-Indonesian_Road_Sign_temp_3e.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/1/16/Indonesian_Road_Sign_temp_3e.png/240px-Indonesian_Road_Sign_temp_3e.png 2x" data-file-width="1141" data-file-height="1142"></a></span></div>
    <div class="gallerytext">
<p>Pengalihan dengan pembelahan arus
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesian_Road_Sign_temp_3f.png" class="mw-file-description" title="Pembelahan arus habis"><img alt="Pembelahan arus habis" src="//upload.wikimedia.org/wikipedia/commons/thumb/a/a2/Indonesian_Road_Sign_temp_3f.png/120px-Indonesian_Road_Sign_temp_3f.png" decoding="async" width="120" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/a/a2/Indonesian_Road_Sign_temp_3f.png/180px-Indonesian_Road_Sign_temp_3f.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/a/a2/Indonesian_Road_Sign_temp_3f.png/240px-Indonesian_Road_Sign_temp_3f.png 2x" data-file-width="1141" data-file-height="1142"></a></span></div>
    <div class="gallerytext">
<p>Pembelahan arus habis
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesian_Road_Sign_temp_3g.png" class="mw-file-description" title="Pembelahan arus (arah berbeda)"><img alt="Pembelahan arus (arah berbeda)" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/bc/Indonesian_Road_Sign_temp_3g.png/120px-Indonesian_Road_Sign_temp_3g.png" decoding="async" width="120" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/bc/Indonesian_Road_Sign_temp_3g.png/180px-Indonesian_Road_Sign_temp_3g.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/bc/Indonesian_Road_Sign_temp_3g.png/240px-Indonesian_Road_Sign_temp_3g.png 2x" data-file-width="1141" data-file-height="1142"></a></span></div>
    <div class="gallerytext">
<p>Pembelahan arus (arah berbeda)
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesian_Road_Sign_temp_3h.png" class="mw-file-description" title="Pembelahan arus habis (arah berbeda)"><img alt="Pembelahan arus habis (arah berbeda)" src="//upload.wikimedia.org/wikipedia/commons/thumb/5/57/Indonesian_Road_Sign_temp_3h.png/120px-Indonesian_Road_Sign_temp_3h.png" decoding="async" width="120" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/5/57/Indonesian_Road_Sign_temp_3h.png/180px-Indonesian_Road_Sign_temp_3h.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/5/57/Indonesian_Road_Sign_temp_3h.png/240px-Indonesian_Road_Sign_temp_3h.png 2x" data-file-width="1141" data-file-height="1142"></a></span></div>
    <div class="gallerytext">
<p>Pembelahan arus habis (arah berbeda)
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesian_Road_Sign_temp_4a.png" class="mw-file-description" title="Hati-hati"><img alt="Hati-hati" src="//upload.wikimedia.org/wikipedia/commons/thumb/8/8c/Indonesian_Road_Sign_temp_4a.png/107px-Indonesian_Road_Sign_temp_4a.png" decoding="async" width="107" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/8/8c/Indonesian_Road_Sign_temp_4a.png/161px-Indonesian_Road_Sign_temp_4a.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/8/8c/Indonesian_Road_Sign_temp_4a.png/214px-Indonesian_Road_Sign_temp_4a.png 2x" data-file-width="1141" data-file-height="1277"></a></span></div>
    <div class="gallerytext">
<p>Hati-hati
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesian_Road_Sign_temp_4b.png" class="mw-file-description" title="Pekerjaan di depan"><img alt="Pekerjaan di depan" src="//upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Indonesian_Road_Sign_temp_4b.png/110px-Indonesian_Road_Sign_temp_4b.png" decoding="async" width="110" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Indonesian_Road_Sign_temp_4b.png/165px-Indonesian_Road_Sign_temp_4b.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Indonesian_Road_Sign_temp_4b.png/220px-Indonesian_Road_Sign_temp_4b.png 2x" data-file-width="1141" data-file-height="1247"></a></span></div>
    <div class="gallerytext">
<p>Pekerjaan di depan
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesian_Road_Sign_temp_4c.png" class="mw-file-description" title="Batas tinggi ruang bebas"><img alt="Batas tinggi ruang bebas" src="//upload.wikimedia.org/wikipedia/commons/thumb/d/d4/Indonesian_Road_Sign_temp_4c.png/120px-Indonesian_Road_Sign_temp_4c.png" decoding="async" width="120" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/d/d4/Indonesian_Road_Sign_temp_4c.png/180px-Indonesian_Road_Sign_temp_4c.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/d/d4/Indonesian_Road_Sign_temp_4c.png/240px-Indonesian_Road_Sign_temp_4c.png 2x" data-file-width="1146" data-file-height="1146"></a></span></div>
    <div class="gallerytext">
<p>Batas tinggi ruang bebas
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesian_Road_Sign_temp_4d.png" class="mw-file-description" title="Batas lebar ruang bebas"><img alt="Batas lebar ruang bebas" src="//upload.wikimedia.org/wikipedia/commons/thumb/c/c7/Indonesian_Road_Sign_temp_4d.png/120px-Indonesian_Road_Sign_temp_4d.png" decoding="async" width="120" height="119" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/c/c7/Indonesian_Road_Sign_temp_4d.png/180px-Indonesian_Road_Sign_temp_4d.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/c/c7/Indonesian_Road_Sign_temp_4d.png/240px-Indonesian_Road_Sign_temp_4d.png 2x" data-file-width="1147" data-file-height="1142"></a></span></div>
    <div class="gallerytext">
<p>Batas lebar ruang bebas
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesian_Road_Sign_temp_4e.png" class="mw-file-description" title="Lalu lintas dua arah"><img alt="Lalu lintas dua arah" src="//upload.wikimedia.org/wikipedia/commons/thumb/4/43/Indonesian_Road_Sign_temp_4e.png/120px-Indonesian_Road_Sign_temp_4e.png" decoding="async" width="120" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/4/43/Indonesian_Road_Sign_temp_4e.png/180px-Indonesian_Road_Sign_temp_4e.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/4/43/Indonesian_Road_Sign_temp_4e.png/240px-Indonesian_Road_Sign_temp_4e.png 2x" data-file-width="1133" data-file-height="1133"></a></span></div>
    <div class="gallerytext">
<p>Lalu lintas dua arah
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesian_Road_Sign_temp_4f.png" class="mw-file-description" title="Petugas kontrol lalu lintas"><img alt="Petugas kontrol lalu lintas" src="//upload.wikimedia.org/wikipedia/commons/thumb/b/b7/Indonesian_Road_Sign_temp_4f.png/120px-Indonesian_Road_Sign_temp_4f.png" decoding="async" width="120" height="120" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/b/b7/Indonesian_Road_Sign_temp_4f.png/180px-Indonesian_Road_Sign_temp_4f.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/b/b7/Indonesian_Road_Sign_temp_4f.png/240px-Indonesian_Road_Sign_temp_4f.png 2x" data-file-width="1141" data-file-height="1142"></a></span></div>
    <div class="gallerytext">
<p>Petugas kontrol lalu lintas
</p>
    </div>
  </li>
  <li class="gallerybox" style="width: 155px">
    <div class="thumb" style="width: 150px; height: 150px;"><span typeof="mw:File"><a href="/wiki/Berkas:Indonesian_Road_Sign_temp_5.png" class="mw-file-description" title="Kurangi kecepatan sekarang"><img alt="Kurangi kecepatan sekarang" src="//upload.wikimedia.org/wikipedia/commons/thumb/4/49/Indonesian_Road_Sign_temp_5.png/120px-Indonesian_Road_Sign_temp_5.png" decoding="async" width="120" height="83" class="mw-file-element" srcset="//upload.wikimedia.org/wikipedia/commons/thumb/4/49/Indonesian_Road_Sign_temp_5.png/180px-Indonesian_Road_Sign_temp_5.png 1.5x, //upload.wikimedia.org/wikipedia/commons/thumb/4/49/Indonesian_Road_Sign_temp_5.png/240px-Indonesian_Road_Sign_temp_5.png 2x" data-file-width="1349" data-file-height="931"></a></span></div>
    <div class="gallerytext">
<p>Kurangi kecepatan sekarang
</p>
    </div>
  </li>
</ul>
''';
