class MomentumModel {
  final int homePossession;
  final int awayPossession;
  final List<Momentum> momentumData;

  MomentumModel({
    required this.homePossession,
    required this.awayPossession,
    required this.momentumData,
  });
}

class Momentum {
  final int time;
  final double homeMomentum;
  final double awayMomentum;

  Momentum({
    required this.time,
    required this.homeMomentum,
    required this.awayMomentum,
  });
}
