class Onboarding {
  String image, title, description;
  Onboarding(this.image, this.title, this.description);
}

List<Onboarding> onboardings = [
  Onboarding(
      'https://tdwstcontent.telkomsel.com/s3fs-public/images/pages/assets/onboarding_reskin_image1.png',
      'Selamat datang di aplikasi Livin by Mandiri Terbaru',
      'Satu aplikasi perbankan untuk gaya hidup dan segala kebutuhan Anda sehari-hari.'),
  Onboarding(
      'https://tdwstcontent.telkomsel.com/s3fs-public/images/pages/assets/onboarding_reskin_image2.png',
      'Cek e-wallet tanpa ribet',
      'lebih dari sekedar top-up. Pantau semua saldo e-wallet kamu dalam satu aplikasi.'),
  Onboarding(
      'https://tdwstcontent.telkomsel.com/s3fs-public/images/pages/assets/onboarding_reskin_image3.png',
      'Tetap tenang tanpa kartu',
      'Lupa bawa kartu, tapi butuh cash? Bisa! \nBagi-bagi cash tanpa ketemu? Bisa!')
];
