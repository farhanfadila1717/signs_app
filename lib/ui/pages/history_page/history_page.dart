import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:signs_app/core/redux/action_mapper.dart';
import 'package:flutter/material.dart';
import 'package:signs_app/ui/components/audio_controll.dart';
import 'package:signs_app/ui/components/scaffold_animation.dart';
import 'package:signs_app/ui/components/tts_mixin.dart';

class HistoryPage extends StatefulActionMapper {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> with TtsMixin {
  @override
  void initState() {
    super.initState();
    initTts(_kText);
  }

  @override
  void dispose() {
    flutterTts.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldAnimation(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: Scrollbar(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 50),
          children: [
            Center(
              child: Text(
                'Sejarah\nRambu Lalu Lintas',
                textAlign: TextAlign.center,
                style: GoogleFonts.paytoneOne(
                  fontSize: 24,
                ),
              ),
            ),
            const SizedBox(height: 30),
            DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(.8),
                borderRadius: BorderRadius.circular(3),
              ),
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  _kText,
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: AudioControll(
        ttsState: ttsState,
        speakingWord: speakingWord,
        onPause: flutterTts.stop,
        onPlay: playAudio,
      ),
    );
  }
}

const _kText =
    '''Awal mula Rambu lalu lintas diciptakan oleh berbagai individu dan badan otoritas di berbagai negara sepanjang sejarah. Tidak ada satu pencipta tunggal rambu lalu lintas. Pada awalnya, penggunaan tanda-tanda jalan pertama kali diperkenalkan oleh pemerintah lokal atau badan yang bertanggung jawab atas lalu lintas di wilayah tertentu. Jadi awal mula rambu lalu lintas ini sebenarnya, merupakan hasil dari berbagai kontribusi dan peraturan di seluruh dunia.

\tKemudian semakin berkembangnya waktu, standar internasional untuk rambu lalu lintas telah dikembangkan oleh organisasi seperti Perserikatan Bangsa-Bangsa (PBB) melalui Komisi Ekonomi untuk Eropa (UNECE) untuk memastikan konsistensi dalam tanda-tanda lalu lintas di seluruh dunia. 

\tDari situlah sejarah rambu lalu lintas dimulai pada abad ke-19 ketika transportasi bermotor pertama kali diperkenalkan. Beberapa titik penting dalam sejarah rambu lalu lintas termasuk:

\tTanda Jalan Pertama: Pada tahun 1909, Amerika Serikat memasang tanda peringatan pertama di Buffalo, New York. Tanda ini sederhana, berbentuk segitiga dan menampilkan pesan peringatan.

\tSistem Warna: Pada tahun 1917, sistem warna digunakan untuk pertama kalinya dengan tanda merah untuk peringatan dan tanda hijau untuk panduan.

\tPerkembangan Internasional: Seiring berkembangnya transportasi, sistem tanda lalu lintas juga berkembang di berbagai negara dan standar internasional diperkenalkan.

\tTanda Standar Internasional: Perserikatan Bangsa-Bangsa (PBB) memainkan peran penting dalam menyatukan standar rambu lalu lintas internasional, yang dikelola oleh Komisi Ekonomi untuk Eropa (UNECE).

\tSejarah rambu lalu lintas terus berkembang seiring waktu, dengan penggunaan tanda-tanda yang semakin kompleks dan teknologi modern seperti lampu lalu lintas, rambu elektronik, dan sistem navigasi. Tujuan utama dari rambu lalu lintas adalah untuk menjaga keamanan dan disiplin lalu lintas di jalan.
''';
