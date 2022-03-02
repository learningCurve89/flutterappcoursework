import 'package:coursework_2/model/exercise.dart';

Duration setDuration(String level) {
  switch (level) {
    case 'Beginner':
      return Duration(seconds: 10);
    case 'Intermediate':
      return Duration(seconds: 25);
    case 'Advanced':
      return Duration(seconds: 30);
    default:
      return Duration(seconds: 10);
  }
}


final exercises = [
  Exercise(
      id: 1,
      name: 'Pranamasana',
      duration: const Duration(seconds: 10),
      imageUrl: 'assets/images/starting.png',
      description: '''
      Stand at the edge of your mat, keep your feet together and balance your weight equally on both feet.
      
      Expand your chest and relax your shoulders. As you breathe in, lift both arms up from the sides, and as you exhale, bring your palms together in front of the chest in a prayer position.
      '''),
  Exercise(
      id: 2,
      name: 'Hasta Uttanasana',
      duration: const Duration(seconds: 10),
      imageUrl: 'assets/images/pose1.png',
      description: "Breathing in, lift the arms up and back, keeping the biceps close to the ears. In this pose, the effort is to stretch the whole body up from the heels to the tips of the fingers."),
  Exercise(
      id: 3,
      name: 'Hasta Padasana',
      duration: const Duration(seconds: 10),
      imageUrl: 'assets/images/pose2.png',
      description: "Breathing out, bend forward from the waist keeping the spine erect. As you exhale completely, bring the hands down to the floor beside the feet."),
  Exercise(
      id: 4,
      name: 'Ashwa Sanchalanasana',
      duration: const Duration(seconds: 10),
      imageUrl: 'assets/images/pose3.png',
      description: "Breathing in, push your right leg back, as far back as possible. Bring the right knee to the floor and look up."),
  Exercise(
      id: 5,
      name: 'Chaturanga Dandasana',
      duration: const Duration(seconds: 10),
      imageUrl: 'assets/images/pose4.png',
      description: "As you breathe in, take the left leg back and bring the whole body in a straight line"),
  Exercise(
      id: 6,
      name: 'Ashtanga Namaskar',
      duration: const Duration(seconds: 10),
      imageUrl: 'assets/images/pose5.png',
      description: "Gently bring your knees down to the floor and exhale. Take the hips back slightly, slide forward, rest your chest and chin on the floor. Raise your posterior a little bit. The two hands, two feet, two knees, chest and chin (eight parts of the body) should touch the floor."),
  Exercise(
      id: 7,
      name: 'Bhujangasana',
      duration: const Duration(seconds: 10),
      imageUrl: 'assets/images/pose6.png',
      description: "Slide forward and raise the chest up into the Cobra pose. You may keep your elbows bent in this pose with the shoulders away from the ears. Look up at the ceiling."),
  Exercise(
      id: 8,
      name: 'Adho Mukha Svanasana',
      duration: const Duration(seconds: 10),
      imageUrl: 'assets/images/pose7.png',
      description: "Breathing out, lift the hips and the tailbone up to bring the body into an inverted ‘V’ pose."),
  Exercise(
      id: 9,
      name: 'Ashwa Sanchalanasana',
      duration: const Duration(seconds: 10),
      imageUrl: 'assets/images/pose8.png',
      description: "Breathing in, bring the right foot forward in between the two hands. The left knee goes down on the floor. Press the hips down and look up."),
  Exercise(
      id: 10,
      name: 'Hasta Padasana',
      duration: const Duration(seconds: 10),
      imageUrl: 'assets/images/pose9.png',
      description: ""),
  Exercise(
      id: 11,
      name: 'Hasta Uttanasana',
      duration: const Duration(seconds: 10),
      imageUrl: 'assets/images/pose10.png',
      description: "Breathing out, bring the left foot forward. Keep the palms on the floor. You may bend the knees, if necessary."),
  Exercise(
      id: 12,
      name: 'Pranamasana',
      duration: const Duration(seconds: 10),
      imageUrl: 'assets/images/pose11.png',
      description: "As you exhale, first straighten the body, then bring the arms down. Relax in this position and observe the sensations in your body."),
];

